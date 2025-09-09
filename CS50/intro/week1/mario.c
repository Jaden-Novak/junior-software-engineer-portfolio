#include <cs50.h>
#include <stdio.h>

void print_row(int bricks);

int main(void)
{
    // Prompt user for input
    int height;
    do
    {
        height = get_int("What is the height of the pyramid? ");
    }
    while (height <= 0); // repeat if not positive
    // Print a pyramid of that height
    for (int i = 0; i < height; i++)
    {
        // Print spaces before blocks
        for (int s = 0; s < height - i - 1; s++)
        {
            printf(" ");
        }
        print_row(i + 1);
        printf("  ");
        print_row(i + 1);
        printf("\n");
    }
}
void print_row(int bricks)
{
    for (int i = 0; i < bricks; i++)
    {
        printf("#");
    }
}
