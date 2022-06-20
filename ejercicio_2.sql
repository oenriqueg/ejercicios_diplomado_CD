/*
Oscar Enrique Estrada garcía
oenriqueg@gmail.com
Curso propedéutico para el Diplomado en Ciencia de Datos
Base de Datos
Ejercicio 2
*/

-- 1.- Listar el número de alumnos por colonia, mostrar solo las colonias que contengan la palabra "LOMAS"

SELECT COLONIA, COUNT(NOMBRE) 
FROM ALUMNOS
WHERE COLONIA LIKE '%LOMAS%'
GROUP BY COLONIA

-- 2.- Listar los pagos que no pertenezcan a ningún alumno y que sean mayores o iguales a 10,000

-- 3.- Listar los alumnos que hayan pagado 30,000 o más en 10 pagos o menos

-- 4.- Lista el nombre de mujer que más veces se repite

-- 5.- Escribir la frase "SIN CURP" en el campo curp de todos los alumnos sin dato en el campo sexo

-- 6.- Listar los alumnos que no contengan un email válido

-- 7.- Listar el total de pagos por curso (usar tablas pago y cursos)

-- 8.- Listar los alumnos que no tengan ningún pago registrado

-- 9.- Listar los 10 alumnos más altos (campo estatura)

-- 10.- Listar los alumnos que contengan un email NULL
