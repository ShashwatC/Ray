#include <glm/vec2.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <glm/gtc/matrix_transform.hpp>
#define GLM_ENABLE_EXPERIMENTAL
#include <glm/gtx/string_cast.hpp>
#include <GLFW/glfw3.h>

#include "BoundingBox.h"

class RenderEngine {
public:
    GLuint textureID, textureID2;
    GLuint program;

    BoundingBox * bb;

    // Params for camera
    glm::vec3 position;
    glm::vec3 front;
    glm::vec3 up;
    glm::vec3 right;

    RenderEngine(const char * volpath);
    bool loadVolumeFromFile(const char* fileName);
    void run();
    void draw();
    void initGlfw();
private:
    void update(float delta);
    GLFWwindow * mainWindow = nullptr;
    GLfloat Yaw = 0,Pitch = 0;
};
