CREATE TABLE centro_familiar_usuario
(
   centro_familiar integer NOT NULL,
   usuario character(20) NOT NULL,
   CONSTRAINT pk_centro_familiar_usuario PRIMARY KEY (centro_familiar, usuario),
   CONSTRAINT fk_centro_familiar FOREIGN KEY (centro_familiar) REFERENCES centro_familiar (codigo)    ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT fk_usuario FOREIGN KEY (usuario) REFERENCES usuario (usuario)    ON UPDATE NO ACTION ON DELETE NO ACTION
) WITHOUT OIDS;

ALTER TABLE proyecto ADD COLUMN activo boolean NOT NULL DEFAULT TRUE;

ALTER TABLE programa ADD COLUMN activo boolean NOT NULL DEFAULT TRUE;

ALTER TABLE actividad ADD COLUMN activo boolean NOT NULL DEFAULT TRUE;
