# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zwt/lhy/MyProject/DepGraph

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zwt/lhy/MyProject/DepGraph/build

# Include any dependencies generated for this target.
include libgalois/test/CMakeFiles/unit-papi.dir/depend.make

# Include the progress variables for this target.
include libgalois/test/CMakeFiles/unit-papi.dir/progress.make

# Include the compile flags for this target's objects.
include libgalois/test/CMakeFiles/unit-papi.dir/flags.make

libgalois/test/CMakeFiles/unit-papi.dir/papi.cpp.o: libgalois/test/CMakeFiles/unit-papi.dir/flags.make
libgalois/test/CMakeFiles/unit-papi.dir/papi.cpp.o: ../libgalois/test/papi.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object libgalois/test/CMakeFiles/unit-papi.dir/papi.cpp.o"
	cd /home/zwt/lhy/MyProject/DepGraph/build/libgalois/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/unit-papi.dir/papi.cpp.o -c /home/zwt/lhy/MyProject/DepGraph/libgalois/test/papi.cpp

libgalois/test/CMakeFiles/unit-papi.dir/papi.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/unit-papi.dir/papi.cpp.i"
	cd /home/zwt/lhy/MyProject/DepGraph/build/libgalois/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zwt/lhy/MyProject/DepGraph/libgalois/test/papi.cpp > CMakeFiles/unit-papi.dir/papi.cpp.i

libgalois/test/CMakeFiles/unit-papi.dir/papi.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/unit-papi.dir/papi.cpp.s"
	cd /home/zwt/lhy/MyProject/DepGraph/build/libgalois/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zwt/lhy/MyProject/DepGraph/libgalois/test/papi.cpp -o CMakeFiles/unit-papi.dir/papi.cpp.s

# Object files for target unit-papi
unit__papi_OBJECTS = \
"CMakeFiles/unit-papi.dir/papi.cpp.o"

# External object files for target unit-papi
unit__papi_EXTERNAL_OBJECTS =

libgalois/test/unit-papi: libgalois/test/CMakeFiles/unit-papi.dir/papi.cpp.o
libgalois/test/unit-papi: libgalois/test/CMakeFiles/unit-papi.dir/build.make
libgalois/test/unit-papi: libgalois/libgalois_shmem.a
libgalois/test/unit-papi: lonestar/liblonestar/liblonestar.a
libgalois/test/unit-papi: libgalois/libgalois_shmem.a
libgalois/test/unit-papi: /usr/lib/x86_64-linux-gnu/libnuma.so
libgalois/test/unit-papi: /usr/lib/llvm-13/lib/libLLVMSupport.a
libgalois/test/unit-papi: /usr/lib/x86_64-linux-gnu/libz.so
libgalois/test/unit-papi: /usr/lib/x86_64-linux-gnu/libtinfo.so
libgalois/test/unit-papi: /usr/lib/llvm-13/lib/libLLVMDemangle.a
libgalois/test/unit-papi: libgalois/test/CMakeFiles/unit-papi.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable unit-papi"
	cd /home/zwt/lhy/MyProject/DepGraph/build/libgalois/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/unit-papi.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libgalois/test/CMakeFiles/unit-papi.dir/build: libgalois/test/unit-papi

.PHONY : libgalois/test/CMakeFiles/unit-papi.dir/build

libgalois/test/CMakeFiles/unit-papi.dir/clean:
	cd /home/zwt/lhy/MyProject/DepGraph/build/libgalois/test && $(CMAKE_COMMAND) -P CMakeFiles/unit-papi.dir/cmake_clean.cmake
.PHONY : libgalois/test/CMakeFiles/unit-papi.dir/clean

libgalois/test/CMakeFiles/unit-papi.dir/depend:
	cd /home/zwt/lhy/MyProject/DepGraph/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zwt/lhy/MyProject/DepGraph /home/zwt/lhy/MyProject/DepGraph/libgalois/test /home/zwt/lhy/MyProject/DepGraph/build /home/zwt/lhy/MyProject/DepGraph/build/libgalois/test /home/zwt/lhy/MyProject/DepGraph/build/libgalois/test/CMakeFiles/unit-papi.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libgalois/test/CMakeFiles/unit-papi.dir/depend
