#include <algorithm>
#include <cassert>
#include <glad/glad.h>
#include <glm/vec2.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <glm/gtc/matrix_transform.hpp>
#define GLM_ENABLE_EXPERIMENTAL
#include <glm/gtx/string_cast.hpp>
#include <GLFW/glfw3.h>
#include <imgui_impl_glfw_gl3.h>

#include <iostream>
#include <stdio.h>

#include "../include/RenderEngine.h"
#include "../include/BoundingBox.h"
#include "../include/utility.h"

#define XDIM 256
#define YDIM 256
#define ZDIM 109

float mouseSensitivity = 0.05f;
float keySensitivty = 0.05;
glm::mat4 remember = glm::mat4(1.0);
float iso = 5.0;

float arr[5];


void scroll_callback(GLFWwindow* window, double xoffset, double yoffset);

RenderEngine::RenderEngine(const char * volpath) {
    auto vert(fileToCharArr("../assets/raycast.vert"));
    auto frag(fileToCharArr("../assets/raycast.frag"));
    initGlfw();

    //Create program
    program = makeProgram(compileShader(shDf(GL_VERTEX_SHADER,&vert[0],vert.size())),
            compileShader(shDf(GL_FRAGMENT_SHADER,&frag[0],frag.size())),true);

    BoundingBox * bb = new BoundingBox(program);
    position = glm::vec3(0,0,2);
    front = glm::vec3(0,0,-1);
    up = glm::vec3(0,1,0);
    right = glm::vec3(1,0,0);

    loadVolumeFromFile(volpath);

}

bool RenderEngine::loadVolumeFromFile(const char* fileName) {

    // Hard-coded for the time being
    const int size = XDIM*YDIM*ZDIM;

    FILE *pFile = fopen(fileName,"rb");
    if(NULL == pFile) {
        return false;
    }

    GLubyte * pVolume = new GLubyte[size]; //<- here pVolume is a 1D byte array 
    fread(pVolume, sizeof(GLubyte), size, pFile);
    fclose(pFile);

    // now pVolume is passed to a 3d texture 
    //load data into a 3D texture

    glGenTextures(1, &textureID);
    glBindTexture(GL_TEXTURE_3D, textureID);

    // set the texture parameters
    glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_WRAP_R, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);

    glTexImage3D(GL_TEXTURE_3D, 0, GL_RGBA, XDIM, YDIM, ZDIM, 0, GL_RED,
            GL_UNSIGNED_BYTE, pVolume);
    glGenerateMipmap(GL_TEXTURE_3D);
    delete [] pVolume;

    for (int i=0;i<5;i++){
        arr[i] = 0.5;
    }
    return true;
}

void RenderEngine::run() {
    double delta = 0.0f;
    double last = 0.0f;
    while (!glfwWindowShouldClose(mainWindow)) {
        double curr = glfwGetTime();
        delta = curr-last;
        last = curr;
        glfwPollEvents();
        update(delta);
        glEnable(GL_CULL_FACE);
        glCullFace(GL_FRONT); // The normals point inwards!
        //glEnable(GL_BLEND);
        //glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA); // Not needed in raycasting
        draw();
        glfwSwapBuffers(mainWindow);
    }
}

void RenderEngine::draw() {

    for (int i=1;i<=4;i++){
        arr[i] = std::min(arr[i],1.0f);
        arr[i] = std::max(arr[i],0.0f);
        // Clip to (0,1)
    }

    // Create a 1D texture for mapping iso values to colors (lookup table basically)
    const int Size = 6;

    glm::vec4 Mapping[Size];
    Mapping[1] = glm::vec4(1.0,0.0,0.0,arr[1]);
    Mapping[2] = glm::vec4(0.0,1.0,0.0,arr[2]);
    Mapping[3] = glm::vec4(0.0,0.0,1.0,arr[3]);
    Mapping[4] = glm::vec4(0.0,0.0,1.0,arr[4]);

    float pData[Size][4];
    for(int i=0;i<Size;i++) {
        pData[i][0] = Mapping[i].x;
        pData[i][1] = Mapping[i].y;
        pData[i][2] = Mapping[i].z;
        pData[i][3] = Mapping[i].w;
    }

    glGenTextures(1, &textureID2);
    glBindTexture(GL_TEXTURE_1D, textureID2);

    glTexParameteri(GL_TEXTURE_1D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);    // GL_REPEAT?
    glTexParameteri(GL_TEXTURE_1D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_1D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);

    glTexImage1D(GL_TEXTURE_1D,0,GL_RGBA,Size,0,GL_RGBA,GL_FLOAT,pData);


    glClearColor(0.1f, 0.1f, 0.1f, 1.0f);
    glClearDepth(1.0f);
    glClear(GL_COLOR_BUFFER_BIT |GL_DEPTH_BUFFER_BIT);

    glm::mat4 v = glm::lookAt(position, position+front, up);
    glm::mat4 projection = glm::perspective(glm::radians(45.0f), 1.5f, 0.01f, 100.0f);

    glUseProgram(program);

	GLint vViewPos_uniform = glGetUniformLocation(program, "viewPos");
    glUniform3fv(vViewPos_uniform, 1, glm::value_ptr(position));

    glUniformMatrix4fv(glGetUniformLocation(program,"mvp"),1,GL_FALSE,glm::value_ptr(projection*v));
    glUniformMatrix4fv(glGetUniformLocation(program,"v"),1,GL_FALSE,glm::value_ptr(v));
    float sens = 10; // sensitivity
    glUniform1f(glGetUniformLocation(program,"isoSurf"),iso/sens);

    if (remember == glm::mat4(1.0)){
        remember = projection*v;
    }

    glUniformMatrix4fv(glGetUniformLocation(program,"old"),1,GL_FALSE,glm::value_ptr(remember));

    glUniform1i(glGetUniformLocation(program, "texVol"), 0);
    glUniform1i(glGetUniformLocation(program, "tf"), 1);

    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_3D, textureID);

    glActiveTexture(GL_TEXTURE1);
    glBindTexture(GL_TEXTURE_1D, textureID2);



    bb->draw(program);

    drawTransferEditor();
}

void RenderEngine::initGlfw() {
    mainWindow = setupGlfw(800, 600, "Main");

    glfwSetWindowUserPointer(mainWindow, this);

    glfwSetScrollCallback(mainWindow, scroll_callback);


    if (!gladLoadGLLoader((GLADloadproc) glfwGetProcAddress))
    {
        std::cout << "Failed to initialize OpenGL context" << std::endl;
        exit(-1);
    }

    ImGui_ImplGlfwGL3_Init(mainWindow, false);
}

void RenderEngine::update(float delta) {


    if(glfwGetKey(mainWindow,GLFW_KEY_ESCAPE) == GLFW_PRESS){
        glfwSetWindowShouldClose(mainWindow, GLFW_TRUE);
    }
    else if(glfwGetKey(mainWindow,GLFW_KEY_RIGHT) == GLFW_PRESS){
        position+=right*keySensitivty;

    }
    else if(glfwGetKey(mainWindow,GLFW_KEY_D) == GLFW_PRESS){
        position+=right*keySensitivty;
    }
    else if(glfwGetKey(mainWindow,GLFW_KEY_LEFT) == GLFW_PRESS){
        position-=right*keySensitivty;
    }
    else if(glfwGetKey(mainWindow,GLFW_KEY_A) == GLFW_PRESS){
        position-=right*keySensitivty;
    }
    else if(glfwGetKey(mainWindow,GLFW_KEY_UP) == GLFW_PRESS){
        iso += keySensitivty; //position+=up*keySensitivty;
    }
    else if(glfwGetKey(mainWindow,GLFW_KEY_W) == GLFW_PRESS){
        position+=up*keySensitivty;
    }
    else if(glfwGetKey(mainWindow,GLFW_KEY_DOWN) == GLFW_PRESS){
        iso -= keySensitivty; //position-=up*keySensitivty;
    }
    else if(glfwGetKey(mainWindow,GLFW_KEY_S) == GLFW_PRESS){
        position-=up*keySensitivty;
    }
    //else if(glfwGetKey(mainWindow,GLFW_KEY_1) == GLFW_PRESS){
    //    arr[1]+=keySensitivty;
    //}
    //else if(glfwGetKey(mainWindow,GLFW_KEY_2) == GLFW_PRESS){
    //    arr[2]+=keySensitivty;
    //}
    //else if(glfwGetKey(mainWindow,GLFW_KEY_3) == GLFW_PRESS){
    //    arr[3]+=keySensitivty;
    //}
    //else if(glfwGetKey(mainWindow,GLFW_KEY_4) == GLFW_PRESS){
    //    arr[4]+=keySensitivty;
    //}
    //else if(glfwGetKey(mainWindow,GLFW_KEY_5) == GLFW_PRESS){
    //    arr[1]-=keySensitivty;
    //}
    //else if(glfwGetKey(mainWindow,GLFW_KEY_6) == GLFW_PRESS){
    //    arr[2]-=keySensitivty;
    //}
    //else if(glfwGetKey(mainWindow,GLFW_KEY_7) == GLFW_PRESS){
    //    arr[3]-=keySensitivty;
    //}
    //else if(glfwGetKey(mainWindow,GLFW_KEY_8) == GLFW_PRESS){
    //    arr[4]-=keySensitivty;
    //}

    double posX,posY;
    glfwGetCursorPos(mainWindow,&posX,&posY);


    int currState = glfwGetMouseButton(mainWindow,GLFW_MOUSE_BUTTON_LEFT);


    static int prevState = currState;
    static double lastX = 0;
    static double lastY = 0;

    if(prevState == GLFW_RELEASE && currState == GLFW_PRESS) {
        lastX = posX;
        lastY = posY;
    }
    else if(prevState == GLFW_PRESS && currState == GLFW_PRESS){

        double xoffset = posX - lastX;
        double yoffset = lastY - posY;

        Yaw += xoffset*mouseSensitivity;
        Pitch += yoffset*mouseSensitivity;


        lastX = posX;
        lastY = posY;

        //udapte cam pitch and roll
        //rotate along global y ,local x axis
        front.x = cosf(glm::radians(Yaw-90)) * cosf(glm::radians(Pitch));
        front.y = sinf(glm::radians(Pitch));
        front.z = sinf(glm::radians(Yaw-90)) * cosf(glm::radians(Pitch));

        //right vector in x-z plane always(no roll camera)
        right = glm::vec3(-front.z, 0, front.x);
        up = glm::normalize(glm::cross(right, front));

    }

    prevState = currState;

}

void RenderEngine::drawTransferEditor() {
    ImGui_ImplGlfwGL3_NewFrame();

    ImGui::SetNextWindowSize(ImVec2(230, 130));
    ImGui::SetNextWindowPos(ImVec2(550,0));
    bool show_another_window = true;

    ImGui::Begin("Transfer Function Editor", &show_another_window, 
            ImGuiWindowFlags_NoResize);

    ImGui::SliderFloat("Red:", &arr[1], 0.0f, 1.0f);
    ImGui::SliderFloat("Green:", &arr[2], 0.0f, 1.0f);
    ImGui::SliderFloat("Blue:", &arr[3], 0.0f, 1.0f);
    ImGui::SliderFloat("Alpha:", &arr[4], 0.0f, 1.0f);

    ImGui::End();

    ImGui::Render();
}


void scroll_callback(GLFWwindow* window, double xoffset, double yoffset) {

    RenderEngine *  ptr = (RenderEngine * )glfwGetWindowUserPointer(window);
    ptr->position+=ptr->front*(float)yoffset;

}
