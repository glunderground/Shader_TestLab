Shader "Hoang/Surface/Section3/Challenge1"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _myRange ("myRange", Range(0,5)) = 1
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        CGPROGRAM
            #pragma surface surf Lambert

            struct Input
            {
                float2 uv_MainTex;
            };

            float4 _Color;
            float _myRange;
            sampler2D _MainTex;

           void surf (Input IN, inout SurfaceOutput h)
           {
               h.Albedo = (tex2D(_MainTex, IN.uv_MainTex)* _myRange * _Color).rgb;
               //h.Emissive = _myRange.rgb;
           }
        ENDCG
    }
    FallBack"Diffuse"
}
