import sys
import csv

lemas=[]
tipos=[]
generos=[]
numeros=[]

with open('./csv/nombres.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='|')
    for row in reader:
        lemas.append(row[0])
        tipos.append(row[2])
        if row[3] == '':
            generos.append(None)
        else:
            generos.append(row[3])
        if row[4] == '':
            numeros.append(None)
        else:
            numeros.append(row[4])

print("INSERT INTO PALABRAS (lema, raiz) VALUES")
for x in lemas:
    print("(\"{lema}\",NULL),".format(lema=x))
print(';')
