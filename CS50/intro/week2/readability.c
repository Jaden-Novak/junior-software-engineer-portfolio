#include <cs50.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

int count_letters(string text);
int count_words(string text);
int count_sentences(string text);

int main(void)
{
    // Prompt user for text
    string text = get_string("Text: ");

    // Count number of letters, words, and sentences in text
    int letters = count_letters(text);
    int words = count_words(text);
    int sentences = count_sentences(text);

    // Calculate L; L is average number of letters per 100 words
    float L = (float) letters / words * 100;

    // Calculate S; S is average number of sentences per 100 words
    float S = (float) sentences / words * 100;

    // Compute the Coleman-Liau index
    float index = (float) 0.0588 * L - 0.296 * S - 15.8;

    // Print the grade level
    if (index < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (index > 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %d\n", (int) round(index));
    }
}

int count_letters(string text)
{
    // Keep track of letters
    int letters = 0;

    // Add count for each letter
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (isalpha(text[i]))
        {
            letters++;
        }
    }
    return letters;
}

int count_words(string text) // Words end in spaces, punctuation can be ignored
{
    // Keep track of words
    int words = 0;

    // Add count when space
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (isspace(text[i]))
        {
            words++;
        }
    }
    // Add one more for the end of passages because no space exists.
    words++;
    return words;
}

int count_sentences(string text) // Sentences end in ., !, or ?
{
    // Keep track of sentences
    int sentences = 0;

    // Add count when ., ?, or ! is found
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (text[i] == '.' || text[i] == '!' || text[i] == '?')
        {
            sentences++;
        }
    }
    return sentences;
}
