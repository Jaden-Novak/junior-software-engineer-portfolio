#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

int main(int argc, string argv[])
{
    // Get users input
    if (argc != 2) // 0 or >1 arguments = error
    {
        printf("key\n");
        return 1;
    }

    string key = argv[1];

    // not 26 letters = error
    if (strlen(key) != 26)
    {
        printf("Key must contain 26 letters.\n");
        return 1;
    }

    for (int i = 0, len = strlen(key); i < len; i++)
    {
        // not alphanumeric = error
        if (!isalpha(key[i]))
        {
            printf("Key must only contain letters.\n");
            return 1;
        }
        // double letters = error
        for (int n = i + 1; n < 26; n++)
        {
            if (tolower(key[n]) == tolower(key[i]))
            {
                printf("Must not contain duplicate letters.\n");
                return 1;
            }
        }
    }
    // Prompt user for text
    string plaintext = get_string("plaintext: ");

    // Print "cyphertext: ", remaining text comes from below
    printf("ciphertext: ");

    // Convert plaintext into ciphertext
    for (int i = 0; i < strlen(plaintext); i++)
    {
        char c = plaintext[i];

        if isalpha (c)
        {
            int index; // A = 0, B = 1, etc..

            if (isupper(c)) // Checks for uppercase
            {
                index = c - 'A';
                printf("%c", toupper(key[index]));
            }
            else // Else, lowercase
            {
                index = c - 'a';
                printf("%c", tolower(key[index]));
            }
        }
        else
        {
            printf("%c", c); // Prints non-alpha letters as-is
        }
    }

    printf("\n");
    return 0;
}
