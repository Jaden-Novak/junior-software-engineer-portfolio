#include <cs50.h>
#include <stdio.h>

// Visa Rules: 13 and 16 digits; 4 start
// AE Rules: 15 digits; 34, 37 start
// MC Rules: 16 digits; 51,52,53,54,55 start

int main(void)
{
    // Prompt user for input
    const long n = get_long("Please insert your credit card number: ");

    // Count the number of digits
    int count = 0;
    long ntemp = n;

    while (ntemp != 0)
    {
        ntemp = ntemp / 10;
        count++;
    }

    // Check validity of card based on digits
    if (count == 13 || count == 15 || count == 16)
    {
        // Multiply all odd digits and multiply by two and sum all even digits
        int sum_odd = 0;
        int sum_even = 0;
        int sum_total = 0;
        int position = 0; // final digit is 0 (even)

        long c = n;
        while (c > 0)
        {
            int digit = c % 10; // This digit equals the final digit of the long

            // % shows remainders -- if there is a remainder, it is an odd number
            if (position % 2 == 1)
            {
                int product = digit * 2;                // multiplies digit by two
                sum_odd += product / 10 + product % 10; // if product > 10, adds 10's place (product
                                                        // / 10) and 1's place (product & 10)
            }
            else
            {
                sum_even += digit; // sums even value
            }
            c = c / 10;
            position++;
        }
        sum_total = sum_even + sum_odd;
        // Check if final digit is 0
        if (sum_total % 10 == 0)
        {
            // Check the value of the first two digits and categorize credit card
            long firstdigits = n;
            while (firstdigits >= 100)
            {
                firstdigits = firstdigits / 10;
            }
            if (firstdigits > 39 && firstdigits < 50)
            {
                if (count == 13 || count == 16)
                {
                    printf("VISA\n");
                }
                else
                {
                    printf("INVALID\n");
                }
            }
            else if (firstdigits == 34 || firstdigits == 37)
            {
                if (count == 15)
                {
                    printf("AMEX\n");
                }
                else
                {
                    printf("INVALID\n");
                }
            }
            else if (firstdigits > 50 && firstdigits < 56)
            {
                if (count == 16)
                {
                    printf("MASTERCARD\n");
                }
                else
                {
                    printf("INVALID\n");
                }
            }
            else
            {
                printf("INVALID\n"); // Print invalid if starting numbers don't match
            }
        }
        else
        {
            printf("INVALID\n"); // Print invalid if does not end in 0
        }
    }
    else
    {
        printf("INVALID\n"); // Print invalid if contains wrong number of digits
    }
}
