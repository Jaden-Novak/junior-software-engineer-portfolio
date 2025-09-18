#include "helpers.h"
#include <math.h>

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    // Loop over all pixels
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {

            // Create average value of RGBs
            float grayscale_v =
                (image[i][j].rgbtRed + image[i][j].rgbtBlue + image[i][j].rgbtGreen) / 3.0;

            // Apply average value to all RGBs
            image[i][j].rgbtRed = round(grayscale_v);
            image[i][j].rgbtBlue = round(grayscale_v);
            image[i][j].rgbtGreen = round(grayscale_v);
        }
    }
    return;
}

// Convert image to sephia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{
    // Loop over all pixels
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {

            // Create values for sephiaRGBs
            float sephiaRed = .393 * image[i][j].rgbtRed + .769 * image[i][j].rgbtGreen +
                              .189 * image[i][j].rgbtBlue;
            if (round(sephiaRed) > 255)
                sephiaRed = 255;
            float sephiaGreen = .349 * image[i][j].rgbtRed + .686 * image[i][j].rgbtGreen +
                                .168 * image[i][j].rgbtBlue;
            if (round(sephiaGreen) > 255)
                sephiaGreen = 255;
            float sephiaBlue = .272 * image[i][j].rgbtRed + .534 * image[i][j].rgbtGreen +
                               .131 * image[i][j].rgbtBlue;
            if (round(sephiaBlue) > 255)
                sephiaBlue = 255;

            // Update old RGB values to sephiaRGB values
            image[i][j].rgbtRed = round(sephiaRed);
            image[i][j].rgbtBlue = round(sephiaBlue);
            image[i][j].rgbtGreen = round(sephiaGreen);
        }
    }
    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    // Create a copy of image
    RGBTRIPLE copy[height][width];

    // Create copy so don't reflect already reflected values
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            copy[i][j] = image[i][j];
        }
    }

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            // Loop backwards from end of row, take reverse value ([width - 1 is the last value in
            // the array])
            image[i][j] = copy[i][width - 1 - j];
        }
    }
    return;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    // Create a copy of image
    RGBTRIPLE copy[height][width];

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            copy[i][j] = image[i][j];
        }
    }
    // Need to create an average that doesn't include values on the outer edges
    // This means a counter needs to be created so that average can be calculated dynamically
    // Outside boundary means: < height of 0 || < width of 0 || > image[height] || > image[width]
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            int red_t = 0;
            int green_t = 0;
            int blue_t = 0;
            int counter = 0;

            // Look at every 3x3 pixel around a pixel (i, j)
            for (int row = -1; row < 2; row++)
            {
                for (int col = -1; col < 2; col++)
                {
                    // Create temp value for each i, j within 3x3 grid
                    int temp_i = i + row; // row + row offset
                    int temp_j = j + col; // column + column offset

                    // Check if temp_i is outside array, if it is, continue (don't add anything,
                    // dont update counter)
                    if (temp_i < 0 || temp_i >= height || temp_j < 0 || temp_j >= width)
                    {
                        continue;
                    }

                    // Add all values of 3x3 grid to total
                    red_t += copy[temp_i][temp_j].rgbtRed;
                    green_t += copy[temp_i][temp_j].rgbtGreen;
                    blue_t += copy[temp_i][temp_j].rgbtBlue;

                    // Add to counter through each loop
                    counter++;
                }
            }
            // Average out total values, put in original image
            image[i][j].rgbtRed = round((float) red_t / counter);
            image[i][j].rgbtGreen = round((float) green_t / counter);
            image[i][j].rgbtBlue = round((float) blue_t / counter);
        }
    }
    return;
}
