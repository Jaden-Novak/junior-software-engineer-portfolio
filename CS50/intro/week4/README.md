# CS50 Week 4 – Memory, Pointers, and File I/O

This folder contains my assignments for Week 4 of CS50: Introduction to Programming.

## Overview
Week 4 introduces the fundamentals of memory management, pointers, and file input/output in C.  
Key concepts covered:
- Pointers and pointer arithmetic
- Dynamic memory allocation (`malloc`, `free`)
- Strings as arrays of characters
- Reading from and writing to files
- Working with binary file formats (e.g., BMP, WAV)

## Assignments
### 1. Volume
- Program that adjusts the volume of a WAV audio file by scaling its samples.  
- Reads the WAV header, copies it to the output, scales each sample by a given factor, and writes samples back.  
- Key concepts: parsing binary headers, using fixed-width integer types (`int16_t`), handling potential clipping/overflow, file I/O, and arithmetic with casts.
  
### 2. Filter (helpers.c)
- Program that applies image filters (e.g., grayscale, sepia, reflect, blur, edges) to BMP image files.  
- Uses 2D arrays of structs to represent pixels.  
- Key concepts: manipulating arrays, using structs (`RGBTRIPLE`), and applying algorithms to images.

### 3. Recover
- Program that recovers JPEG files from a forensic image (raw memory card dump).  
- Reads 512-byte blocks, detects JPEG headers, and writes recovered images to disk.  
- Key concepts: file I/O (`fopen`, `fread`, `fwrite`), conditionals, working with bytes, algorithmic file scanning.
