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

-   VSCode

    1. Install extension `CMake Tools`
    2. Press `Ctrl + Shift + P`
    3. Select `CMake: Configure` OR `CMake: Build Target`
        - Choose `CMake: Configure` to configure and build in separate steps
        - Choose `CMake: Build Target` to configure and build in single step
        - `CMake: Configure`
            - command-line
                - Run `cmake --build build`
            - `CMake: Build Target`
                - Select build target
        - `CMake: Build Target`
            - Select build target

-   command-line

    1.  Run `cmake -B build`
    2.  Run `cmake --build build`

Files (library files / executable files) will be stored in bin directory

Intermediates (object files) will be stored in build directory

### Helpful Commands

-   `git clean -dfx`
    -   Remove all files not under source control
-   `git clean -dfxn`
    -   Check what files `git clean -dfx` would remove
