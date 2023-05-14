shader_type spatial;

void fragment() {
	ALBEDO=vec2(float(int(UV.x*44.)+int(UV.y*60.)&1),0).xyx;
}
