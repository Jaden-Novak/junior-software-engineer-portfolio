def main():
    while True:
        try:
            height = int(input("What is the height of the pyramid? "))
            if height > 8:
                print("Woah partner. Ain't nobody building a pyramid THAT big.")
            elif height > 0:
                break
            else:
                print("Stop that. Put in a number.")
        except ValueError:
            print("Why are you doing this? Put in a number.")

    # Print rows
    for i in range(height):
        # Print spaces before blocks
        for j in range(height - i - 1):
            print(" ", end="")
        print_row(i + 1)
        print("  ", end="")
        print_row(i + 1)
        print()

def print_row(bricks):
    for i in range(bricks):
        print("#", end="")

main()
