ALTER TABLE actividad ADD COLUMN "timestamp" timestamp without time zone NOT NULL DEFAULT NOW();

ALTER TABLE actividad_historial ADD COLUMN "timestamp" timestamp without time zone NOT NULL DEFAULT NOW();

ALTER TABLE actividad ADD COLUMN usuario_modificacion character(20);

ALTER TABLE actividad_historial ADD COLUMN usuario_modificacion character(20);



DROP TRIGGER crea_historico;

CREATE TRIGGER crea_historico
  BEFORE UPDATE
  ON actividad
  FOR EACH ROW
  EXECUTE PROCEDURE insert_actividad_historial();

-- Function: insert_actividad_historial()

-- DROP FUNCTION insert_actividad_historial();

CREATE OR REPLACE FUNCTION insert_actividad_historial()
  RETURNS trigger AS
$BODY$
    BEGIN
        --
        -- Crea un registro historico de la tabla actividad
        --
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO actividad_historial
            (codigo, programa, estado, actividad_resultado, usuario, nombre, descripcion, avance, costo, fecha_inicio, fecha_termino,
            fecha_inicio_real, cantidad_sesiones_programadas, cantidad_sesiones_realizadas, cantidad_personas, cantidad_personas_total, activo, actividad_formato, timestamp)
            SELECT OLD.codigo, OLD.programa, OLD.estado, OLD.actividad_resultado, OLD.usuario, OLD.nombre, OLD.descripcion, OLD.avance, OLD.costo, OLD.fecha_inicio, OLD.fecha_termino,
            OLD.fecha_inicio_real, OLD.cantidad_sesiones_programadas, OLD.cantidad_sesiones_realizadas, OLD.cantidad_personas, OLD.cantidad_personas_total, OLD.activo, OLD.actividad_formato, OLD.timestamp;
            RETURN NEW;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO actividad_historial
            (codigo, programa, estado, actividad_resultado, usuario, nombre, descripcion, avance, costo, fecha_inicio, fecha_termino,
            fecha_inicio_real, cantidad_sesiones_programadas, cantidad_sesiones_realizadas, cantidad_personas, cantidad_personas_total, activo, actividad_formato, timestamp)
            SELECT OLD.codigo, OLD.programa, OLD.estado, OLD.actividad_resultado, OLD.usuario, OLD.nombre, OLD.descripcion, OLD.avance, OLD.costo, OLD.fecha_inicio, OLD.fecha_termino,
            OLD.fecha_inicio_real, OLD.cantidad_sesiones_programadas, OLD.cantidad_sesiones_realizadas, OLD.cantidad_personas, OLD.cantidad_personas_total, OLD.activo, OLD.actividad_formato, OLD.timestamp;
            RETURN NEW;
        END IF;
        RETURN NULL;
    END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION insert_actividad_historial() OWNER TO funfamilia;





-- Function: inserta_thesaurus(text)

-- DROP FUNCTION inserta_thesaurus(text);

CREATE OR REPLACE FUNCTION inserta_thesaurus(descripcion text)
  RETURNS integer AS
$BODY$
DECLARE
	descripcion_text ALIAS FOR $1;
	palabras_array varchar[] := string_to_array(descripcion_text, ' ');
	thesaurus_rec RECORD;
BEGIN
	FOR i IN array_lower(palabras_array,1) .. array_upper(palabras_array,1) LOOP
		SELECT INTO thesaurus_rec * FROM thesaurus WHERE UPPER(palabra) = UPPER(palabras_array[i]);
		IF thesaurus_rec.codigo IS NULL THEN
			INSERT INTO thesaurus(palabra, cantidad_ocurrencias)
			VALUES(palabras_array[i], 1);
		ELSE
			UPDATE thesaurus
			SET cantidad_ocurrencias = 1 + thesaurus_rec.cantidad_ocurrencias
			WHERE codigo = thesaurus_rec.codigo;
		END IF;
	END LOOP;
	RETURN 0;
END
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION inserta_thesaurus(text) OWNER TO funfamilia;
