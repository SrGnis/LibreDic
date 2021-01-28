import csv
import sys

head = ["INFINITIVO", "TERMINACIÓN", "REGULAR",
        "REFLEXIVO", "ACTUAL", "RECONOCIDO"]
save = []


def formate(linea):
    if("NORECONOCIDO" in linea):
        linea.insert(1, linea[0][-2:])
        linea.insert(2, "")
        linea.insert(3, "")
        linea.insert(4, "")
    else:
        linea.append("RECONOCIDO")
        if("IRREGULAR" in linea):
            linea.insert(1, linea[0][-2:])
        if(not ("REFLEXIVO" in linea)):
            linea.insert(3, "NOREFLEXIVO")

    return linea


def main():
    f = open("../verbos.txt", "r")
    for l in f:
        l = l.replace(' ', '')
        l = l.replace(']', '')
        l = l.replace('-', '')
        l = l.split('[')
        l = formate(l)
        save.append(l)
    f.close()

    with open('verbos.csv', 'w', newline='') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(head)
        for r in save:
            writer.writerow(r)


if __name__ == "__main__":
    main()
