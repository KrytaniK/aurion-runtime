-- Workspace Declarations
workspace "AurionRuntime"
    architecture "x64"
    startproject "AurionRuntime"

    configurations { "Debug", "Release", "Dist"}

    outputdir = "%{cfg.buildcfg}_%{cfg.system}_%{cfg.architecture}"

-- Project Declaration
project "AurionRuntime"
    kind "SharedLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "Off"

    targetdir ("%{wks.location}/build/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/build/bin-int/" .. outputdir .. "/%{prj.name}")

    allmodulespublic "On"
    scanformoduledependencies "true"

    files { "modules/**.ixx", "src/**.cpp" }

    includedirs {}

    libdirs {}

    links {}

    -- Platform Filters
    filter "system:windows"
		systemversion "latest"

        defines { "AURION_PLATFORM_WINDOWS" }

    -- Configuration Filters
    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

        defines { "AURION_RUNTIME_DEBUG" }

        links {}

    filter "configurations:Release"
        runtime "Release"
        optimize "On"

        links {}

    filter "configurations:Dist"
        runtime "Release"
        optimize "On"

        links {}