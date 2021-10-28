Shader "Hoang/Udemy/Challenge1"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Texture", 2D) = "white" {}
        _Range ("Range", Range(0,10)) = 1 
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
             
            sampler2D _MainTex;
            float4 _Color;
            half _Range;

         void surf (Input IN, inout SurfaceOutput h)
         {
            h.Albedo = (tex2D(_MainTex, IN.uv_MainTex) *_Range *_Color).rgb;

            //h.Emission = (texCUBE(_hCube, IN.worldRefl)*+_hCubeRange).rgb;
         }
        ENDCG
    }
    FallBack "Diffuse"
}
