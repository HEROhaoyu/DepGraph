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
include lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/depend.make

# Include the progress variables for this target.
include lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/progress.make

# Include the compile flags for this target's objects.
include lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/flags.make

lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/IndependentSet.cpp.o: lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/flags.make
lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/IndependentSet.cpp.o: ../lonestar/analytics/cpu/independentset/IndependentSet.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/IndependentSet.cpp.o"
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/cpu/independentset && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/maximal-independentset-cpu.dir/IndependentSet.cpp.o -c /home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/cpu/independentset/IndependentSet.cpp

lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/IndependentSet.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/maximal-independentset-cpu.dir/IndependentSet.cpp.i"
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/cpu/independentset && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/cpu/independentset/IndependentSet.cpp > CMakeFiles/maximal-independentset-cpu.dir/IndependentSet.cpp.i

lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/IndependentSet.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/maximal-independentset-cpu.dir/IndependentSet.cpp.s"
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/cpu/independentset && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/cpu/independentset/IndependentSet.cpp -o CMakeFiles/maximal-independentset-cpu.dir/IndependentSet.cpp.s

# Object files for target maximal-independentset-cpu
maximal__independentset__cpu_OBJECTS = \
"CMakeFiles/maximal-independentset-cpu.dir/IndependentSet.cpp.o"

# External object files for target maximal-independentset-cpu
maximal__independentset__cpu_EXTERNAL_OBJECTS =

lonestar/analytics/cpu/independentset/maximal-independentset-cpu: lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/IndependentSet.cpp.o
lonestar/analytics/cpu/independentset/maximal-independentset-cpu: lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/build.make
lonestar/analytics/cpu/independentset/maximal-independentset-cpu: libgalois/libgalois_shmem.a
lonestar/analytics/cpu/independentset/maximal-independentset-cpu: lonestar/liblonestar/liblonestar.a
lonestar/analytics/cpu/independentset/maximal-independentset-cpu: libgalois/libgalois_shmem.a
lonestar/analytics/cpu/independentset/maximal-independentset-cpu: /usr/lib/x86_64-linux-gnu/libnuma.so
lonestar/analytics/cpu/independentset/maximal-independentset-cpu: /usr/lib/llvm-13/lib/libLLVMSupport.a
lonestar/analytics/cpu/independentset/maximal-independentset-cpu: /usr/lib/x86_64-linux-gnu/libz.so
lonestar/analytics/cpu/independentset/maximal-independentset-cpu: /usr/lib/x86_64-linux-gnu/libtinfo.so
lonestar/analytics/cpu/independentset/maximal-independentset-cpu: /usr/lib/llvm-13/lib/libLLVMDemangle.a
lonestar/analytics/cpu/independentset/maximal-independentset-cpu: lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable maximal-independentset-cpu"
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/cpu/independentset && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/maximal-independentset-cpu.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/build: lonestar/analytics/cpu/independentset/maximal-independentset-cpu

.PHONY : lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/build

lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/clean:
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/cpu/independentset && $(CMAKE_COMMAND) -P CMakeFiles/maximal-independentset-cpu.dir/cmake_clean.cmake
.PHONY : lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/clean

lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/depend:
	cd /home/zwt/lhy/MyProject/DepGraph/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zwt/lhy/MyProject/DepGraph /home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/cpu/independentset /home/zwt/lhy/MyProject/DepGraph/build /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/cpu/independentset /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lonestar/analytics/cpu/independentset/CMakeFiles/maximal-independentset-cpu.dir/depend
