-- Creación de la base de datos
CREATE DATABASE gestion_academica;
USE gestion_academica;

-- Tabla Departamento
CREATE TABLE Departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edificio VARCHAR(50),
    presupuesto DECIMAL(12,2)
);

-- Tabla Estudiante
CREATE TABLE Estudiante (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    id_departamento INT,
    fecha_ingreso DATE,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

-- Tabla Profesor
CREATE TABLE Profesor (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    id_departamento INT,
    fecha_contratacion DATE,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

-- Tabla Curso
CREATE TABLE Curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    creditos INT NOT NULL,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

-- Tabla Clase
CREATE TABLE Clase (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    id_profesor INT NOT NULL,
    semestre VARCHAR(20) NOT NULL,
    año INT NOT NULL,
    aula VARCHAR(20),
    horario VARCHAR(50),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso),
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id_profesor)
);

-- Tabla Inscripcion
CREATE TABLE Inscripcion (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_clase INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_clase) REFERENCES Clase(id_clase),
    UNIQUE KEY (id_estudiante, id_clase)
);

-- Tabla Calificacion
CREATE TABLE Calificacion (
    id_calificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_inscripcion INT NOT NULL,
    nota DECIMAL(3,2) NOT NULL,
    tipo_evaluacion VARCHAR(50),
    fecha_evaluacion DATE,
    FOREIGN KEY (id_inscripcion) REFERENCES Inscripcion(id_inscripcion)
);

-- Insertar 10 departamentos
INSERT INTO Departamento (nombre, edificio, presupuesto) VALUES 
('Matemáticas', 'Edificio A', 500000.00),
('Ciencias de la Computación', 'Edificio B', 750000.00),
('Física', 'Edificio C', 450000.00),
('Química', 'Edificio D', 600000.00),
('Biología', 'Edificio E', 550000.00),
('Literatura', 'Edificio F', 400000.00),
('Historia', 'Edificio G', 350000.00),
('Economía', 'Edificio H', 650000.00),
('Psicología', 'Edificio I', 480000.00),
('Ingeniería', 'Edificio J', 800000.00);

-- Insertar 100 estudiantes (ejemplo de 10)
INSERT INTO Estudiante (nombre, apellido, email, id_departamento, fecha_ingreso) VALUES
('Alejandro', 'Ramírez', 'alejandro.ramirez@estudiante.edu', 1, '2020-08-25'),
('Beatriz', 'Torres', 'beatriz.torres@estudiante.edu', 2, '2021-01-15'),
('César', 'Vargas', 'cesar.vargas@estudiante.edu', 1, '2019-09-10'),
('Diana', 'Cruz', 'diana.cruz@estudiante.edu', 3, '2020-03-22'),
('Ernesto', 'Mendoza', 'ernesto.mendoza@estudiante.edu', 2, '2021-08-05'),
('Fabiola', 'Ríos', 'fabiola.rios@estudiante.edu', 4, '2019-11-18'),
('Gabriel', 'Ortega', 'gabriel.ortega@estudiante.edu', 5, '2020-05-30'),
('Hilda', 'Jiménez', 'hilda.jimenez@estudiante.edu', 3, '2021-02-12'),
('Iván', 'Navarro', 'ivan.navarro@estudiante.edu', 6, '2019-07-08'),
('Jessica', 'Castillo', 'jessica.castillo@estudiante.edu', 7, '2020-10-15'),
('Kevin', 'Lara', 'kevin.lara@estudiante.edu', 8, '2021-04-20'),
('Laura', 'Méndez', 'laura.mendez@estudiante.edu', 9, '2019-12-05'),
('Manuel', 'Ortiz', 'manuel.ortiz@estudiante.edu', 10, '2020-07-12'),
('Natalia', 'Pacheco', 'natalia.pacheco@estudiante.edu', 1, '2021-03-18'),
('Óscar', 'Quiñones', 'oscar.quinones@estudiante.edu', 2, '2019-10-22'),
('Patricia', 'Ruiz', 'patricia.ruiz@estudiante.edu', 3, '2020-06-30'),
('Quetzal', 'Sosa', 'quetzal.sosa@estudiante.edu', 4, '2021-01-08'),
('Roberto', 'Téllez', 'roberto.tellez@estudiante.edu', 5, '2019-08-14'),
('Sara', 'Ugalde', 'sara.ugalde@estudiante.edu', 6, '2020-04-25'),
('Tomás', 'Valle', 'tomas.valle@estudiante.edu', 7, '2021-11-05'),
('Úrsula', 'Wong', 'ursula.wong@estudiante.edu', 8, '2019-06-12'),
('Víctor', 'Xochitl', 'victor.xochitl@estudiante.edu', 9, '2020-02-18'),
('Wendy', 'Yáñez', 'wendy.yanez@estudiante.edu', 10, '2021-09-22'),
('Ximena', 'Zepeda', 'ximena.zepeda@estudiante.edu', 1, '2019-05-30'),
('Yahir', 'Acuña', 'yahir.acuna@estudiante.edu', 2, '2020-12-08'),
('Zoe', 'Bermúdez', 'zoe.bermudez@estudiante.edu', 3, '2021-07-15'),
('Aldo', 'Cervantes', 'aldo.cervantes@estudiante.edu', 4, '2019-04-20'),
('Brenda', 'Dávila', 'brenda.davila@estudiante.edu', 5, '2020-10-28'),
('Cristian', 'Escobar', 'cristian.escobar@estudiante.edu', 6, '2021-05-12'),
('Daniela', 'Fuentes', 'daniela.fuentes@estudiante.edu', 7, '2019-02-25'),
('Erick', 'Guzmán', 'erick.guzman@estudiante.edu', 8, '2020-09-05'),
('Fabiana', 'Herrera', 'fabiana.herrera@estudiante.edu', 9, '2021-04-18'),
('Gerardo', 'Ibarra', 'gerardo.ibarra@estudiante.edu', 10, '2019-11-30'),
('Hortensia', 'Jasso', 'hortensia.jasso@estudiante.edu', 1, '2020-06-15'),
('Ismael', 'Kuri', 'ismael.kuri@estudiante.edu', 2, '2021-01-22'),
('Julieta', 'Lozano', 'julieta.lozano@estudiante.edu', 3, '2019-08-08'),
('Karina', 'Mireles', 'karina.mireles@estudiante.edu', 4, '2020-03-12'),
('Leonardo', 'Núñez', 'leonardo.nunez@estudiante.edu', 5, '2021-10-25'),
('Mariana', 'Orozco', 'mariana.orozco@estudiante.edu', 6, '2019-07-18'),
('Néstor', 'Pineda', 'nestor.pineda@estudiante.edu', 7, '2020-02-28'),
('Olivia', 'Quezada', 'olivia.quezada@estudiante.edu', 8, '2021-09-08'),
('Pablo', 'Reyes', 'pablo.reyes@estudiante.edu', 9, '2019-04-15'),
('Querida', 'Sánchez', 'querida.sanchez@estudiante.edu', 10, '2020-11-22'),
('Rafael', 'Trejo', 'rafael.trejo@estudiante.edu', 1, '2021-06-05'),
('Silvia', 'Urbina', 'silvia.urbina@estudiante.edu', 2, '2019-03-12'),
('Tadeo', 'Vázquez', 'tadeo.vazquez@estudiante.edu', 3, '2020-10-18'),
('Úrsula', 'Wences', 'ursula.wences@estudiante.edu', 4, '2021-05-30'),
('Vicente', 'Xicoténcatl', 'vicente.xicotencatl@estudiante.edu', 5, '2019-12-12'),
('Wanda', 'Yáñez', 'wanda.yanez@estudiante.edu', 6, '2020-07-25'),
('Xavier', 'Zambrano', 'xavier.zambrano@estudiante.edu', 7, '2021-02-08'),
('Yolanda', 'Aguilar', 'yolanda.aguilar@estudiante.edu', 8, '2019-09-15'),
('Zacarías', 'Benítez', 'zacarias.benitez@estudiante.edu', 9, '2020-04-22'),
('Adrián', 'Castañeda', 'adrian.castaneda@estudiante.edu', 10, '2021-11-05'),
('Bárbara', 'Durán', 'barbara.duran@estudiante.edu', 1, '2019-06-18'),
('César', 'Enríquez', 'cesar.enriquez@estudiante.edu', 2, '2020-01-25'),
('Dulce', 'Fierro', 'dulce.fierro@estudiante.edu', 3, '2021-08-08'),
('Emilio', 'González', 'emilio.gonzalez@estudiante.edu', 4, '2019-05-12'),
('Florencia', 'Hidalgo', 'florencia.hidalgo@estudiante.edu', 5, '2020-12-18'),
('Gustavo', 'Infante', 'gustavo.infante@estudiante.edu', 6, '2021-07-22'),
('Helena', 'Juárez', 'helena.juarez@estudiante.edu', 7, '2019-04-05'),
('Ignacio', 'Kumamoto', 'ignacio.kumamoto@estudiante.edu', 8, '2020-09-15'),
('Jazmín', 'López', 'jazmin.lopez@estudiante.edu', 9, '2021-04-28'),
('Karla', 'Mendoza', 'karla.mendoza@estudiante.edu', 10, '2019-01-08'),
('Lorenzo', 'Nieto', 'lorenzo.nieto@estudiante.edu', 1, '2020-06-12'),
('Mónica', 'Ocampo', 'monica.ocampo@estudiante.edu', 2, '2021-01-25'),
('Noé', 'Peralta', 'noe.peralta@estudiante.edu', 3, '2019-08-30'),
('Ofelia', 'Quiroz', 'ofelia.quiroz@estudiante.edu', 4, '2020-03-15'),
('Pascual', 'Rangel', 'pascual.rangel@estudiante.edu', 5, '2021-10-22'),
('Quechul', 'Salamanca', 'quechul.salamanca@estudiante.edu', 6, '2019-07-05'),
('Rosendo', 'Tapia', 'rosendo.tapia@estudiante.edu', 7, '2020-02-12'),
('Susana', 'Uribe', 'susana.uribe@estudiante.edu', 8, '2021-09-18'),
('Teófilo', 'Valencia', 'teofilo.valencia@estudiante.edu', 9, '2019-04-22'),
('Ubaldo', 'Wong', 'ubaldo.wong@estudiante.edu', 10, '2020-11-05'),
('Verónica', 'Xolalpa', 'veronica.xolalpa@estudiante.edu', 1, '2021-06-15'),
('Wilfrido', 'Yáñez', 'wilfrido.yanez@estudiante.edu', 2, '2019-03-22'),
('Xóchitl', 'Zaragoza', 'xochitl.zaragoza@estudiante.edu', 3, '2020-10-08'),
('Yadira', 'Álvarez', 'yadira.alvarez@estudiante.edu', 4, '2021-05-12'),
('Zacarías', 'Beltrán', 'zacarias.beltran@estudiante.edu', 5, '2019-12-25'),
('Amalia', 'Cervantes', 'amalia.cervantes@estudiante.edu', 6, '2020-07-30'),
('Bonifacio', 'Delgado', 'bonifacio.delgado@estudiante.edu', 7, '2021-02-15'),
('Celestina', 'Escamilla', 'celestina.escamilla@estudiante.edu', 8, '2019-09-22'),
('Demetrio', 'Fonseca', 'demetrio.fonseca@estudiante.edu', 9, '2020-04-05'),
('Esmeralda', 'Guerra', 'esmeralda.guerra@estudiante.edu', 10, '2021-11-18'),
('Froilán', 'Huerta', 'froilan.huerta@estudiante.edu', 1, '2019-06-30'),
('Grisel', 'Ibarra', 'grisel.ibarra@estudiante.edu', 2, '2020-01-08'),
('Heriberto', 'Jaimes', 'heriberto.jaimes@estudiante.edu', 3, '2021-08-12'),
('Irma', 'Kuri', 'irma.kuri@estudiante.edu', 4, '2019-05-25'),
('Jacobo', 'Lira', 'jacobo.lira@estudiante.edu', 5, '2020-12-30');

-- Insertar 100 profesores (ejemplo de 10, repetir patrones similares)
INSERT INTO Profesor (nombre, apellido, email, id_departamento, fecha_contratacion) VALUES
('Juan', 'Pérez', 'juan.perez@universidad.edu', 1, '2010-05-15'),
('María', 'Gómez', 'maria.gomez@universidad.edu', 2, '2012-08-20'),
('Carlos', 'López', 'carlos.lopez@universidad.edu', 1, '2015-03-10'),
('Ana', 'Martínez', 'ana.martinez@universidad.edu', 3, '2008-11-05'),
('Luis', 'Rodríguez', 'luis.rodriguez@universidad.edu', 2, '2018-09-01'),
('Sofía', 'Hernández', 'sofia.hernandez@universidad.edu', 4, '2016-07-22'),
('Pedro', 'Díaz', 'pedro.diaz@universidad.edu', 5, '2014-02-18'),
('Laura', 'García', 'laura.garcia@universidad.edu', 3, '2017-10-30'),
('Jorge', 'Fernández', 'jorge.fernandez@universidad.edu', 6, '2019-04-12'),
('Marta', 'Sánchez', 'marta.sanchez@universidad.edu', 7, '2011-12-08'),
('Ricardo', 'Morales', 'ricardo.morales@universidad.edu', 8, '2013-06-25'),
('Patricia', 'Ortega', 'patricia.ortega@universidad.edu', 9, '2015-09-14'),
('Fernando', 'Ramírez', 'fernando.ramirez@universidad.edu', 10, '2016-11-30'),
('Gabriela', 'Vargas', 'gabriela.vargas@universidad.edu', 1, '2020-01-15'),
('Héctor', 'Silva', 'hector.silva@universidad.edu', 2, '2019-07-22'),
('Isabel', 'Castro', 'isabel.castro@universidad.edu', 3, '2018-03-10'),
('Roberto', 'Mendoza', 'roberto.mendoza@universidad.edu', 4, '2017-05-18'),
('Lucía', 'Guerrero', 'lucia.guerrero@universidad.edu', 5, '2016-09-05'),
('Oscar', 'Paredes', 'oscar.paredes@universidad.edu', 6, '2015-12-12'),
('Adriana', 'Rojas', 'adriana.rojas@universidad.edu', 7, '2014-08-20'),
('Manuel', 'Fuentes', 'manuel.fuentes@universidad.edu', 8, '2013-04-15'),
('Carmen', 'Santos', 'carmen.santos@universidad.edu', 9, '2012-10-28'),
('Raúl', 'Navarro', 'raul.navarro@universidad.edu', 10, '2011-07-17'),
('Diana', 'Cortés', 'diana.cortes@universidad.edu', 1, '2021-02-14'),
('Javier', 'Miranda', 'javier.miranda@universidad.edu', 2, '2020-06-09'),
('Teresa', 'Ríos', 'teresa.rios@universidad.edu', 3, '2019-11-25'),
('Arturo', 'Campos', 'arturo.campos@universidad.edu', 4, '2018-05-30'),
('Verónica', 'Luna', 'veronica.luna@universidad.edu', 5, '2017-01-12'),
('Felipe', 'Espinoza', 'felipe.espinoza@universidad.edu', 6, '2016-08-07'),
('Elena', 'Valdez', 'elena.valdez@universidad.edu', 7, '2015-03-19'),
('Guillermo', 'Cárdenas', 'guillermo.cardenas@universidad.edu', 8, '2014-10-22'),
('Silvia', 'Orozco', 'silvia.orozco@universidad.edu', 9, '2013-12-05'),
('Alberto', 'Mejía', 'alberto.mejia@universidad.edu', 10, '2012-09-14'),
('Beatriz', 'Delgado', 'beatriz.delgado@universidad.edu', 1, '2011-04-28'),
('Rodrigo', 'Cervantes', 'rodrigo.cervantes@universidad.edu', 2, '2022-01-10'),
('Claudia', 'Salazar', 'claudia.salazar@universidad.edu', 3, '2021-07-15'),
('Francisco', 'Vega', 'francisco.vega@universidad.edu', 4, '2020-03-22'),
('Alicia', 'Ponce', 'alicia.ponce@universidad.edu', 5, '2019-10-08'),
('José', 'Serrano', 'jose.serrano@universidad.edu', 6, '2018-06-12'),
('Rosa', 'Maldonado', 'rosa.maldonado@universidad.edu', 7, '2017-02-25'),
('Miguel', 'Rosales', 'miguel.rosales@universidad.edu', 8, '2016-11-30'),
('Lourdes', 'Aguirre', 'lourdes.aguirre@universidad.edu', 9, '2015-09-14'),
('Enrique', 'Castillo', 'enrique.castillo@universidad.edu', 10, '2014-05-18'),
('Marina', 'Peña', 'marina.pena@universidad.edu', 1, '2013-01-20'),
('Gerardo', 'Reyes', 'gerardo.reyes@universidad.edu', 2, '2022-08-05'),
('Daniela', 'Núñez', 'daniela.nunez@universidad.edu', 3, '2021-04-12'),
('Alejandro', 'Medina', 'alejandro.medina@universidad.edu', 4, '2020-12-15'),
('Paulina', 'Soto', 'paulina.soto@universidad.edu', 5, '2019-08-22'),
('Hugo', 'Contreras', 'hugo.contreras@universidad.edu', 6, '2018-05-30'),
('Raquel', 'Zamora', 'raquel.zamora@universidad.edu', 7, '2017-02-14'),
('Eduardo', 'Valencia', 'eduardo.valencia@universidad.edu', 8, '2016-10-08'),
('Norma', 'Franco', 'norma.franco@universidad.edu', 9, '2015-07-12'),
('Sergio', 'Barrera', 'sergio.barrera@universidad.edu', 10, '2014-04-25'),
('Leticia', 'Galván', 'leticia.galvan@universidad.edu', 1, '2013-11-18'),
('Joaquín', 'Velázquez', 'joaquin.velazquez@universidad.edu', 2, '2022-06-30'),
('Rocío', 'Márquez', 'rocio.marquez@universidad.edu', 3, '2021-03-15'),
('Federico', 'Juárez', 'federico.juarez@universidad.edu', 4, '2020-10-22'),
('Yolanda', 'Ibáñez', 'yolanda.ibanez@universidad.edu', 5, '2019-07-05'),
('René', 'Ochoa', 'rene.ochoa@universidad.edu', 6, '2018-04-12'),
('Estela', 'León', 'estela.leon@universidad.edu', 7, '2017-01-25'),
('Salvador', 'Mora', 'salvador.mora@universidad.edu', 8, '2016-09-08'),
('Victoria', 'Rangel', 'victoria.rangel@universidad.edu', 9, '2015-06-14'),
('Feliciano', 'Bustos', 'feliciano.bustos@universidad.edu', 10, '2014-03-28'),
('Aurora', 'Acosta', 'aurora.acosta@universidad.edu', 1, '2013-10-10'),
('Marcelo', 'Padilla', 'marcelo.padilla@universidad.edu', 2, '2022-05-15'),
('Nadia', 'Castañeda', 'nadia.castaneda@universidad.edu', 3, '2021-02-20'),
('Rolando', 'Salinas', 'rolando.salinas@universidad.edu', 4, '2020-09-12'),
('Ximena', 'Villarreal', 'ximena.villarreal@universidad.edu', 5, '2019-06-25'),
('Fermín', 'Cordero', 'fermin.cordero@universidad.edu', 6, '2018-04-08'),
('Esperanza', 'Tapia', 'esperanza.tapia@universidad.edu', 7, '2017-01-15'),
('Abelardo', 'Ayala', 'abelardo.ayala@universidad.edu', 8, '2016-10-22'),
('Rosario', 'Bernal', 'rosario.bernal@universidad.edu', 9, '2015-07-30'),
('Teodoro', 'Carmona', 'teodoro.carmona@universidad.edu', 10, '2014-05-12'),
('Luz', 'Delacruz', 'luz.delacruz@universidad.edu', 1, '2013-12-18'),
('Nicolás', 'Fierro', 'nicolas.fierro@universidad.edu', 2, '2022-07-22'),
('Perla', 'Gallegos', 'perla.gallegos@universidad.edu', 3, '2021-04-30'),
('Ulises', 'Huerta', 'ulises.huerta@universidad.edu', 4, '2020-12-05'),
('Wendy', 'Lozano', 'wendy.lozano@universidad.edu', 5, '2019-09-15'),
('Vicente', 'Montoya', 'vicente.montoya@universidad.edu', 6, '2018-06-28'),
('Zulema', 'Olvera', 'zulema.olvera@universidad.edu', 7, '2017-04-10'),
('Agustín', 'Quintero', 'agustin.quintero@universidad.edu', 8, '2016-01-22'),
('Berenice', 'Romo', 'berenice.romo@universidad.edu', 9, '2015-10-05'),
('Ciro', 'Trujillo', 'ciro.trujillo@universidad.edu', 10, '2014-07-18'),
('Dorotea', 'Uribe', 'dorotea.uribe@universidad.edu', 1, '2013-02-28'),
('Efraín', 'Zúñiga', 'efrain.zuniga@universidad.edu', 2, '2022-09-12'),
('Griselda', 'Arredondo', 'griselda.arredondo@universidad.edu', 3, '2021-06-25'),
('Homero', 'Báez', 'homero.baez@universidad.edu', 4, '2020-03-08'),
('Irene', 'Cadena', 'irene.cadena@universidad.edu', 5, '2019-12-15'),
('Jacinto', 'Duarte', 'jacinto.duarte@universidad.edu', 6, '2018-08-22'),
('Katia', 'Escamilla', 'katia.escamilla@universidad.edu', 7, '2017-05-30'),
('Leopoldo', 'Fabela', 'leopoldo.fabela@universidad.edu', 8, '2016-02-12'),
('Minerva', 'Griego', 'minerva.griego@universidad.edu', 9, '2015-11-25'),
('Néstor', 'Hinojosa', 'nestor.hinojosa@universidad.edu', 10, '2014-08-08');

-- Insertar 40 cursos (relacionados con departamentos)
INSERT INTO Curso (codigo, nombre, creditos, id_departamento) VALUES
('MAT101', 'Cálculo I', 4, 1),
('MAT102', 'Cálculo II', 4, 1),
('MAT201', 'Álgebra Lineal', 3, 1),
('MAT202', 'Ecuaciones Diferenciales', 4, 1),
('CS101', 'Introducción a la Programación', 3, 2),
('CS102', 'Estructuras de Datos', 4, 2),
('CS201', 'Algoritmos', 4, 2),
('CS202', 'Bases de Datos', 3, 2),
('FIS101', 'Física General', 4, 3),
('FIS102', 'Física Moderna', 4, 3),
('FIS201', 'Termodinámica', 4, 3),
('FIS202', 'Electromagnetismo', 4, 3),
('QUI101', 'Química Orgánica', 3, 4),
('QUI102', 'Química Inorgánica', 3, 4),
('QUI201', 'Bioquímica', 4, 4),
('QUI202', 'Química Analítica', 3, 4),
('BIO101', 'Biología Celular', 3, 5),
('BIO102', 'Genética', 4, 5),
('BIO201', 'Ecología', 3, 5),
('BIO202', 'Microbiología', 4, 5),
('LIT101', 'Literatura Universal', 2, 6),
('LIT102', 'Literatura Española', 3, 6),
('LIT201', 'Literatura Contemporánea', 3, 6),
('LIT202', 'Taller de Creación Literaria', 2, 6),
('HIS101', 'Historia Mundial', 3, 7),
('HIS102', 'Historia de América', 3, 7),
('HIS201', 'Historia del Arte', 2, 7),
('HIS202', 'Historia Económica', 3, 7),
('ECO101', 'Microeconomía', 3, 8),
('ECO102', 'Macroeconomía', 3, 8),
('ECO201', 'Econometría', 4, 8),
('ECO202', 'Economía Internacional', 3, 8),
('PSI101', 'Psicología General', 3, 9),
('PSI102', 'Psicología del Desarrollo', 3, 9),
('PSI201', 'Psicología Social', 3, 9),
('PSI202', 'Psicopatología', 4, 9),
('ING101', 'Introducción a la Ingeniería', 2, 10),
('ING102', 'Mecánica de Materiales', 4, 10),
('ING201', 'Circuitos Eléctricos', 4, 10),
('ING202', 'Termodinámica Aplicada', 4, 10);

-- Insertar 100 clases (relacionando cursos y profesores)
INSERT INTO Clase (id_curso, id_profesor, semestre, año, aula, horario) VALUES
(1, 1, 'Primavera', 2023, 'A101', 'Lunes y Miércoles 8:00-9:30'),
(1, 2, 'Otoño', 2023, 'A102', 'Martes y Jueves 8:00-9:30'),
(2, 1, 'Primavera', 2023, 'A103', 'Lunes y Miércoles 10:00-11:30'),
(2, 3, 'Otoño', 2023, 'A104', 'Martes y Jueves 10:00-11:30'),
(3, 4, 'Primavera', 2023, 'A201', 'Lunes y Miércoles 14:00-15:30'),
(3, 5, 'Otoño', 2023, 'A202', 'Martes y Jueves 14:00-15:30'),
(4, 6, 'Primavera', 2023, 'A203', 'Viernes 9:00-12:00'),
(4, 7, 'Otoño', 2023, 'A204', 'Lunes y Miércoles 16:00-17:30'),
(5, 8, 'Primavera', 2023, 'B101', 'Martes y Jueves 16:00-17:30'),
(5, 9, 'Otoño', 2023, 'B102', 'Viernes 13:00-16:00'),
(6, 10, 'Primavera', 2023, 'B103', 'Lunes y Miércoles 8:00-9:30'),
(6, 11, 'Otoño', 2023, 'B104', 'Martes y Jueves 8:00-9:30'),
(7, 12, 'Primavera', 2023, 'B201', 'Lunes y Miércoles 10:00-11:30'),
(7, 13, 'Otoño', 2023, 'B202', 'Martes y Jueves 10:00-11:30'),
(8, 14, 'Primavera', 2023, 'B203', 'Lunes y Miércoles 14:00-15:30'),
(8, 15, 'Otoño', 2023, 'B204', 'Martes y Jueves 14:00-15:30'),
(9, 16, 'Primavera', 2023, 'C101', 'Viernes 9:00-12:00'),
(9, 17, 'Otoño', 2023, 'C102', 'Lunes y Miércoles 16:00-17:30'),
(10, 18, 'Primavera', 2023, 'C103', 'Martes y Jueves 16:00-17:30'),
(10, 19, 'Otoño', 2023, 'C104', 'Viernes 13:00-16:00'),
(11, 20, 'Primavera', 2023, 'C201', 'Lunes y Miércoles 8:00-9:30'),
(11, 21, 'Otoño', 2023, 'C202', 'Martes y Jueves 8:00-9:30'),
(12, 22, 'Primavera', 2023, 'C203', 'Lunes y Miércoles 10:00-11:30'),
(12, 23, 'Otoño', 2023, 'C204', 'Martes y Jueves 10:00-11:30'),
(13, 24, 'Primavera', 2023, 'D101', 'Lunes y Miércoles 14:00-15:30'),
(13, 25, 'Otoño', 2023, 'D102', 'Martes y Jueves 14:00-15:30'),
(14, 26, 'Primavera', 2023, 'D103', 'Viernes 9:00-12:00'),
(14, 27, 'Otoño', 2023, 'D104', 'Lunes y Miércoles 16:00-17:30'),
(15, 28, 'Primavera', 2023, 'D201', 'Martes y Jueves 16:00-17:30'),
(15, 29, 'Otoño', 2023, 'D202', 'Viernes 13:00-16:00'),
(16, 30, 'Primavera', 2023, 'D203', 'Lunes y Miércoles 8:00-9:30'),
(16, 31, 'Otoño', 2023, 'D204', 'Martes y Jueves 8:00-9:30'),
(17, 32, 'Primavera', 2023, 'E101', 'Lunes y Miércoles 10:00-11:30'),
(17, 33, 'Otoño', 2023, 'E102', 'Martes y Jueves 10:00-11:30'),
(18, 34, 'Primavera', 2023, 'E103', 'Lunes y Miércoles 14:00-15:30'),
(18, 35, 'Otoño', 2023, 'E104', 'Martes y Jueves 14:00-15:30'),
(19, 36, 'Primavera', 2023, 'E201', 'Viernes 9:00-12:00'),
(19, 37, 'Otoño', 2023, 'E202', 'Lunes y Miércoles 16:00-17:30'),
(20, 38, 'Primavera', 2023, 'E203', 'Martes y Jueves 16:00-17:30'),
(20, 39, 'Otoño', 2023, 'E204', 'Viernes 13:00-16:00'),
(21, 40, 'Primavera', 2023, 'F101', 'Lunes y Miércoles 8:00-9:30'),
(21, 41, 'Otoño', 2023, 'F102', 'Martes y Jueves 8:00-9:30'),
(22, 42, 'Primavera', 2023, 'F103', 'Lunes y Miércoles 10:00-11:30'),
(22, 43, 'Otoño', 2023, 'F104', 'Martes y Jueves 10:00-11:30'),
(23, 44, 'Primavera', 2023, 'F201', 'Lunes y Miércoles 14:00-15:30'),
(23, 45, 'Otoño', 2023, 'F202', 'Martes y Jueves 14:00-15:30'),
(24, 46, 'Primavera', 2023, 'F203', 'Viernes 9:00-12:00'),
(24, 47, 'Otoño', 2023, 'F204', 'Lunes y Miércoles 16:00-17:30'),
(25, 48, 'Primavera', 2023, 'G101', 'Martes y Jueves 16:00-17:30'),
(25, 49, 'Otoño', 2023, 'G102', 'Viernes 13:00-16:00'),
(26, 50, 'Primavera', 2023, 'G103', 'Lunes y Miércoles 8:00-9:30'),
(26, 51, 'Otoño', 2023, 'G104', 'Martes y Jueves 8:00-9:30'),
(27, 52, 'Primavera', 2023, 'G201', 'Lunes y Miércoles 10:00-11:30'),
(27, 53, 'Otoño', 2023, 'G202', 'Martes y Jueves 10:00-11:30'),
(28, 54, 'Primavera', 2023, 'G203', 'Lunes y Miércoles 14:00-15:30'),
(28, 55, 'Otoño', 2023, 'G204', 'Martes y Jueves 14:00-15:30'),
(29, 56, 'Primavera', 2023, 'H101', 'Viernes 9:00-12:00'),
(29, 57, 'Otoño', 2023, 'H102', 'Lunes y Miércoles 16:00-17:30'),
(30, 58, 'Primavera', 2023, 'H103', 'Martes y Jueves 16:00-17:30'),
(30, 59, 'Otoño', 2023, 'H104', 'Viernes 13:00-16:00'),
(31, 60, 'Primavera', 2023, 'H201', 'Lunes y Miércoles 8:00-9:30'),
(31, 61, 'Otoño', 2023, 'H202', 'Martes y Jueves 8:00-9:30'),
(32, 62, 'Primavera', 2023, 'H203', 'Lunes y Miércoles 10:00-11:30'),
(32, 63, 'Otoño', 2023, 'H204', 'Martes y Jueves 10:00-11:30'),
(33, 64, 'Primavera', 2023, 'I101', 'Lunes y Miércoles 14:00-15:30'),
(33, 65, 'Otoño', 2023, 'I102', 'Martes y Jueves 14:00-15:30'),
(34, 66, 'Primavera', 2023, 'I103', 'Viernes 9:00-12:00'),
(34, 67, 'Otoño', 2023, 'I104', 'Lunes y Miércoles 16:00-17:30'),
(35, 68, 'Primavera', 2023, 'I201', 'Martes y Jueves 16:00-17:30'),
(35, 69, 'Otoño', 2023, 'I202', 'Viernes 13:00-16:00'),
(36, 70, 'Primavera', 2023, 'J101', 'Lunes y Miércoles 8:00-9:30'),
(36, 71, 'Otoño', 2023, 'J102', 'Martes y Jueves 8:00-9:30'),
(37, 72, 'Primavera', 2023, 'J103', 'Lunes y Miércoles 10:00-11:30'),
(37, 73, 'Otoño', 2023, 'J104', 'Martes y Jueves 10:00-11:30'),
(38, 74, 'Primavera', 2023, 'J201', 'Lunes y Miércoles 14:00-15:30'),
(38, 75, 'Otoño', 2023, 'J202', 'Martes y Jueves 14:00-15:30'),
(39, 76, 'Primavera', 2023, 'J203', 'Viernes 9:00-12:00'),
(39, 77, 'Otoño', 2023, 'J204', 'Lunes y Miércoles 16:00-17:30'),
(40, 78, 'Primavera', 2023, 'J301', 'Martes y Jueves 16:00-17:30'),
(40, 79, 'Otoño', 2023, 'J302', 'Viernes 13:00-16:00');

-- Insertar 100 inscripciones (relacionando estudiantes y clases)
INSERT INTO Inscripcion (id_inscripcion, id_estudiante, id_clase, fecha_inscripcion) VALUES
(1, 1, 1, '2023-01-10'), 
(2, 2, 2, '2023-01-11'), 
(3, 3, 3, '2023-01-12'), 
(4, 4, 4, '2023-01-13'), 
(5, 5, 5, '2023-01-14'),
(6, 6, 6, '2023-01-15'), 
(7, 7, 7, '2023-01-16'), 
(8, 8, 8, '2023-01-17'), 
(9, 9, 9, '2023-01-18'), 
(10, 10, 10, '2023-01-19'),
(11, 11, 11, '2023-01-20'), 
(12, 12, 12, '2023-01-21'), 
(13, 13, 13, '2023-01-22'), 
(14, 14, 14, '2023-01-23'), 
(15, 15, 15, '2023-01-24'),
(16, 16, 16, '2023-01-25'), 
(17, 17, 17, '2023-01-26'), 
(18, 18, 18, '2023-01-27'), 
(19, 19, 19, '2023-01-28'), 
(20, 20, 20, '2023-01-29'),
(21, 21, 21, '2023-01-30'), 
(22, 22, 22, '2023-01-31'), 
(23, 23, 23, '2023-02-01'), 
(24, 24, 24, '2023-02-02'), 
(25, 25, 25, '2023-02-03'),
(26, 26, 26, '2023-02-04'), 
(27, 27, 27, '2023-02-05'), 
(28, 28, 28, '2023-02-06'), 
(29, 29, 29, '2023-02-07'), 
(30, 30, 30, '2023-02-08'),
(31, 31, 31, '2023-02-09'), 
(32, 32, 32, '2023-02-10'), 
(33, 33, 33, '2023-02-11'), 
(34, 34, 34, '2023-02-12'), 
(35, 35, 35, '2023-02-13'),
(36, 36, 36, '2023-02-14'), 
(37, 37, 37, '2023-02-15'), 
(38, 38, 38, '2023-02-16'), 
(39, 39, 39, '2023-02-17'), 
(40, 40, 40, '2023-02-18'),
(41, 41, 41, '2023-02-19'), 
(42, 42, 42, '2023-02-20'), 
(43, 43, 43, '2023-02-21'), 
(44, 44, 44, '2023-02-22'), 
(45, 45, 45, '2023-02-23'),
(46, 46, 46, '2023-02-24'), 
(47, 47, 47, '2023-02-25'), 
(48, 48, 48, '2023-02-26'), 
(49, 49, 49, '2023-02-27'), 
(50, 50, 50, '2023-02-28'),
(51, 51, 51, '2023-03-01'), 
(52, 52, 52, '2023-03-02'), 
(53, 53, 53, '2023-03-03'), 
(54, 54, 54, '2023-03-04'), 
(55, 55, 55, '2023-03-05'),
(56, 56, 56, '2023-03-06'), 
(57, 57, 57, '2023-03-07'), 
(58, 58, 58, '2023-03-08'), 
(59, 59, 59, '2023-03-09'), 
(60, 60, 60, '2023-03-10'),
(61, 61, 61, '2023-03-11'), 
(62, 62, 62, '2023-03-12'), 
(63, 63, 63, '2023-03-13'), 
(64, 64, 64, '2023-03-14'), 
(65, 65, 65, '2023-03-15'),
(66, 66, 66, '2023-03-16'), 
(67, 67, 67, '2023-03-17'), 
(68, 68, 68, '2023-03-18'), 
(69, 69, 69, '2023-03-19'), 
(70, 70, 70, '2023-03-20'),
(71, 71, 71, '2023-03-21'), 
(72, 72, 72, '2023-03-22'), 
(73, 73, 73, '2023-03-23'), 
(74, 74, 74, '2023-03-24'), 
(75, 75, 75, '2023-03-25'),
(76, 76, 76, '2023-03-26'), 
(77, 77, 77, '2023-03-27'), 
(78, 78, 78, '2023-03-28'), 
(79, 79, 79, '2023-03-29'), 
(80, 80, 80, '2023-03-30'),
(81, 81, 81, '2023-03-31'), 
(82, 82, 82, '2023-04-01'), 
(83, 83, 83, '2023-04-02'), 
(84, 84, 84, '2023-04-03'), 
(85, 85, 85, '2023-04-04'),
(86, 86, 86, '2023-04-05'), 
(87, 87, 87, '2023-04-06'), 
(88, 88, 88, '2023-04-07');

-- Insertar 100 calificaciones (relacionadas con inscripciones)
INSERT INTO Calificacion (id_inscripcion, nota, tipo_evaluacion, fecha_evaluacion) VALUES
(1, 4.5, 'Parcial 1', '2023-03-15'), (1, 4.8, 'Parcial 2', '2023-05-10'), (1, 4.9, 'Final', '2023-06-12'),
(2, 3.9, 'Parcial 1', '2023-03-16'), (2, 4.2, 'Parcial 2', '2023-05-11'), (2, 4.3, 'Final', '2023-06-13'),
(3, 4.7, 'Parcial 1', '2023-03-15'), (3, 4.9, 'Parcial 2', '2023-05-10'), (3, 5.0, 'Final', '2023-06-12'),
(4, 3.5, 'Parcial 1', '2023-03-17'), (4, 3.8, 'Parcial 2', '2023-05-12'), (4, 4.0, 'Final', '2023-06-14'),
(5, 4.0, 'Parcial 1', '2023-03-16'), (5, 4.3, 'Parcial 2', '2023-05-11'), (5, 4.5, 'Final', '2023-06-13'),
(6, 3.8, 'Parcial 1', '2023-03-18'), (6, 4.1, 'Parcial 2', '2023-05-13'), (6, 4.2, 'Final', '2023-06-15'),
(7, 4.2, 'Parcial 1', '2023-03-19'), (7, 4.5, 'Parcial 2', '2023-05-14'), (7, 4.7, 'Final', '2023-06-16'),
(8, 3.7, 'Parcial 1', '2023-03-20'), (8, 4.0, 'Parcial 2', '2023-05-15'), (8, 4.1, 'Final', '2023-06-17'),
(9, 4.6, 'Parcial 1', '2023-03-21'), (9, 4.8, 'Parcial 2', '2023-05-16'), (9, 4.9, 'Final', '2023-06-18'),
(10, 3.9, 'Parcial 1', '2023-03-22'), (10, 4.2, 'Parcial 2', '2023-05-17'), (10, 4.4, 'Final', '2023-06-19'),
(11, 4.1, 'Parcial 1', '2023-03-23'), (11, 4.4, 'Parcial 2', '2023-05-18'), (11, 4.6, 'Final', '2023-06-20'),
(12, 3.6, 'Parcial 1', '2023-03-24'), (12, 3.9, 'Parcial 2', '2023-05-19'), (12, 4.0, 'Final', '2023-06-21'),
(13, 4.3, 'Parcial 1', '2023-03-25'), (13, 4.6, 'Parcial 2', '2023-05-20'), (13, 4.8, 'Final', '2023-06-22'),
(14, 3.8, 'Parcial 1', '2023-03-26'), (14, 4.1, 'Parcial 2', '2023-05-21'), (14, 4.3, 'Final', '2023-06-23'),
(15, 4.0, 'Parcial 1', '2023-03-27'), (15, 4.3, 'Parcial 2', '2023-05-22'), (15, 4.5, 'Final', '2023-06-24'),
(16, 3.5, 'Parcial 1', '2023-03-28'), (16, 3.8, 'Parcial 2', '2023-05-23'), (16, 4.0, 'Final', '2023-06-25'),
(17, 4.4, 'Parcial 1', '2023-03-29'), (17, 4.7, 'Parcial 2', '2023-05-24'), (17, 4.9, 'Final', '2023-06-26'),
(18, 3.9, 'Parcial 1', '2023-03-30'), (18, 4.2, 'Parcial 2', '2023-05-25'), (18, 4.4, 'Final', '2023-06-27'),
(19, 4.2, 'Parcial 1', '2023-03-31'), (19, 4.5, 'Parcial 2', '2023-05-26'), (19, 4.7, 'Final', '2023-06-28'),
(20, 3.7, 'Parcial 1', '2023-04-01'), (20, 4.0, 'Parcial 2', '2023-05-27'), (20, 4.2, 'Final', '2023-06-29'),
(21, 4.5, 'Parcial 1', '2023-04-02'), (21, 4.8, 'Parcial 2', '2023-05-28'), (21, 4.9, 'Final', '2023-06-30'),
(22, 3.8, 'Parcial 1', '2023-04-03'), (22, 4.1, 'Parcial 2', '2023-05-29'), (22, 4.3, 'Final', '2023-07-01'),
(23, 4.1, 'Parcial 1', '2023-04-04'), (23, 4.4, 'Parcial 2', '2023-05-30'), (23, 4.6, 'Final', '2023-07-02'),
(24, 3.6, 'Parcial 1', '2023-04-05'), (24, 3.9, 'Parcial 2', '2023-05-31'), (24, 4.1, 'Final', '2023-07-03'),
(25, 4.3, 'Parcial 1', '2023-04-06'), (25, 4.6, 'Parcial 2', '2023-06-01'), (25, 4.8, 'Final', '2023-07-04'),
(26, 3.9, 'Parcial 1', '2023-04-07'), (26, 4.2, 'Parcial 2', '2023-06-02'), (26, 4.4, 'Final', '2023-07-05'),
(27, 4.0, 'Parcial 1', '2023-04-08'), (27, 4.3, 'Parcial 2', '2023-06-03'), (27, 4.5, 'Final', '2023-07-06'),
(28, 3.5, 'Parcial 1', '2023-04-09'), (28, 3.8, 'Parcial 2', '2023-06-04'), (28, 4.0, 'Final', '2023-07-07'),
(29, 4.4, 'Parcial 1', '2023-04-10'), (29, 4.7, 'Parcial 2', '2023-06-05'), (29, 4.9, 'Final', '2023-07-08'),
(30, 3.8, 'Parcial 1', '2023-04-11'), (30, 4.1, 'Parcial 2', '2023-06-06'), (30, 4.3, 'Final', '2023-07-09'),
(31, 4.2, 'Parcial 1', '2023-04-12'), (31, 4.5, 'Parcial 2', '2023-06-07'), (31, 4.7, 'Final', '2023-07-10'),
(32, 3.7, 'Parcial 1', '2023-04-13'), (32, 4.0, 'Parcial 2', '2023-06-08'), (32, 4.2, 'Final', '2023-07-11'),
(33, 4.5, 'Parcial 1', '2023-04-14'), (33, 4.8, 'Parcial 2', '2023-06-09'), (33, 4.9, 'Final', '2023-07-12'),
(34, 3.9, 'Parcial 1', '2023-04-15'), (34, 4.2, 'Parcial 2', '2023-06-10'), (34, 4.4, 'Final', '2023-07-13'),
(35, 4.1, 'Parcial 1', '2023-04-16'), (35, 4.4, 'Parcial 2', '2023-06-11'), (35, 4.6, 'Final', '2023-07-14'),
(36, 3.6, 'Parcial 1', '2023-04-17'), (36, 3.9, 'Parcial 2', '2023-06-12'), (36, 4.1, 'Final', '2023-07-15'),
(37, 4.3, 'Parcial 1', '2023-04-18'), (37, 4.6, 'Parcial 2', '2023-06-13'), (37, 4.8, 'Final', '2023-07-16'),
(38, 3.8, 'Parcial 1', '2023-04-19'), (38, 4.1, 'Parcial 2', '2023-06-14'), (38, 4.3, 'Final', '2023-07-17'),
(39, 4.0, 'Parcial 1', '2023-04-20'), (39, 4.3, 'Parcial 2', '2023-06-15'), (39, 4.5, 'Final', '2023-07-18'),
(40, 3.5, 'Parcial 1', '2023-04-21'), (40, 3.8, 'Parcial 2', '2023-06-16'), (40, 4.0, 'Final', '2023-07-19'),
(41, 4.4, 'Parcial 1', '2023-04-22'), (41, 4.7, 'Parcial 2', '2023-06-17'), (41, 4.9, 'Final', '2023-07-20'),
(42, 3.9, 'Parcial 1', '2023-04-23'), (42, 4.2, 'Parcial 2', '2023-06-18'), (42, 4.4, 'Final', '2023-07-21'),
(43, 4.1, 'Parcial 1', '2023-04-24'), (43, 4.4, 'Parcial 2', '2023-06-19'), (43, 4.6, 'Final', '2023-07-22'),
(44, 3.6, 'Parcial 1', '2023-04-25'), (44, 3.9, 'Parcial 2', '2023-06-20'), (44, 4.1, 'Final', '2023-07-23'),
(45, 4.3, 'Parcial 1', '2023-04-26'), (45, 4.6, 'Parcial 2', '2023-06-21'), (45, 4.8, 'Final', '2023-07-24'),
(46, 3.8, 'Parcial 1', '2023-04-27'), (46, 4.1, 'Parcial 2', '2023-06-22'), (46, 4.3, 'Final', '2023-07-25'),
(47, 4.0, 'Parcial 1', '2023-04-28'), (47, 4.3, 'Parcial 2', '2023-06-23'), (47, 4.5, 'Final', '2023-07-26'),
(48, 3.5, 'Parcial 1', '2023-04-29'), (48, 3.8, 'Parcial 2', '2023-06-24'), (48, 4.0, 'Final', '2023-07-27'),
(49, 4.4, 'Parcial 1', '2023-04-30'), (49, 4.7, 'Parcial 2', '2023-06-25'), (49, 4.9, 'Final', '2023-07-28'),
(50, 3.9, 'Parcial 1', '2023-05-01'), (50, 4.2, 'Parcial 2', '2023-06-26'), (50, 4.4, 'Final', '2023-07-29');

-- Desactivar verificación de claves foráneas
SET FOREIGN_KEY_CHECKS = 0;

-- Reactivar verificación
SET FOREIGN_KEY_CHECKS = 1;


-- Consultas Básicas y Avanzadas
-- 1. Mostrar el nombre y apellido de todos los estudiantes ordenados alfabéticamente por apellido
SELECT nombre, apellido 
FROM Estudiante 
ORDER BY apellido;

-- 2. Mostrar todos los cursos que tienen más de 3 créditos
SELECT nombre, creditos 
FROM Curso 
WHERE creditos > 3;

-- 3. Mostrar el nombre del estudiante y el nombre del curso en el que está inscrito (INNER JOIN)
SELECT e.nombre, e.apellido, c.nombre AS curso
FROM Estudiante e
JOIN Inscripcion i ON e.id_estudiante = i.id_estudiante
JOIN Clase cl ON i.id_clase = cl.id_clase
JOIN Curso c ON cl.id_curso = c.id_curso;

-- 4. Mostrar todos los estudiantes y, si están inscritos, el curso correspondiente (LEFT JOIN)
SELECT e.nombre, e.apellido, c.nombre AS curso
FROM Estudiante e
LEFT JOIN Inscripcion i ON e.id_estudiante = i.id_estudiante
LEFT JOIN Clase cl ON i.id_clase = cl.id_clase
LEFT JOIN Curso c ON cl.id_curso = c.id_curso;

-- 5. Mostrar todos los cursos, incluyendo los que aún no tienen estudiantes inscritos (RIGHT JOIN)
SELECT c.nombre AS curso, COUNT(i.id_inscripcion) AS estudiantes_inscritos
FROM Inscripcion i
RIGHT JOIN Clase cl ON i.id_clase = cl.id_clase
RIGHT JOIN Curso c ON cl.id_curso = c.id_curso
GROUP BY c.id_curso;

-- 6. Contar cuántos estudiantes hay por departamento
SELECT d.nombre AS departamento, COUNT(e.id_estudiante) AS total_estudiantes
FROM Departamento d
LEFT JOIN Estudiante e ON d.id_departamento = e.id_departamento
GROUP BY d.id_departamento;

-- 7. Calcular el promedio de notas por estudiante
SELECT e.nombre, e.apellido, AVG(ca.nota) AS promedio_notas
FROM Estudiante e
JOIN Inscripcion i ON e.id_estudiante = i.id_estudiante
JOIN Calificacion ca ON i.id_inscripcion = ca.id_inscripcion
GROUP BY e.id_estudiante;

-- 8. Mostrar la nota máxima y mínima por clase
SELECT cl.id_clase, cu.nombre AS curso, 
       MAX(ca.nota) AS nota_maxima, 
       MIN(ca.nota) AS nota_minima
FROM Clase cl
JOIN Curso cu ON cl.id_curso = cu.id_curso
JOIN Inscripcion i ON cl.id_clase = i.id_clase
JOIN Calificacion ca ON i.id_inscripcion = ca.id_inscripcion
GROUP BY cl.id_clase;

-- 9. Mostrar los 5 estudiantes con el mayor promedio de notas
SELECT e.nombre, e.apellido, AVG(ca.nota) AS promedio_notas
FROM Estudiante e
JOIN Inscripcion i ON e.id_estudiante = i.id_estudiante
JOIN Calificacion ca ON i.id_inscripcion = ca.id_inscripcion
GROUP BY e.id_estudiante
ORDER BY promedio_notas DESC
LIMIT 5;

-- Actualizar y Borrar
-- 10. Cambiar el correo electrónico de un estudiante
UPDATE Estudiante
SET email = 'nuevo.email@estudiante.edu'
WHERE id_estudiante = 1;

-- Actualizar los créditos de un curso
UPDATE Curso
SET creditos = 5
WHERE codigo = 'CS101';

-- Eliminar una inscripción
DELETE FROM Inscripcion
WHERE id_estudiante = 5 AND id_clase = 3;

-- Eliminar todas las calificaciones menores a 3.0
DELETE FROM Calificacion
WHERE nota < 3.0;

-- 1: Eliminar por ID de estudiante y ID de clase
-- Eliminar la inscripción del estudiante con id=5 en la clase con id=10
DELETE FROM Inscripcion 
WHERE id_estudiante = 5 AND id_clase = 10;

-- 2: Eliminar usando nombres en lugar de IDs (más amigable
-- Eliminar la inscripción de "Juan Pérez" en la clase de "Cálculo I"
DELETE FROM Inscripcion
WHERE id_estudiante = (
    SELECT id_estudiante FROM Estudiante 
    WHERE nombre = 'Juan' AND apellido = 'Pérez'
)
AND id_clase = (
    SELECT id_clase FROM Clase 
    JOIN Curso ON Clase.id_curso = Curso.id_curso 
    WHERE Curso.nombre = 'Cálculo I'
);

-- 3: Eliminar todas las inscripciones de un estudiante
-- Eliminar todas las inscripciones del estudiante con id=8
DELETE FROM Inscripcion 
WHERE id_estudiante = 8;

-- eliminar las calificaciones asociadas:
-- Primero eliminar las calificaciones relacionadas
DELETE FROM Calificacion
WHERE id_inscripcion IN (
    SELECT id_inscripcion FROM Inscripcion
    WHERE id_estudiante = 5 AND id_clase = 10
);

-- Luego eliminar la inscripción
DELETE FROM Inscripcion
WHERE id_estudiante = 5 AND id_clase = 10;

-- Otra manera de eliminar 
START TRANSACTION;

DELETE FROM Calificacion
WHERE id_inscripcion IN (
    SELECT id_inscripcion FROM Inscripcion
    WHERE id_estudiante = 5 AND id_clase = 10
);

DELETE FROM Inscripcion
WHERE id_estudiante = 5 AND id_clase = 10;

COMMIT;
-- O ROLLBACK si algo falla
