CREATE TABLE `PALABRAS` (
  `lema` varchar(100) NOT NULL,
  `raiz` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`lema`),
  KEY `PALABRAS_FK` (`raiz`),
  CONSTRAINT `PALABRAS_FK` FOREIGN KEY (`raiz`) REFERENCES `PALABRAS` (`lema`) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE `CATEGORIAS` (
  `categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`categoria`)
);

CREATE TABLE `CARACTERISTICAS` (
  `lema` varchar(100) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`lema`,`categoria`),
  KEY `CARACTERISTICAS_FK_1` (`categoria`),
  CONSTRAINT `CARACTERISTICAS_FK` FOREIGN KEY (`lema`) REFERENCES `PALABRAS` (`lema`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CARACTERISTICAS_FK_1` FOREIGN KEY (`categoria`) REFERENCES `CATEGORIAS` (`categoria`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `TIPOS_PROPIEADES` (
  `tipo_propiedad` varchar(100) NOT NULL,
  PRIMARY KEY (`tipo_propiedad`)
);

CREATE TABLE `PROPIEDADES` (
  `lema` varchar(100) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `valor` varchar(100) NOT NULL,
  PRIMARY KEY (`lema`,`categoria`,`tipo`),
  KEY `NewTable_FK` (`tipo`),
  CONSTRAINT `NewTable_FK` FOREIGN KEY (`tipo`) REFERENCES `TIPOS_PROPIEADES` (`tipo_propiedad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `NewTable_FK_1` FOREIGN KEY (`lema`, `categoria`) REFERENCES `CARACTERISTICAS` (`lema`, `categoria`) ON DELETE CASCADE ON UPDATE CASCADE
);