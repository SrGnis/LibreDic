#Información de una palabra
SELECT pal.lema, s.id AS id_sentido, cat.tipo_categoria AS categoria, tp.tipo_propiedad_entero AS propiedad, pro.valor 
FROM
(
    SELECT *
    FROM palabras pal
    WHERE pal.lema = "casa"
) AS pal
JOIN sentidos s ON s.id_palabra = pal.id
JOIN caracteristicas car ON car.id_sentido = s.id
JOIN categorias cat ON car.id_categoria = cat.id
JOIN propiedades pro ON car.id = pro.id_caracteristicas 
JOIN tipos_propiedades tp ON pro.id_tipo_propiedad = tp.id

#Todas la palabras con su categoria
SELECT 
  tabla.palabra,
  tabla.raiz,
  tabla.tipo_categoria AS categoria
FROM (
  SELECT c.id, p.lema AS palabra, r.lema AS raiz, c2.tipo_categoria 
  FROM sentidos s 
  JOIN palabras p ON p.id = s.id_palabra
  JOIN palabras r ON r.id = s.id_raiz
  JOIN caracteristicas c ON c.id_sentido = s.id
  JOIN categorias c2 ON c2.id = c.id_categoria
) tabla;

#Solo las palabras de cierta categoria Ej. solo verbos
SELECT p.id, p.lema 
FROM caracteristicas car 
JOIN (SELECT * FROM categorias WHERE tipo_categoria = 'V') AS cat
	ON car.id_categoria = cat.id
JOIN sentidos s ON s.id = car.id_sentido 
JOIN palabras p ON p.id = s.id_palabra;

#Solo las palabras con una cierta propiedad Ej. solo palabras masculinas
SELECT pal.lema, cat.tipo_categoria
FROM
(
    SELECT pro.*
    FROM propiedades pro
    JOIN (SELECT * FROM tipos_propiedades tp WHERE tipo_propiedad = 'G') AS tp
        ON pro.id_tipo_propiedad = tp.id
    WHERE valor = 'M'
) AS p
JOIN caracteristicas car ON p.id_caracteristicas = car.id
JOIN categorias cat ON car.id_categoria = cat.id 
JOIN sentidos s ON s.id = car.id_sentido 
JOIN palabras pal ON pal.id = s.id_palabra;

#Solo las palabras con CIERTAS propiedades Ej. solo palabras masculinas en singular
SELECT pal.lema, cat.tipo_categoria
FROM caracteristicas car
JOIN
(
    SELECT pro.*
    FROM propiedades pro
    JOIN (SELECT * FROM tipos_propiedades tp WHERE tipo_propiedad = 'G') AS tp
        ON pro.id_tipo_propiedad = tp.id
    WHERE valor = 'M'
) AS p1
ON car.id = p1.id_caracteristicas
JOIN 
(
    SELECT pro.*
    FROM propiedades pro
    JOIN (SELECT * FROM tipos_propiedades tp WHERE tipo_propiedad = 'N') AS tp
        ON pro.id_tipo_propiedad = tp.id
    WHERE valor = 'S'
) AS p2
ON car.id = p2.id_caracteristicas
JOIN categorias cat ON car.id_categoria = cat.id 
JOIN sentidos s ON s.id = car.id_sentido 
JOIN palabras pal ON pal.id = s.id_palabra;

#Solo las palabras con una cierta propiedad y caracteristica Ej. solo adjetivos masculinos
SELECT pal.lema, cat.tipo_categoria
FROM
(
    SELECT pro.*
    FROM propiedades pro
    JOIN (SELECT * FROM tipos_propiedades tp WHERE tipo_propiedad = 'G') AS tp
        ON pro.id_tipo_propiedad = tp.id
    WHERE valor = 'M'
) AS p
JOIN caracteristicas car ON p.id_caracteristicas = car.id
JOIN (SELECT * FROM categorias WHERE tipo_categoria = 'A') cat ON car.id_categoria = cat.id
JOIN sentidos s ON s.id = car.id_sentido 
JOIN palabras pal ON pal.id = s.id_palabra;


# linea por palabra
SELECT 
  tabla.palabra,
  tabla.raiz,
  tabla.tipo_categoria AS categoria,
  t.valor AS tipo,
  g.valor AS genero,
  n.valor AS numero
FROM (
  SELECT c.id, p.lema AS palabra, r.lema AS raiz, c2.tipo_categoria 
  FROM sentidos s 
  JOIN palabras p ON p.id = s.id_palabra
  JOIN palabras r ON r.id = s.id_raiz
  JOIN caracteristicas c ON c.id_sentido = s.id
  JOIN categorias c2 ON c2.id = c.id_categoria
) tabla
INNER JOIN propiedades t
  on tabla.id = t.id_caracteristicas
  and t.id_tipo_propiedad = 1
INNER JOIN propiedades g
  on tabla.id = g.id_caracteristicas
  and g.id_tipo_propiedad = 3
INNER JOIN propiedades n
  on tabla.id = n.id_caracteristicas
  and n.id_tipo_propiedad = 4
