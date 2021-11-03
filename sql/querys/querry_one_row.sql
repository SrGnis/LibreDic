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