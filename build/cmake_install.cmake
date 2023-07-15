# Install script for directory: /home/zwt/lhy/MyProject/DepGraph

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Galois" TYPE FILE FILES
    "/home/zwt/lhy/MyProject/DepGraph/build/GaloisConfigVersion.cmake"
    "/home/zwt/lhy/MyProject/DepGraph/build/GaloisConfig.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Galois/GaloisTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Galois/GaloisTargets.cmake"
         "/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles/Export/lib/cmake/Galois/GaloisTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Galois/GaloisTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Galois/GaloisTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Galois" TYPE FILE FILES "/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles/Export/lib/cmake/Galois/GaloisTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Galois" TYPE FILE FILES "/home/zwt/lhy/MyProject/DepGraph/build/CMakeFiles/Export/lib/cmake/Galois/GaloisTargets-debug.cmake")
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/zwt/lhy/MyProject/DepGraph/build/libsupport/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/libgalois/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/libpygalois/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/libdist/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/libcusp/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/libgluon/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/libpangolin/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/lonestar/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/scripts/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/inputs/cmake_install.cmake")
  include("/home/zwt/lhy/MyProject/DepGraph/build/tools/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/zwt/lhy/MyProject/DepGraph/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
