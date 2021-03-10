CREATE TABLE `PALABRAS` (
  `id_palabra` int(11) NOT NULL AUTO_INCREMENT,
  `lema` varchar(30) NOT NULL,
  `raiz` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_palabra`),
  UNIQUE KEY `PALABRAS_UN` (`lema`),
  KEY `PALABRAS_RAIZ` (`raiz`),
  CONSTRAINT `PALABRAS_RAIZ` FOREIGN KEY (`raiz`) REFERENCES `PALABRAS` (`id_palabra`) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE `TIPOS_CATEGORIAS` (
  `id_tipo_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_categoria` char(3) NOT NULL,
  PRIMARY KEY (`id_tipo_categoria`),
  UNIQUE KEY `TIPOS_CATEGORIAS_UN` (`tipo_categoria`)
);

CREATE TABLE `CARACTERISTICAS` (
  `id_palabra` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_palabra`,`id_categoria`),
  KEY `CARACTERISTICAS_CATEG` (`id_categoria`),
  CONSTRAINT `CARACTERISTICAS_CATEG` FOREIGN KEY (`id_categoria`) REFERENCES `TIPOS_CATEGORIAS` (`id_tipo_categoria`) ON UPDATE CASCADE,
  CONSTRAINT `CARACTERISTICAS_PALABRA` FOREIGN KEY (`id_palabra`) REFERENCES `PALABRAS` (`id_palabra`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `TIPOS_PROPIEDADES` (
  `id_tipo_propiedad` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_propiedad` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_propiedad`),
  UNIQUE KEY `TIPOS_PROPIEDADES_UN` (`tipo_propiedad`)
);

CREATE TABLE `PROPIEDADES` (
  `id_propiedad` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_propiedad` int(11) NOT NULL,
  `id_palabra` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `valor` varchar(30) NOT NULL,
  PRIMARY KEY (`id_propiedad`),
  KEY `PROPIEDADES_CARACT` (`id_palabra`,`id_categoria`),
  KEY `PROPIEDADES_TIPO` (`id_tipo_propiedad`),
  CONSTRAINT `PROPIEDADES_CARACT` FOREIGN KEY (`id_palabra`, `id_categoria`) REFERENCES `CARACTERISTICAS` (`id_palabra`, `id_categoria`) ON DELETE CASCADE,
  CONSTRAINT `PROPIEDADES_TIPO` FOREIGN KEY (`id_tipo_propiedad`) REFERENCES `TIPOS_PROPIEDADES` (`id_tipo_propiedad`) ON UPDATE CASCADE
);
