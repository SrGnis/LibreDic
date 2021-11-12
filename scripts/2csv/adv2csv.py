# coding=utf-8

import csv
import sys

head = ["WORD", "ROOT", "CATEGORY", "TYPE"]
save = []


def main():
    f = open("data/src/adv.txt", "r")
    for l in f:
        if(l != ""):
            l = l.replace('\n', '')
            l = l.split(' ')
            p = list(l[2])
            del l[2]
            l.extend(p)
            save.append(l)
    f.close()

    with open('data/csv/adv.csv', 'w') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(head)
        for r in save:
            writer.writerow(r)


if __name__ == "__main__":
    main()
