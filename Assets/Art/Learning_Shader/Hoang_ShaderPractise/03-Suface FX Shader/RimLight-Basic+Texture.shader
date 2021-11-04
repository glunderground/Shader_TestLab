Shader "Hoang/RimLight-Basic+Texture"
{
    Properties
    {
        _RimColor ("Rim Color", Color) = (0.0,0.5,0.5,0.0)
        _MainTex("Texture", 2D) = "white" {}
        _Float1("Float1",Vector) = (1,1,1)
    }
    SubShader
    {

            CGPROGRAM
            #pragma surface surf Lambert

            struct Input
            {
                float3 viewDir;
                float2 uv_MainTex;
            };
            float4 _RimColor;
            float4 _Color;
            sampler2D _MainTex;
            float3 _Float1;

            void surf (Input IN, inout SurfaceOutput h)
            {
                //half rim = dot(normalize(IN.viewDir),h.Normal);
                half dotProduct = dot(IN.viewDir,h.Normal);
                h.Albedo = (tex2D(_MainTex,IN.uv_MainTex)*(1-dotProduct)).rgb;
                h.Emission = _RimColor*(1-dotProduct)*_Float1;
            }
            ENDCG

    }
    Fallback"Diffuse"
}
