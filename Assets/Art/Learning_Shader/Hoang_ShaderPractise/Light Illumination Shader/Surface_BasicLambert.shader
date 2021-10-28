Shader "Hoang/Surface/BasicLambert"
{
    Properties
    {
        _Color ("BaseColor", Color) = (1,1,1,1)
        //Specular
        //_SpecColor("SpecColor", Color) = (1,1,1,1) //it's have been defined in the "include" file
        //_Specular("Specular", Range (0,1)) = 0.5
        //_Glossiness("Glossiness", Range(0,1)) = 0.5 
        
    }

    SubShader
    {
        Tags
        {    "Queue" = "Geometry"    }

        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        { 
            float2 uv_MainTex;
        };

        float4 _Color;
        //float4 _SpecColor; // it's have been defined in the "include" files that Unity builds, so i don't need to define
        //float2 _Specular;
        //float2 _Glossiness;

        void surf (Input IN, inout SurfaceOutput h)
        {
            h.Albedo = _Color.rgb;
            //h.Specular = _Specular;
            //h.Gloss = _Glossiness;
        }
        ENDCG
    }
    Fallback"Diffuse"
}