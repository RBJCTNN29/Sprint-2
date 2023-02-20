CONSULTA 1

USE tienda; 
SELECT nombre 
FROM producto

CONSULTA 2

USE tienda;
SELECT nombre, precio
FROM producto

CONSULTA 3

USE tienda; 
SELECT *
FROM producto

CONSULTA 4

USE tienda;
SELECT nombre, precio, CAST(precio * 1.08 AS DECIMAL(5, 2)) AS dolares
FROM producto

CONSULTA 5

USE tienda;
SELECT nombre, precio AS euros, CAST(precio * 1.08 AS DECIMAL(5, 2)) AS "dòlars nord-americans"
FROM producto

CONSULTA 6

USE tienda;
SELECT UPPER(nombre), precio 
FROM producto

CONSULTA 7

USE tienda;
SELECT LOWER(nombre), precio
FROM producto

CONSULTA 8

USE tienda;
SELECT nombre AS fabricante, SUBSTRING(UPPER(nombre), 1, 2) AS codigo
FROM fabricante

CONSULTA 9

USE tienda;
SELECT nombre, CAST(precio AS DECIMAL(5, 0)) AS precio
FROM producto

CONSULTA 10

USE tienda;
SELECT nombre, TRUNCATE(precio, 0) AS precio
FROM producto

CONSULTA 11

USE tienda;
SELECT codigo_fabricante 
FROM producto

CONSULTA 12

USE tienda;
SELECT distinct codigo_fabricante 
FROM producto

CONSULTA 13

USE tienda;
SELECT nombre
FROM fabricante ORDER BY nombre ASC;

CONSULTA 14

USE tienda;
SELECT nombre
FROM fabricante ORDER BY nombre DESC;

CONSULTA 15

-----------

CONSULTA 16

USE tienda;
SELECT * 
FROM fabricante
LIMIT 5

CONSULTA 17

USE tienda;
SELECT *
FROM fabricante
LIMIT 3, 2

CONSULTA 18

USE tienda;
SELECT nombre, precio
FROM producto
ORDER BY precio
LIMIT 1

CONSULTA 19

USE tienda;
SELECT nombre, precio
FROM producto
ORDER BY precio DESC
LIMIT 1

CONSULTA 20

USE tienda;
SELECT nombre
FROM producto
WHERE codigo_fabricante = 2

CONSULTA 21

USE tienda; 
SELECT p.nombre AS "producto", p.precio, f.nombre AS "fabricante"
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo;

CONSULTA 22

USE tienda;
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre;

CONSULTA 23

USE tienda;
SELECT p.codigo AS codigo_producto, p.nombre, p.codigo_fabricante, f.nombre AS fabricante
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo;

CONSULTA 24

USE tienda;
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
ORDER BY precio
LIMIT 1

CONSULTA 25

USE tienda;
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
ORDER BY precio DESC
LIMIT 1

CONSULTA 26

USE tienda; 
SELECT p.codigo, p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = "Lenovo";

CONSULTA 27

USE tienda;
SELECT p.*, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = "Crucial" AND p.precio > 200;

CONSULTA 28

USE tienda;
SELECT p.*, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE   f.nombre = "Asus" OR 
		f.nombre = "Hewlett-Packard" OR
        f.nombre = "Seagate"

CONSULTA 29

USE tienda;
SELECT p.*, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ("Asus", "Hewlett-Packard", "Seagate")

CONSULTA 30

USE tienda; 
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE "%e";

CONSULTA 31

USE tienda;
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE "%w%";

CONSULTA 32

USE tienda;
SELECT p.nombre, p.precio, f.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC

CONSULTA 33

USE tienda; 
SELECT f.codigo, f.nombre
FROM fabricante f
JOIN producto p
ON f.codigo = p.codigo_fabricante
WHERE p.codigo_fabricante IS NOT NULL 

CONSULTA 34

USE tienda;
SELECT f.codigo AS codigo_fab, f.nombre AS fabricante, p.nombre AS producto
FROM producto p
RIGHT JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE p.nombre LIKE '%%' OR p.nombre IS NULL
ORDER BY f.codigo

CONSULTA 35

USE tienda;
SELECT f.nombre
FROM fabricante f
LEFT JOIN producto p
ON f.codigo = p.codigo_fabricante
WHERE p.nombre IS NULL

CONSULTA 36

USE tienda;
SELECT p.*
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = "Lenovo";

CONSULTA 37


CONSULTA 38

USE tienda; 
SELECT p.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE (SELECT MAX(precio) FROM producto) AND (f.nombre = "Lenovo")
LIMIT 1

CONSULTA 39

USE tienda; 
SELECT p.nombre
FROM producto p
JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = "Hewlett-Packard" AND (SELECT MIN(precio))
LIMIT 1

CONSULTA 40


CONSULTA 41


CONSULTA UNIVERSIDAD 1

USE universidad; 
SELECT p.apellido1, p.apellido2, p.nombre
FROM persona p
WHERE p.tipo = "alumno"
ORDER BY p.apellido1, p.apellido2 DESC, p.nombre

CONSULTA UNIVERSIDAD 2

USE universidad; 
SELECT p.nombre, p.apellido1, p.apellido2
FROM persona p
WHERE (p.tipo = "alumno") AND (p.telefono IS NULL)

CONSULTA UNIVERSIDAD 3

USE universidad; 
SELECT p.*
FROM persona p
WHERE (p.tipo = "alumno") AND (p.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31')

CONSULTA UNIVERSIDAD 4

USE universidad;
SELECT p.*
FROM persona p
WHERE p.tipo = "profesor" AND p.telefono IS NULL AND p.nif LIKE "%K"

CONSULTA UNIVERSIDAD 5

USE universidad;
SELECT a.nombre 
FROM asignatura a
WHERE (curso = 3) AND (cuatrimestre = 1) AND (id_grado = 7)

CONSULTA UNIVERSIDAD 6

USE universidad;
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS departamento
FROM persona p
JOIN profesor pf 
ON p.id = pf.id_profesor
JOIN departamento d 
ON pf.id_departamento = d.id
WHERE p.tipo = 'profesor'
ORDER BY p.apellido1, p.apellido2, p.nombre 

CONSULTA UNIVERSIDAD 7

USE universidad; 
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin
FROM persona p
JOIN alumno_se_matricula_asignatura m
ON m.id_alumno = p.id
JOIN  asignatura a
ON a.id = m.id_asignatura
JOIN curso_escolar ce
ON ce.id = m.id_curso_escolar
WHERE p.nif = '26902806M'

CONSULTA UNIVERSIDAD 8

USE universidad; 
SELECT d.nombre AS departamento_prof, a.nombre AS asignatura, p.id_profesor
FROM profesor p
JOIN asignatura a
ON p.id_profesor = a.id_profesor
JOIN departamento d
ON d.id = p.id_departamento
JOIN grado g
ON g.id = a.id_grado
WHERE g.id = 4;

CONSULTA UNIVERSIDAD 9

USE universidad; 
SELECT distinct p.nombre
FROM persona p
JOIN alumno_se_matricula_asignatura a
ON a.id_alumno = p.id
JOIN curso_escolar c
ON c.id = a.id_curso_escolar
WHERE p.tipo = "alumno" AND c.anyo_inicio = 2018 

CONSULTA L/R JOIN 1

USE universidad; 
SELECT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre
FROM persona p
JOIN profesor pf
ON p.id = pf.id_profesor
JOIN departamento d
ON d.id = pf.id_departamento
WHERE p.tipo = 'profesor'
ORDER BY departamento, apellido1, apellido2, nombre

CONSULTA L/R JOIN 2

USE universidad;
SELECT p.nombre, p.apellido1, p.apellido2
FROM persona p
LEFT JOIN profesor pf
ON pf.id_profesor = p.id
LEFT JOIN asignatura a
ON a.id_profesor = pf.id_profesor
WHERE (p.tipo = 'profesor') AND (a.id_profesor IS NULL);

CONSULTA L/R JOIN 3

USE universidad; 
SELECT d.nombre
FROM departamento d
LEFT JOIN profesor pf
ON pf.id_departamento = d.id
WHERE pf.id_departamento IS NULL

CONSULTA L/R JOIN 4

USE universidad; 
SELECT p.nombre, p.apellido1, p.apellido2, a.nombre AS asignatura
FROM persona p
JOIN profesor pf
ON pf.id_profesor = p.id
LEFT JOIN asignatura a
ON a.id_profesor = pf.id_profesor
WHERE a.nombre IS NULL

CONSULTA L/R JOIN 5

USE universidad; 
SELECT a.nombre AS asignatura, 
concat(p.nombre, ' ', p.apellido1, ' ', p.apellido2) AS nombre_profesor
FROM persona p
JOIN profesor pf
ON pf.id_profesor = p.id
RIGHT JOIN asignatura a
ON a.id_profesor = pf.id_profesor
WHERE pf.id_profesor IS NULL

CONSULTA L/R JOIN 6

USE universidad;
SELECT d.nombre AS departamento, a.nombre AS asignatura, m.id_curso_escolar
FROM departamento d
LEFT JOIN profesor p
ON p.id_departamento = d.id
LEFT JOIN asignatura a 
ON a.id_profesor = p.id_profesor
LEFT JOIN alumno_se_matricula_asignatura m
ON m.id_asignatura = a.id
WHERE a.nombre IS NULL OR m.id_curso_escolar IS NULL

CONSULTA RESUMEN 1

USE universidad; 
SELECT COUNT(ALL p.id) AS numero_alumnos
FROM persona p
WHERE p.tipo = 'alumno'

CONSULTA RESUMEN 2

USE universidad; 
SELECT COUNT(p.fecha_nacimiento)
FROM persona p
WHERE (EXTRACT(YEAR FROM p.fecha_nacimiento)) = 1999

CONSULTA RESUMEN 3

USE universidad; 
SELECT d.nombre AS departamento, COUNT(p.id) AS profesores
FROM persona p
JOIN profesor pf
ON p.id = pf.id_profesor
JOIN departamento d
ON d.id = pf.id_departamento
WHERE p.tipo = 'profesor' 
GROUP BY d.nombre
ORDER BY profesores DESC

CONSULTA RESUMEN 4

USE universidad; 
SELECT d.nombre AS departamento, COUNT(pf.id_profesor) AS profesores
FROM departamento d
LEFT JOIN profesor pf
ON pf.id_departamento = d.id
WHERE (pf.id_profesor = @pf.id_profesor OR @pf.id_profesor IS NULL)
GROUP BY d.nombre

CONSULTA RESUMEN 5

USE universidad; 
SELECT g.nombre AS grado, COUNT(a.id) AS asignaturas 
FROM grado g
LEFT JOIN asignatura a
ON a.id_grado = g.id
WHERE (g.id = @g.id OR @g.id IS NULL)
GROUP BY g.nombre
ORDER BY asignaturas DESC

CONSULTA RESUMEN 6

USE universidad; 
SELECT g.nombre AS grado, COUNT(a.id) AS asignaturas 
FROM grado g
JOIN asignatura a
ON a.id_grado = g.id
GROUP BY g.nombre
HAVING asignaturas > 40

CONSULTA RESUMEN 7

USE universidad; 
SELECT ANY_VALUE(g.nombre) AS grado, a.tipo AS tipo_asignaturas, SUM(a.creditos) AS creditos
FROM grado g
JOIN asignatura a
ON a.id_grado = g.id
GROUP BY a.tipo

CONSULTA RESUMEN 8

USE universidad; 
SELECT c.anyo_inicio AS año_inicio, COUNT(m.id_alumno) AS num_alumnos
FROM persona p
JOIN alumno_se_matricula_asignatura m
ON m.id_alumno = p.id
JOIN curso_escolar c
ON c.id = m.id_curso_escolar
GROUP BY c.id

CONSULTA RESUMEN 9

USE universidad; 
SELECT p.id AS id_prof, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS asignaturas
FROM persona p
LEFT JOIN asignatura a
ON a.id_profesor = p.id
WHERE (p.tipo = 'profesor') AND (a.id = @a.id OR @a.id IS NULL)
GROUP BY p.id
ORDER BY asignaturas DESC

CONSULTA RESUMEN 10

USE universidad; 
SELECT p.*
FROM persona p
ORDER BY fecha_nacimiento DESC LIMIT 1

CONSULTA RESUMEN 11

USE universidad; 
SELECT p.nombre AS nombre_prof, p.apellido1, p.apellido2, pf.id_departamento, a.id AS asignatura
FROM persona p
LEFT JOIN profesor pf
ON pf.id_profesor = p.id
LEFT JOIN asignatura a
ON a.id_profesor = pf.id_profesor
WHERE (p.tipo = 'profesor') AND (a.id IS NULL)


