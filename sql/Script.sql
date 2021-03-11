INSERT INTO PALABRAS (lema, raiz) VALUES
	("casa",NULL);

INSERT INTO CARACTERISTICAS VALUES
	((SELECT id_palabra from PALABRAS WHERE lema="casa"), (SELECT id_tipo_categoria from TIPOS_CATEGORIAS WHERE tipo_categoria='SUS'));

INSERT INTO TIPOS_PROPIEDADES (tipo_propiedad) VALUES
	("genero"),
	("numero");

INSERT INTO PROPIEDADES (id_tipo_propiedad, id_palabra, id_categoria, valor) VALUES
	((SELECT id_tipo_propiedad from TIPOS_PROPIEDADES WHERE tipo_propiedad="genero"), 
	(SELECT id_palabra from PALABRAS WHERE lema="casa"), 
	(SELECT id_tipo_categoria from TIPOS_CATEGORIAS WHERE tipo_categoria='SUS'),
	"femenino"),
	((SELECT id_tipo_propiedad from TIPOS_PROPIEDADES WHERE tipo_propiedad="numero"), 
	(SELECT id_palabra from PALABRAS WHERE lema="casa"), 
	(SELECT id_tipo_categoria from TIPOS_CATEGORIAS WHERE tipo_categoria='SUS'),
	"singular");