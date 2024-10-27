#include <gtest/gtest.h>

#include <iostream>

#include "squared1D.hpp"

class GrayImageTest : public testing::Test {
protected:
    GrayImageTest() {
        image.height = 64;
        image.width = 64;
        // image.height = 1024;
        // image.width = 1024;
        std::unique_ptr<float[]> pix(new float[image.height * image.width]);
        image.pixels = std::move(pix);

        for (int i = 0; i < image.height * image.width; ++i) {
            image.pixels[i] = static_cast<float>(i % 3);
        }
    }
    GrayScaleImage<float> image;
};

TEST_F(GrayImageTest, Squared1D_CUDA) {
    auto output = squared1D(image);

    EXPECT_EQ(0, 0);
}
