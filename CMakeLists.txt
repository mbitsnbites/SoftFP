cmake_minimum_required(VERSION 3.4.3)
project(SoftFP)

#-----------------------------------------------------------------------------
# The SoftFP library.
#-----------------------------------------------------------------------------

add_library(softfp
            softfp.c
            softfp.h
            softfp_template.h
            softfp_template_icvt.h)
target_include_directories(softfp PUBLIC .)
file(READ "VERSION" _config_version)
target_compile_definitions(softfp PRIVATE CONFIG_VERSION=${_config_version})

# Compiler specific flags (e.g. treat warnings as errors).
if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR
   CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  target_compile_options(softfp PRIVATE -Wall -Werror)
elseif(MSVC)
  target_compile_definitions(softfp
                             _CRT_SECURE_NO_WARNINGS
                             _SCL_SECURE_NO_WARNINGS)
  target_compile_options(softfp PRIVATE /WX)
endif()


#-----------------------------------------------------------------------------
# Test.
#-----------------------------------------------------------------------------

# The test uses the softfloat library from qemu.
add_library(softfloat
            softfloat.c
            softfloat.h
            softfloat-macros.h
            softfloat-specialize.h)
target_include_directories(softfloat PUBLIC .)

add_executable(softfptest
               softfptest.c
               softfptest_template.h)
target_link_libraries(softfptest softfp softfloat)

