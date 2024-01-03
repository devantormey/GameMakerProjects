//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 baseColor = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 shadowColor = vec4(0.0, 0.0, 0.0, 0.5); // Black color with 50% opacity

    // Check if pixel is transparent
    if (baseColor.a == 0.0) {
        discard; // Don't draw transparent pixels
    } else {
        gl_FragColor = shadowColor; // Apply shadow color
    }
}
