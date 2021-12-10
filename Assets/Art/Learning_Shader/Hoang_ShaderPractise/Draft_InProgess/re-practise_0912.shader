Shader "Re-practise_0912"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float uv_MainTex;
        };

        sampler2D _MainTex;

        void surf (Input IN, inout SurfaceOutput h)
        {
            h.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
        }

        ENDCG
    }
    FallBack "Diffuse"
}