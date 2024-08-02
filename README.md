# Practice-C-Plus-Plus-Game-Engine

## Credit

Code adapted from YouTube tutorials by The Cherno and sudocpp:

-   The Cherno
    -   https://www.youtube.com/playlist?list=PLlrATfBNZ98dC-V-N3m0Go4deliWHPFwT
-   sudocpp
    -   https://www.youtube.com/playlist?list=PLsCsQorDHC9Wism5Xlp8ZKtKeGBeCJJ72

## Usage

### General

-   System Requirements
    -   `Windows-x86_64`
-   Git Submodules
    -   Run `git submodule update --init --recursive`

### CMake

-   VSCode `CMake Tools: Build`

    1.  Install extension `CMake Tools`
    2.  Press `Ctrl + Shift + P`
    3.  Select `CMake: Build Target`
        -   If no targets (choose one)
            -   Select `CMake: Configure`
            -   Type desired target

-   command-line

    1.  Run `cmake -B build`
    2.  Run `cmake --build build`

### Premake

-   Windows `Batch file Solution`

    1.  Run `GenerateSolution.bat`
    2.  Run `msbuild`

-   Windows `Batch file Makefile`

    1.  Run `GenerateMakefile.bat`
    2.  Run `make`

-   command-line

    1.  Run `vendor\bin\Premake\premake5.exe <build type>`
    2.  Run Corresponding command (`msbuild`, `make`, etc.)

#### You may need to rerun commands or reload your window if your system does not recognize newly created files

#### Files (libraries / executable files) will be stored in bin directory

#### Intermediates (object files) will be stored in build directory

### Helpful Commands

-   `git clean -dfx`
    -   Remove all files not under source control
-   `git clean -dfxn`
    -   Check what files `git clean -dfx` would remove
-   Run `CleanProjects.bat`
    -   Remove all Makefiles and root `bin` / `bin-build` / `build` directories
-   Check `premake5.lua` in root directory for more premake commands
-   Check `tasks.json` and `launch.json` in `.vscode` directory for more tasks
