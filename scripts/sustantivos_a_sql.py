import sys
import csv

lemas=[]
tipos=[]
generos=[]
numeros=[]
todo=[]
header=[]

with open('./csv/sustantivos.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='|')
    coun = True
    for row in reader:
        if(coun):
            header = row
            coun = False
        else:
            todo.append(row)
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

lemas = list(dict.fromkeys(lemas)) #eliminar duplicados


with open('./sql/sustantivos.sql', 'w') as of:

    of.write("INSERT INTO PALABRAS (lema, raiz) VALUES")
    for p in lemas:
        if '_' not in p:
            of.write("(\"{lema}\",NULL),\n".format(lema=p))
    of.write(';')

    of.write('\n')

    of.write("INSERT INTO CARACTERISTICAS (id_palabra, id_categoria) VALUES")
    for p in lemas:
        if '_' not in p:
            of.write("((SELECT (id_palabra) FROM PALABRAS WHERE lema=\"{lema}\"),(SELECT (id_tipo_categoria) FROM TIPOS_CATEGORIAS WHERE tipo_categoria=\"SUS\")),\n".format(lema=p))
    of.write(';')

    of.write('\n')

    of.write("INSERT INTO PROPIEDADES (id_tipo_propiedad, id_palabra, id_categoria, valor) VALUES")
    for r in todo:
        if '_' not in r[0]:
            for x in range(2,len(r)):
                of.write("((SELECT (id_tipo_propiedad) FROM TIPOS_PROPIEDADES WHERE tipo_propiedad=\"{tipo_propiedad}\"),(SELECT (id_palabra) FROM PALABRAS WHERE lema=\"{lema}\"), (SELECT (id_tipo_categoria) FROM TIPOS_CATEGORIAS WHERE tipo_categoria=\"SUS\"), (\"{valor}\")),\n".format(tipo_propiedad=header[x].lower(),lema=r[0],valor=r[x].lower()))
    of.write(';')

