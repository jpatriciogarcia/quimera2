-- Table: persona

-- DROP TABLE persona;

CREATE TABLE persona
(
  rut integer NOT NULL,
  nombres character(80) NOT NULL,
  apellido_paterno character(80) NOT NULL,
  apellido_materno character(80) NOT NULL,
  sexo character(1) NOT NULL,
  fecha_nacimiento date NOT NULL,
  fecha_inscripcion timestamp without time zone DEFAULT now(),
  tipo_calle integer,
  tipo_vivienda integer,
  calle character(255),
  numero character(60),
  block character(60),
  piso character(60),
  numero_departamento character(60),
  comuna character(10),
  fono character(20),
  celular character(20),
  mail character(80),
  estado_civil integer,
  numero_miembros_familia smallint,
  nivel_educacional integer,
  ocupacion integer,
  CONSTRAINT persona_pkey PRIMARY KEY (rut),
  CONSTRAINT fk_persona_reference_estado_c FOREIGN KEY (estado_civil)
      REFERENCES estado_civil (codigo) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_persona_reference_nivel_ed FOREIGN KEY (nivel_educacional)
      REFERENCES nivel_educacional (codigo) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_persona_reference_ocupacio FOREIGN KEY (ocupacion)
      REFERENCES ocupacion (codigo) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_persona_reference_tipo_cal FOREIGN KEY (tipo_calle)
      REFERENCES tipo_calle (codigo) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_persona_reference_tipo_viv FOREIGN KEY (tipo_vivienda)
      REFERENCES tipo_vivienda (codigo) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT
) 
WITHOUT OIDS;
ALTER TABLE persona OWNER TO postgres;


-- Index: index_15

-- DROP INDEX index_15;

CREATE UNIQUE INDEX index_15
  ON persona
  USING btree
  (rut);


