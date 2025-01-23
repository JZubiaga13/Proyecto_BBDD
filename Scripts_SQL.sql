SELECT *
FROM alumno

SELECT*
FROM campus


ALTER TABLE alumno
ADD COLUMN id_campus INT;

UPDATE alumno
SET id_campus = (SELECT id_campus
                  FROM campus
                  WHERE campus.id_campus = alumno.id_campus);

SELECT *
FROM aula

ALTER TABLE alumno
DROP COLUMN id_campus


ALTER TABLE alumno
DROP COLUMN id_curso

ALTER TABLE alumno
ADD COLUMN id_curso INT;

UPDATE alumno
SET id_curso = (SELECT id_curso
                  FROM curso
                  WHERE curso.id_curso = alumno.id_curso);

SELECT *
FROM curso

UPDATE curso
SET id_campus = (SELECT id_campus
                  FROM campus
                  WHERE curso.id_campus = campus.id_campus);

UPDATE curso
SET id_aula = (SELECT id_aula
                  FROM aula
                  WHERE curso.id_aula = aula.id_aula);

SELECT *
FROM profesor

ALTER TABLE profesor
DROP COLUMN id_campus;

ALTER TABLE profesor
ADD COLUMN id_campus INT;

ALTER TABLE profesor
RENAME COLUMN id_campus TO ciudad;
