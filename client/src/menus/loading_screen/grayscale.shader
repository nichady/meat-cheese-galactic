shader_type canvas_item;

uniform float grayscale;

void fragment() {
    COLOR = texture(TEXTURE, UV);
    float avg = (COLOR.r + COLOR.g + COLOR.b) / 3.0;
    COLOR.rgb = vec3((COLOR.rgb * (1.0 - grayscale) + avg) / (2.0 - grayscale));
}
