CREATE DATABASE Biblioteca;
use DATABASE BIBLIOTECA;
CREATE TABLE socio(
     Id_soc INT(4)  NOT NULL,
     Nombres VARCHAR(20) NOT NULL,
     Apellidos VARCHAR(20) NOT NULL,
     Telefono INT(4),
     Direccion VARCHAR(50) NOT NULL
);
CREATE TABLE tema(
     Id_tem INT(4) NOT NULL,
     Nombre VARCHAR(40) NOT NULL
);
CREATE TABLE Autor(
     Id_aut INT(4) NOT NULL,
     Nombre VARCHAR(40) NOT NULL
);
CREATE TABLE Libro(
     Id_lib INT(4) NOT NULL,
     Título VARCHAR(40) NOT NULL,
     Id_tem INT(4) NOT NULL,
     Id_aut INT(4) NOT NULL,
	 Id_eje INT(4) NOT NULL
);
CREATE TABLE Ejemplar(
     Id_eje INT(4) NOT NULL,
     Num_orden INT(3) NOT NULL,
     Ubicacion VARCHAR(10) NOT NULL,
     Disponible VARCHAR(1) NOT NULL
);
CREATE TABLE Adquisicion(
     Id_adq INT(4) NOT NULL,
     Id_eje INT(4) NOT NULL,
     Id_soc INT(4) NOT NULL,
     Fecha_prest DATE NOT NULL,
     Fecha_dev DATE NOT NULL,
     Estado VARCHAR(1) NOT NULL
);
ALTER TABLE socio
ADD CONSTRAINT pk_socio
PRIMARY KEY (id_soc) GO;
ALTER TABLE tema
ADD CONSTRAINT pk_tema
PRIMARY KEY (id_tem)  GO;
ALTER TABLE autor
ADD CONSTRAINT pk_autor
PRIMARY KEY (id_aut) GO;
ALTER TABLE libro
ADD CONSTRAINT pk_libro
PRIMARY KEY (id_lib) GO;
ALTER TABLE libro
ADD CONSTRAINT fk_libro_tema
FOREIGN KEY (id_tem)
REFERENCES tema(id_tem) GO;
ALTER TABLE libro
ADD CONSTRAINT fk_libro_autor
FOREIGN KEY (id_aut)
REFERENCES tema(id_aut) GO
ALTER TABLE Libro
ADD CONSTRAINT fk_libro_ejemplar
FOREIGN KEY id_eje
REFERENCES Ejemplar(id_eje) GO;
ALTER TABLE Ejemplar
ADD CONSTRAINT pk_ejemplar
PRIMARY KEY (id_eje) GO;
ALTER TABLE ejemplar
ADD CONSTRAINT r_disponible
CHECK (Disponible IN( 'D' , 'N')) GO;
ALTER TABLE Adquisicion
ADD CONSTRAINT pk_adquisicion
PRIMARY KEY (id_adq, id_eje, id_soc) GO;
ALTER TABLE Adquisicion
ADD CONSTRAINT fk_adquicion_ejemp
FOREIGN KEY id_eje
REFERENCES Ejemplar(id_eje) GO;
ALTER TABLE Adquisicion
ADD CONSTRAINT fk_socio
FOREIGN KEY id_soc
REFERENCES Socio(id_soc) GO;
ALTER TABLE Adquisicion
ADD CONSTRAINT r_disponible
CHECK (ESTADO IN( 'D' , 'N')) GO;
