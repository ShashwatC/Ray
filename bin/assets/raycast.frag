#version 330

in vec3 fpos;
in vec3 fTexCoord;

uniform sampler3D texVol;
uniform vec3 viewPos;

uniform mat4 mvp;
uniform mat4 v;
uniform mat4 old;
uniform mat4 rot;

out vec4 color;

void main(void) {

    vec4 value;
    float stepsize = 0.01;

    vec3 texPos = (1+fpos)/2;
    texPos.y = 1 - texPos.y; // Image is inverted on y
    // Computing the texPos here  instead of sending it manually
    vec3 viewPosC = vec3(mvp*vec4(viewPos,1.0));
    vec3 direction = fpos - viewPosC;
    direction = normalize(direction);
    direction = vec3(v*vec4(direction,1.0));
    direction = normalize(direction);
    color = vec4(0.0);
    for (int i = 0; i < 100; i++) {
        value = vec4(texture(texVol, texPos).x);
        texPos = texPos + direction * stepsize;
        color = value + color;
    }
    color/=20;
    color = vec4(direction,1.0);


}
