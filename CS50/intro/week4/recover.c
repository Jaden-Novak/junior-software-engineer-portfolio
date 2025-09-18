#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    // Accept single line argument
    if (argc != 2)
    {
        printf("Usage: ./recover FILE\n");
        return 1;
    }

    // Open memory card
    FILE *card = fopen(argv[1], "r");

    // Create buffer for block of data
    uint8_t buffer[512];

    // JPEG Counter
    int counter = 0;

    // Start FILE Pointer at NULL
    FILE *img = NULL;

    // Read while there is still data
    while (fread(buffer, 1, 512, card) == 512)
    {
        // Find start of jpeg
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && buffer[3] >= 0xe0 &&
            buffer[3] <= 0xef)
        {
            // Close previous file -- doesn't apply to first image
            if (img != NULL)
            {
                fclose(img);
            }

            // Create file name
            char name_buff[8];
            sprintf(name_buff, "%03i.jpg", counter);

            // Update counter for next file name
            counter++;

            // Open new file to start writing JPG
            img = fopen(name_buff, "w");
            fwrite(buffer, 1, 512, img);
        }
        else
        {
            if (img != NULL)
            {
                fwrite(buffer, 1, 512, img);
            }
        }
    }

    fclose(card);
    fclose(img);
}
