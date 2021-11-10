import sys
import csv

lemas=[]
tipos=[]
generos=[]
numeros=[]
todo=[]
header=[]
otro=[]

with open('./data/csv/adv.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='|')
    coun = True
    for row in reader:
        if(coun):
            header = row
            coun = False
        else:
            todo.append(row)


with open('./sql/inserts/adv_words.sql', 'w') as of:
    first=True
    of.write('INSERT IGNORE INTO palabras (lema) VALUES\n')
    for p in todo:
        if first:
            of.write('("{lema}")'.format(lema=p[0]))
            first = False
        else:
            of.write(',\n("{lema}")'.format(lema=p[0]))
    of.write(';\nCOMMIT;\n')

with open('./sql/inserts/adv.sql', 'w') as of:
    conta=0
    for p in todo:
        #Sentidos
        of.write('INSERT INTO sentidos (id_palabra, id_raiz) VALUES\n')
        of.write('((SELECT (id) FROM palabras WHERE lema="{lema}"),(SELECT (id) FROM palabras WHERE lema="{raiz}"));\n'.format(lema=p[0],raiz=p[1]))
        
        #Caracteristicas
        of.write('INSERT INTO caracteristicas (id_sentido, id_categoria) VALUES\n')
        of.write('((SELECT MAX(id) FROM sentidos),(SELECT (id) FROM categorias WHERE tipo_categoria=\'R\'));\n')

        #Propiedades
        of.write('INSERT INTO propiedades (id_tipo_propiedad, valor, id_caracteristicas) VALUES\n')
        of.write('((SELECT (id) FROM tipos_propiedades WHERE tipo_propiedad=\'T\'),(\'{valor}\') ,(SELECT MAX(id) FROM caracteristicas));\n'.format(valor=p[3]))

        conta += 1
        if conta == 3000:
            of.write('COMMIT;\n')
            conta = 0
