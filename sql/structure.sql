CREATE TABLE `PALABRAS` (
  `id_palabra` int(11) NOT NULL AUTO_INCREMENT,
  `lema` varchar(35) NOT NULL,
  `raiz` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_palabra`),
  UNIQUE KEY `PALABRAS_UN` (`lema`),
  KEY `PALABRAS_RAIZ` (`raiz`),
  CONSTRAINT `PALABRAS_RAIZ` FOREIGN KEY (`raiz`) REFERENCES `PALABRAS` (`id_palabra`) ON DELETE SET NULL ON UPDATE CASCADE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `TIPOS_CATEGORIAS` (
  `id_tipo_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_categoria` char(1) NOT NULL,
  PRIMARY KEY (`id_tipo_categoria`),
  UNIQUE KEY `TIPOS_CATEGORIAS_UN` (`tipo_categoria`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `CATEGORIAS` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `id_palabra` int(11) NOT NULL,
  `id_tipo_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `CATEGORIAS_UN` (`id_palabra`,`id_categoria`),
  KEY `CATEGORIAS_PALABRA` (`id_palabra`),
  KEY `CATEGORIAS_TIPO` (`id_tipo_categoria`),
  CONSTRAINT `CATEGORIAS_PALABRA` FOREIGN KEY (`id_palabra`) REFERENCES `PALABRAS` (`id_palabra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CATEGORIAS_TIPO` FOREIGN KEY (`id_tipo_categoria`) REFERENCES `TIPOS_CATEGORIAS` (`id_tipo_categoria`) ON UPDATE CASCADE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `SENTIDOS` (
  `id_sentido` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_sentido`),
  KEY `SENTIDOS_FK` (`id_categoria`),
  CONSTRAINT `SENTIDOS_FK` FOREIGN KEY (`id_categoria`) REFERENCES `CATEGORIAS` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `TIPOS_PROPIEDADES` (
  `id_tipo_propiedad` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_propiedad` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_propiedad`),
  UNIQUE KEY `TIPOS_PROPIEDADES_UN` (`tipo_propiedad`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `PROPIEDADES` (
  `id_propiedad` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_propiedad` int(11) NOT NULL,
  `valor` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `id_sentido` int(11) NOT NULL,
  PRIMARY KEY (`id_propiedad`),
  KEY `PROPIEDADES_TIPO` (`id_tipo_propiedad`),
  KEY `PROPIEDADES_SENTIDO` (`id_sentido`),
  CONSTRAINT `PROPIEDADES_SENTIDO` FOREIGN KEY (`id_sentido`) REFERENCES `SENTIDOS` (`id_sentido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PROPIEDADES_TIPO` FOREIGN KEY (`id_tipo_propiedad`) REFERENCES `TIPOS_PROPIEDADES` (`id_tipo_propiedad`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

COMMIT;