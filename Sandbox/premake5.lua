include "Engine"

project "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{_ACTION}/%{prj.name}")
    objdir ("%{wks.location}/bin-build/" .. outputdir .. "/%{_ACTION}/%{prj.name}")

    files
    {
        "include/**.h",
        "src/**.cpp"
    }

    includedirs
    {
        "%{wks.location}/Engine/src/Engine/include",
        "%{wks.location}/Engine/vendor/spdlog/include"
    }

    links
    {
        "Engine"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "GE_PLATFORM_WINDOWS"
        }

        postbuildcommands
        {
            '{COPYFILE} "%{wks.location}/bin/' .. outputdir .. '/%{_ACTION}/Engine/Engine.dll" "%{wks.location}/bin/' .. outputdir .. '/%{_ACTION}/%{prj.name}"'
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
