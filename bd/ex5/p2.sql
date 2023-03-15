-- Ejercicio 1
INSERT INTO acs_objects (object_id, object_type, title, package_id, context_id, security_inherit_p, creation_user, creation_ip, modifying_user, modifying_ip)
VALUES 
	(1, 'user', 'titulo ejemplo', 1, 4, false, 2, '192.168.0.1', 1, '192.168.0.1'),
    (2, 'user', 'titulo ejemplo2', 3, 7, true, 3, '192.155.0.1', 1, '192.168.0.1');

-- Ejercicio 2
INSERT INTO acs_objects (object_id, object_type, title, package_id, context_id, security_inherit_p, creation_user, creation_date, creation_ip, last_modified, modifying_user, modifying_ip)
VALUES 
	(1, 'user', 'titulo ejemplo', 1, 4, false, 2,'2023-03-10 16:30:00', '192.168.0.1','2023-03-13 18:39:04', 1, '192.168.0.1'),
    (2, 'user', 'titulo ejemplo2', 3, 7, true, 3,'2023-02-17 17:20:00', '192.155.0.1','2023-03-15 18:55:08', 1, '192.168.0.1');

-- Ejercicio 3
UPDATE acs_objects SET title = 'Ejemplo de título' WHERE object_id > 100;

-- Ejercicio 4
DELETE FROM acs_objects WHERE modifying_ip = '200.200.200.200';


