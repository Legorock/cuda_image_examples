# add the executable

add_executable(naoiCuda main.cpp)

target_include_directories(naoiCuda PRIVATE "external")

#add_library(squared1D SHARED imageSquared1D.cu)
#target_link_libraries(squared1D PUBLIC CUDA::cudart)
#target_include_directories(squared1D PUBLIC "include")
#set_target_properties(squared1D PROPERTIES CUDA_ARCHITECTURES ${CUDA_ARCH})
#
#add_library(squared2D SHARED imageSquared2D.cu)
#target_link_libraries(squared2D PUBLIC CUDA::cudart)
#target_include_directories(squared2D PUBLIC "include")
#set_target_properties(squared2D PROPERTIES CUDA_ARCHITECTURES ${CUDA_ARCH})
#
#add_library(squared2D_perf shared imageSquared2D_perf.cu)
#target_link_libraries(squared2D_perf public cuda::cudart)
#target_include_directories(squared2D_perf public "include")
#set_target_properties(squared2D_perf PROPERTIES CUDA_ARCHITECTURES ${CUDA_ARCH})
#
#add_library(perceptron SHARED perceptron.cu)
#target_link_libraries(perceptron PUBLIC CUDA::cudart)
#target_include_directories(perceptron PUBLIC "include")
#set_target_properties(perceptron PROPERTIES CUDA_ARCHITECTURES ${CUDA_ARCH})
#
#target_link_libraries(naoiCuda PRIVATE
#    squared1D
#    squared2D
#    squared2D_perf
#    perceptron
#    )
