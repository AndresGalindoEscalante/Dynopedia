create database if not exists dynopedia;

use dynopedia;

/*Motor utilizado  en todas las tablas es InnoDB*/
/*Valor NOT NULL a todos los atributos para que se tengan que rellenar*/
create table if not exists administrador(
	id int not null auto_increment primary key,
    nombre varchar(30) not null,
    nivel int not null
)engine = InnoDB;

create table if not exists usuario_editor(
	id int not null auto_increment primary key,
    nombre varchar(30) not null,
    apellido varchar(50) not null,
    correo varchar(45) not null,
    contraseña varchar(45) not null,
    administrador_id int
)engine = InnoDB;

create table if not exists pagina(
	id int not null auto_increment primary key,
	fecha_creacion date not null,
    tipo varchar(50) not null,
    administrador_id int
)engine = InnoDB;

create table if not exists usuario_editor_has_pagina(
	usuario_editor_id int,
    pagina_id int
)engine = InnoDB;

create table if not exists familias(
	id int not null auto_increment primary key,
    nombre varchar(45)
)engine = InnoDB;

create table if not exists zonas(
	id int not null auto_increment primary key,
    clima varchar(30),
    regino varchar(50)
)engine = InnoDB;

create table if not exists dinosaurios(
	id int not null auto_increment primary key,
    nombre varchar(50),
    era varchar(50),
    pagina_id int,
    familias_id int,
    zonas_id int
)engine = InnoDB;

/* Inserccion de claves foraneas*/
alter table usuario_editor add constraint foreign key (administrador_id) references administrador(id);
alter table pagina add constraint foreign key (administrador_id) references administrador(id);
alter table usuario_editor_has_pagina add constraint foreign key (usuario_editor_id) references usuario_editor(id);
alter table usuario_editor_has_pagina add constraint foreign key (pagina_id) references usuario_editor(id);
alter table dinosaurios add constraint foreign key (pagina_id) references pagina (id);
alter table dinosaurios add constraint foreign key (familias_id) references familias (id);
alter table dinosaurios add constraint foreign key (zonas_id) references zonas (id);

/*Inserts administradores*/
INSERT INTO administrador VALUES (1,"Andres",1);
INSERT INTO administrador VALUES (2,"Javier",1);
INSERT INTO administrador VALUES (3,"Stephen Hawkings",2);
Select * from administrador;

/*Inserts familias*/
INSERT INTO pagina  VALUES(1,"2022-10-11","Inicial",1);
INSERT INTO pagina  VALUES(2,"2022-10-11","Formulario",1);
INSERT INTO pagina  VALUES(3,"2022-10-11","Dinosaurios",1);
INSERT INTO pagina  VALUES(4,"2022-11-25","TierList",1);
Select * from pagina;

/*Inserts familias*/
INSERT INTO familias  VALUES(1,"Tyrannosauridae");	
INSERT INTO familias  VALUES(2,"Brachiosauridae");
INSERT INTO familias  VALUES(3,"Ankylosauridae");
INSERT INTO familias VALUES(4,"Ceratopsidae");
Select * from familias;

/*Inserts zonas*/
INSERT INTO zonas  VALUES(1,"Calido","Norteamérica");
INSERT INTO zonas  VALUES(2,"Calido","Europa");
INSERT INTO zonas  VALUES(3,"Calido","Asia");
INSERT INTO zonas  VALUES(4,"Calido","Sudamerica");
INSERT INTO zonas  VALUES(5,"Calido","Africa");
INSERT INTO zonas  VALUES(6,"Calido","Australia");
INSERT INTO zonas  VALUES(7,"Calido","Oceano");
Select * from zonas;

/*Insert usuarios*/
INSERT INTO usuario_editor VALUES(1,"Pepe","Jimenez","pepejimenez@gmail.com","1234AEIOU",1);
INSERT INTO usuario_editor VALUES(2,"Ibai","LLanos","gordostreamer@gmail.com","BURGER_KING",1);
INSERT INTO usuario_editor VALUES(3,"Cristiano","Ronaldo","cr7@gmail.com","MessiEsMalo",1);
INSERT INTO usuario_editor VALUES(4,"Cristiano","Ateo","igualhaydios@gmail.com","AmenJesusBigBang",1);

/*Inserts dinosaurios*/
INSERT INTO dinosaurios  VALUES(1,"Tyrannosaurus_rex","Cretácico",3,1,1);
INSERT INTO dinosaurios  VALUES(2,"Brachiosaurus","Jurasico",3,2,1);
INSERT INTO dinosaurios  VALUES(3,"Anquilosaurio","Cretacico",3,3,1);
INSERT INTO dinosaurios  VALUES(4,"Triceratops","Cretacico",3,4,1);
Select * from dinosaurios;


