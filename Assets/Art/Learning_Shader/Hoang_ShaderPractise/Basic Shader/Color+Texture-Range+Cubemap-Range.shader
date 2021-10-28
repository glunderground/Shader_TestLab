Shader"Hoang/Basic/Color+Texture-Range+Cubemap-Range"
{

 Properties
 {
    _hColor ("Color", Color) = (1,1,1,1)
    //_Alpha ("Trans", Color) = (1,1,1,1)
    //_Normal("Normal", Color) = (1,1,1,1)
    //_Emission("Emission", Color) = (1,1,1,1)

    _hTexRange ("Texture Range", Range(0,5)) = 1
    _hTex ("Example Texture", 2D) = "white" {}
    _hCube ("Example Cube", CUBE) = "" {}
    _hCubeRange ("Cube Range", Range(0,5)) = 1
    _hFloat ("Example Float", Float) = 0.5
    _hVector ("Example Vector", Vector) = (1,1,1,1)

 }

 SubShader
 {
    CGPROGRAM
          #pragma surface surf Lambert

          struct Input
          {
              float2 uv_hTex /* uv_MainTex */;
              float3 worldRefl;
          };

          fixed4 _hColor;
          //fixed _Alpha;
          //fixed4 _Normal;
          //fixed4 _Emission;

          half _hTexRange;
          half _hCubeRange;
          sampler2D _hTex;
          samplerCUBE _hCube;
          float _hFloat;
          float _hVector;

          void surf (Input IN, inout SurfaceOutput h)
          {
              //h.Albedo /*.r*/ = _hColor.rgb;

              h.Albedo = (tex2D(_hTex, IN.uv_hTex) *_hTexRange *_hColor).rgb;
              //h.Alpha = _Alpha.a;
              //h.Normal = _Normal.rgb;
              //h.Emission = _Emission.r;
              h.Emission = (texCUBE(_hCube, IN.worldRefl)*_hCubeRange).rgb;
          }

    ENDCG
 }
 FallBack "Diffuse"
}