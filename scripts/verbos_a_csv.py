import csv
import sys

head = ["PALABRA", "CATEGORÍA", "TERMINACIÓN", "REGULAR",
        "REFLEXIVO", "ACTUAL", "RECONOCIDO"]
save = []


def formate(linea):
    if linea[0] == "irregularizar":
        linea.insert(1, "AR")
        linea.insert(3, "")
        linea.insert(4, "ACTUAL")
        linea.insert(1, "VERBO")
    elif("NORECONOCIDO" in linea):
        linea.insert(1, linea[0][-2:].upper())
        linea.insert(2, "")
        linea.insert(3, "")
        linea.insert(4, "")
        linea.insert(1, "VERBO")
    else:
        linea.append("RECONOCIDO")
        if("IRREGULAR" in linea and not("IR" in linea or "AR" in linea or "ER" in linea)):
            linea.insert(1, linea[0][-2:].upper())
        if(not ("REFLEXIVO" in linea)):
            linea.insert(3, "NOREFLEXIVO")
        linea.insert(1, "VERBO")

    return linea


def main():
    f = open("./texto_plano/verbos.txt", "r")
    for l in f:
        l = l.replace(' ', '')
        l = l.replace(']', '')
        l = l.replace('-', '')
        l = l.replace('\n', '')
        l = l.split('[')
        l = formate(l)
        save.append(l)
    f.close()

    with open('./csv/verbos.csv', 'w', newline='') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(head)
        for r in save:
            writer.writerow(r)


if __name__ == "__main__":
    main()
