# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.8

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/shashwat/Downloads/yo/Ray

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/shashwat/Downloads/yo/Ray/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/basanti.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/basanti.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/basanti.dir/flags.make

CMakeFiles/basanti.dir/main.cpp.o: CMakeFiles/basanti.dir/flags.make
CMakeFiles/basanti.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/shashwat/Downloads/yo/Ray/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/basanti.dir/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/basanti.dir/main.cpp.o -c /Users/shashwat/Downloads/yo/Ray/main.cpp

CMakeFiles/basanti.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/basanti.dir/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/shashwat/Downloads/yo/Ray/main.cpp > CMakeFiles/basanti.dir/main.cpp.i

CMakeFiles/basanti.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/basanti.dir/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/shashwat/Downloads/yo/Ray/main.cpp -o CMakeFiles/basanti.dir/main.cpp.s

CMakeFiles/basanti.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/basanti.dir/main.cpp.o.requires

CMakeFiles/basanti.dir/main.cpp.o.provides: CMakeFiles/basanti.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/basanti.dir/build.make CMakeFiles/basanti.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/basanti.dir/main.cpp.o.provides

CMakeFiles/basanti.dir/main.cpp.o.provides.build: CMakeFiles/basanti.dir/main.cpp.o


CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o: CMakeFiles/basanti.dir/flags.make
CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o: ../lib/BoundingBox.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/shashwat/Downloads/yo/Ray/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o -c /Users/shashwat/Downloads/yo/Ray/lib/BoundingBox.cpp

CMakeFiles/basanti.dir/lib/BoundingBox.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/basanti.dir/lib/BoundingBox.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/shashwat/Downloads/yo/Ray/lib/BoundingBox.cpp > CMakeFiles/basanti.dir/lib/BoundingBox.cpp.i

CMakeFiles/basanti.dir/lib/BoundingBox.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/basanti.dir/lib/BoundingBox.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/shashwat/Downloads/yo/Ray/lib/BoundingBox.cpp -o CMakeFiles/basanti.dir/lib/BoundingBox.cpp.s

CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o.requires:

.PHONY : CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o.requires

CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o.provides: CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o.requires
	$(MAKE) -f CMakeFiles/basanti.dir/build.make CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o.provides.build
.PHONY : CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o.provides

CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o.provides.build: CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o


CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o: CMakeFiles/basanti.dir/flags.make
CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o: ../lib/RenderEngine.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/shashwat/Downloads/yo/Ray/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o -c /Users/shashwat/Downloads/yo/Ray/lib/RenderEngine.cpp

CMakeFiles/basanti.dir/lib/RenderEngine.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/basanti.dir/lib/RenderEngine.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/shashwat/Downloads/yo/Ray/lib/RenderEngine.cpp > CMakeFiles/basanti.dir/lib/RenderEngine.cpp.i

CMakeFiles/basanti.dir/lib/RenderEngine.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/basanti.dir/lib/RenderEngine.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/shashwat/Downloads/yo/Ray/lib/RenderEngine.cpp -o CMakeFiles/basanti.dir/lib/RenderEngine.cpp.s

CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o.requires:

.PHONY : CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o.requires

CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o.provides: CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o.requires
	$(MAKE) -f CMakeFiles/basanti.dir/build.make CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o.provides.build
.PHONY : CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o.provides

CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o.provides.build: CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o


CMakeFiles/basanti.dir/lib/utility.cpp.o: CMakeFiles/basanti.dir/flags.make
CMakeFiles/basanti.dir/lib/utility.cpp.o: ../lib/utility.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/shashwat/Downloads/yo/Ray/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/basanti.dir/lib/utility.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/basanti.dir/lib/utility.cpp.o -c /Users/shashwat/Downloads/yo/Ray/lib/utility.cpp

CMakeFiles/basanti.dir/lib/utility.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/basanti.dir/lib/utility.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/shashwat/Downloads/yo/Ray/lib/utility.cpp > CMakeFiles/basanti.dir/lib/utility.cpp.i

CMakeFiles/basanti.dir/lib/utility.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/basanti.dir/lib/utility.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/shashwat/Downloads/yo/Ray/lib/utility.cpp -o CMakeFiles/basanti.dir/lib/utility.cpp.s

CMakeFiles/basanti.dir/lib/utility.cpp.o.requires:

.PHONY : CMakeFiles/basanti.dir/lib/utility.cpp.o.requires

CMakeFiles/basanti.dir/lib/utility.cpp.o.provides: CMakeFiles/basanti.dir/lib/utility.cpp.o.requires
	$(MAKE) -f CMakeFiles/basanti.dir/build.make CMakeFiles/basanti.dir/lib/utility.cpp.o.provides.build
.PHONY : CMakeFiles/basanti.dir/lib/utility.cpp.o.provides

CMakeFiles/basanti.dir/lib/utility.cpp.o.provides.build: CMakeFiles/basanti.dir/lib/utility.cpp.o


CMakeFiles/basanti.dir/ext/glad/src/glad.c.o: CMakeFiles/basanti.dir/flags.make
CMakeFiles/basanti.dir/ext/glad/src/glad.c.o: ../ext/glad/src/glad.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/shashwat/Downloads/yo/Ray/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/basanti.dir/ext/glad/src/glad.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/basanti.dir/ext/glad/src/glad.c.o   -c /Users/shashwat/Downloads/yo/Ray/ext/glad/src/glad.c

CMakeFiles/basanti.dir/ext/glad/src/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/basanti.dir/ext/glad/src/glad.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/shashwat/Downloads/yo/Ray/ext/glad/src/glad.c > CMakeFiles/basanti.dir/ext/glad/src/glad.c.i

CMakeFiles/basanti.dir/ext/glad/src/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/basanti.dir/ext/glad/src/glad.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/shashwat/Downloads/yo/Ray/ext/glad/src/glad.c -o CMakeFiles/basanti.dir/ext/glad/src/glad.c.s

CMakeFiles/basanti.dir/ext/glad/src/glad.c.o.requires:

.PHONY : CMakeFiles/basanti.dir/ext/glad/src/glad.c.o.requires

CMakeFiles/basanti.dir/ext/glad/src/glad.c.o.provides: CMakeFiles/basanti.dir/ext/glad/src/glad.c.o.requires
	$(MAKE) -f CMakeFiles/basanti.dir/build.make CMakeFiles/basanti.dir/ext/glad/src/glad.c.o.provides.build
.PHONY : CMakeFiles/basanti.dir/ext/glad/src/glad.c.o.provides

CMakeFiles/basanti.dir/ext/glad/src/glad.c.o.provides.build: CMakeFiles/basanti.dir/ext/glad/src/glad.c.o


# Object files for target basanti
basanti_OBJECTS = \
"CMakeFiles/basanti.dir/main.cpp.o" \
"CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o" \
"CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o" \
"CMakeFiles/basanti.dir/lib/utility.cpp.o" \
"CMakeFiles/basanti.dir/ext/glad/src/glad.c.o"

# External object files for target basanti
basanti_EXTERNAL_OBJECTS =

../bin/basanti: CMakeFiles/basanti.dir/main.cpp.o
../bin/basanti: CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o
../bin/basanti: CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o
../bin/basanti: CMakeFiles/basanti.dir/lib/utility.cpp.o
../bin/basanti: CMakeFiles/basanti.dir/ext/glad/src/glad.c.o
../bin/basanti: CMakeFiles/basanti.dir/build.make
../bin/basanti: ext/glfw/src/libglfw3.a
../bin/basanti: CMakeFiles/basanti.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/shashwat/Downloads/yo/Ray/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable ../bin/basanti"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/basanti.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/basanti.dir/build: ../bin/basanti

.PHONY : CMakeFiles/basanti.dir/build

CMakeFiles/basanti.dir/requires: CMakeFiles/basanti.dir/main.cpp.o.requires
CMakeFiles/basanti.dir/requires: CMakeFiles/basanti.dir/lib/BoundingBox.cpp.o.requires
CMakeFiles/basanti.dir/requires: CMakeFiles/basanti.dir/lib/RenderEngine.cpp.o.requires
CMakeFiles/basanti.dir/requires: CMakeFiles/basanti.dir/lib/utility.cpp.o.requires
CMakeFiles/basanti.dir/requires: CMakeFiles/basanti.dir/ext/glad/src/glad.c.o.requires

.PHONY : CMakeFiles/basanti.dir/requires

CMakeFiles/basanti.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/basanti.dir/cmake_clean.cmake
.PHONY : CMakeFiles/basanti.dir/clean

CMakeFiles/basanti.dir/depend:
	cd /Users/shashwat/Downloads/yo/Ray/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shashwat/Downloads/yo/Ray /Users/shashwat/Downloads/yo/Ray /Users/shashwat/Downloads/yo/Ray/cmake-build-debug /Users/shashwat/Downloads/yo/Ray/cmake-build-debug /Users/shashwat/Downloads/yo/Ray/cmake-build-debug/CMakeFiles/basanti.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/basanti.dir/depend
