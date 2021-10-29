Shader "Hoang/Basic/Color+EmiColor"
{
    Properties{
        _Color ("color", Color) = (1,1,1,1)
        _Emission ("Emi", Color) = (1,1,1,1)
    }

    SubShader{
        CGPROGRAM
           #pragma surface surf Lambert

           struct Input{
               float2 uv_MainTex;
           };

           float4 _Color;
           float4 _Emission;

           void surf (Input IN, inout SurfaceOutput o)
           {
               o.Albedo = _Color.rgb;
               o.Emission = _Emission.rgb;
           }
        ENDCG
    }
    Fallback "Diffuse"
}