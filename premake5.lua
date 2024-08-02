workspace "Game-Engine"
    architecture "x86_64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

include "Sandbox"

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
        os.execute("del /s /q *.sln")
        os.execute("del /s /q *.vcxproj")
        os.execute("del /s /q *.vcxproj.filters")

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
