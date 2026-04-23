project "nfd"
	kind "StaticLib"
	language "C++"
  cppdialect "C++20"
	staticruntime "off" 

	targetdir ("bin/nfd/builds/%{cfg.system}_%{cfg.buildcfg}")
	objdir ("bin/nfd/intermediates/%{cfg.system}")

	includedirs
  {
      "src"
  }

	files
	{
	    "src/include/**.h",
      "src/include/**.hpp",
      "src/**.cpp",
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		optimize "off"

	filter "configurations:Release"
		runtime "Release"
		symbols "off"
		optimize "on"
