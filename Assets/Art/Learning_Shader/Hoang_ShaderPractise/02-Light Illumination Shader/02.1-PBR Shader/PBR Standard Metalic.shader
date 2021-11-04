Shader "Hoang/PBR/PBR-Metalic"
{
    Properties
    {
        _Color("Color", color) = (1,1,1,1)
        //_DiffuseMap ("Diffuse", 2D) = "white" {}
        _MetallicTex("Metalic", 2D) = "white" {}
        _Metallic("Metalic", Range(0,1)) = 0.5
    }

    SubShader
    {
        Tags { "Queue"="Geometry"}
        CGPROGRAM
          #pragma surface surf Standard

          struct Input
          {
            float2 uv_MetallicTex;
          };

          fixed4 _Color;
          //sampler2D _DiffuseMap;
          sampler2D _MetallicTex;
          half _Metallic;

          void surf (Input IN, inout SurfaceOutputStandard h)
          {
           h.Albedo = _Color.rgb;
           h.Smoothness = tex2D (_MetallicTex, IN.uv_MetallicTex).r;
           h.Metallic = _Metallic;
          }
        ENDCG
    }
    Fallback"Diffuse"
}