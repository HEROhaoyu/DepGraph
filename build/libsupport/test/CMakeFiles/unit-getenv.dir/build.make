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
include libsupport/test/CMakeFiles/unit-getenv.dir/depend.make

# Include the progress variables for this target.
include libsupport/test/CMakeFiles/unit-getenv.dir/progress.make

# Include the compile flags for this target's objects.
include libsupport/test/CMakeFiles/unit-getenv.dir/flags.make

libsupport/test/CMakeFiles/unit-getenv.dir/getenv.cpp.o: libsupport/test/CMakeFiles/unit-getenv.dir/flags.make
libsupport/test/CMakeFiles/unit-getenv.dir/getenv.cpp.o: ../libsupport/test/getenv.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object libsupport/test/CMakeFiles/unit-getenv.dir/getenv.cpp.o"
	cd /home/zwt/lhy/MyProject/DepGraph/build/libsupport/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/unit-getenv.dir/getenv.cpp.o -c /home/zwt/lhy/MyProject/DepGraph/libsupport/test/getenv.cpp

libsupport/test/CMakeFiles/unit-getenv.dir/getenv.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/unit-getenv.dir/getenv.cpp.i"
	cd /home/zwt/lhy/MyProject/DepGraph/build/libsupport/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zwt/lhy/MyProject/DepGraph/libsupport/test/getenv.cpp > CMakeFiles/unit-getenv.dir/getenv.cpp.i

libsupport/test/CMakeFiles/unit-getenv.dir/getenv.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/unit-getenv.dir/getenv.cpp.s"
	cd /home/zwt/lhy/MyProject/DepGraph/build/libsupport/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zwt/lhy/MyProject/DepGraph/libsupport/test/getenv.cpp -o CMakeFiles/unit-getenv.dir/getenv.cpp.s

# Object files for target unit-getenv
unit__getenv_OBJECTS = \
"CMakeFiles/unit-getenv.dir/getenv.cpp.o"

# External object files for target unit-getenv
unit__getenv_EXTERNAL_OBJECTS =

libsupport/test/unit-getenv: libsupport/test/CMakeFiles/unit-getenv.dir/getenv.cpp.o
libsupport/test/unit-getenv: libsupport/test/CMakeFiles/unit-getenv.dir/build.make
libsupport/test/unit-getenv: libsupport/libgalois_support.a
libsupport/test/unit-getenv: /usr/lib/libfmt.a
libsupport/test/unit-getenv: libsupport/test/CMakeFiles/unit-getenv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable unit-getenv"
	cd /home/zwt/lhy/MyProject/DepGraph/build/libsupport/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/unit-getenv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libsupport/test/CMakeFiles/unit-getenv.dir/build: libsupport/test/unit-getenv

.PHONY : libsupport/test/CMakeFiles/unit-getenv.dir/build

libsupport/test/CMakeFiles/unit-getenv.dir/clean:
	cd /home/zwt/lhy/MyProject/DepGraph/build/libsupport/test && $(CMAKE_COMMAND) -P CMakeFiles/unit-getenv.dir/cmake_clean.cmake
.PHONY : libsupport/test/CMakeFiles/unit-getenv.dir/clean

libsupport/test/CMakeFiles/unit-getenv.dir/depend:
	cd /home/zwt/lhy/MyProject/DepGraph/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zwt/lhy/MyProject/DepGraph /home/zwt/lhy/MyProject/DepGraph/libsupport/test /home/zwt/lhy/MyProject/DepGraph/build /home/zwt/lhy/MyProject/DepGraph/build/libsupport/test /home/zwt/lhy/MyProject/DepGraph/build/libsupport/test/CMakeFiles/unit-getenv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libsupport/test/CMakeFiles/unit-getenv.dir/depend
