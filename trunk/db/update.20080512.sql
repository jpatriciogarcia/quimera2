CREATE TABLE actividad_formato
(
  codigo integer NOT NULL DEFAULT nextval('formato_actividad_codigo_seq'::regclass),
  actividad_tipo integer NOT NULL,
  nombre character varying(255) NOT NULL,
  descripcion text,
  activo boolean NOT NULL DEFAULT true,
  CONSTRAINT formato_actividad_pkey PRIMARY KEY (codigo),
  CONSTRAINT fk_actividad_ref_actividad_tipo FOREIGN KEY (actividad_tipo)
      REFERENCES actividad_tipo (codigo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
) 
WITH OIDS;
ALTER TABLE actividad_formato OWNER TO postgres;


-- Index: index_41

-- DROP INDEX index_41;

CREATE UNIQUE INDEX index_41
  ON actividad_formato
  USING btree
  (codigo);



---------------------------------------

ALTER TABLE actividad DROP COLUMN actividad_tipo;

--------------------------
ALTER TABLE actividad ADD COLUMN actividad_formato integer NOT NULL DEFAULT 1;
ALTER TABLE actividad ADD CONSTRAINT fk_actividad_ref_actividad_formato FOREIGN KEY (actividad_formato) REFERENCES actividad_formato (codigo)    ON UPDATE NO ACTION ON DELETE NO ACTION;
