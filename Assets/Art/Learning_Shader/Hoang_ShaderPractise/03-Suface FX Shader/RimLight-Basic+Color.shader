Shader "Hoang/RimLight-Basic+Color"
{
    Properties
    {
        _RimColor ("Rim Color", Color) = (0.0,0.5,0.5,0.0)
        _Color("Base Color", Color) = (0,0,0,0)
    }
    SubShader
    {

            CGPROGRAM
            #pragma surface surf Lambert

            struct Input
            {
                float3 viewDir;
            };
            float4 _RimColor;
            float4 _Color;

            void surf (Input IN, inout SurfaceOutput h)
            {
                //half rim = dot(normalize(IN.viewDir),h.Normal);
                half dotp = dot(IN.viewDir,h.Normal);
                h.Albedo = float3(dotp,1,1)*_Color;
                //h.Emission = _RimColor.rgb * rim;
            }
            ENDCG

    }
    Fallback"Diffuse"
}
