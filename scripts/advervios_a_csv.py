# coding=utf-8

import csv
import sys

head = ["PALABRA", "CATEGORÍA", "TIPO"]
save = []


def formate(linea):
    print(linea)
    l = []
    l.append(linea[0])
    l.append("ADVERVIO")
    l.append("GENERAL")

    return l


def main():
    f = open("./texto_plano/advervios.txt", "r")
    for l in f:
        if(l != ""):
            l = l.split(' ')
            l = formate(l)
            save.append(l)
    f.close()

    with open('./csv/advervios.csv', 'w') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(head)
        for r in save:
            writer.writerow(r)


if __name__ == "__main__":
    main()
