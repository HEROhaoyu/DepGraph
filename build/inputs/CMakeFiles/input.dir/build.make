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

# Utility rule file for input.

# Include the progress variables for this target.
include inputs/CMakeFiles/input.dir/progress.make

inputs/CMakeFiles/input: inputs/small_inputs


inputs/small_inputs: inputs/lonestar-cpu-inputs.tar.gz
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Unpacking lonestar-cpu-inputs.tar.gz"
	cd /home/zwt/lhy/MyProject/DepGraph/build/inputs && /usr/local/bin/cmake -E tar xJf lonestar-cpu-inputs.tar.gz

inputs/lonestar-cpu-inputs.tar.gz:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating lonestar-cpu-inputs.tar.gz"
	cd /home/zwt/lhy/MyProject/DepGraph/build/inputs && /usr/local/bin/cmake -P /home/zwt/lhy/MyProject/DepGraph/build/inputs/download.cmake

input: inputs/CMakeFiles/input
input: inputs/small_inputs
input: inputs/lonestar-cpu-inputs.tar.gz
input: inputs/CMakeFiles/input.dir/build.make

.PHONY : input

# Rule to build all files generated by this target.
inputs/CMakeFiles/input.dir/build: input

.PHONY : inputs/CMakeFiles/input.dir/build

inputs/CMakeFiles/input.dir/clean:
	cd /home/zwt/lhy/MyProject/DepGraph/build/inputs && $(CMAKE_COMMAND) -P CMakeFiles/input.dir/cmake_clean.cmake
.PHONY : inputs/CMakeFiles/input.dir/clean

inputs/CMakeFiles/input.dir/depend:
	cd /home/zwt/lhy/MyProject/DepGraph/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zwt/lhy/MyProject/DepGraph /home/zwt/lhy/MyProject/DepGraph/inputs /home/zwt/lhy/MyProject/DepGraph/build /home/zwt/lhy/MyProject/DepGraph/build/inputs /home/zwt/lhy/MyProject/DepGraph/build/inputs/CMakeFiles/input.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : inputs/CMakeFiles/input.dir/depend
