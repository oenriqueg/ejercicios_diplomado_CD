/*
Oscar Enrique Estrada garcía
oenriqueg@gmail.com
Curso propedéutico para el Diplomado en Ciencia de Datos
Base de Datos
Ejercicio 1
*/

-- 1.- Crear una tabla llamada personal con los campos clave_personal, nombre, paterno, materno, rfc, fechanacimiento, email

CREATE TABLE personal (
	clave_personal varchar(14) PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	paterno varchar(50) NOT NULL,
	materno varchar(50) NOT NULL,
	rfc varchar(13) NOT NULL,
	fechanacimiento date NOT NULL,
	email varchar(60) NULL
	);

-- 2 y 3.- Crear una tabla llamada prestamo con los campos no_prestamo, clave_personal, fecha, monto, tipo
-- Prestamo debe tener un CONSTRAINT de FOREIGN KEY en DELETE para clave_personal

CREATE TABLE prestamo (
	no_prestamo varchar(8) PRIMARY KEY,
	clave_personal varchar(14) not null,
	fecha date NOT NULL,
	monto float NOT NULL,
	tipo varchar(2) NOT NULL,
	CONSTRAINT fk_clave_personal
    	FOREIGN KEY (clave_personal)
    	REFERENCES personal (clave_personal)
    	ON DELETE CASCADE	
	);

-- 4.- Agregar un índice único en el campo RFC de personal usando ALTER

ALTER TABLE personal
ADD CONSTRAINT unique_index UNIQUE (rfc)

-- 5.- Agregar un campo periodo en la tabla prestamo usando ALTER

ALTER TABLE prestamo
ADD periodo varchar(17);

-- 6.- Cambiar el tipo de dato del campo monto a decimal(10,2) usando ALTER

ALTER TABLE prestamo 
MODIFY monto NUMBER(10,2);

-- 7.- Eliminar el campo email de la tabla personal

ALTER TABLE personal
DROP column email;

-- 8.- Insertar 3 registros en la tabla personal y 2 registros por cada persona en prestamo (los datos que estoy agregando son arbitrarios y no tienen una lógica)

INSERT ALL
    INTO personal (clave_personal,nombre,paterno,materno,rfc,fechanacimiento) VALUES ('0781EAGO860712','OSCAR ENRIQUE','ESTRADA','GARCIA','EAGO860712XX1','12/07/1986')
    INTO personal (clave_personal,nombre,paterno,materno,rfc,fechanacimiento) VALUES ('0781EAGO860713','JUAN PABLO','ACOSTA','GARCIA','EAGO860712XX2','12/07/1950')
    INTO personal (clave_personal,nombre,paterno,materno,rfc,fechanacimiento) VALUES ('0781EAGO860714','FRANCISCO JOSE','PAOLI','BOLIO','EAGO860712XX5','12/07/1994')
SELECT * FROM DUAL;
-- Honestamente no entendí exactamente lo que hacía la última sentencia, estuve más de 1 hora tratando de hacerlo diferente y encontré esta forma para hacerlo en un solo insert.


-- 9.- Eliminar 1 registro de personal y validar el CONSTRAINT de DELETE

DELETE FROM personal WHERE clave_personal ='0781EAGO860712';

-- 10.- Eliminar la tabla prestamo

DROP TABLE prestamo;

-- Estuvo muy entretenido el ejercicio, muchas gracias!