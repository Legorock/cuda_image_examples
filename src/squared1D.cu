#include <iostream>
#include <math.h>

#include "squared1D.hpp"

// Kernel function to add the elements of two arrays
__global__
void squared_1D(float* input_image, float* output_image, int image_size)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    for (int i = idx; i < image_size ; i += gridDim.x) {
        output_image[i] = input_image[i] * input_image[i];
    }
}

GrayScaleImage<float> squared1D(const GrayScaleImage<float>& image)
{
    int image_size = image.height * image.width;
    float *input_image, *output_image;

    std::cout << "squared1D with size:" << image_size << std::endl;

    // Allocate Unified Memory – accessible from CPU or GPU
    auto err = cudaMallocManaged(&input_image, image_size*sizeof(float));
    if (err != 0) { std::cerr << "Cuda malloc error: " << err << std::endl; }
    err = cudaMallocManaged(&output_image, image_size*sizeof(float));
    if (err != 0) { std::cerr << "Cuda malloc error: " << err << std::endl; }

    // initialize and copy arrays on the host
    for (int i = 0; i < image_size; i++) {
        // input_image[i] = image.pixels[i];
        // output_image[i] = 0;
    }

    std::cout << "squared1D before launch" << std::endl;

    int num_threads = 1024;
    int num_blocks = std::max(image_size / num_threads, 1024);

    // squared_1D<<<num_blocks, num_threads>>>(input_image, output_image, image_size);

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();

    // copy back to CPU
    GrayScaleImage<float> output;
    output.height = image.height;
    output.width = image.width;
    output.pixels = std::unique_ptr<float[]>(new float[image_size]);

    for (int i = 0; i < image_size; i++) {
        output.pixels[i] = output_image[i];
    }

    std::cout << "squared1D before free" << std::endl;

    cudaFree(input_image);
    cudaFree(output_image);

    return output;
}
