#pragma once

#include <memory>

template<typename Pixel>
struct GrayScaleImage
{
    int height = 0;
    int width = 0;
    std::unique_ptr<Pixel[]> pixels = nullptr;
};
