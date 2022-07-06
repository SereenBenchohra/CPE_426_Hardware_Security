import sys

def main (argv):
    if (len(argv) != 6):
        print ("USAGE: lcg.py [a] [b] [m] [s0] [#of bits]")
    a = int(argv[1])
    b = int(argv[2])
    m = int(argv[3])
    s_prev = int(argv[4])
    num_of_rands = int(argv[5])
    i = 0;

    while (i < num_of_rands):
        s_cur = ((a * s_prev) + b) % m
        if s_cur % 2 == 0:
            print('0', end='')
        else:
            print('1', end='')
        s_prev = s_cur
        i += 1;

    print("\nDone.")



if __name__ == '__main__':
    main(sys.argv)
