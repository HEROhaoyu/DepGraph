# Install script for directory: /home/zwt/lhy/MyProject/DepGraph/lonestar/analytics/distributed

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/betweennesscentrality/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/bfs/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/connected-components/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/k-core/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/pagerank/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/partition/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/matrixcompletion/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/sssp/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/lonestar/analytics/distributed/triangle-counting/cmake_install.cmake")

endif()

