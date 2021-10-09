-- Base de datos BD_San Romilla
-- DROP TABLE San Romilla;
CREATE DATABASE IF NOT EXISTS San_Romilla DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE San_Romilla;

-- Estructura tabla Usuario
CREATE TABLE Usuario(
    correo varchar(50)  NOT NULL PRIMARY KEY,
    tipo char(1) NOT NULL default 'C',
    nombre varchar(50) NOT NULL,
    apellidos varchar(50) NOT NULL,
    telefono char(9) NOT NULL,
    contraseña varchar(254) NOT NULL,
    CONSTRAINT Tipo_Usuario CHECK (tipo='A' OR tipo='C')
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Estructura tabla Patrocinador
CREATE TABLE Patrocinador(
    idPatrocinador tinyint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    telefono char(9) NOT NULL,
    logo blob NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Estructura tabla Recorrido
CREATE TABLE Recorrido(
    idRecorrido  tinyint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    distancia smallint unsigned NOT NULL,
    imagen varchar(50) NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Estructura tabla Categoría
CREATE TABLE Categoria(
    idCategoria tinyint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    categoria varchar(50) NOT NULL,
    hora_inicio_carrera time NULL,
    id_idRecorrido_Recorrido tinyint unsigned NOT NULL,
    CONSTRAINT Categoria_Recorrido FOREIGN KEY (id_idRecorrido_Recorrido) REFERENCES Recorrido(idRecorrido)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Estructura tabla Participante
CREATE TABLE Participante(
    nInscripcion  smallint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dni char(9) NOT NULL UNIQUE,
    fecha_nacimiento date NOT NULL,
    nombre varchar(50) NOT NULL,
    apellidos varchar(50) NOT NULL,
    sexo char(1) NOT NULL,
    telefono char(9) NOT NULL,
    dorsal tinyint unsigned NULL UNIQUE,
    id_idCategoría_Categoria tinyint unsigned NOT NULL,
    CONSTRAINT sexo CHECK (sexo='M' OR sexo='F'),
    CONSTRAINT Categoria_Participante FOREIGN KEY ( id_idCategoría_Categoria) REFERENCES Categoria(idCategoria)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Estructura tabla Evento
CREATE TABLE Evento(
    idEvento  tinyint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    logo blob NULL,
    fecha date NULL,
    lugar varchar(50) NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Estructura tabla Clasificacion
CREATE TABLE Clasificacion(
    id_nInscripcion_Participante  smallint unsigned NOT NULL PRIMARY KEY,
    id_idCategoria_Categoria tinyint unsigned NOT NULL,
    posición smallint unsigned NULL,
    tiempo time NULL,
    CONSTRAINT Clasificacion_Participante FOREIGN KEY (id_nInscripcion_Participante) REFERENCES Participante(nInscripcion),
    CONSTRAINT Categoria_Clasificacion FOREIGN KEY (id_idCategoria_Categoria) REFERENCES Categoria(idCategoria)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Estructura tabla Imagen
CREATE TABLE Imagen(
    idImagen smallint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    archivo varchar(100) NOT NULL,
    idEvento tinyint unsigned NOT NULL,
    CONSTRAINT Evento_Imagen FOREIGN KEY (idEvento) REFERENCES Evento(idEvento)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

