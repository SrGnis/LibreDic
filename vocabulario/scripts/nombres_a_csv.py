import csv
import sys

head = ["PALABRA", "CATEGORIA", "TIPO",
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

    if(len(linea) != 6):

        l.append("")
        l.append("")

    else:

        if(linea[1][2] == 'M'):
            l.append("MASCULINO")
        elif(linea[1][2] == 'F'):
            l.append("FEMENINO")
        else:
            l.append("COMÚN")
        
        if(linea[1][3] == 'M'):
            l.append("SINGULAR")
        elif(linea[1][3] == 'F'):
            l.append("PLURAL")
        else:
            l.append("INVARIABLE")

    return l


def main():
    f = open("nombres.txt", "r")
    for l in f:
        l = l.split(' ')
        l = formate(l)
        save.append(l)
    f.close()

    with open('nombres.csv', 'w', newline='') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(head)
        for r in save:
            writer.writerow(r)


if __name__ == "__main__":
    main()
