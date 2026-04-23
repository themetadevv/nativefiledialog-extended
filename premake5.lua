project "nfd"
	kind "StaticLib"
	language "C++"
  	cppdialect "C++20"
	staticruntime "off" 

	targetdir ("bin/nfd/builds/%{cfg.system}_%{cfg.buildcfg}")
	objdir ("bin/nfd/intermediates/%{cfg.system}")

	includedirs
  	{
      	"src/include"
  	}

	files
	{
	    "src/include/**.h",
      	"src/include/**.hpp"
	}

	filter "system:windows"
        systemversion "latest"

        defines
        {
            "NFD_PLATFORM_WINDOWS"
        }

        files
        {
            "src/nfd_win.cpp"
        }

    filter "system:linux"
        pic "On"

        defines
        {
            "NFD_PLATFORM_LINUX"
        }

        files
        {
            "src/nfd_gtk.c"
        }

        links
        {
            "gtk-3",
            "gobject-2.0",
            "glib-2.0"
        }

    filter "system:macosx"
        defines
        {
            "NFD_PLATFORM_MACOS"
        }

        files
        {
            "src/nfd_cocoa.m"
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
