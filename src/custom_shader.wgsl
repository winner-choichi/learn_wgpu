struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) uv: vec2<f32>,
};

@vertex
fn vs_custom_main (
    @builtin(vertex_index) in_vertex_index: u32,
) -> VertexOutput {
    var out: VertexOutput;
    let x = f32(1 - i32(in_vertex_index)) * 0.5;
    let y = f32(i32(in_vertex_index & 1u)*2 -1) * 0.5;
    out.clip_position = vec4<f32>(x + 0.2, y, 0.0, 1.0);
    out.uv = vec2<f32>(x * 0.5 + 0.5, y * 0.5 + 0.5);

    return out;
}

@fragment
fn fs_custom_main (in: VertexOutput) -> @location(0) vec4<f32> {
    let uv = in.uv;
    return vec4<f32>(uv.x, uv.y, 0.5, 1.0);
}