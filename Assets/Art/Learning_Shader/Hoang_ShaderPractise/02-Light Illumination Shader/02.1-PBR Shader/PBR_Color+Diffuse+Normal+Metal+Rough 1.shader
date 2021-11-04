Shader "Hoang/PBR/PBR_Color+Diffuse+Normal+Metal+Rough2"
{
    Properties
    {
        _TintColor("TintColor", Color) = (1,1,1,1)
        _Texture ("Diffuse", 2D) = "white" {}
        _BumpMap ("Bump Map", 2D) = "bump" {}
        _Roughness("Roughness", Range(0,1)) = 0.5
        _Metallic("Metalic", Range(0,1)) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        CGPROGRAM
            #pragma surface surf Standard

            struct Input
            {
                float2 uv_Texture;
                float2 uv_BumpMap;
                float2 uv_Roughness;
            };

            sampler2D _Texture;
            sampler2D _BumpMap;
            float4 _TintColor;
            half _Roughness;
            half _Metallic;

            void surf (Input IN, inout SurfaceOutputStandard h)
            {
                h.Albedo = (tex2D(_Texture, IN.uv_Texture)*_TintColor).rgb;
                h.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));
                h.Smoothness = _Roughness;
                h.Metallic = _Metallic;

            }
        ENDCG
    }
    Fallback"Diffuse"
}
