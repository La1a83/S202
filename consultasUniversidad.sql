
USE universidad;

/*Consultes universidad*/
SELECT  apellido1,apellido2,nombre FROM persona WHERE tipo = 'alumno'  ORDER BY apellido1 ASC,apellido2 ASC, nombre ASC;
SELECT nombre, apellido1,apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE "%K";
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3  AND id_grado = 7;
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS departamento FROM persona  JOIN profesor ON profesor.id_profesor = persona.id INNER JOIN departamento ON departamento.id = profesor.id_departamento  ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
SELECT asignatura .nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM alumno_se_matricula_asignatura INNER JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura INNER JOIN persona ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar   WHERE persona.nif = '26902806M';
SELECT DISTINCT departamento.nombre FROM departamento INNER JOIN profesor ON profesor.id_departamento = departamento.id INNER JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor INNER JOIN grado ON grado.id = asignatura.id_grado WHERE asignatura.id_grado = 4;
SELECT  DISTINCT persona.id, persona.nombre, persona.apellido1,persona.apellido2 FROM alumno_se_matricula_asignatura INNER JOIN persona ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019;

/*Consultres universitat amb LEFT JOIN I RIGTH JOIN*/
SELECT departamento.nombre AS departamento, persona.apellido1 AS apellido1, persona.apellido2 AS apellido2 , persona.nombre AS nombre FROM profesor  RIGHT JOIN departamento ON departamento.id = profesor.id_departamento LEFT JOIN persona ON persona.id = profesor.id_profesor ORDER BY departamento ASC, apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT persona.apellido1 AS apellido1, persona.apellido2 AS apellido2 , persona.nombre AS nombre, departamento.nombre AS departamento FROM profesor  RIGHT JOIN departamento ON departamento.id = profesor.id_departamento  LEFT JOIN persona ON persona.id = profesor.id_profesor WHERE departamento.id IS NULL ORDER BY departamento ASC, apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT departamento.nombre AS departamento  FROM departamento  LEFT JOIN profesor ON departamento.id = profesor.id_departamento  WHERE profesor.id_departamento IS NULL;
SELECT persona.nombre, persona.apellido1,persona.apellido2 FROM asignatura RIGHT JOIN persona ON asignatura.id_profesor = persona.id JOIN profesor ON profesor.id_profesor = persona.id WHERE asignatura.id_profesor IS NULL;
SELECT asignatura.nombre AS asignatura FROM asignatura LEFT JOIN persona ON persona.id = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;

/*Consultes resum*/
SELECT COUNT(*) FROM persona WHERE persona.tipo LIKE 'alumno';
SELECT COUNT(*) FROM persona WHERE persona.tipo LIKE 'alumno' AND YEAR(persona.fecha_nacimiento) = 1999;
SELECT departamento.nombre AS departamento,COUNT(id_profesor) AS num_profesores FROM profesor  JOIN departamento ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre ORDER BY COUNT(id_profesor)DESC;
SELECT departamento.nombre AS departamento,COUNT(id_profesor) AS num_profesores FROM profesor RIGHT JOIN departamento ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre;
SELECT grado.nombre AS grau, COUNT(asignatura.id_grado) AS num_asignatures FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre ORDER BY COUNT(asignatura.id_grado) DESC;
SELECT grado.nombre AS grau, COUNT(asignatura.id_grado) AS num_asignatures FROM grado JOIN asignatura ON asignatura.id_grado = grado.id  GROUP BY grado.nombre  HAVING COUNT(asignatura.id_grado)>40 ;
SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) FROM grado JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre,asignatura.tipo;
