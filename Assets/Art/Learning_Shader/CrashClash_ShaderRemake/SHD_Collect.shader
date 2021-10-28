Shader "Hoang/Clone_CrashClash_Shader/SHD_Collect"
{
    Properties
    {
        _Color1 ("Color", Color) = (1,1,1,1)
        //_Color2 ("Color", Color) = (1,1,1,1)
        _TexRange ("TexRange", Range (0,10)) = 0.5
        _MainTex ("Texture", 2D) = "white" {}
        //_Glow ("Glow", Range (0,10)) = 0.5
        _Emission ("Emission", Color) = (1,1,1,1)
    }
    SubShader
    {
            CGPROGRAM
            #pragma surface surf Lambert

            struct Input
            {
                float2 uv_MainTex;
                float3 worldfRelf;
            };

            float4 _Color1;
            //float4 _Color2;
            half _TexRange;
            //float3 _Glow;
            sampler2D _MainTex;
            float4 _Emission;

            void surf (Input IN, inout SurfaceOutput h)
            {
                h.Albedo = (tex2D(_MainTex, IN.uv_MainTex) *_TexRange *_Color1).rgb;
                h.Emission = _Emission;
            }
            ENDCG
    }
    FallBack "Diffuse"
}
