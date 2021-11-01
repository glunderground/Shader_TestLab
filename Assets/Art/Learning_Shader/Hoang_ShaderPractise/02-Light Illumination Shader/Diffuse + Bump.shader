Shader "Hoang/Surface/Diffuse + Bump"
{
    Properties
    {
        _TintColor("TintColor", Color) = (1,1,1,1)
        _Texture ("Diffuse", 2D) = "white" {}
        _BumpMap ("Bump Map", 2D) = "bump" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        CGPROGRAM
            #pragma surface surf Lambert

            struct Input
            {
                float2 uv_Texture;
                float2 uv_BumpMap;
            };

            sampler2D _Texture;
            sampler2D _BumpMap;
            float4 _TintColor;

            void surf (Input IN, inout SurfaceOutput h)
            {
                h.Albedo = (tex2D(_Texture, IN.uv_Texture)*_TintColor).rgb;
                h.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));
            }
        ENDCG
    }
    Fallback"Diffuse"
}
