#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal; 
layout (location = 2) in vec2 aTexCoord;

out vec3 FragPos;
out vec3 Normal;
out vec2 TexCoords;

uniform mat4 modelcubes;
uniform mat4 view;
uniform mat4 projection;
uniform mat4 transform;

void main()
{
	gl_Position = projection * view * transform * modelcubes * vec4(aPos, 1.0f);
	TexCoords = vec2(aTexCoord.x, aTexCoord.y);
	FragPos = vec3(transform * modelcubes * vec4(aPos, 1.0));
    Normal = mat3(transpose(inverse(transform * modelcubes))) * aNormal;  
}

