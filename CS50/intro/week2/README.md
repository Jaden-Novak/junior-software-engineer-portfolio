# CS50 Week 2 – C Programming and Algorithms

This folder contains my assignments and exercises for **Week 2** of CS50: Introduction to Computer Science.  

## Overview
Week 2 focuses on **C programming, arrays, loops, functions, and string manipulation**.  
Key concepts covered:  
- Command-line arguments (`argc` and `argv`)  
- Loops and nested loops  
- Conditional statements  
- Arrays and string manipulation  
- Algorithms for text analysis and encryption  

## Assignments

### 1. Scrabble
- Program that calculates a score for a given word.  
- Key concepts: arrays, loops, conditionals, character manipulation.

### 2. Readability
- Program that analyzes text to determine its reading level using the Coleman-Liau index.  
- Key concepts: loops, counting letters/words/sentences, arithmetic, string processing.

### 3. Substitution
- Program that implements a substitution cipher: converts plaintext into ciphertext using a 26-character key.  
- Preserves letter case and ignores non-alphabetical characters.  
- Key concepts: arrays, strings, loops, conditionals, command-line arguments.

## Key Concepts Learned
- Using arrays to store and access data efficiently  
- Looping through strings and arrays  
- Implementing simple algorithms in C  
- Handling user input and command-line arguments  
- Preserving case and handling non-alphabetic characters in string processing  

## Usage
Compile each C file with GCC:

```bash
gcc filename.c -o program
./program

(For substitution.c)
./substitution KEY
Replace KEY with a 26-character string containing unique letters.
