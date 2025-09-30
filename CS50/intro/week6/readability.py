from cs50 import get_string


def main():
    # Prompt user for text
    text = get_string("Text: ")

    # Count number of ltrs, wrds, and stncs in text
    letters = count_letters(text)
    words = count_words(text)
    sentences = count_sentences(text)

    # Calculate L
    L = float(letters / words * 100)

    # Calculate S
    S = float(sentences / words * 100)

    # Compute C-L index
    index = float(0.0588 * L - 0.296 * S - 15.8)

    # Print grade level
    if (index < 1):
        print("Before Grade 1")
    elif (index > 16):
        print("Grade 16+")
    else:
        print("Grade", round(index))


def count_letters(text):
    letters = 0

    # Count each letter
    for i in range(len(text)):
        if text[i].isalpha():
            letters += 1

    return letters


def count_words(text):
    words = 0

    # Add count to words for every space
    for i in range(len(text)):
        if text[i].isspace():
            words += 1

    # Add one at end, because end has no space
    words += 1
    return words


def count_sentences(text):  # Sentences end in ., !, or ?
    sentences = 0

    # Add count when above are found
    for i in range(len(text)):
        if text[i] == "." or text[i] == "!" or text[i] == "?":
            sentences += 1

    return sentences


main()
