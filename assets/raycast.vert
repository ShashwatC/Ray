#version 330

uniform mat4 mvp;
uniform mat4 v;
uniform mat4 old;

layout(location=0)in vec3 position;

out vec3 fpos;

void main() {
	gl_Position = mvp*vec4(position, 1.0);
    fpos = position;
}
