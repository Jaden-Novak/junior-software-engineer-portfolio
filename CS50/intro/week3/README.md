# CS50 Week 3 – Arrays, Algorithms, and Voting Systems

This folder contains my assignments for **Week 3** of CS50: Introduction to Programming.

## Overview
Week 3 focuses on **arrays, algorithms, and basic data structures** in C.  
Key concepts covered:
- Arrays and 2D arrays
- Structs
- Functions returning values
- Loops and conditional logic
- Implementing algorithms (Plurality and Runoff voting)

## Assignments

### 1. Plurality
- Program that simulates a simple election where each voter can vote for one candidate.  
- The program counts votes and prints the candidate(s) with the most votes.  
- Key concepts: arrays, structs, functions (`vote()`, `print_winner()`), loops, conditionals, string comparison.

### 2. Runoff
- Program that simulates a runoff election using ranked-choice voting.  
- Voters rank candidates in order of preference, and the program eliminates the candidate(s) with the fewest votes in successive rounds until a winner emerges.  
- Key concepts: 2D arrays for voter preferences, loops, functions (`vote()`, `tabulate()`, `find_min()`, `is_tie()`, `eliminate()`), structs, logical conditions, algorithmic thinking.

## Usage
Compile each C file with GCC:

```bash
gcc plurality.c -o plurality
./plurality

gcc runoff.c -o runoff
./runoff
