# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

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

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pzx/server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pzx/server/build

# Include any dependencies generated for this target.
include CMakeFiles/test_fileappender.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/test_fileappender.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/test_fileappender.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_fileappender.dir/flags.make

CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.o: CMakeFiles/test_fileappender.dir/flags.make
CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.o: /home/pzx/server/tests/test_fileAppender.cpp
CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.o: CMakeFiles/test_fileappender.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pzx/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.o -MF CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.o.d -o CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.o -c /home/pzx/server/tests/test_fileAppender.cpp

CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pzx/server/tests/test_fileAppender.cpp > CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.i

CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pzx/server/tests/test_fileAppender.cpp -o CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.s

# Object files for target test_fileappender
test_fileappender_OBJECTS = \
"CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.o"

# External object files for target test_fileappender
test_fileappender_EXTERNAL_OBJECTS =

/home/pzx/server/bin/test_fileappender: CMakeFiles/test_fileappender.dir/tests/test_fileAppender.cpp.o
/home/pzx/server/bin/test_fileappender: CMakeFiles/test_fileappender.dir/build.make
/home/pzx/server/bin/test_fileappender: /home/pzx/server/lib/libatpdxy.so
/home/pzx/server/bin/test_fileappender: CMakeFiles/test_fileappender.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pzx/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/pzx/server/bin/test_fileappender"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_fileappender.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_fileappender.dir/build: /home/pzx/server/bin/test_fileappender
.PHONY : CMakeFiles/test_fileappender.dir/build

CMakeFiles/test_fileappender.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_fileappender.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_fileappender.dir/clean

CMakeFiles/test_fileappender.dir/depend:
	cd /home/pzx/server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pzx/server /home/pzx/server /home/pzx/server/build /home/pzx/server/build /home/pzx/server/build/CMakeFiles/test_fileappender.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_fileappender.dir/depend
