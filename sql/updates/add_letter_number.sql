ALTER TABLE libredic_db.palabras ADD num_letras varchar(100) NULL;
CREATE INDEX palabras_num_letras_IDX USING BTREE ON libredic_db.palabras (num_letras);

UPDATE palabras SET num_letras = LENGTH(lema);
