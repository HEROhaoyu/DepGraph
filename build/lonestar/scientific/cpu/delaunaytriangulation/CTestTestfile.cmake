# CMake generated Testfile for 
# Source directory: /home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation
# Build directory: /home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(run-small1-delaunaytriangulation-cpu-8 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/reference/meshes/r10k.node" "-t" "8")
set_tests_properties(run-small1-delaunaytriangulation-cpu-8 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;5;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small1-delaunaytriangulation-cpu-4 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/reference/meshes/r10k.node" "-t" "4")
set_tests_properties(run-small1-delaunaytriangulation-cpu-4 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;5;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small1-delaunaytriangulation-cpu-2 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/reference/meshes/r10k.node" "-t" "2")
set_tests_properties(run-small1-delaunaytriangulation-cpu-2 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;5;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small1-delaunaytriangulation-cpu-1 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/reference/meshes/r10k.node" "-t" "1")
set_tests_properties(run-small1-delaunaytriangulation-cpu-1 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;5;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small2-delaunaytriangulation-cpu-8 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/meshes/250k.2.node" "-t" "8")
set_tests_properties(run-small2-delaunaytriangulation-cpu-8 PROPERTIES  _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;6;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small2-delaunaytriangulation-cpu-4 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/meshes/250k.2.node" "-t" "4")
set_tests_properties(run-small2-delaunaytriangulation-cpu-4 PROPERTIES  _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;6;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small2-delaunaytriangulation-cpu-2 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/meshes/250k.2.node" "-t" "2")
set_tests_properties(run-small2-delaunaytriangulation-cpu-2 PROPERTIES  _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;6;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small2-delaunaytriangulation-cpu-1 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/meshes/250k.2.node" "-t" "1")
set_tests_properties(run-small2-delaunaytriangulation-cpu-1 PROPERTIES  _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;6;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small1-delaunaytriangulation-deterministic-cpu-8 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-deterministic-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/reference/meshes/r10k.node" "-t" "8")
set_tests_properties(run-small1-delaunaytriangulation-deterministic-cpu-8 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;16;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small1-delaunaytriangulation-deterministic-cpu-4 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-deterministic-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/reference/meshes/r10k.node" "-t" "4")
set_tests_properties(run-small1-delaunaytriangulation-deterministic-cpu-4 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;16;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small1-delaunaytriangulation-deterministic-cpu-2 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-deterministic-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/reference/meshes/r10k.node" "-t" "2")
set_tests_properties(run-small1-delaunaytriangulation-deterministic-cpu-2 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;16;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small1-delaunaytriangulation-deterministic-cpu-1 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-deterministic-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/reference/meshes/r10k.node" "-t" "1")
set_tests_properties(run-small1-delaunaytriangulation-deterministic-cpu-1 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;16;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small2-delaunaytriangulation-deterministic-cpu-8 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-deterministic-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/meshes/250k.2.node" "-t" "8")
set_tests_properties(run-small2-delaunaytriangulation-deterministic-cpu-8 PROPERTIES  _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;17;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small2-delaunaytriangulation-deterministic-cpu-4 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-deterministic-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/meshes/250k.2.node" "-t" "4")
set_tests_properties(run-small2-delaunaytriangulation-deterministic-cpu-4 PROPERTIES  _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;17;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small2-delaunaytriangulation-deterministic-cpu-2 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-deterministic-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/meshes/250k.2.node" "-t" "2")
set_tests_properties(run-small2-delaunaytriangulation-deterministic-cpu-2 PROPERTIES  _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;17;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
add_test(run-small2-delaunaytriangulation-deterministic-cpu-1 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/scientific/cpu/delaunaytriangulation/delaunaytriangulation-deterministic-cpu" "-meshGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/meshes/250k.2.node" "-t" "1")
set_tests_properties(run-small2-delaunaytriangulation-deterministic-cpu-1 PROPERTIES  _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;17;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/scientific/cpu/delaunaytriangulation/CMakeLists.txt;0;")
