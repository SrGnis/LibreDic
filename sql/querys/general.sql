#Información de una palabra
SELECT pal.lema, s.id AS id_sentido, car.categoria, pro.propiedad, pro.valor 
FROM
(
    SELECT *
    FROM palabras pal
    WHERE pal.lema = "casa"
) AS pal
JOIN sentidos s ON s.id_palabra = pal.id
JOIN caracteristicas car ON car.id_sentido = s.id
JOIN propiedades pro ON car.id = pro.id_caracteristicas;

#Información de una palabra verbose
SELECT pal.lema, s.id AS id_sentido, car.categoria, pro.propiedad, pro.valor, cv.verbose AS categoria_v, pv.verbose AS propiedad_v, pvv.verbose AS valor_v
FROM
(
    SELECT *
    FROM palabras pal
    WHERE pal.lema = "casa"
) AS pal
JOIN sentidos s ON s.id_palabra = pal.id
JOIN caracteristicas car ON car.id_sentido = s.id
JOIN categorias_verbose cv ON car.categoria = cv.categoria 
JOIN propiedades pro ON car.id = pro.id_caracteristicas
JOIN propiedades_verbose pv ON pv.propiedad = pro.propiedad 
LEFT JOIN propiedad_valor_verbose pvv ON pro.valor = pvv.valor AND pro.propiedad = pvv.tipo AND car.categoria = pvv.categoria;

#Todas la palabras con su categoria
SELECT 
  tabla.palabra,
  tabla.raiz,
  tabla.categoria
FROM (
  SELECT c.id, p.lema AS palabra, r.lema AS raiz, c.categoria 
  FROM sentidos s 
  JOIN palabras p ON p.id = s.id_palabra
  JOIN palabras r ON r.id = s.id_raiz
  JOIN caracteristicas c ON c.id_sentido = s.id
) tabla;

#Solo las palabras de cierta categoria Ej. solo verbos
SELECT p.id, p.lema 
FROM (SELECT * FROM caracteristicas WHERE categoria = "V") car
JOIN sentidos s ON s.id = car.id_sentido 
JOIN palabras p ON p.id = s.id_palabra;

#Solo las palabras con una cierta propiedad Ej. solo palabras masculinas
SELECT pal.lema, car.categoria 
FROM
(
    SELECT pro.*
    FROM propiedades pro
    WHERE propiedad = 'G' AND valor = 'M'
) AS p
JOIN caracteristicas car ON p.id_caracteristicas = car.id
JOIN sentidos s ON s.id = car.id_sentido 
JOIN palabras pal ON pal.id = s.id_palabra;

#Solo las palabras con CIERTAS propiedades Ej. solo palabras masculinas en singular
SELECT pal.lema, car.categoria
FROM caracteristicas car
JOIN
(
    SELECT pro.*
    FROM propiedades pro
    WHERE propiedad = 'G' AND valor = 'M'
) AS p1
ON car.id = p1.id_caracteristicas
JOIN 
(
    SELECT pro.*
    FROM propiedades pro
    WHERE propiedad = 'N' AND valor = 'S'
) AS p2
ON car.id = p2.id_caracteristicas
JOIN sentidos s ON s.id = car.id_sentido 
JOIN palabras pal ON pal.id = s.id_palabra;

#Solo las palabras con una cierta propiedad y caracteristica Ej. solo adjetivos masculinos
SELECT pal.lema, car.categoria
FROM
(
    SELECT pro.*
    FROM propiedades pro
    WHERE propiedad = 'G' AND valor = 'M'
) AS p
JOIN (SELECT * FROM caracteristicas WHERE categoria = "A") car ON p.id_caracteristicas = car.id
JOIN sentidos s ON s.id = car.id_sentido 
JOIN palabras pal ON pal.id = s.id_palabra;


# linea por palabra
SELECT 
  tabla.palabra,
  tabla.raiz,
  tabla.categoria,
  t.valor AS tipo,
  g.valor AS genero,
  n.valor AS numero
FROM (
  SELECT c.id, p.lema AS palabra, r.lema AS raiz, c.categoria 
  FROM sentidos s 
  JOIN palabras p ON p.id = s.id_palabra
  JOIN palabras r ON r.id = s.id_raiz
  JOIN caracteristicas c ON c.id_sentido = s.id
) tabla
INNER JOIN propiedades t
  on tabla.id = t.id_caracteristicas
  and t.propiedad = 'T'
INNER JOIN propiedades g
  on tabla.id = g.id_caracteristicas
  and g.propiedad = 'G'
INNER JOIN propiedades n
  on tabla.id = n.id_caracteristicas
  and n.propiedad = 'N';
 
