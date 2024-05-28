workspace "Engine"
    architecture "x86_64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

include "Engine/premake5.lua"
include "Sandbox/premake5.lua"
-- include "Game-2/premake5.lua"

-- Run `vendor\bin\premake\premake5.exe clean`
newaction {
    trigger = "clean",
    description = "Clean Projects",
    execute = function()
        print("Cleaning Projects...")
        os.execute("rmdir /s /q bin")
        os.execute("rmdir /s /q bin-build")
        os.execute("rmdir /s /q build")
        os.execute("del /s /q Makefile")
        print("Done.")
    end
}

-- Run `vendor\bin\premake\premake5.exe clean-build`
newaction {
    trigger = "clean-build",
    description = "Clean Build",
    execute = function()
        print("Cleaning Bin and Build Directories...")
        os.execute("rmdir /s /q bin")
        os.execute("rmdir /s /q bin-build")
        os.execute("rmdir /s /q build")
        print("Done.")
    end
}

-- Run `vendor\bin\premake\premake5.exe clean-make`
newaction {
    trigger = "clean-make",
    description = "Clean Make",
    execute = function()
        print("Cleaning Makefiles...")
        os.execute("del /s /q Makefile")
        print("Done.")
    end
}
