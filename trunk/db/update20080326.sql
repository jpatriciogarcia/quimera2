ALTER TABLE actividad RENAME tipo  TO actividad_tipo;
ALTER TABLE actividad RENAME resultado  TO actividad_resultado;
ALTER TABLE actividad ALTER COLUMN actividad_tipo SET STATISTICS -1;
ALTER TABLE actividad ALTER COLUMN actividad_resultado SET STATISTICS -1;
COMMENT ON COLUMN actividad.actividad_tipo IS 'Tipo de la actividad, hace referencia a la tabla actividad_tipo';
COMMENT ON COLUMN actividad.actividad_resultado IS 'Resultado de la actividad, hace referencia a la tabla actividad_resultado';

ALTER TABLE actividad RENAME responsable  TO usuario;
ALTER TABLE actividad ALTER COLUMN usuario SET STATISTICS -1;
COMMENT ON COLUMN actividad.usuario IS 'Responsable de la actividad, hace referencia a la tabla usuario';

ALTER TABLE programa RENAME estado  TO programa_estado;
ALTER TABLE programa ALTER COLUMN programa_estado SET STATISTICS -1;
