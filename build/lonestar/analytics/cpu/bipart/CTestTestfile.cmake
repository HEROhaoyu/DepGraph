# CMake generated Testfile for 
# Source directory: /home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/cpu/bipart
# Build directory: /home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/cpu/bipart
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(run-small1-bipart-cpu-8 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/cpu/bipart/bipart-cpu" "-hMetisGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/partitioning/ibm01.hgr" "-t" "8")
set_tests_properties(run-small1-bipart-cpu-8 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/cpu/bipart/CMakeLists.txt;5;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/cpu/bipart/CMakeLists.txt;0;")
add_test(run-small1-bipart-cpu-4 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/cpu/bipart/bipart-cpu" "-hMetisGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/partitioning/ibm01.hgr" "-t" "4")
set_tests_properties(run-small1-bipart-cpu-4 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/cpu/bipart/CMakeLists.txt;5;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/cpu/bipart/CMakeLists.txt;0;")
add_test(run-small1-bipart-cpu-2 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/cpu/bipart/bipart-cpu" "-hMetisGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/partitioning/ibm01.hgr" "-t" "2")
set_tests_properties(run-small1-bipart-cpu-2 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/cpu/bipart/CMakeLists.txt;5;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/cpu/bipart/CMakeLists.txt;0;")
add_test(run-small1-bipart-cpu-1 "/home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/cpu/bipart/bipart-cpu" "-hMetisGraph" "/home/zwt/lhy/MyProject/DepGraph/build/inputs/partitioning/ibm01.hgr" "-t" "1")
set_tests_properties(run-small1-bipart-cpu-1 PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/lonestar/CMakeLists.txt;17;add_test;/home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/cpu/bipart/CMakeLists.txt;5;add_test_scale;/home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/cpu/bipart/CMakeLists.txt;0;")
