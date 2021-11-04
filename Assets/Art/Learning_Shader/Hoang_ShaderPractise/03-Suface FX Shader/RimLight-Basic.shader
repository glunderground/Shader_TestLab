Shader "Hoang/RimLight-Basic"
{
    Properties
    {
        //_RimColor ("Rim Color", Color) = (0.0,0.5,0.5,0.0)
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

            void surf (Input IN, inout SurfaceOutput h)
            {
                //half rim = dot(normalize(IN.viewDir),h.Normal);
                //h.Albedo = float3(dot(IN.viewDir,h.Normal),1,1-dot(IN.viewDir,h.Normal)); //nền vàng. rimlight xanh
                //h.Albedo.r = 1-dot(IN.viewDir,h.Normal); //rimlight màu đỏ

                //cách viết bình thường
                /*
                half dotp = 1-dot(IN.viewDir,h.Normal);
                h.Albedo = float3(1,dotp,1); */

                //cách viết tắt
                //h.Albedo = float3(1,dot(IN.viewDir,h.Normal),1);
                //h.Albedo = float3(dot(IN.viewDir,h.Normal),1,1-dot(IN.viewDir,h.Normal));

                //tác dụng giống nhau
                //h.Albedo = float3(1-dot(IN.viewDir,h.Normal),0,0);
                //h.Albedo.r = 1 - dot(IN.viewDir,h.Normal);
                //h.Emission.r = 1 - dot(IN.viewDir,h.Normal);
                h.Albedo.gb = float2(1-dot(IN.viewDir,h.Normal),0);

                //h.Emission = _RimColor.rgb * rim;
            }
            ENDCG

    }
    Fallback"Diffuse"
}
