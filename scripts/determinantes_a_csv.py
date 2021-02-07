# coding=utf-8

import csv
import sys

head = ["PALABRA", "CATEGORÍA", "TIPO", "PERSONA",
        "GENERO", "NUMERO", "NUMERO_POSEEDOR"]
save = []


def formate(linea):
    print(linea)
    l = []
    l.append(linea[0])
    l.append("DETERMINANTE")

    if(linea[1][1] == 'D'):
        l.append("DEMOSTRATIVO")
    elif(linea[1][1] == 'P'):
        l.append("POSESIVO")
    elif(linea[1][1] == 'T'):
        l.append("INTERROGATIVO")
    elif(linea[1][1] == 'E'):
        l.append("EXCLAMATIVO")
    else:
        l.append("INDEFINIDO")

    if(linea[1][2] == '1'):
        l.append("PRIMERA")
    elif(linea[1][2] == '2'):
        l.append("SEGUNDA")
    elif(linea[1][2] == '3'):
        l.append("TERCERA")
    else:
        l.append("")

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

    if(linea[1][5] == 'S'):
        l.append("SINGULAR")
    elif(linea[1][5] == 'P'):
        l.append("PLURAL")
    elif(linea[1][1] == 'P'):
        l.append("INDEFINIDO")
    else:
        l.append("")

    return l


def main():
    f = open("determinantes.txt", "r")
    llegado = False
    for l in f:
        if(l != ""):
            l = l.split(' ')
            if(llegado):
                print(l)
                l = formate(l)
                save.append(l)
            elif(l[0] == "()\n"):
                llegado = True

    f.close()

    with open('determinantes.csv', 'w') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(head)
        for r in save:
            writer.writerow(r)


if __name__ == "__main__":
    main()
