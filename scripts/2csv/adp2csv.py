# coding=utf-8

import csv
import sys

head = ["PALABRA", "ROOT", "CATEGORÍA", "TIPO"]
save = []


def main():
    f = open("data/src/tanc.txt", "r")
    for l in f:
        if(l != ""):
            l = l.replace('\n', '')
            l = l.split(' ')
            if (l[2][0] == 'S'):
                p = list(l[2])
                del l[2]
                l.extend(p)
                save.append(l)
    f.close()

    with open('data/csv/adp.csv', 'w') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(head)
        for r in save:
            writer.writerow(r)


if __name__ == "__main__":
    main()
