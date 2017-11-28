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
    vec3 tbot = (1.0 / r.dir) * (cuboid.min-r.or);
    vec3 ttop = (1.0 / r.dir) * (cuboid.max-r.or);
    vec3 tmin = min(ttop, tbot);
    vec3 tmax = max(ttop, tbot);
    vec2 t = max(tmin.xx, tmin.yz);
    entry = max(0,max(t.x, t.y));
    t = min(tmax.xx, tmax.yz);
    exit = min(t.x, t.y);
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
    float num_steps = 100;
    float stepsize = dist/num_steps;
    vec3 curPos = entry;

    color = vec4(0.0);

    for (int i = 0; i < num_steps; i++) {
        vec3 texPos = (1+curPos)/2;
        texPos.y = 1 - texPos.y; // Image is inverted on y

        value = vec4(texture(texVol, texPos).x);
        curPos = curPos + direction * stepsize;
        color = value + color;
    }

    color/=num_steps;
    color*=2;

}
