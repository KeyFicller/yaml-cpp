project "yaml-cpp"
    kind "StaticLib"
    language "C++"

    targetdir(g_workspaceDir .. "/bin/" .. g_outputDir .. "/%{prj.name}")
    objdir(g_workspaceDir .. "/bin-int/" .. g_outputDir .. "/%{prj.name}")

    defines {"_CRT_SECURE_NO_WARNINGS", "YAML_CPP_STATIC_DEFINE"}

    files {
		"src/**.h",
		"src/**.cpp",
		
		"include/**.h"
    }

    includedirs {
        "include"
    }

    links {

    }

    filter "system:windows"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "On"