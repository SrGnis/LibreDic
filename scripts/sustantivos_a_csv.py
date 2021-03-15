# coding=utf-8

import csv
import sys

head = ["PALABRA", "CATEGORÍA", "TIPO",
        "GENERO", "NUMERO"]
save = []


def formate(linea):
    l = []
    l.append(linea[0])
    l.append("NOMBRE")

    if(linea[1][1] == 'C'):
        l.append("COMÚN")
    else:
        l.append("PROPIO")

    if(len(linea[1]) != 8):
        l.append("")
        l.append("")

    else:

        if(linea[1][2] == 'M'):
            l.append("MASCULINO")
        elif(linea[1][2] == 'F'):
            l.append("FEMENINO")
        else:
            l.append("COMÚN")

        if(linea[1][3] == 'S'):
            l.append("SINGULAR")
        elif(linea[1][3] == 'P'):
            l.append("PLURAL")
        else:
            l.append("INVARIABLE")

    return l


def main():
    f = open("./texto_plano/nombres.txt", "r")
    for l in f:
        if(l != ""):
            l = l.split(' ')
            l = formate(l)
            save.append(l)
    f.close()

    with open('./csv/nombres.csv', 'w') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(head)
        for r in save:
            writer.writerow(r)


if __name__ == "__main__":
    main()
