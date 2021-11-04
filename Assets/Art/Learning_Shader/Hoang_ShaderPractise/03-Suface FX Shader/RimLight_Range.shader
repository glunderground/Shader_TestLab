Shader "Hoang/RimLight_Range"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _TintColor ("Tint Color", Color) = (1,1,1,1)
        _RimColor ("Rim Color", Color) = (0.0,0.5,0.5,0.0)
        _RimStreng ("Rim Streng", Float) = 0.5
    }
    SubShader
    {

            CGPROGRAM
            #pragma surface surf Lambert

            struct Input
            {
                float2 uv_MainTex;
                float3 viewDir;
            };

            sampler2D _MainTex;
            float4 _RimColor;
            half _RimStreng;
            float4 _TintColor;

            void surf (Input IN, inout SurfaceOutput h)
            {
                half rim = 1 - saturate(dot(normalize(IN.viewDir),h.Normal));
                h.Albedo = tex2D(_MainTex,IN.uv_MainTex)*_TintColor;
                h.Emission = _RimColor.rgb * pow(rim,_RimStreng);

                //cách viết tắt :
                //h.Emission = 1 - dot(IN.viewDir,h.Normal);
            }
            ENDCG

    }
    Fallback"Diffuse"
}
