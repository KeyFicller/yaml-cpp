project "yaml-cpp"
    kind "StaticLib"
    language "C++"

    targetdir(envir_work_space_directory .. "/bin/" .. envir_output_directory .. "/%{prj.name}")
    objdir(envir_work_space_directory .. "/bin-int/" .. envir_output_directory .. "/%{prj.name}")

    defines {
      "_CRT_SECURE_NO_WARNINGS",
      "YAML_CPP_STATIC_DEFINE"
    }

    files {
		  "src/**.h",
		  "src/**.cpp",
		
		  "include/**.h",
          "premake5.lua"
    }

    includedirs {
        "include"
    }

    links {

    }

    postbuildcommands {
        ("{COPY} %{cfg.buildtarget.relpath} \"../../bin/" .. envir_output_directory .. "/sandbox/\""),
        ("{COPY} %{cfg.buildtarget.relpath} \"../../bin/" .. envir_output_directory .. "/unittest/\"")
    }


    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

	filter "configurations:Release"
        runtime "Release"
        optimize "on"
        flags {
            "StaticRuntime"
        }

