# CMake generated Testfile for 
# Source directory: /home/zwt/lhy/MyProject/DepGraph/libsupport/test
# Build directory: /home/zwt/lhy/MyProject/DepGraph/build/libsupport/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(unit-getenv "/home/zwt/lhy/MyProject/DepGraph/build/libsupport/test/unit-getenv")
set_tests_properties(unit-getenv PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/libsupport/test/CMakeLists.txt;9;add_test;/home/zwt/lhy/MyProject/DepGraph/libsupport/test/CMakeLists.txt;19;add_test_unit;/home/zwt/lhy/MyProject/DepGraph/libsupport/test/CMakeLists.txt;0;")
add_test(unit-logging "/home/zwt/lhy/MyProject/DepGraph/build/libsupport/test/unit-logging")
set_tests_properties(unit-logging PROPERTIES  ENVIRONMENT "GALOIS_DO_NOT_BIND_THREADS=1" LABELS "quick" _BACKTRACE_TRIPLES "/home/zwt/lhy/MyProject/DepGraph/libsupport/test/CMakeLists.txt;9;add_test;/home/zwt/lhy/MyProject/DepGraph/libsupport/test/CMakeLists.txt;20;add_test_unit;/home/zwt/lhy/MyProject/DepGraph/libsupport/test/CMakeLists.txt;0;")
