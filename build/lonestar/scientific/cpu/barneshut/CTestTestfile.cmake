# CMake generated Testfile for 
# Source directory: /home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/barneshut
# Build directory: /home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/barneshut
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(run-small-barneshut-cpu-8 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/barneshut/barneshut-cpu" "-n" "10000" "-steps" "1" "-seed" "0" "-t" "8")
set_tests_properties(run-small-barneshut-cpu-8 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/barneshut/CMakeLists.txt;10;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/barneshut/CMakeLists.txt;0;")
add_test(run-small-barneshut-cpu-4 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/barneshut/barneshut-cpu" "-n" "10000" "-steps" "1" "-seed" "0" "-t" "4")
set_tests_properties(run-small-barneshut-cpu-4 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/barneshut/CMakeLists.txt;10;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/barneshut/CMakeLists.txt;0;")
add_test(run-small-barneshut-cpu-2 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/barneshut/barneshut-cpu" "-n" "10000" "-steps" "1" "-seed" "0" "-t" "2")
set_tests_properties(run-small-barneshut-cpu-2 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/barneshut/CMakeLists.txt;10;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/barneshut/CMakeLists.txt;0;")
add_test(run-small-barneshut-cpu-1 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/barneshut/barneshut-cpu" "-n" "10000" "-steps" "1" "-seed" "0" "-t" "1")
set_tests_properties(run-small-barneshut-cpu-1 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/barneshut/CMakeLists.txt;10;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/barneshut/CMakeLists.txt;0;")
