Shader "Hoang/PBR/PBR-Metalic 1"
{
    Properties
    {
        _Color("Color", color) = (1,1,1,1)
        //_DiffuseMap ("Diffuse", 2D) = "white" {}
        _MetallicColor("Metalic", color) = (1,1,1,1)
        _Metallic("Metalic", Range(0,1)) = 0.5
    }

    SubShader
    {
        Tags { "Queue"="Geometry"}
        CGPROGRAM
          #pragma surface surf Standard

          struct Input
          {
            float2 uv_MetallicColor;
          };

          fixed4 _Color;
          //sampler2D _DiffuseMap;
          fixed4 _MetallicColor;
          half _Metallic;

          void surf (Input IN, inout SurfaceOutputStandard h)
          {
           h.Albedo = _Color.rgb;
           h.Smoothness = _MetallicColor.r;
           h.Metallic = _Metallic;
          }
        ENDCG
    }
    Fallback"Diffuse"
}