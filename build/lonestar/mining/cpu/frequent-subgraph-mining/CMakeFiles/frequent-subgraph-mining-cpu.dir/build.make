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
include lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/depend.make

# Include the progress variables for this target.
include lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/progress.make

# Include the compile flags for this target's objects.
include lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/flags.make

lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/fsm.cpp.o: lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/flags.make
lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/fsm.cpp.o: ../lonestar/mining/cpu/frequent-subgraph-mining/fsm.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/fsm.cpp.o"
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/mining/cpu/frequent-subgraph-mining && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/frequent-subgraph-mining-cpu.dir/fsm.cpp.o -c /home/zwt/lhy/MyProject/DepGraph/lonestar/mining/cpu/frequent-subgraph-mining/fsm.cpp

lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/fsm.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/frequent-subgraph-mining-cpu.dir/fsm.cpp.i"
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/mining/cpu/frequent-subgraph-mining && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zwt/lhy/MyProject/DepGraph/lonestar/mining/cpu/frequent-subgraph-mining/fsm.cpp > CMakeFiles/frequent-subgraph-mining-cpu.dir/fsm.cpp.i

lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/fsm.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/frequent-subgraph-mining-cpu.dir/fsm.cpp.s"
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/mining/cpu/frequent-subgraph-mining && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zwt/lhy/MyProject/DepGraph/lonestar/mining/cpu/frequent-subgraph-mining/fsm.cpp -o CMakeFiles/frequent-subgraph-mining-cpu.dir/fsm.cpp.s

# Object files for target frequent-subgraph-mining-cpu
frequent__subgraph__mining__cpu_OBJECTS = \
"CMakeFiles/frequent-subgraph-mining-cpu.dir/fsm.cpp.o"

# External object files for target frequent-subgraph-mining-cpu
frequent__subgraph__mining__cpu_EXTERNAL_OBJECTS =

lonestar/mining/cpu/frequent-subgraph-mining/frequent-subgraph-mining-cpu: lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/fsm.cpp.o
lonestar/mining/cpu/frequent-subgraph-mining/frequent-subgraph-mining-cpu: lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/build.make
lonestar/mining/cpu/frequent-subgraph-mining/frequent-subgraph-mining-cpu: libpangolin/libpangolin.a
lonestar/mining/cpu/frequent-subgraph-mining/frequent-subgraph-mining-cpu: lonestar/mining/libminingbench/libminingbench.a
lonestar/mining/cpu/frequent-subgraph-mining/frequent-subgraph-mining-cpu: lonestar/liblonestar/liblonestar.a
lonestar/mining/cpu/frequent-subgraph-mining/frequent-subgraph-mining-cpu: libgalois/libgalois_shmem.a
lonestar/mining/cpu/frequent-subgraph-mining/frequent-subgraph-mining-cpu: /usr/lib/x86_64-linux-gnu/libnuma.so
lonestar/mining/cpu/frequent-subgraph-mining/frequent-subgraph-mining-cpu: /usr/lib/llvm-13/lib/libLLVMSupport.a
lonestar/mining/cpu/frequent-subgraph-mining/frequent-subgraph-mining-cpu: /usr/lib/x86_64-linux-gnu/libz.so
lonestar/mining/cpu/frequent-subgraph-mining/frequent-subgraph-mining-cpu: /usr/lib/x86_64-linux-gnu/libtinfo.so
lonestar/mining/cpu/frequent-subgraph-mining/frequent-subgraph-mining-cpu: /usr/lib/llvm-13/lib/libLLVMDemangle.a
lonestar/mining/cpu/frequent-subgraph-mining/frequent-subgraph-mining-cpu: lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable frequent-subgraph-mining-cpu"
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/mining/cpu/frequent-subgraph-mining && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/frequent-subgraph-mining-cpu.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/build: lonestar/mining/cpu/frequent-subgraph-mining/frequent-subgraph-mining-cpu

.PHONY : lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/build

lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/clean:
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/mining/cpu/frequent-subgraph-mining && $(CMAKE_COMMAND) -P CMakeFiles/frequent-subgraph-mining-cpu.dir/cmake_clean.cmake
.PHONY : lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/clean

lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/depend:
	cd /home/zwt/lhy/MyProject/DepGraph/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zwt/lhy/MyProject/DepGraph /home/zwt/lhy/MyProject/DepGraph/lonestar/mining/cpu/frequent-subgraph-mining /home/zwt/lhy/MyProject/DepGraph/build /home/zwt/lhy/MyProject/DepGraph/build/lonestar/mining/cpu/frequent-subgraph-mining /home/zwt/lhy/MyProject/DepGraph/build/lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lonestar/mining/cpu/frequent-subgraph-mining/CMakeFiles/frequent-subgraph-mining-cpu.dir/depend

