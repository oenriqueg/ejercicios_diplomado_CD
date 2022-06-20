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

-- 2.- Crear una tabla llamada prestamo con los campos no_prestamo, clave_personal, fecha, monto, tipo
CREATE TABLE prestamo (
	no_prestamo varchar(10) PRIMARY KEY,
	clave_personal FOREIGN KEY,
	fecha date NOT NULL,
	monto float NOT NULL,
	tipo varchar(2) NOT NULL,	
	CONSTRAINT clave_personal
		FOREING KEY (clave_personal)
		ON DELETE CASCADE
		REFERENCES personal(clave_personal)
	);
-- 3.- Prestamo debe tener un CONSTRAINT de FOREIGN KEY en DELETE para clave_personal



-- 4.- Agregar un índice único en el campo RFC de personal usando ALTER

CREATE UNIQUE INDEX rfc
ON personal (rfc);

-- 5.- Agregar un campo periodo en la tabla prestamo usando ALTER

ALTER TABLE prestamo
ADD periodo varchar(17);

-- 6.- Cambiar el tipo de dato del campo monto a decimal(10,2) usando ALTER

ALTER TABLE prestamo
MODIFY COLUMN monto float(10,2);

-- 7.- Eliminar el campo email de la tabla personal

ALTER TABLE personal
DROP column email

-- 8.- Insertar 3 registros en la tabla personal y 2 registros por cada persona en prestamo

INSERT INTO personal (
	clave personal,
	nombre,
	paterno,
	materno,
	rfc,
	fechanacimiento,
	email
)
VALUES
    (
        '2019 Summer Promotion',
        0.15,
        '20190601',
        '20190901'
    ),
    (
        '2019 Fall Promotion',
        0.20,
        '20191001',
        '20191101'
    ),
    (
        '2019 Winter Promotion',
        0.25,
        '20191201',
        '20200101'
    );
INSERT INTO personal (clave_personal, nombre, paterno, materno, rfc, fechanacimiento, email)
VALUES ('01781EAGO860712', 'OSCAR ENRIQUE', 'ESTRADA', 'GARCIA', 'EAGO860712XX1','12/07/86','oenriqueg@gmail.com')

INSERT INTO personal (clave_personal, nombre, paterno, materno, rfc, fechanacimiento, email)
VALUES ('01781EAGO860712', 'OSCAR ENRIQUE', 'ESTRADA', 'GARCIA', 'EAGO860712XX1','12/07/86','oenriqueg@gmail.com')

INSERT INTO personal (clave_personal, nombre, paterno, materno, rfc, fechanacimiento, email)
VALUES ('01781EAGO860712', 'OSCAR ENRIQUE', 'ESTRADA', 'GARCIA', 'EAGO860712XX1','12/07/86','oenriqueg@gmail.com')

INSERT INTO prestamo (clave_personal, nombre, paterno, materno, rfc, fechanacimiento, email)
VALUES ('01781EAGO860712', 'OSCAR ENRIQUE', 'ESTRADA', 'GARCIA', 'EAGO860712XX1','12/07/86','oenriqueg@gmail.com')

INSERT INTO prestamo (clave_personal, nombre, paterno, materno, rfc, fechanacimiento, email)
VALUES ('01781EAGO860712', 'OSCAR ENRIQUE', 'ESTRADA', 'GARCIA', 'EAGO860712XX1','12/07/86','oenriqueg@gmail.com')

-- 9.- Eliminar 1 registro de personal y validar el CONSTRAINT de DELETE

DELETE FROM personal WHERE clave_personal ='01781EAGO860712';

-- 10.- Eliminar la tabla prestamo

DROP TABLE prestamo;
