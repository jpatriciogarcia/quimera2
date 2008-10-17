-- Para recordar la contraseña
ALTER TABLE usuario ADD COLUMN envio_clave character(32);
ALTER TABLE usuario ADD COLUMN envio_valido_hasta timestamp without time zone;


