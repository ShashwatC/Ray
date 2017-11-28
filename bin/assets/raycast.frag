#version 330

in vec3 fpos;           // Position on cube (unmodified)

uniform sampler3D texVol;
uniform vec3 viewPos;   // Position of eye  (unmodified)

uniform mat4 mvp;       // MVP matrix
uniform mat4 v;         // View matrix
uniform mat4 old;       // Initial mvp matrix

out vec4 color;

struct BoundingBox{
    vec3 min;
    vec3 max;
};

struct Ray{
    vec3 or;
    vec3 dir;
};

void IntersectBox(Ray r, BoundingBox cuboid, out float entry, out float exit)
{
    vec3 bottom = (1.0 / r.dir) * (cuboid.min-r.or);
    vec3 top = (1.0 / r.dir) * (cuboid.max-r.or);
    vec3 t_min = min(top, bottom);
    vec3 t_max = max(top, bottom);

    vec2 t_en,t_ex;
    t_en = max(t_min.xx, t_min.yz);
    t_ex = min(t_max.xx, t_max.yz);

    entry = max(max(t_en.x, t_en.y),0);
    exit =      min(t_ex.x, t_ex.y);

}

void main(void) {

    BoundingBox cuboid = BoundingBox(vec3(-1.0),vec3(1.0)); // Create bounding box

    vec4 value;
    vec3 direction = fpos - viewPos;
    direction = normalize(direction);
    //direction = vec3(v*vec4(direction,1.0));
    direction = normalize(direction);

    Ray ray = Ray(fpos, direction);                  // Create ray from direction

    float t_enter, t_exit;
    IntersectBox(ray, cuboid, t_enter, t_exit);          // Find intersection parameters

    vec3 entry  = ray.or + ray.dir*t_enter;
    vec3 exit   = ray.or + ray.dir*t_exit;
    float dist = distance(entry,exit);
    float num_steps = 256;
    float stepsize = dist/num_steps;
    vec3 curPos = entry;

    color = vec4(0.0);

    // Average intensity projection
    for (int i = 0; i < num_steps; i++) {
        vec3 tmp = vec3(curPos.xy,curPos.z*2.3486238532110093);
        vec3 texPos = (1+tmp)/2;
        texPos.y = 1 - texPos.y; // Image is inverted on y

        value = vec4(texture(texVol, texPos).x);
        curPos = curPos + direction * stepsize;
        color = value + color;
    }

    color/=num_steps;
    color*=4;

    // Maximum intensity projection
/*
    for (int i = 0; i < num_steps; i++) {
        vec3 tmp = vec3(curPos.xy,curPos.z*2.3486238532110093);
        vec3 texPos = (1+tmp)/2;
        texPos.y = 1 - texPos.y; // Image is inverted on y

        value = vec4(texture(texVol, texPos).x);
        curPos = curPos + direction * stepsize;
        color = max(value,color);
    }
    */
}
