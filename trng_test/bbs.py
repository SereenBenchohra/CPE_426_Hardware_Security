import sys
import random

def main(argv):
    if len(argv) != 4:
        print("USAGE: bbs.py [P (prime number)] [Q (prime number)] [#of bits]")
        exit(1)

    P = int(argv[1])
    Q = int(argv[2])
    num_bits = int(argv[3])
    N = P * Q
    x_prev = random.randint(2, N-2)
    i = 0
    while i < num_bits:
        x_cur = (x_prev ** 2) % N
        if x_cur % 2 == 0:
            print('0', end='')
        else:
            print('1', end='')
        x_prev = x_cur
        i += 1;

    print("\nDone.")

if __name__ == '__main__':
    main(sys.argv)
