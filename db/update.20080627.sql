ALTER TABLE detalle_costos ALTER costo TYPE bigint;
ALTER TABLE detalle_costos ALTER numero_documento TYPE bigint;
ALTER TABLE detalle_costos
   ALTER COLUMN numero_documento DROP NOT NULL;
