--Relacionar alumnos con en qué aulas dan sus clases

SELECT A.nombre_apellidos, Au.numero
FROM alumno A
INNER JOIN curso C
ON A.id_curso=C.id_curso
INNER JOIN aula Au
ON Au.id_aula=C.id_aula

--Ver qué proyectos corresponden por cada curso

SELECT C.id_curso,C.vertical,P.nombre_proyecto
FROM CURSO C
INNER JOIN ALUMNO AL
ON C.id_curso=AL.id_curso
INNER JOIN CALIFICACIONES CA
ON CA.id_alumno=AL.id_alumno
INNER JOIN PROYECTOS P
ON P.nombre_proyecto=CA.nombre_proyecto 

--Ver cuando tiene que empezar el profesor,modalidad, en qué ciudad, aula, fecha de comienzo y que impartirá

SELECT P.nombre,C.modalidad,CA.ciudad,AU.numero,PR.fecha_comienzo,C.vertical
FROM PROFESOR P
INNER JOIN PROFESOR_CURSO PC
ON P.id_profesor=PC.id_profesor
INNER JOIN CURSO C
ON PC.id_curso=C.id_curso
INNER JOIN PROMOCION PR
ON PR.id_promocion=C.id_promocion
INNER JOIN AULA AU
ON AU.id_aula=C.id_aula
INNER JOIN CAMPUS CA
ON C.id_campus=CA.id_campus

--Cuántos alumnos hay por cada vertical?

SELECT C.vertical,COUNT(ID_ALUMNO)
FROM ALUMNO AL
INNER JOIN CURSO C
ON C.id_curso=AL.id_curso
GROUP BY C.vertical 

--Ver qué trabajos está costando más a los alumnos

SELECT P.nombre_proyecto,COUNT(AL.id_alumno)
FROM CURSO C
INNER JOIN ALUMNO AL
ON C.id_curso=AL.id_curso
INNER JOIN CALIFICACIONES CA
ON CA.id_alumno=AL.id_alumno
INNER JOIN PROYECTOS P
ON P.nombre_proyecto=CA.nombre_proyecto
WHERE CA.resultado = 'No Apto'
GROUP BY P.nombre_proyecto 