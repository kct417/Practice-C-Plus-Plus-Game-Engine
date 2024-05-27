project "Game-2"
    location (_SCRIPT_DIR)
    kind "ConsoleApp"
    language "C++"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/build/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{wks.location}/%{prj.name}/include/**.h",
        "%{wks.location}/%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{wks.location}/Engine/src",
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
            "{COPYFILE} %{wks.location}/bin/" .. outputdir .. "/Engine/*.dll %{wks.location}/bin/" .. outputdir .. "/%{prj.name}/"
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
