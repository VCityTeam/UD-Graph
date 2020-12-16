import sys
from os import system


def main():
    if len(sys.argv) != 3:
        sys.exit(
            'Incorrect number of arguments: {}\nUsage: python processGML.py [input datafile] [output datafile]'.format(
                len(sys.argv)))

    system('python ../../utilities/flatten_geometry.py {} {}'.format(sys.argv[1], sys.argv[2]))
    # system('python ../../utilities/show_ns.py {}'.format(sys.argv[2]))

if __name__ == "__main__":
    main()