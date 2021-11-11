-- LibreDic.categorias definition

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_categoria` char(1) COLLATE utf8mb4_bin NOT NULL,
  `tipo_categoria_entero` varchar(35) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


-- LibreDic.palabras definition

CREATE TABLE `palabras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lema` varchar(35) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PALABRAS_UN` (`lema`)
) ENGINE=InnoDB AUTO_INCREMENT=107187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


-- LibreDic.tipos_propiedades definition

CREATE TABLE `tipos_propiedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_propiedad` char(3) COLLATE utf8mb4_bin NOT NULL,
  `tipo_propiedad_entero` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TIPOS_PROPIEDADES_UN` (`tipo_propiedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


-- LibreDic.sentidos definition

CREATE TABLE `sentidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_palabra` int(11) NOT NULL,
  `id_raiz` int(11) DEFAULT NULL,
  `sentido` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `SENTIDOS_FK` (`id_palabra`),
  KEY `SENTIDOS_FK_1` (`id_raiz`),
  CONSTRAINT `SENTIDOS_FK` FOREIGN KEY (`id_palabra`) REFERENCES `palabras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SENTIDOS_FK_1` FOREIGN KEY (`id_raiz`) REFERENCES `palabras` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=107639 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


-- LibreDic.caracteristicas definition

CREATE TABLE `caracteristicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sentido` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `caracteristicas_fk` (`id_sentido`),
  KEY `caracteristicas_fk_1` (`id_categoria`),
  CONSTRAINT `caracteristicas_fk` FOREIGN KEY (`id_sentido`) REFERENCES `sentidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `caracteristicas_fk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


-- LibreDic.propiedades definition

CREATE TABLE `propiedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_propiedad` int(11) NOT NULL,
  `valor` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `id_caracteristicas` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `propiedades_tipo` (`id_tipo_propiedad`),
  KEY `propiedades_sentido` (`id_caracteristicas`),
  CONSTRAINT `propiedades_sentido` FOREIGN KEY (`id_caracteristicas`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `propiedades_tipo` FOREIGN KEY (`id_tipo_propiedad`) REFERENCES `tipos_propiedades` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;