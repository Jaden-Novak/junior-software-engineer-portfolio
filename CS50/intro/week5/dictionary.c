// Implements a dictionary's functionality
#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

#include "dictionary.h"

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
} node;

// Choose number of buckets in hash table
#define N 1000

// Hash table
node *table[N];

// Word counter
unsigned int word_count = 0;

// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    // Hash word to obtain hash value
    unsigned int index = hash(word);

    // Access linked list at that index in the hash table
    node *cursor = table[index];

    // Traverse linked list, looking for the word (strcasecmp)
    //  Return true if found, false if not
    while (cursor != NULL)
    {
        if (strcasecmp(cursor->word, word) == 0)
            return true;
        cursor = cursor->next;
    }
    return false;
}

// Hashes word to a number
unsigned int hash(const char *word)
{
    unsigned int sum = 0;
    for (int i = 0; word[i] != '\0'; i++)
    {
        sum += tolower(word[i]);
    }
    return sum % N;
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{
    // Open dictionary file
    FILE *file = fopen(dictionary, "r");
    if (file == NULL)
    {
        printf("Could not open dictionary: %s\n", dictionary);
        return false;
    }

    // Read string one at a time
    char word[LENGTH + 1]; // Add one for \0
    while (fscanf(file, "%s", word) == 1)
    {
        // Create new node for each word
        node *newnode = malloc(sizeof(node));
        if (newnode == NULL)
        {
            fclose(file);
            return false;
        }

        strcpy(newnode->word, word);

        // Hash word to obtain has value
        unsigned int index = hash(word);

        // Insert node into hash table at that location
        newnode->next = table[index];
        table[index] = newnode;

        word_count++;
    }
    fclose(file);
    return true;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    return word_count;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    // Go through each bucket, list in each bucket, free every node
    // Iterate through each bucket
    for (int i = 0; i < N; i++)
    {
        node *cursor = table[i];
        // traverse the linked list
        while (cursor != NULL)
        {
            node *tmp = cursor;
            cursor = cursor->next;
            free(tmp);
        }
    }
    return true;
}
