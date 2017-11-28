#pragma once
#include <algorithm>
#include <cassert>
#include <glm/vec2.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <glm/gtc/matrix_transform.hpp>
#define GLM_ENABLE_EXPERIMENTAL
#include <glm/gtx/string_cast.hpp>
#include <GLFW/glfw3.h>

class BoundingBox {

public:
    BoundingBox(GLuint program);
    void draw(GLuint program);
};
