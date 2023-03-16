-- Ejercicio 1
INSERT INTO acs_objects (object_id, title, package_id, context_id, creation_user, creation_ip, modifying_ip)
VALUES 
	(1, 'titulo ejemplo', 1, 4, 2, '192.168.0.1', '192.168.0.1'),
    (2, 'titulo ejemplo2', 3, 7, 3, '192.155.0.1', '192.168.0.1');


-- Ejercicio 2
-- creation_date y last_modified no se incluyen porque son default (se pone la fecha/hora automáticamente)
INSERT INTO acs_objects (object_id, object_type, title, package_id, context_id, security_inherit_p, creation_user,  creation_ip,  modifying_user, modifying_ip)
VALUES 
	(1, 'user', 'titulo ejemplo', 1, 4, false, 2, '192.168.0.1', 1, '192.168.0.1'),
    (2, 'user', 'titulo ejemplo2', 3, 7, true, 3, '192.155.0.1', 1, '192.168.0.1');


-- Ejercicio 3
UPDATE acs_objects SET title = 'Ejemplo de título' WHERE object_id > 100;


-- Ejercicio 4
DELETE FROM acs_objects WHERE modifying_ip = '200.200.200.200';


