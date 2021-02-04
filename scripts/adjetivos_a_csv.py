# coding=utf-8

import csv
import sys

head = ["PALABRA", "CATEGORIA", "TIPO",
        "GENERO", "NUMERO", "FUNCIÓN"]
save = []


def formate(linea):
    print(linea)
    l = []
    l.append(linea[0])
    l.append("ADJETIVO")
    l.append("CALIFICATIVO")

    if(linea[1][3] == 'M'):
        l.append("MASCULINO")
    elif(linea[1][3] == 'F'):
        l.append("FEMENINO")
    else:
        l.append("COMÚN")

    if(linea[1][4] == 'S'):
        l.append("SINGULAR")
    elif(linea[1][4] == 'P'):
        l.append("PLURAL")
    else:
        l.append("INVARIABLE")

    if(linea[1][5] == 'P'):
        l.append("PARTICIPIO")
    else:
        l.append("")

    return l


def main():
    f = open("adjetivos.txt", "r")
    for l in f:
        if(l != ""):
            l = l.split(' ')
            l = formate(l)
            save.append(l)
    f.close()

    with open('adjetivos.csv', 'w') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(head)
        for r in save:
            writer.writerow(r)


if __name__ == "__main__":
    main()
