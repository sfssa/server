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
include CMakeFiles/atpdxy.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/atpdxy.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/atpdxy.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/atpdxy.dir/flags.make

CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.o: CMakeFiles/atpdxy.dir/flags.make
CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.o: /home/pzx/server/atpdxy/base/fileappender.cpp
CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.o: CMakeFiles/atpdxy.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pzx/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.o -MF CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.o.d -o CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.o -c /home/pzx/server/atpdxy/base/fileappender.cpp

CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pzx/server/atpdxy/base/fileappender.cpp > CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.i

CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pzx/server/atpdxy/base/fileappender.cpp -o CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.s

CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.o: CMakeFiles/atpdxy.dir/flags.make
CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.o: /home/pzx/server/atpdxy/base/utils.cpp
CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.o: CMakeFiles/atpdxy.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pzx/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.o -MF CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.o.d -o CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.o -c /home/pzx/server/atpdxy/base/utils.cpp

CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pzx/server/atpdxy/base/utils.cpp > CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.i

CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pzx/server/atpdxy/base/utils.cpp -o CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.s

CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.o: CMakeFiles/atpdxy.dir/flags.make
CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.o: /home/pzx/server/atpdxy/base/mutex.cpp
CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.o: CMakeFiles/atpdxy.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pzx/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.o -MF CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.o.d -o CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.o -c /home/pzx/server/atpdxy/base/mutex.cpp

CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pzx/server/atpdxy/base/mutex.cpp > CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.i

CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pzx/server/atpdxy/base/mutex.cpp -o CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.s

CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.o: CMakeFiles/atpdxy.dir/flags.make
CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.o: /home/pzx/server/atpdxy/base/countdownlatch.cpp
CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.o: CMakeFiles/atpdxy.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pzx/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.o -MF CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.o.d -o CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.o -c /home/pzx/server/atpdxy/base/countdownlatch.cpp

CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pzx/server/atpdxy/base/countdownlatch.cpp > CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.i

CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pzx/server/atpdxy/base/countdownlatch.cpp -o CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.s

# Object files for target atpdxy
atpdxy_OBJECTS = \
"CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.o" \
"CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.o" \
"CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.o" \
"CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.o"

# External object files for target atpdxy
atpdxy_EXTERNAL_OBJECTS =

/home/pzx/server/lib/libatpdxy.so: CMakeFiles/atpdxy.dir/atpdxy/base/fileappender.cpp.o
/home/pzx/server/lib/libatpdxy.so: CMakeFiles/atpdxy.dir/atpdxy/base/utils.cpp.o
/home/pzx/server/lib/libatpdxy.so: CMakeFiles/atpdxy.dir/atpdxy/base/mutex.cpp.o
/home/pzx/server/lib/libatpdxy.so: CMakeFiles/atpdxy.dir/atpdxy/base/countdownlatch.cpp.o
/home/pzx/server/lib/libatpdxy.so: CMakeFiles/atpdxy.dir/build.make
/home/pzx/server/lib/libatpdxy.so: CMakeFiles/atpdxy.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pzx/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX shared library /home/pzx/server/lib/libatpdxy.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/atpdxy.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/atpdxy.dir/build: /home/pzx/server/lib/libatpdxy.so
.PHONY : CMakeFiles/atpdxy.dir/build

CMakeFiles/atpdxy.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/atpdxy.dir/cmake_clean.cmake
.PHONY : CMakeFiles/atpdxy.dir/clean

CMakeFiles/atpdxy.dir/depend:
	cd /home/pzx/server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pzx/server /home/pzx/server /home/pzx/server/build /home/pzx/server/build /home/pzx/server/build/CMakeFiles/atpdxy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/atpdxy.dir/depend

