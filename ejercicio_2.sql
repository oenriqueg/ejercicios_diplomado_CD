/*
Oscar Enrique Estrada garcía
oenriqueg@gmail.com
Curso propedéutico para el Diplomado en Ciencia de Datos
Base de Datos
Ejercicio 2
*/

-- 1.- Listar el número de alumnos por colonia, mostrar solo las colonias que contengan la palabra "LOMAS"

SELECT COLONIA, COUNT(NOMBRE) ALUMNOS 
FROM ALUMNOS
WHERE COLONIA LIKE '%LOMAS%'
GROUP BY COLONIA

-- 2.- Listar los pagos que no pertenezcan a ningún alumno y que sean mayores o iguales a 10,000

SELECT * FROM PAGOS P LEFT JOIN ALUMNOS A ON (P.CLAVE_ALU = A.CLAVE_ALU)
WHERE A.CLAVE_ALU IS NULL
AND PAGO >= 10000
ORDER BY P.CLAVE_ALU DESC

-- 3.- Listar los alumnos que hayan pagado 30,000 o más en 10 pagos o menos

SELECT NOMBRE, AP_PATERNO, AP_MATERNO, COUNT(PAGO) PAGOS, SUM(PAGO) TOTAL FROM ALUMNOS A LEFT JOIN PAGOS P ON (A.CLAVE_ALU = P.CLAVE_ALU)
WHERE P.CLAVE_ALU IS NOT NULL
HAVING COUNT(PAGO) <= 10 AND SUM(PAGO) >= 30000
GROUP BY NOMBRE, AP_PATERNO, AP_MATERNO
ORDER BY AP_PATERNO ASC

-- 4.- Lista el nombre de mujer que más veces se repite

SELECT * FROM (
    SELECT DISTINCT NOMBRE, SEXO, 
        COUNT(NOMBRE) OVER (PARTITION BY NOMBRE) FRECUENCIA
        -- Investigando encontré como usar el PARTITION BY en lugar del group by
    FROM ALUMNOS
    WHERE SEXO = 'F'
    ORDER BY FRECUENCIA DESC
)
WHERE ROWNUM = 1

-- 5.- Escribir la frase "SIN CURP" en el campo curp de todos los alumnos sin dato en el campo sexo

-- Primero modificamos el datatype del campo a STRING usando ALTER
ALTER TABLE ALUMNOS
MODIFY CURP VARCHAR(18);

-- Procedo a inyectar "SIN CURP" en los registros correspondientes

UPDATE ALUMNOS
SET CURP = 'SIN CURP'
WHERE SEXO IS NULL;

-- 6.- Listar los alumnos que no contengan un email válido

SELECT * FROM ALUMNOS
WHERE EMAIL NOT LIKE '%@%.%';

-- 7.- Listar el total de pagos por curso (usar tablas pago y cursos)

SELECT NOMBRE, COUNT(PAGO) PAGOS, SUM(PAGO) FROM PAGOS P LEFT JOIN CURSOS C ON (P.ID_CURSO = C.ID_CURSO)
WHERE C.ID_CURSO IS NOT NULL
GROUP BY NOMBRE

-- Me llamó la atención que hay muchísimos pagos que fueron hechos desde 2008, pero que tienen asociado el ID_CURSO de 2020-2021, sólo como una observación.

-- 8.- Listar los alumnos que no tengan ningún pago registrado

SELECT NOMBRE, AP_PATERNO, AP_MATERNO, COUNT(PAGO) PAGOS, SUM(PAGO) TOTAL FROM ALUMNOS A LEFT JOIN PAGOS P ON (A.CLAVE_ALU = P.CLAVE_ALU)
WHERE P.CLAVE_ALU IS NULL
HAVING COUNT(PAGO) < 1
GROUP BY NOMBRE, AP_PATERNO, AP_MATERNO
ORDER BY AP_PATERNO ASC

-- 9.- Listar los 10 alumnos más altos (campo estatura)

SELECT * FROM (
    SELECT DISTINCT NOMBRE, AP_PATERNO, AP_MATERNO, ESTATURA
    FROM ALUMNOS
    ORDER BY ESTATURA DESC)
WHERE ROWNUM <= 10

-- 10.- Listar los alumnos que contengan un email NULL

SELECT * FROM ALUMNOS
WHERE EMAIL IS NULL