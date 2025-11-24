-- 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1, apellido2, nombre;

-- 2. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades. (nombre, apellido1, apellido2)
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno' 
  AND telefono IS NULL;

-- 3. Retorna el llistat dels alumnes que van néixer en 1999. (id, nombre, apellido1, apellido2, fecha_nacimiento)
SELECT id, nombre, apellido1, apellido2, fecha_nacimiento
FROM persona
WHERE tipo = 'alumno'
  AND YEAR(fecha_nacimiento) = 1999;

-- 4. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K. (nombre, apellido1, apellido2, nif)
SELECT nombre, apellido1, apellido2, nif
FROM persona
WHERE tipo = 'profesor'
  AND telefono IS NULL
  AND nif LIKE '%K';

-- 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7. (id, nombre, cuatrimestre, curso, id_grado)
SELECT id, nombre, cuatrimestre, curso, id_grado
FROM asignatura
WHERE cuatrimestre = 1
  AND curso = 3
  AND id_grado = 7;
-- 6. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom. (apellido1, apellido2, nombre, departamento)
SELECT 
    pe.apellido1 AS apellido1,
    pe.apellido2 AS apellido2,
    pe.nombre AS nombre,
    d.nombre AS departamento
FROM profesor p
JOIN persona pe ON p.id_profesor = pe.id
JOIN departamento d ON p.id_departamento = d.id
ORDER BY pe.apellido1, pe.apellido2, pe.nombre;

-- 7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M. (nombre, anyo_inicio, anyo_fin)
SELECT asg.nombre, cs.anyo_inicio, cs.anyo_fin
FROM alumno_se_matricula_asignatura a
JOIN curso_escolar cs ON a.id_curso_escolar = cs.id
JOIN asignatura asg ON a.id_asignatura = asg.id
JOIN persona p ON a.id_alumno = p.id
WHERE p.nif = '26902806M';

-- 8. Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015). (nombre)
SELECT DISTINCT d.nombre
FROM departamento d 
JOIN profesor p
ON d.id = p.id_departamento
JOIN asignatura a
ON a.id_profesor = p.id_profesor
JOIN grado g
ON g.id = a.id_grado 
WHERE g.nombre= 'Grado en Ingeniería Informática (Plan 2015)';

-- 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019. (nombre, apellido1, apellido2)
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2
FROM persona p
JOIN alumno_se_matricula_asignatura al 
    ON p.id = al.id_alumno
JOIN curso_escolar ce 
    ON al.id_curso_escolar = ce.id
WHERE p.tipo = 'alumno'
  AND ce.anyo_inicio = 2018
  AND ce.anyo_fin = 2019;

-- 10. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom. (departamento, apellido1, apellido2, nombre)
SELECT 
    d.nombre AS departamento,
    pe.apellido1,
    pe.apellido2,
    pe.nombre
FROM persona pe
LEFT JOIN profesor p ON pe.id = p.id_profesor
LEFT JOIN departamento d ON d.id = p.id_departamento
WHERE pe.tipo = 'profesor'
ORDER BY departamento, pe.apellido1, pe.apellido2, pe.nombre;

-- 11. Retorna un llistat amb els professors/es que no estan associats a un departament. (apellido1, apellido2, nombre)
SELECT pe.apellido1, pe.apellido2, pe.nombre
FROM persona pe
LEFT JOIN profesor p ON pe.id = p.id_profesor LEFT JOIN departamento d ON d.id = p.id_departamento
WHERE pe.tipo = 'profesor' AND d.id IS NULL;

-- 12. Retorna un llistat amb els departaments que no tenen professors/es associats. (nombre)
SELECT d.nombre
FROM departamento d
LEFT JOIN profesor p
ON p.id_departamento = d.id
WHERE p.id_departamento IS NULL;

-- 13. Retorna un llistat amb els professors/es que no imparteixen cap assignatura. (apellido1, apellido2, nombre)
SELECT pe.apellido1, pe.apellido2, pe.nombre
FROM persona pe
LEFT JOIN profesor pr
ON pr.id_profesor = pe.id
LEFT JOIN asignatura a
ON a.id_profesor = pr.id_profesor
Where pe.tipo = 'profesor'
AND pr.id_profesor IS NOT NULL
 AND a.id_profesor IS NULL;

-- 14. Retorna un llistat amb les assignatures que no tenen un professor/a assignat. (id, nombre)
SELECT a.id, a.nombre
FROM asignatura a
LEFT JOIN profesor p
ON a.id_profesor = p.id_profesor
WHERE p.id_profesor IS NULL;

-- 15. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar. (nombre)
SELECT d.nombre
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor
WHERE a.id IS NULL;

-- 16. Retorna el nombre total d'alumnes que hi ha. (total)
SELECT COUNT(*) AS total
FROM persona
WHERE tipo = 'alumno';

-- 17. Calcula quants alumnes van néixer en 1999. (total)
SELECT COUNT(*) AS total
FROM persona
WHERE tipo = 'alumno'
  AND YEAR(fecha_nacimiento) = 1999;

-- 18. Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es. (departamento, total)
SELECT 
    d.nombre AS departamento,
    COUNT(pr.id_profesor) AS total
FROM profesor pr
JOIN persona pe ON pr.id_profesor = pe.id
JOIN departamento d ON pr.id_departamento = d.id
WHERE pe.tipo = 'profesor'
GROUP BY d.id, d.nombre
ORDER BY total DESC;

-- 19. Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat. (departamento, total)
SELECT d.nombre AS departamento, COUNT(pr.id_profesor) AS total
FROM departamento d
LEFT JOIN profesor pr ON pr.id_departamento = d.id
LEFT JOIN persona pe ON pr.id_profesor = pe.id
GROUP BY d.id, d.nombre
ORDER BY total DESC;

-- 20. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures. (grau, total)
SELECT g.nombre AS grau, COUNT(asig.id) AS total
FROM grado g
LEFT JOIN asignatura asig ON asig.id_grado = g.id
GROUP BY g.id, g.nombre
ORDER BY total DESC;


-- 21. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades. (grau, total)
SELECT DISTINCT g.nombre, COUNT(asig.nombre) as total_asignaturas
FROM grado g
JOIN asignatura asig
ON asig.id_grado = g.id
GROUP BY g.id, g.nombre
HAVING COUNT(asig.nombre) > 40;

-- 22. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus. (grau, tipus, total_creditos)
SELECT DISTINCT g.nombre, asig.tipo, SUM(asig.creditos) as total_creditos
FROM grado g
JOIN asignatura asig
ON asig.id_grado = g.id
GROUP BY g.id, g.nombre, asig.tipo;

-- 23. Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats. (anyo_inicio, total)
SELECT ce.anyo_inicio, COUNT(al.id_alumno)
FROM curso_escolar ce
JOIN alumno_se_matricula_asignatura al
ON al.id_curso_escolar = ce.id
JOIN persona pe
ON al.id_alumno = pe.id
WHERE pe.tipo = 'alumno'
GROUP BY al.id_curso_escolar;

-- 24. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures. (id, nombre, apellido1, apellido2, total)
SELECT pe.id, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.nombre) as total_asignarturas
FROM persona pe
LEFT JOIN profesor pr
ON pr.id_profesor = pe.id
LEFT JOIN asignatura a
ON a.id_profesor = pr.id_profesor
WHERE pe.tipo= 'profesor'
GROUP BY pe.id, pe.nombre, pe.apellido1, pe.apellido2
ORDER BY  total_asignarturas DESC;

-- 25. Retorna totes les dades de l'alumne/a més jove.
SELECT nombre
FROM persona
WHERE tipo = 'alumno' AND fecha_nacimiento = (
    SELECT MAX(fecha_nacimiento)
    FROM persona
);

-- 26. Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura. (apellido1, apellido2, nombre)
SELECT pe.apellido1, pe.apellido2, pe.nombre
FROM persona pe
JOIN profesor pr 
ON pr.id_profesor = pe.id
JOIN departamento d
ON pr.id_departamento = d.id
LEFT JOIN asignatura a
ON a.id_profesor = pr.id_profesor
WHERE pe.tipo = 'profesor' AND a.id_profesor IS NULL;
