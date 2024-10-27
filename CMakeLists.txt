cmake_minimum_required(VERSION 3.27)

# set the project name
project(NaioCudaChallange VERSION 1.0 LANGUAGES CXX CUDA)

option(ENABLE_TESTING "Enables unit-testing" ON)
option(ENABLE_ASAN "Enables address sanitizer tool" OFF)
option(CUDA_ARCH "Sets the cuda architecture property" native)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_CUDA_STANDARD 20)
set(CMAKE_CUDA_STANDARD_REQUIRED ON)

# Avoid warning about DOWNLOAD_EXTRACT_TIMESTAMP in CMake 3.24:
if (CMAKE_VERSION VERSION_GREATER_EQUAL "3.24.0")
	cmake_policy(SET CMP0135 NEW)
endif()

find_package(CUDAToolkit REQUIRED)

# Enable AddressSanitizer based on "ENABLE_ASAN"
if (ENABLE_ASAN)
    set(SANITIZER_FLAGS "-fsanitize=address")
    add_compile_options(${SANITIZER_FLAGS})
    add_link_options(${SANITIZER_FLAGS})
endif()

add_subdirectory(src)

if (ENABLE_TESTING)
    include(CTest)
    add_subdirectory(test)
endif()
