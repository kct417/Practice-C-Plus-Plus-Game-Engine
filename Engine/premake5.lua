project "Engine"
    kind "SharedLib"
    language "C++"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-build/" .. outputdir .. "/%{prj.name}")

    pchheader "gepch.h"
    pchsource "%{wks.location}/%{prj.name}/src/Engine/src/gepch.cpp"

    files
    {
        "%{wks.location}/%{prj.name}/src/**.h",
        "%{wks.location}/%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{wks.location}/%{prj.name}/src/Engine/include",
        "%{wks.location}/%{prj.name}/vendor/spdlog/include"
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

    filter "configurations:Debug"
        defines "GE_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "GE_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "GE_DIST"
        optimize "On"
