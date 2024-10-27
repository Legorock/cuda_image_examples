# Testing #
include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

add_executable(squared1D_test squared1D.test.cpp)
target_link_libraries(squared1D_test GTest::gtest_main squared1D)

include(GoogleTest)
gtest_discover_tests(squared1D_test)
