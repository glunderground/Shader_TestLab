Shader"Hoang/Basic/Color+EmiColor+NormalColor"
{

 Properties
 {
    _Color("Color", Color) = (1,1,1,1)
    _Normal("Normal", Color) = (1,1,1,1)
    _Emission("Emission", Color) = (1,1,1,1)
 }

 SubShader
 {
    CGPROGRAM
          #pragma surface surf Lambert

          struct Input
          {
              float2 uv_MainTex;
          };

          fixed4 _Color;
          fixed4 _Normal;
          fixed4 _Emission;

          void surf (Input IN, inout SurfaceOutput h)
          {
              h.Albedo = _Color.rgb;
              h.Normal = _Normal.rgb;
              h.Emission = _Emission.rgb;
          }

    ENDCG
 }
 FallBack "Diffuse"
}