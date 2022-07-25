--3.1. Seleccionar una sede a partir de una lista que contiene los nombres y ubicaciones de las sedes.

SELECT cs.nom_complejo, cs.direccion, CA.ubicacion
FROM campus_sede CS
INNER JOIN campus_area CA ON (CA.id_complejo_fk_id = CS.id_complejo);


--3.2. Seleccionar el área donde se realizará el evento, a partir de una lista de nombres y ubicaciones de áreas 
--     y que pertenecen a la sede previamente seleccionada.

SELECT CA.nom_area, CA.ubicacion, CE.consec_evento, CE.fecha_hora
FROM campus_area CA
INNER JOIN campus_evento CE ON (CE.id_area_fk_id = CA.id_area) AND (CE.id_complejo_fk_id = CA.id_complejo_fk_id)
WHERE CA.id_complejo_fk_id = '00001'; -- Complejo seleccionado id 'Soccer City'

--3.3. Seleccionar el deporte de una lista de deportes que se permiten en el área seleccionada.

SELECT SD.nom_deporte
FROM sports_deporte SD
INNER JOIN campus_evento CE ON (CE.id_deporte_fk_id = SD.id_deporte)
INNER JOIN campus_area CA ON (CA.id_area = CE.id_area_fk_id) AND (CA.id_complejo_fk_id = CE.id_complejo_fk_id) 
								AND (CA.id_area =  '00001');

--3.4. Incluir los demás campos ¿?
-- id persona

--3.5. Responsable del Evento quien está “logueado” y la fecha de préstamo corresponde a la fecha del sistema.

SELECT CE.consec_evento, CE.fecha_hora, AU.first_name, AU.last_name, AU.username, fecha_prestamo AS fecha_sistema
FROM sports_deporte SD
INNER JOIN campus_evento CE ON (CE.id_deporte_fk_id = SD.id_deporte)
INNER JOIN campus_area CA ON (CA.id_area = CE.id_area_fk_id) AND (CA.id_complejo_fk_id = CE.id_complejo_fk_id) 
INNER JOIN users_persona UP ON (UP.cod_persona = CE.cod_persona_fk_id)
INNER JOIN sports_prestamo SP ON (SP.cod_persona_fk_id = UP.cod_persona)
INNER JOIN auth_user AU ON (UP.user_id = AU.id);


--3.6. Guardar y por algún medio se podrá invocar dos interfaces una Préstamo y la otra Comisario ¿?


--3.7. Selecciona los equipos que sirven para ese deporte, que están en el inventario de esa sede y que está libre,
--     crear el registro de préstamo del equipo incluyendo la fecha de préstamo.

SELECT SE.nom_equipo, SI.id_complejo_fk_id
FROM sports_equipo SE
INNER JOIN sports_inventario SI ON (SI.id_equipo_fk_id = SE.id_equipo)
								AND (SI.id_estado_fk_id = '1') -- 1: libre
								AND (SI.id_complejo_fk_id = '00001')
INNER JOIN sports_deporte_id_equipo_fk SDE ON (SDE.equipo_id = SE.id_equipo)
								AND (SDE.deporte_id = 'FBL'); -- Deporte seleccionado 'futbol'

--Se debe insertar un registro de prestamo.


--3.8. De una lista de comisarios seleccione el comisario (de una lista de tareas debe seleccionar la tarea del comisario).
SELECT AU.first_name, AU.last_name
FROM auth_user AU
INNER JOIN users_persona UP ON (UP.id_tipo_persona_fk_id = '2') -- 2: comisario
							and (AU.id = UP.user_id);

SELECT UT.desc_tarea FROM users_tarea UT;

--De los ìtems seleccionados en las dos consultas se debe hacer un INSERT INTO users_comisarioevento



--4.1. Seleccionar una sede a partir de una lista que contiene los nombres y ubicaciones de las sedes.

SELECT cs.nom_complejo, cs.direccion, CA.ubicacion
FROM campus_sede CS
INNER JOIN campus_area CA ON (CA.id_complejo_fk_id = CS.id_complejo);


--4.2. Seleccionar de una lista el equipo (dicha lista contiene los quipos disponibles en inventario para la sede seleccionada
--     y que tienen estado Libre). Equipo se refiere a equipamiento.

SELECT SE.nom_equipo, SI.id_complejo_fk_id
FROM sports_equipo SE
INNER JOIN sports_inventario SI ON (SI.id_equipo_fk_id = SE.id_equipo) AND (SI.id_estado_fk_id = '1');


--4.3. Incluir el estado de una lista de estados (5 o 6 dependiendo para que se presta)
SELECT SE.nom_equipo, SI.id_complejo_fk_id, SI.id_estado_fk_id AS est_inv, EI.desc_estado AS desc_est_inv,
	    SP.id_estado_fk_id AS est_ptmo, EP.desc_estado AS desc_est_ptmo
FROM sports_equipo SE
INNER JOIN sports_inventario SI ON (SI.id_equipo_fk_id = SE.id_equipo)
INNER JOIN sports_prestamo SP ON (SP.consec_inventario_fk_id = SI.consec_inventario)
LEFT  JOIN sports_estado EI ON (EI.id_estado = SI.id_estado_fk_id)
LEFT  JOIN sports_estado EP ON (EP.id_estado = SP.id_estado_fk_id);


--4.4. Responsable del Préstamo quien está “logueado” y la fecha de préstamo corresponde a la fecha del sistema.

SELECT AU.first_name, AU.last_name, AU.username, fecha_prestamo AS fecha_sistema
FROM users_persona UP
INNER JOIN sports_prestamo SP ON (SP.cod_persona_fk_id = UP.cod_persona)
INNER JOIN auth_user AU ON (UP.user_id = AU.id)
WHERE AU.username = 'Jeff' --Usuario logueado