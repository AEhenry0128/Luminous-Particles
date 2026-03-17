#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

in vec2 texCoord0;
in vec4 vertexColor;

out vec4 fragColor;

void main() {
    
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    
    if (color.a < 0.1) {
        discard;
    }

    float maxC = max(color.r, max(color.g, color.b));
    float minC = min(color.r, min(color.g, color.b));
    float delta = maxC - minC;

    if (delta > 0.01) {
        color.rgb = mix(vec3(0.3), color.rgb*1.2, 1.2);

    } else {
        color.rgb *= 2.0;
    }
    
    fragColor = color;
}

