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
include lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/depend.make

# Include the progress variables for this target.
include lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/progress.make

# Include the compile flags for this target's objects.
include lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/flags.make

lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/bfs_pull.cpp.o: lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/flags.make
lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/bfs_pull.cpp.o: ../lonestar/analytics/distributed/bfs/bfs_pull.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/bfs_pull.cpp.o"
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/bfs && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/bfs-pull-dist.dir/bfs_pull.cpp.o -c /home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/distributed/bfs/bfs_pull.cpp

lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/bfs_pull.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bfs-pull-dist.dir/bfs_pull.cpp.i"
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/bfs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/distributed/bfs/bfs_pull.cpp > CMakeFiles/bfs-pull-dist.dir/bfs_pull.cpp.i

lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/bfs_pull.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bfs-pull-dist.dir/bfs_pull.cpp.s"
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/bfs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/distributed/bfs/bfs_pull.cpp -o CMakeFiles/bfs-pull-dist.dir/bfs_pull.cpp.s

# Object files for target bfs-pull-dist
bfs__pull__dist_OBJECTS = \
"CMakeFiles/bfs-pull-dist.dir/bfs_pull.cpp.o"

# External object files for target bfs-pull-dist
bfs__pull__dist_EXTERNAL_OBJECTS =

lonestar/analytics/distributed/bfs/bfs-pull-dist: lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/bfs_pull.cpp.o
lonestar/analytics/distributed/bfs/bfs-pull-dist: lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/build.make
lonestar/analytics/distributed/bfs/bfs-pull-dist: libgalois/libgalois_shmem.a
lonestar/analytics/distributed/bfs/bfs-pull-dist: /usr/lib/llvm-13/lib/libLLVMSupport.a
lonestar/analytics/distributed/bfs/bfs-pull-dist: lonestar/libdistbench/libdistbench.a
lonestar/analytics/distributed/bfs/bfs-pull-dist: /usr/lib/llvm-13/lib/libLLVMSupport.a
lonestar/analytics/distributed/bfs/bfs-pull-dist: /usr/lib/x86_64-linux-gnu/libz.so
lonestar/analytics/distributed/bfs/bfs-pull-dist: /usr/lib/x86_64-linux-gnu/libtinfo.so
lonestar/analytics/distributed/bfs/bfs-pull-dist: /usr/lib/llvm-13/lib/libLLVMDemangle.a
lonestar/analytics/distributed/bfs/bfs-pull-dist: libgluon/libgalois_gluon.a
lonestar/analytics/distributed/bfs/bfs-pull-dist: libdist/libgalois_dist_async.a
lonestar/analytics/distributed/bfs/bfs-pull-dist: libgalois/libgalois_shmem.a
lonestar/analytics/distributed/bfs/bfs-pull-dist: /usr/lib/x86_64-linux-gnu/libnuma.so
lonestar/analytics/distributed/bfs/bfs-pull-dist: /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi_cxx.so
lonestar/analytics/distributed/bfs/bfs-pull-dist: /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so
lonestar/analytics/distributed/bfs/bfs-pull-dist: lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bfs-pull-dist"
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/bfs && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bfs-pull-dist.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/build: lonestar/analytics/distributed/bfs/bfs-pull-dist

.PHONY : lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/build

lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/clean:
	cd /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/bfs && $(CMAKE_COMMAND) -P CMakeFiles/bfs-pull-dist.dir/cmake_clean.cmake
.PHONY : lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/clean

lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/depend:
	cd /home/zwt/lhy/MyProject/DepGraph/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zwt/lhy/MyProject/DepGraph /home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/distributed/bfs /home/zwt/lhy/MyProject/DepGraph/build /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/bfs /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lonestar/analytics/distributed/bfs/CMakeFiles/bfs-pull-dist.dir/depend

