ALTER TABLE sesion ADD CONSTRAINT fk_sesion_reference_persona FOREIGN KEY (rut_persona) REFERENCES persona (rut)    ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE usuario ADD COLUMN rut integer;
