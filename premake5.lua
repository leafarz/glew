project "glew"
	kind "StaticLib"
	language "C"

	targetdir ("bin/lib/" .. outputdir)
	objdir ("bin/intermediate/lib/" .. outputdir)

	files
	{
		"include/GL/glew.h",
		"src/glew.c"
	}

	includedirs
	{
		"include"
	}

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "system:windows"
		staticruntime "On"
		systemversion "latest"
		defines
		{
			"GLEW_STATIC",
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"

	filter "configurations:MinSizeRelease"
		runtime "Release"
		optimize "On"