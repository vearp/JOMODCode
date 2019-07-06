varying vec2 Texcoord;
//varying vec3 nrm;

void main(void)
{

      vec3 normal, lightDir;
      vec4 diffuse, ambient, globalAmbient;
      float NdotL;
      
      normal = normalize(gl_NormalMatrix * gl_Normal);
	//nrm=normal;
      lightDir = normalize(vec3(gl_LightSource[0].position));
      NdotL = max(dot(normal, lightDir), 0.0);
      diffuse = gl_FrontMaterial.diffuse * gl_LightSource[0].diffuse;
      
      /* Compute the ambient and globalAmbient terms */
      ambient = gl_FrontMaterial.ambient * gl_LightSource[0].ambient;
      globalAmbient = gl_LightModel.ambient * gl_FrontMaterial.ambient;
      
      gl_FrontColor =  NdotL * diffuse + globalAmbient + ambient;
   
   Texcoord    = gl_MultiTexCoord0.xy;
   gl_Position     = ftransform();
}