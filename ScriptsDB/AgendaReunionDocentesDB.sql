create database AgendaReunionDocentesDB
go
use AgendaReunionDocentesDB
go 

create table Usuario (
	Id bigint not null identity,
	Nombres varchar(100) not null,
	Apellidos varchar(100) not null,
	Edad int not null,
	Genero char(1) not null,
	Correo varchar(100) not null,
	Telefono varchar(10) null,
	Usuario varchar(50) null,
	Clave varchar(50) not null,
	EsDocente bit not null default 0, -- 1: DOCENTE, 0: USUARIO
	primary key(Id)
);
go

create table Reunion(
	Id bigint not null identity,
	IdUsuario bigint null,
	Titulo varchar(100) not null,
	Descripcion varchar(500) null,
	FechaProgramacion date not null,
	Estado varchar(50) not null,
	primary key (id),
	constraint fk_reunion_usuario foreign key(IdUsuario) references Usuario(Id)
);
go

create table DocenteReunion (
	Id bigint not null identity,
	IdReunion bigint not null,
	IdDocente bigint not null,
	Primary key(Id),
	constraint fk_docentereunion_reunion foreign key(IdReunion) references Reunion(Id),
	constraint fk_docentereunion_docente foreign key(IdDocente) references Usuario(Id)
);
go

create table ActaReunion(
	Id bigint not null identity,
	IdReunion bigint not null,
	IdUsuario bigint not null,
	Comentario varchar(800) not null,
	FechaCreado datetime not null,
	primary key(Id),
	constraint fk_actareunion_reunion foreign key(IdReunion) references Reunion(Id),
	constraint fk_actareunion_usuario foreign key(IdUsuario) references Usuario(Id)
);