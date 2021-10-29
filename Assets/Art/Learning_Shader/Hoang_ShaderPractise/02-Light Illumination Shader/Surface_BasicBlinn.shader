Shader "Hoang/Surface/BasicBlinn"
{
    Properties
    {
        _Color ("BaseColor", Color) = (1,1,1,1)
        _Float("Float", Float) = 0.5
        //Specular
        _SpecColor("SpecColor", Color) = (1,1,1,1) //it's have been defined in the "include" file
        _Specular("Specular", Range (0,1)) = 0.5
        _Glossiness("Glossiness", Range(0,1)) = 0.5
    }

    SubShader
    {
        Tags
        {   
            "Queue" = "Geometry" 
        }

        CGPROGRAM
        #pragma surface surf BlinnPhong

        struct Input
        { 
            float2 uv_MainTex;
        };

        float4 _Color;
        float _Float;
        //float4 _SpecColor; // it's have been defined in the "include" files that Unity builds, so i don't need to define
        half _Specular; //specular power ( value = 0....1)
        float _Glossiness; //specular intensity

        void surf (Input IN, inout SurfaceOutput h)
        {
            h.Albedo = (_Color *_Float).rgb;
            h.Specular = _Specular;
            h.Gloss = _Glossiness;
        }
        ENDCG
    }
    Fallback"Diffuse"
}