precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec4 color = texture2D(tex, v_texcoord);
    gl_FragColor = vec4(color.rgb * 0.2, color.a);
}
