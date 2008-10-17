DROP VIEW reporte_total_nacional_personas_participantes;
DROP VIEW reporte_actividad_estado_aprovada;
DROP VIEW reporte_total_nacional_actividades_por_estado;

--

CREATE OR REPLACE VIEW reporte_actividades_exitosas AS 
 SELECT a.codigo AS actividad_codigo, a.nombre AS actividad_nombre, b.codigo AS programa_codigo, b.nombre AS programa_nombre, c.codigo AS proyecto_codigo, c.nombre AS proyecto_nombre, d.codigo AS centro_familiar_codigo, d.nombre AS centro_familiar_nombre, e.codigo AS actividad_formato_codigo, e.nombre AS actividad_formato_nombre, min(a.fecha_inicio::date) AS fecha_inicio, max(a.fecha_termino::date) AS fecha_termino
   FROM actividad a
   JOIN programa b ON a.programa = b.codigo
   JOIN proyecto c ON b.proyecto = c.codigo
   JOIN centro_familiar d ON c.centro_familiar = d.codigo
   JOIN actividad_formato e ON a.actividad_formato = e.codigo
  WHERE a.actividad_resultado = 10
  GROUP BY b.codigo, b.nombre, a.codigo, c.codigo, c.nombre, d.codigo, d.nombre, e.codigo, e.nombre, a.nombre;

ALTER TABLE reporte_actividades_exitosas OWNER TO funfamilia;

----
CREATE OR REPLACE VIEW reporte_total_nacional_actividades_nuevas AS 
 SELECT count(a.codigo) AS cantidad_actividades, b.codigo AS programa_codigo, b.nombre AS programa_nombre, c.codigo AS proyecto_codigo, c.nombre AS proyecto_nombre, d.codigo AS centro_familiar_codigo, d.nombre AS centro_familiar_nombre, e.codigo AS actividad_formato_codigo, e.nombre AS actividad_formato_nombre, min(a.fecha_inicio::date) AS fecha_inicio, max(a.fecha_termino::date) AS fecha_termino
   FROM actividad a
   JOIN programa b ON a.programa = b.codigo
   JOIN proyecto c ON b.proyecto = c.codigo
   JOIN centro_familiar d ON c.centro_familiar = d.codigo
   JOIN actividad_formato e ON a.actividad_formato = e.codigo
  WHERE a.estado = 30
  GROUP BY b.codigo, b.nombre, a.codigo, c.codigo, c.nombre, d.codigo, d.nombre, e.codigo, e.nombre;

ALTER TABLE reporte_total_nacional_actividades_nuevas OWNER TO funfamilia;

--
CREATE OR REPLACE VIEW reporte_actividad_estado_en_ejecucion AS
 SELECT a.codigo AS numeroactividad, a.nombre AS nombreactividad, a.estado AS numeroestado, e.nombre AS nombreestado, a.fecha_inicio, a.fecha_termino, c.centro_familiar AS numerocentro, d.nombre AS nombrecentro
   FROM actividad a
   JOIN programa p ON a.programa = p.codigo
   JOIN proyecto c ON p.proyecto = c.codigo
   JOIN centro_familiar d ON d.codigo = c.centro_familiar
   JOIN actividad_estado e ON e.codigo = a.estado
  WHERE a.estado = 50;
ALTER TABLE reporte_actividad_estado_en_ejecucion OWNER TO funfamilia;

-------------------



CREATE OR REPLACE VIEW reporte_total_nacional_personas_participantes AS

SELECT 	cf.codigo AS centro_familiar_codigo, cf.nombre AS centro_familiar_nombre,
	pr.codigo AS proyecto_codigo, pr.nombre AS proyecto_nombre,
	p.codigo AS programa_codigo, p.nombre AS programa_nombre,
	a.codigo AS actividad_codigo, a.nombre AS actividad_nombre,
	min(s.fecha_inicio::date) AS fecha_inicio, max(s.fecha_termino::date) AS fecha_termino,
	count(a.codigo) AS cantidad_personas
FROM sesion s
JOIN actividad a ON (s.actividad = a.codigo)
JOIN programa p ON (a.programa = p.codigo)
JOIN proyecto pr ON (p.proyecto = pr.codigo)
JOIN centro_familiar cf ON (pr.centro_familiar = cf.codigo)
GROUP BY a.codigo, a.nombre, p.codigo, p.nombre, pr.codigo, pr.nombre, cf.codigo, cf.nombre
ORDER BY cf.codigo, pr.codigo, p.codigo, a.codigo;

ALTER TABLE reporte_total_nacional_personas_participantes OWNER TO funfamilia;


---


CREATE OR REPLACE VIEW reporte_actividad_estado_finalizada AS
 SELECT a.codigo AS numeroactividad, a.nombre AS nombreactividad, a.estado AS numeroestado, e.nombre AS nombreestado, a.fecha_inicio, a.fecha_termino, c.centro_familiar AS numerocentro, d.nombre AS nombrecentro
   FROM actividad a
   JOIN programa p ON a.programa = p.codigo
   JOIN proyecto c ON p.proyecto = c.codigo
   JOIN centro_familiar d ON d.codigo = c.centro_familiar
   JOIN actividad_estado e ON e.codigo = a.estado
  WHERE a.estado = 60;

ALTER TABLE reporte_actividad_estado_finalizada OWNER TO funfamilia;


---

CREATE OR REPLACE VIEW reporte_actividad_estado_observada AS
 SELECT a.codigo AS numeroactividad, a.nombre AS nombreactividad, a.estado AS numeroestado, e.nombre AS nombreestado, a.fecha_inicio, a.fecha_termino, c.centro_familiar AS numerocentro, d.nombre AS nombrecentro
   FROM actividad a
   JOIN programa p ON a.programa = p.codigo
   JOIN proyecto c ON p.proyecto = c.codigo
   JOIN centro_familiar d ON d.codigo = c.centro_familiar
   JOIN actividad_estado e ON e.codigo = a.estado
  WHERE a.estado = 20;

ALTER TABLE reporte_actividad_estado_observada OWNER TO funfamilia;

---

CREATE OR REPLACE VIEW reporte_actividad_estado_aprobada AS 
 SELECT a.codigo AS numeroactividad, a.nombre AS nombreactividad, a.estado AS numeroestado, e.nombre AS nombreestado, a.fecha_inicio, a.fecha_termino, c.centro_familiar AS numerocentro, d.nombre AS nombrecentro
   FROM actividad a
   JOIN programa p ON a.programa = p.codigo
   JOIN proyecto c ON p.proyecto = c.codigo
   JOIN centro_familiar d ON d.codigo = c.centro_familiar
   JOIN actividad_estado e ON e.codigo = a.estado
  WHERE a.estado = 30;

ALTER TABLE reporte_actividad_estado_aprobada OWNER TO funfamilia;

---

CREATE OR REPLACE VIEW reporte_actividad_estado_rechazada AS
 SELECT a.codigo AS numeroactividad, a.nombre AS nombreactividad, a.estado AS numeroestado, e.nombre AS nombreestado, a.fecha_inicio, a.fecha_termino, c.centro_familiar AS numerocentro, d.nombre AS nombrecentro
   FROM actividad a
   JOIN programa p ON a.programa = p.codigo
   JOIN proyecto c ON p.proyecto = c.codigo
   JOIN centro_familiar d ON d.codigo = c.centro_familiar
   JOIN actividad_estado e ON e.codigo = a.estado
  WHERE a.estado = 40;

ALTER TABLE reporte_actividad_estado_rechazada OWNER TO funfamilia;


---

CREATE OR REPLACE VIEW reporte_actividad_estado_nueva AS

 SELECT a.codigo AS numeroactividad, a.nombre AS nombreactividad, a.estado AS numeroestado, e.nombre AS nombreestado, a.fecha_inicio, a.fecha_termino, c.centro_familiar AS numerocentro, d.nombre AS nombrecentro
   FROM actividad a
   JOIN programa p ON a.programa = p.codigo
   JOIN proyecto c ON p.proyecto = c.codigo
   JOIN centro_familiar d ON d.codigo = c.centro_familiar
   JOIN actividad_estado e ON e.codigo = a.estado
  WHERE a.estado = 10;

ALTER TABLE reporte_actividad_estado_nueva OWNER TO funfamilia;


---

CREATE OR REPLACE VIEW reporte_dineros_utilizados_por_programas AS
 SELECT a.codigo_actividad, a.descripcion, a.costo, a.numero_documento, c.codigo AS codigo_programa, c.nombre AS nombre_programa, d.codigo AS codigo_formato_actividad, d.nombre AS formato_actividad, c.fecha_inicio, c.fecha_termino
   FROM detalle_costos a
   JOIN actividad b ON a.codigo_actividad = b.codigo
   JOIN programa c ON b.programa = c.codigo
   JOIN actividad_formato d ON b.actividad_formato = d.codigo
  ORDER BY c.codigo;

ALTER TABLE reporte_dineros_utilizados_por_programas OWNER TO funfamilia;

------------

CREATE OR REPLACE VIEW reporte_total_nacional_prestaciones AS
 SELECT (a.rut::character varying::text || '-'::text) || digito_verificador(a.rut::character varying)::text AS rut, (((a.nombres::text || ' '::text) || a.apellido_paterno::text) || ' '::text) || a.apellido_materno::text AS nombre, ((((a.calle::text || ''::text) || (a.numero::text || ''::text)) || (a.block::text || ''::text)) || (a.piso::text || ''::text)) || (a.numero_departamento::text || ''::text) AS direccion, a.fono AS telefono, a.celular, f.nombre AS centro_familiar, f.codigo AS codigo_centro_familiar, c.actividad_formato AS codigo_formato, g.nombre AS actividad_formato, c.programa AS codigo_programa, h.nombre AS programa, b.fecha_inicio, b.fecha_termino
   FROM persona a
   JOIN sesion b ON a.rut = b.rut_persona
   JOIN actividad c ON b.actividad = c.codigo
   JOIN usuario d ON c.usuario = d.usuario
   JOIN centro_familiar_usuario e ON d.usuario = e.usuario
   JOIN centro_familiar f ON e.centro_familiar = f.codigo
   JOIN actividad_formato g ON c.actividad_formato = g.codigo
   JOIN programa h ON c.programa = h.codigo
  WHERE b.fecha_inicio::text > 0::text;

ALTER TABLE reporte_total_nacional_prestaciones OWNER TO funfamilia;

---

CREATE OR REPLACE VIEW reporte_total_nacional_personas_participantes AS
 SELECT DISTINCT (a.rut::character varying::text || '-'::text) || digito_verificador(a.rut::character varying)::text AS rut, (((a.nombres::text || ' '::text) || a.apellido_paterno::text) || ' '::text) || a.apellido_materno::text AS nombre, ((((a.calle::text || ''::text) || (a.numero::text || ''::text)) || (a.block::text || ''::text)) || (a.piso::text || ''::text)) || (a.numero_departamento::text || ''::text) AS direccion, a.fono AS telefono, a.celular, f.nombre AS centro_familiar, f.codigo AS codigo_centro_familiar, c.actividad_formato AS codigo_formato, g.nombre AS actividad_formato, c.programa AS codigo_programa, h.nombre AS programa, min(b.fecha_inicio) AS min, max(b.fecha_termino) AS max
   FROM persona a
   JOIN sesion b ON a.rut = b.rut_persona
   JOIN actividad c ON b.actividad = c.codigo
   JOIN usuario d ON c.usuario = d.usuario
   JOIN centro_familiar_usuario e ON d.usuario = e.usuario
   JOIN centro_familiar f ON e.centro_familiar = f.codigo
   JOIN actividad_formato g ON c.actividad_formato = g.codigo
   JOIN programa h ON c.programa = h.codigo
  GROUP BY a.rut, a.nombres, a.apellido_paterno, a.apellido_materno, a.calle, a.numero, a.block, a.piso, a.numero_departamento, a.fono, a.celular, f.nombre, f.codigo, c.actividad_formato, g.nombre, c.programa, h.nombre
  ORDER BY (a.rut::character varying::text || '-'::text) || digito_verificador(a.rut::character varying)::text, (((a.nombres::text || ' '::text) || a.apellido_paterno::text) || ' '::text) || a.apellido_materno::text, ((((a.calle::text || ''::text) || (a.numero::text || ''::text)) || (a.block::text || ''::text)) || (a.piso::text || ''::text)) || (a.numero_departamento::text || ''::text), a.fono, a.celular, f.nombre, f.codigo, c.actividad_formato, g.nombre, c.programa, h.nombre, min(b.fecha_inicio), max(b.fecha_termino);

ALTER TABLE reporte_total_nacional_personas_participantes OWNER TO funfamilia;

-------------

CREATE OR REPLACE VIEW reporte_busca_persona AS
 SELECT DISTINCT (a.rut::character varying::text || '-'::text) || digito_verificador(a.rut::character varying)::text AS rut, (((a.nombres::text || ' '::text) || a.apellido_paterno::text) || ' '::text) || a.apellido_materno::text AS nombre, ((((a.calle::text || ''::text) || (a.numero::text || ''::text)) || (a.block::text || ''::text)) || (a.piso::text || ''::text)) || (a.numero_departamento::text || ''::text) AS direccion, a.comuna, a.estado_civil, a.fono AS telefono, a.celular, a.ocupacion, a.mail
   FROM persona a
  ORDER BY (a.rut::character varying::text || '-'::text) || digito_verificador(a.rut::character varying)::text, (((a.nombres::text || ' '::text) || a.apellido_paterno::text) || ' '::text) || a.apellido_materno::text, ((((a.calle::text || ''::text) || (a.numero::text || ''::text)) || (a.block::text || ''::text)) || (a.piso::text || ''::text)) || (a.numero_departamento::text || ''::text), a.comuna, a.estado_civil, a.fono, a.celular, a.ocupacion, a.mail;

ALTER TABLE reporte_busca_persona OWNER TO funfamilia;


---


CREATE OR REPLACE VIEW reporte_datos_monitores AS
 SELECT DISTINCT (u.rut::character varying::text || '-'::text) || digito_verificador(u.rut::character varying)::text AS rut, (((u.nombres::text || ' '::text) || u.apellido_paterno::text) || ' '::text) || u.apellido_materno::text AS nombre, u.direccion, u.telefono, u.celular, cf.nombre AS centro_familiar, cf.codigo AS codigo_centro_familiar
   FROM usuario u
   JOIN centro_familiar_usuario cfu ON u.usuario = cfu.usuario
   JOIN centro_familiar cf ON cfu.centro_familiar = cf.codigo
   JOIN grupo_login gl ON u.usuario = gl.usuario
  WHERE u.rut IS NOT NULL
  ORDER BY (u.rut::character varying::text || '-'::text) || digito_verificador(u.rut::character varying)::text, (((u.nombres::text || ' '::text) || u.apellido_paterno::text) || ' '::text) || u.apellido_materno::text, u.direccion, u.telefono, u.celular, cf.nombre, cf.codigo;

ALTER TABLE reporte_datos_monitores OWNER TO funfamilia;

---


CREATE OR REPLACE VIEW reporte_dineros_actividad_especifica AS
 SELECT a.codigo AS codigo_actividad, a.nombre AS nombre_actividad, a.estado AS codigo_estado, c.nombre AS nombre_estado, b.id, b.descripcion, b.numero_documento, b.costo
   FROM actividad a, detalle_costos b, actividad_estado c
  WHERE a.codigo = b.codigo_actividad AND a.estado = c.codigo;

ALTER TABLE reporte_dineros_actividad_especifica OWNER TO funfamilia;

--

CREATE OR REPLACE VIEW reporte_personas_centro_familiar AS
 SELECT DISTINCT (a.rut::character varying::text || '-'::text) || digito_verificador(a.rut::character varying)::text AS rut, (((a.nombres::text || ' '::text) || a.apellido_paterno::text) || ' '::text) || a.apellido_materno::text AS nombre, ((((a.calle::text || ''::text) || (a.numero::text || ''::text)) || (a.block::text || ''::text)) || (a.piso::text || ''::text)) || (a.numero_departamento::text || ''::text) AS direccion, a.fono AS telefono, a.celular, f.nombre AS centro_familiar, f.codigo AS codigo_centro_familiar
   FROM persona a
   JOIN sesion b ON a.rut = b.rut_persona
   JOIN actividad c ON b.actividad = c.codigo
   JOIN usuario d ON c.usuario = d.usuario
   JOIN centro_familiar_usuario e ON d.usuario = e.usuario
   JOIN centro_familiar f ON e.centro_familiar = f.codigo
  ORDER BY (a.rut::character varying::text || '-'::text) || digito_verificador(a.rut::character varying)::text, (((a.nombres::text || ' '::text) || a.apellido_paterno::text) || ' '::text) || a.apellido_materno::text, ((((a.calle::text || ''::text) || (a.numero::text || ''::text)) || (a.block::text || ''::text)) || (a.piso::text || ''::text)) || (a.numero_departamento::text || ''::text), a.fono, a.celular, f.nombre, f.codigo;

ALTER TABLE reporte_personas_centro_familiar OWNER TO funfamilia;

---


CREATE OR REPLACE VIEW reporte_personas_por_actividad AS
 SELECT DISTINCT (u.rut::character varying::text || '-'::text) || digito_verificador(u.rut::character varying)::text AS rut, (((u.nombres::text || ' '::text) || u.apellido_paterno::text) || ' '::text) || u.apellido_materno::text AS nombre, ((((u.calle::text || ''::text) || (u.numero::text || ''::text)) || (u.block::text || ''::text)) || (u.piso::text || ''::text)) || (u.numero_departamento::text || ''::text) AS direccion, u.fono AS telefono, u.celular, s.actividad, a.nombre AS nombreactividad
   FROM persona u
   JOIN sesion s ON u.rut = s.rut_persona
   JOIN actividad a ON a.codigo = s.actividad
  WHERE u.rut IS NOT NULL
  ORDER BY (u.rut::character varying::text || '-'::text) || digito_verificador(u.rut::character varying)::text, (((u.nombres::text || ' '::text) || u.apellido_paterno::text) || ' '::text) || u.apellido_materno::text, ((((u.calle::text || ''::text) || (u.numero::text || ''::text)) || (u.block::text || ''::text)) || (u.piso::text || ''::text)) || (u.numero_departamento::text || ''::text), u.fono, u.celular, s.actividad, a.nombre;

ALTER TABLE reporte_personas_por_actividad OWNER TO funfamilia;

---

CREATE OR REPLACE VIEW reporte_seguimiento_personas AS
 SELECT DISTINCT (a.rut::character varying::text || '-'::text) || digito_verificador(a.rut::character varying)::text AS rut, (((a.nombres::text || ' '::text) || a.apellido_paterno::text) || ' '::text) || a.apellido_materno::text AS nombre, ((((a.calle::text || ''::text) || (a.numero::text || ''::text)) || (a.block::text || ''::text)) || (a.piso::text || ''::text)) || (a.numero_departamento::text || ''::text) AS direccion, a.fono AS telefono, a.celular, b.actividad, c.nombre AS nombreactividad
   FROM persona a
   JOIN sesion b ON a.rut = b.rut_persona
   JOIN actividad c ON c.codigo = b.actividad
  WHERE a.rut IS NOT NULL
  ORDER BY (a.rut::character varying::text || '-'::text) || digito_verificador(a.rut::character varying)::text, (((a.nombres::text || ' '::text) || a.apellido_paterno::text) || ' '::text) || a.apellido_materno::text, ((((a.calle::text || ''::text) || (a.numero::text || ''::text)) || (a.block::text || ''::text)) || (a.piso::text || ''::text)) || (a.numero_departamento::text || ''::text), a.fono, a.celular, b.actividad, c.nombre;

ALTER TABLE reporte_seguimiento_personas OWNER TO funfamilia;

---


CREATE OR REPLACE VIEW reporte_total_costos_actividades_por_formato AS
 SELECT sum(a.costo) AS costo, c.nombre AS nombre_formato, b.fecha_inicio, b.fecha_termino
   FROM detalle_costos a
   JOIN actividad b ON a.codigo_actividad = b.codigo
   JOIN actividad_formato c ON c.codigo = b.actividad_formato
  GROUP BY c.codigo, c.nombre, b.fecha_inicio, b.fecha_termino;

ALTER TABLE reporte_total_costos_actividades_por_formato OWNER TO funfamilia;


----


CREATE OR REPLACE VIEW reporte_usuarios_totales AS
 SELECT DISTINCT (u.rut::character varying::text || '-'::text) || digito_verificador(u.rut::character varying)::text AS rut, (((u.nombres::text || ' '::text) || u.apellido_paterno::text) || ' '::text) || u.apellido_materno::text AS nombre, cf.nombre AS centro_familiar, cf.codigo AS codigo_centro_familiar
   FROM usuario u
   JOIN centro_familiar_usuario cfu ON u.usuario = cfu.usuario
   JOIN centro_familiar cf ON cfu.centro_familiar = cf.codigo
  WHERE u.rut IS NOT NULL
  ORDER BY (u.rut::character varying::text || '-'::text) || digito_verificador(u.rut::character varying)::text, (((u.nombres::text || ' '::text) || u.apellido_paterno::text) || ' '::text) || u.apellido_materno::text, cf.nombre, cf.codigo;

ALTER TABLE reporte_usuarios_totales OWNER TO funfamilia;

-----

