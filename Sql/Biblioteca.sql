CREATE TABLE socio(
    id_soc NUMERIC(4)  NOT NULL,
    nombres VARCHAR(20) NOT NULL,
    apellidos VARCHAR(20) NOT NULL,
    telefono NUMERIC(4),
    direccion VARCHAR(50) NOT NULL
);
CREATE TABLE tema(
    id_tem NUMERIC(4) NOT NULL,
    nombre VARCHAR(40) NOT NULL
);
CREATE TABLE autor(
    id_aut NUMERIC(4) NOT NULL,
    nombre VARCHAR(40) NOT NULL
);
CREATE TABLE libro(
    id_lib NUMERIC(4) NOT NULL,
    titulo VARCHAR(40) NOT NULL,
    id_tem NUMERIC(4) NOT NULL,
    id_aut NUMERIC(4) NOT NULL,
);
CREATE TABLE ejemplar(
    id_eje NUMERIC(4) NOT NULL,
    id_lib NUMERIC(4) NOT NULL,
    ubicacion VARCHAR(10) NOT NULL,
    disponible VARCHAR(1) NOT NULL
);
CREATE TABLE adquisicion(
    id_adq NUMERIC(4) NOT NULL,
    id_eje NUMERIC(4) NOT NULL,
    id_soc NUMERIC(4) NOT NULL,
    fecha_prest DATETIME NOT NULL,
    fecha_dev DATETIME,
    estado VARCHAR(1) NOT NULL
);
ALTER TABLE socio
ADD CONSTRAINT pk_socio
PRIMARY KEY (id_soc);

ALTER TABLE tema
ADD CONSTRAINT pk_tema
PRIMARY KEY (id_tem);

ALTER TABLE autor
ADD CONSTRAINT pk_autor
PRIMARY KEY (id_aut);

ALTER TABLE libro
ADD CONSTRAINT pk_libro
PRIMARY KEY (id_lib);

ALTER TABLE ejemplar
ADD CONSTRAINT pk_ejemplar
PRIMARY KEY (id_eje);

ALTER TABLE adquisicion
ADD CONSTRAINT pk_adquisicion
PRIMARY KEY (id_adq, id_eje, id_soc);

ALTER TABLE libro
ADD CONSTRAINT fk_libro_tema
FOREIGN KEY (id_tem)
REFERENCES tema(id_tem);

ALTER TABLE libro
ADD CONSTRAINT fk_libro_autor
FOREIGN KEY (id_aut)
REFERENCES autor(id_aut); 

ALTER TABLE ejemplar
ADD CONSTRAINT fk_ejemplar_libro
FOREIGN KEY (id_lib)
REFERENCES libro(id_lib);

ALTER TABLE ejemplar
ADD CONSTRAINT r_disponible_eje
CHECK (disponible IN('V','F'));

ALTER TABLE adquisicion
ADD CONSTRAINT fk_adquicion_ejemp
FOREIGN KEY (id_eje)
REFERENCES ejemplar(id_eje);

ALTER TABLE adquisicion
ADD CONSTRAINT fk_socio
FOREIGN KEY (id_soc)
REFERENCES socio(id_soc);

ALTER TABLE adquisicion
ADD CONSTRAINT r_disponible_adq
CHECK (estado IN('V','F'));