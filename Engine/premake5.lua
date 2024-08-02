IncludeDir = {}
IncludeDir["glfw"] = "vendor/glfw/include"

include "vendor/glfw"

project "Engine"
    kind "SharedLib"
    language "C++"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{_ACTION}/%{prj.name}")
    objdir ("%{wks.location}/bin-build/" .. outputdir .. "/%{_ACTION}/%{prj.name}")

    pchheader "gepch.h"
    pchsource "src/Engine/src/gepch.cpp"

    files
    {
        "src/Engine/include/**.h",
        "src/Engine/src/**.cpp"
    }

    includedirs
    {
        "src/Engine/include",
        "vendor/spdlog/include",
        "%{IncludeDir.glfw}"
    }

    links
    {
        "GLFW",
        "opengl32"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "GE_PLATFORM_WINDOWS",
            "GE_BUILD_DLL"
        }

        links
        {
            "gdi32"
        }

    filter "configurations:Debug"
        defines "GE_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "GE_RELEASE"
        optimize "On"
        symbols "Off"

    filter "configurations:Dist"
        defines "GE_DIST"
        optimize "On"
        symbols "Off"
