import sys
import csv

lemas=[]
tipos=[]
generos=[]
numeros=[]
todo=[]
header=[]
otro=[]

with open('./data/csv/noun.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='|')
    coun = True
    for row in reader:
        if(coun):
            header = row
            coun = False
        else:
            todo.append(row)
            otro.append(' '.join([row[0],row[2],row[3],row[4],row[5],row[6],row[7],row[8]]))

seen = {}
dupes = []

for x in otro:
    if x not in seen:
        seen[x] = 1
    else:
        if seen[x] == 1:
            dupes.append(x)
        seen[x] += 1

print(dupes)





'''
with open('./sql/noun.sql', 'w') as of:
    of.write("INSERT IGNORE INTO PALABRAS (lema, raiz) VALUES")
    for p in todo:
        of.write("(\"{lema}\",NULL),\n".format(lema=p[0]))
    of.write(';\nCOMMIT;\n')

with open('./sql/type.sql', 'w') as of:
    conta = 0
    for p in todo:
        if conta == 0:
            of.write("INSERT INTO CATEGORIAS (id_palabra, id_tipo_categoria) VALUES \n")
        of.write("((SELECT (id_palabra) FROM PALABRAS WHERE lema=\"{lema}\"),(SELECT (id_tipo_categoria) FROM TIPOS_CATEGORIAS WHERE tipo_categoria=\'N\'))".format(lema=p[0]))
        conta += 1
        if conta == 3000:
            of.write(';\nCOMMIT;\n')
            conta = 0
        else:
            of.write(',\n')

    of.write(';\nCOMMIT;\n')
'''
with open('./sql/sense.sql', 'w') as of:
    conta = 0
    for p in todo:
        #if conta == 0:
        of.write("INSERT INTO SENTIDOS (id_categoria) VALUES \n")
        of.write("((SELECT (id_categoria) FROM CATEGORIAS WHERE id_palabra = (SELECT (id_palabra) FROM PALABRAS WHERE lema=\"{lema}\") AND id_tipo_categoria = (SELECT (id_tipo_categoria) FROM TIPOS_CATEGORIAS WHERE tipo_categoria=\'N\')));\n".format(lema=p[0]))
        conta += 1
        if conta == 3000:
            of.write('COMMIT;\n')
            conta = 0
        #else:
            #of.write(',\n')

    of.write('COMMIT;\n')
'''
    of.write("INSERT INTO PROPIEDADES (id_tipo_propiedad, id_palabra, id_categoria, valor) VALUES")
    for r in todo:
        if '_' not in r[0]:
            for x in range(2,len(r)):
                of.write("((SELECT (id_tipo_propiedad) FROM TIPOS_PROPIEDADES WHERE tipo_propiedad=\"{tipo_propiedad}\"),(SELECT (id_palabra) FROM PALABRAS WHERE lema=\"{lema}\"), (SELECT (id_tipo_categoria) FROM TIPOS_CATEGORIAS WHERE tipo_categoria=\\), (\"{valor}\")),\n".format(tipo_propiedad=header[x].lower(),lema=r[0],valor=r[x].lower()))
    of.write(';')
'''


