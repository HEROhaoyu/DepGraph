#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Galois::support" for configuration "Debug"
set_property(TARGET Galois::support APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Galois::support PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libgalois_support.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS Galois::support )
list(APPEND _IMPORT_CHECK_FILES_FOR_Galois::support "${_IMPORT_PREFIX}/lib/libgalois_support.a" )

# Import target "Galois::shmem" for configuration "Debug"
set_property(TARGET Galois::shmem APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Galois::shmem PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libgalois_shmem.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS Galois::shmem )
list(APPEND _IMPORT_CHECK_FILES_FOR_Galois::shmem "${_IMPORT_PREFIX}/lib/libgalois_shmem.a" )

# Import target "Galois::dist_async" for configuration "Debug"
set_property(TARGET Galois::dist_async APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Galois::dist_async PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libgalois_dist_async.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS Galois::dist_async )
list(APPEND _IMPORT_CHECK_FILES_FOR_Galois::dist_async "${_IMPORT_PREFIX}/lib/libgalois_dist_async.a" )

# Import target "Galois::gluon" for configuration "Debug"
set_property(TARGET Galois::gluon APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Galois::gluon PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libgalois_gluon.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS Galois::gluon )
list(APPEND _IMPORT_CHECK_FILES_FOR_Galois::gluon "${_IMPORT_PREFIX}/lib/libgalois_gluon.a" )

# Import target "Galois::graph-convert" for configuration "Debug"
set_property(TARGET Galois::graph-convert APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Galois::graph-convert PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/graph-convert"
  )

list(APPEND _IMPORT_CHECK_TARGETS Galois::graph-convert )
list(APPEND _IMPORT_CHECK_FILES_FOR_Galois::graph-convert "${_IMPORT_PREFIX}/bin/graph-convert" )

# Import target "Galois::graph-convert-huge" for configuration "Debug"
set_property(TARGET Galois::graph-convert-huge APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Galois::graph-convert-huge PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/graph-convert-huge"
  )

list(APPEND _IMPORT_CHECK_TARGETS Galois::graph-convert-huge )
list(APPEND _IMPORT_CHECK_FILES_FOR_Galois::graph-convert-huge "${_IMPORT_PREFIX}/bin/graph-convert-huge" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
