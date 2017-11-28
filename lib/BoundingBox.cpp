#include <algorithm>
#include <cassert>
#include <glad/glad.h>
#include <glm/vec2.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <glm/gtc/matrix_transform.hpp>
#define GLM_ENABLE_EXPERIMENTAL
#include <iostream>
#include <glm/gtx/string_cast.hpp>
#include <GLFW/glfw3.h>

#include "../include/BoundingBox.h"

GLuint vao, vbo;

BoundingBox::BoundingBox(GLuint program) {

    glm::vec3 minB(-1.0,-1.0,-0.42578125);
    glm::vec3 maxB(1.0,1.0,0.42578125);
    // For Bounding box

    GLfloat vertices[] = {
            // Cube faces properly ordered
            minB.x, maxB.y, minB.z,
            minB.x, maxB.y, maxB.z,
            minB.x, minB.y, minB.z,
            minB.x, minB.y, minB.z,
            minB.x, maxB.y, maxB.z,
            minB.x, minB.y, maxB.z,

            maxB.x, maxB.y, minB.z,
            maxB.x, minB.y, minB.z,
            maxB.x, maxB.y, maxB.z,
            maxB.x, maxB.y, maxB.z,
            maxB.x, minB.y, minB.z,
            maxB.x, minB.y, maxB.z,

            minB.x, minB.y, minB.z,
            minB.x, minB.y, maxB.z,
            maxB.x, minB.y, minB.z,
            maxB.x, minB.y, minB.z,
            minB.x, minB.y, maxB.z,
            maxB.x, minB.y, maxB.z,

            minB.x, maxB.y, minB.z,
            maxB.x, maxB.y, minB.z,
            minB.x, maxB.y, maxB.z,
            minB.x, maxB.y, maxB.z,
            maxB.x, maxB.y, minB.z,
            maxB.x, maxB.y, maxB.z,


            minB.x, minB.y, maxB.z,
            minB.x, maxB.y, maxB.z,
            maxB.x, minB.y, maxB.z,
            maxB.x, minB.y, maxB.z,
            minB.x, maxB.y, maxB.z,
            maxB.x, maxB.y, maxB.z,

            minB.x, minB.y, minB.z,
            maxB.x, minB.y, minB.z,
            minB.x, maxB.y, minB.z,
            minB.x, maxB.y, minB.z,
            maxB.x, minB.y, minB.z,
            maxB.x, maxB.y, minB.z
    };


    glGenVertexArrays(1, &vao);

    glGenBuffers(1, &vbo);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glBindBuffer(GL_ARRAY_BUFFER, 0);


    glBindVertexArray(vao);
    glBindBuffer(GL_ARRAY_BUFFER,vbo);
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3* sizeof(GLfloat),(GLvoid*)0);
    glEnableVertexAttribArray(0);



    glBindVertexArray(0); //Unbind the VAO to disable changes outside this function.

}

void BoundingBox::draw(GLuint program) {
    glUseProgram(program);
    glBindVertexArray(vao);
    glDrawArrays(GL_TRIANGLES, 0, 6*2*3);
    glBindVertexArray(0);
}
