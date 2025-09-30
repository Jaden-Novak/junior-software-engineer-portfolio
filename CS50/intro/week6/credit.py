from cs50 import get_int

def main():
    # Prompt user for input
    N = get_int("Please insert your credit card number: ")

    # Count number of digits
    count = 0
    ntemp = N

    while (ntemp != 0):
        ntemp = ntemp // 10
        count += 1

    # Check validity of card based on digits
    if (count == 13 or count == 15 or count == 16):
        sum_odd = 0
        sum_even = 0
        sum_total = 0
        position = 0

        c = N
        while (c > 0):
            digit = c % 10

            # If there are remainders, its odd
            if (position % 2 == 1):
                product = digit * 2
                sum_odd += product // 10 + product % 10
            else:
                sum_even += digit
            c = c // 10
            position += 1

        sum_total = sum_even + sum_odd
        # Check if final digit is 0
        if (sum_total % 10 == 0):
            # Check value of first two digits to cat credit card
            firstdigits = N
            while (firstdigits >= 100):
                firstdigits = firstdigits // 10
            if (firstdigits > 39 and firstdigits < 50):
                if (count == 13 or count == 16):
                    print("VISA\n")
                else:
                    print("INVALID\n")
            elif (firstdigits == 34 or firstdigits == 37):
                if (count == 15):
                    print("AMEX\n")
                else:
                    print("INVALID\n")
            elif (firstdigits > 50 and firstdigits < 56):
                if (count == 16):
                    print("MASTERCARD\n")
                else:
                    print("INVALID\n")
            else:
                print("INVALID\n") # Invalid if starting number don't match
        else:
            print("INVALID\n") # Invalid if does not end in 0
    else:
        print ("INVALID\n") #Invalid if containing wrong number of digits

main()
