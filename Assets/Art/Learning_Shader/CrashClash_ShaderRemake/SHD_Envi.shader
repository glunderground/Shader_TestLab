Shader "Hoang/Clone_CrashClash_Shader/SHD_Envi"
{
    Properties
    {
        _Color1 ("Color", Color) = (1,1,1,1)
        _Color2 ("Color", Color) = (0,0,0,0)
        //_MainTex ("Texture", 2D) = "white" {}
        //_Range1 ("Range", Range(0,10)) = 1 
        //_Range2 ("Range", Range(0,10)) = 1 
    }

    SubShader
    {

        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
         {
           half uv1_MainTex;
           half uv2_MainTex;
           //float3 worldfRelf;
         };
             
            //sampler2D _MainTex;
            float4 _Color1;
            float4 _Color2;
            //half _Range1;
            //half _Range2;

         void surf (Input IN, inout SurfaceOutput h)
         {
            //h.Albedo = (tex2D(_MainTex, IN.uv_MainTex) *_Range *_Color).rgb;
            h.Albedo = (_Color1 *_Color2).rgb;
            //h.Emission = (texCUBE(_hCube, IN.worldRefl)*+_hCubeRange).rgb;
         }
        ENDCG
    }
    FallBack "Diffuse"
}
