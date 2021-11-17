Shader"Hoang/Color+EmiColor+NormalColor1"
{
    Properties
    {
       _Color("Color", Color) = (1,1,1,1)
       _EmiColor("Emissive", Color) = (1,1,1,1)
       _NormalMap("NormalMap",2D) = "white" {}
    }

    SubShader
    {
        CGPROGRAM
          #pragma surface surf BlinnPhong
          //#pragma vertex vert
          //#pragma fragment frag
          struct Input
          {
            float2 uv_MainTex;
            float2 uv_NormalMap;
          };

          float4 _Color;
          float4 _EmiColor;
          sampler2D _NormalMap;

          void surf (Input IN, inout SurfaceOutput h)
          {
            h.Albedo = _Color.rgb;
            h.Emission = _EmiColor.rgb;
            h.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap));
          }
        ENDCG
    }
    Fallback "Diffuse" //"Color+EmiColor_NormalColor1"
}

