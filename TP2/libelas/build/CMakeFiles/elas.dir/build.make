# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/build"

# Include any dependencies generated for this target.
include CMakeFiles/elas.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/elas.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/elas.dir/flags.make

CMakeFiles/elas.dir/src/filter.cpp.o: CMakeFiles/elas.dir/flags.make
CMakeFiles/elas.dir/src/filter.cpp.o: ../src/filter.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/build/CMakeFiles" $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/elas.dir/src/filter.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/elas.dir/src/filter.cpp.o -c "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/filter.cpp"

CMakeFiles/elas.dir/src/filter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/elas.dir/src/filter.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/filter.cpp" > CMakeFiles/elas.dir/src/filter.cpp.i

CMakeFiles/elas.dir/src/filter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/elas.dir/src/filter.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/filter.cpp" -o CMakeFiles/elas.dir/src/filter.cpp.s

CMakeFiles/elas.dir/src/filter.cpp.o.requires:
.PHONY : CMakeFiles/elas.dir/src/filter.cpp.o.requires

CMakeFiles/elas.dir/src/filter.cpp.o.provides: CMakeFiles/elas.dir/src/filter.cpp.o.requires
	$(MAKE) -f CMakeFiles/elas.dir/build.make CMakeFiles/elas.dir/src/filter.cpp.o.provides.build
.PHONY : CMakeFiles/elas.dir/src/filter.cpp.o.provides

CMakeFiles/elas.dir/src/filter.cpp.o.provides.build: CMakeFiles/elas.dir/src/filter.cpp.o
.PHONY : CMakeFiles/elas.dir/src/filter.cpp.o.provides.build

CMakeFiles/elas.dir/src/elas.cpp.o: CMakeFiles/elas.dir/flags.make
CMakeFiles/elas.dir/src/elas.cpp.o: ../src/elas.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/build/CMakeFiles" $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/elas.dir/src/elas.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/elas.dir/src/elas.cpp.o -c "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/elas.cpp"

CMakeFiles/elas.dir/src/elas.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/elas.dir/src/elas.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/elas.cpp" > CMakeFiles/elas.dir/src/elas.cpp.i

CMakeFiles/elas.dir/src/elas.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/elas.dir/src/elas.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/elas.cpp" -o CMakeFiles/elas.dir/src/elas.cpp.s

CMakeFiles/elas.dir/src/elas.cpp.o.requires:
.PHONY : CMakeFiles/elas.dir/src/elas.cpp.o.requires

CMakeFiles/elas.dir/src/elas.cpp.o.provides: CMakeFiles/elas.dir/src/elas.cpp.o.requires
	$(MAKE) -f CMakeFiles/elas.dir/build.make CMakeFiles/elas.dir/src/elas.cpp.o.provides.build
.PHONY : CMakeFiles/elas.dir/src/elas.cpp.o.provides

CMakeFiles/elas.dir/src/elas.cpp.o.provides.build: CMakeFiles/elas.dir/src/elas.cpp.o
.PHONY : CMakeFiles/elas.dir/src/elas.cpp.o.provides.build

CMakeFiles/elas.dir/src/matrix.cpp.o: CMakeFiles/elas.dir/flags.make
CMakeFiles/elas.dir/src/matrix.cpp.o: ../src/matrix.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/build/CMakeFiles" $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/elas.dir/src/matrix.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/elas.dir/src/matrix.cpp.o -c "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/matrix.cpp"

CMakeFiles/elas.dir/src/matrix.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/elas.dir/src/matrix.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/matrix.cpp" > CMakeFiles/elas.dir/src/matrix.cpp.i

CMakeFiles/elas.dir/src/matrix.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/elas.dir/src/matrix.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/matrix.cpp" -o CMakeFiles/elas.dir/src/matrix.cpp.s

CMakeFiles/elas.dir/src/matrix.cpp.o.requires:
.PHONY : CMakeFiles/elas.dir/src/matrix.cpp.o.requires

CMakeFiles/elas.dir/src/matrix.cpp.o.provides: CMakeFiles/elas.dir/src/matrix.cpp.o.requires
	$(MAKE) -f CMakeFiles/elas.dir/build.make CMakeFiles/elas.dir/src/matrix.cpp.o.provides.build
.PHONY : CMakeFiles/elas.dir/src/matrix.cpp.o.provides

CMakeFiles/elas.dir/src/matrix.cpp.o.provides.build: CMakeFiles/elas.dir/src/matrix.cpp.o
.PHONY : CMakeFiles/elas.dir/src/matrix.cpp.o.provides.build

CMakeFiles/elas.dir/src/descriptor.cpp.o: CMakeFiles/elas.dir/flags.make
CMakeFiles/elas.dir/src/descriptor.cpp.o: ../src/descriptor.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/build/CMakeFiles" $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/elas.dir/src/descriptor.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/elas.dir/src/descriptor.cpp.o -c "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/descriptor.cpp"

CMakeFiles/elas.dir/src/descriptor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/elas.dir/src/descriptor.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/descriptor.cpp" > CMakeFiles/elas.dir/src/descriptor.cpp.i

CMakeFiles/elas.dir/src/descriptor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/elas.dir/src/descriptor.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/descriptor.cpp" -o CMakeFiles/elas.dir/src/descriptor.cpp.s

CMakeFiles/elas.dir/src/descriptor.cpp.o.requires:
.PHONY : CMakeFiles/elas.dir/src/descriptor.cpp.o.requires

CMakeFiles/elas.dir/src/descriptor.cpp.o.provides: CMakeFiles/elas.dir/src/descriptor.cpp.o.requires
	$(MAKE) -f CMakeFiles/elas.dir/build.make CMakeFiles/elas.dir/src/descriptor.cpp.o.provides.build
.PHONY : CMakeFiles/elas.dir/src/descriptor.cpp.o.provides

CMakeFiles/elas.dir/src/descriptor.cpp.o.provides.build: CMakeFiles/elas.dir/src/descriptor.cpp.o
.PHONY : CMakeFiles/elas.dir/src/descriptor.cpp.o.provides.build

CMakeFiles/elas.dir/src/triangle.cpp.o: CMakeFiles/elas.dir/flags.make
CMakeFiles/elas.dir/src/triangle.cpp.o: ../src/triangle.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/build/CMakeFiles" $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/elas.dir/src/triangle.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/elas.dir/src/triangle.cpp.o -c "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/triangle.cpp"

CMakeFiles/elas.dir/src/triangle.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/elas.dir/src/triangle.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/triangle.cpp" > CMakeFiles/elas.dir/src/triangle.cpp.i

CMakeFiles/elas.dir/src/triangle.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/elas.dir/src/triangle.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/src/triangle.cpp" -o CMakeFiles/elas.dir/src/triangle.cpp.s

CMakeFiles/elas.dir/src/triangle.cpp.o.requires:
.PHONY : CMakeFiles/elas.dir/src/triangle.cpp.o.requires

CMakeFiles/elas.dir/src/triangle.cpp.o.provides: CMakeFiles/elas.dir/src/triangle.cpp.o.requires
	$(MAKE) -f CMakeFiles/elas.dir/build.make CMakeFiles/elas.dir/src/triangle.cpp.o.provides.build
.PHONY : CMakeFiles/elas.dir/src/triangle.cpp.o.provides

CMakeFiles/elas.dir/src/triangle.cpp.o.provides.build: CMakeFiles/elas.dir/src/triangle.cpp.o
.PHONY : CMakeFiles/elas.dir/src/triangle.cpp.o.provides.build

# Object files for target elas
elas_OBJECTS = \
"CMakeFiles/elas.dir/src/filter.cpp.o" \
"CMakeFiles/elas.dir/src/elas.cpp.o" \
"CMakeFiles/elas.dir/src/matrix.cpp.o" \
"CMakeFiles/elas.dir/src/descriptor.cpp.o" \
"CMakeFiles/elas.dir/src/triangle.cpp.o"

# External object files for target elas
elas_EXTERNAL_OBJECTS =

libelas.a: CMakeFiles/elas.dir/src/filter.cpp.o
libelas.a: CMakeFiles/elas.dir/src/elas.cpp.o
libelas.a: CMakeFiles/elas.dir/src/matrix.cpp.o
libelas.a: CMakeFiles/elas.dir/src/descriptor.cpp.o
libelas.a: CMakeFiles/elas.dir/src/triangle.cpp.o
libelas.a: CMakeFiles/elas.dir/build.make
libelas.a: CMakeFiles/elas.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libelas.a"
	$(CMAKE_COMMAND) -P CMakeFiles/elas.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/elas.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/elas.dir/build: libelas.a
.PHONY : CMakeFiles/elas.dir/build

CMakeFiles/elas.dir/requires: CMakeFiles/elas.dir/src/filter.cpp.o.requires
CMakeFiles/elas.dir/requires: CMakeFiles/elas.dir/src/elas.cpp.o.requires
CMakeFiles/elas.dir/requires: CMakeFiles/elas.dir/src/matrix.cpp.o.requires
CMakeFiles/elas.dir/requires: CMakeFiles/elas.dir/src/descriptor.cpp.o.requires
CMakeFiles/elas.dir/requires: CMakeFiles/elas.dir/src/triangle.cpp.o.requires
.PHONY : CMakeFiles/elas.dir/requires

CMakeFiles/elas.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/elas.dir/cmake_clean.cmake
.PHONY : CMakeFiles/elas.dir/clean

CMakeFiles/elas.dir/depend:
	cd "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas" "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas" "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/build" "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/build" "/home/pablo/svn/materias/vision en robótica/tps/tp4/src/libelas/build/CMakeFiles/elas.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/elas.dir/depend

