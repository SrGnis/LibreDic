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

lemas = list(dict.fromkeys(lemas))#eliminar duplicados

'''
print("INSERT INTO PALABRAS (lema, raiz) VALUES")
for p in lemas:
    if '_' not in p:
        print("(\"{lema}\",NULL),".format(lema=p))
print(';')
'''

'''
print("INSERT INTO CARACTERISTICAS (id_palabra, id_categoria) VALUES")
for p in lemas:
    if '_' not in p:
        print("((SELECT (id_palabra) FROM PALABRAS WHERE lema=\"{lema}\"),(SELECT (id_tipo_categoria) FROM TIPOS_CATEGORIAS WHERE tipo_categoria=\"SUS\")),".format(lema=p))
print(';')
'''

