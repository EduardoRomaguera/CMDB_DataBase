use master
go
create database SochiSoftwareCMDB;
go
use SochiSoftwareCMDB;
go

--Creación  de las tablas
create table Centro_Computo(
Id_Centro_Computo int identity (1,1) constraint Pk_Centro_Computo_Id_Centro_Computo primary key,
Nombre varchar(100) not null
)
go

create table Area(
Id_Area int identity (1,1) constraint Pk_Area_Id_Area primary key,
Descripcion varchar(100) not null,
Ubicacion varchar (100) not null,
Id_Centro_Computo int not null constraint FK_SochiSofwareAreaCentro_Computo foreign key references Centro_Computo(Id_Centro_Computo)
)
go	

create table Computadora(
Id_Computadora int identity (1,1) constraint Pk_Computadora_Id_Computadora primary key,
Tipo varchar(100) not null,
Descripcion varchar(100) not null,
NumeroSerie varchar(100) constraint UQ_Conmputadora_Numero_Serie unique,
SistemaOperativo varchar(100) not null,
Estado varchar(20) not null constraint CK_Tipo_Estado check(Estado in ('Operativo','Fuera de servicio','Uso limitado','Perdido')) default ('Operativo'),
Id_Centro_Computo int not null constraint FK_SochiSofware_Computadora_Centro_Computo foreign key references Centro_Computo(Id_Centro_Computo)
)
go

create table Usuario(
Id_Usuario int identity (1,1) constraint Pk_Usuario_Id_Usuario primary key,
Nombre varchar(100) not null,
Apellido1 varchar(100) not null,
Apellido2 varchar(100),
Correo varchar(100) not null,
Telefono bigint not null,
Id_Computadora int not null constraint FK_SochiSofware_Computadora foreign key references Computadora(Id_Computadora)
)
go

create table VideoBeam(
Id_Video_Beam int identity (1,1) constraint Pk_Video_Beam_Id_Video_Beam primary key,
Descripcion varchar(100) not null,
Estado varchar(20) not null constraint CK_Tipo_Estado_VB check(Estado in ('Operativo','Fuera de servicio','Uso limitado','Perdido')) default ('Operativo'),
Ubicacion varchar(100) not null,
Id_Centro_Computo int not null constraint FK_SochiSofware_VB_Centro_Computo foreign key references Centro_Computo(Id_Centro_Computo)
)
go

create table Impresora(
Id_Impresora int identity (1,1) constraint Pk_Impresora_Id_Impresora primary key,
Descripcion varchar(100) not null,
Estado varchar(20) not null constraint CK_Tipo_Estado_Impr check(Estado in ('Operativo','Fuera de servicio','Uso limitado','Perdido')) default ('Operativo'),
Ubicacion varchar(100) not null,
Id_Centro_Computo int not null constraint FK_SochiSofware_Impr_Centro_Computo foreign key references Centro_Computo(Id_Centro_Computo)
)
go

create table Software(
Id_Software int identity (1,1) constraint Pk_Software_Id_Software primary key,
Descripcion varchar(100) not null,
Estado varchar(20) not null constraint CK_Tipo_Estado_Soft check(Estado in ('Operativo','Fuera de servicio','Uso limitado','Perdido')) default ('Operativo'),
Id_Centro_Computo int not null constraint FK_SochiSofware_SoftCentro_Computo foreign key references Centro_Computo(Id_Centro_Computo)
)
go

create table Servidor(
Id_Servidor int identity (1,1) constraint Pk_Servidor_Id_Servidor primary key,
Descripcion varchar(100) not null,
Estado varchar(20) not null constraint CK_Tipo_Estado_OD check(Estado in ('Operativo','Fuera de servicio','Uso limitado','Perdido')) default ('Operativo'),
Ubicacion varchar(100) not null,
Id_Centro_Computo int not null constraint FK_SochiSofware_ServCentro_Computo foreign key references Centro_Computo(Id_Centro_Computo)
)
go

create table Otro_Dispositivo(
Id_Otro_Dispositivo int identity (1,1) constraint Pk_Otro_Dispositivo_Id_Otro_Dispositivo primary key,
Descripcion varchar(100) not null,
Estado varchar(20) not null constraint CK_Tipo_EstadoOD check(Estado in ('Operativo','Fuera de servicio','Uso limitado','Perdido')) default ('Operativo'),
Ubicacion varchar(100) not null,
Id_Centro_Computo int not null constraint FK_SochiSofware_OD_Centro_Computo foreign key references Centro_Computo(Id_Centro_Computo)
)
go

--Llenado de tablas
Insert into Centro_Computo
(Nombre)
values ('Centro 001')
Insert into Centro_Computo
(Nombre)
values ('Centro 002')
Insert into Centro_Computo
(Nombre)
values ('Centro 003')
Insert into Centro_Computo
(Nombre)
values ('Centro 004')
Insert into Centro_Computo
(Nombre)
values ('Centro 005')


Insert into Area
(Descripcion, Ubicacion, Id_Centro_Computo)
values ('Gerencia','piso 1','1')
Insert into Area
(Descripcion, Ubicacion, Id_Centro_Computo)
values ('Recursos humanos','piso 1','2')
Insert into Area
(Descripcion, Ubicacion, Id_Centro_Computo)
values ('Salas de reuniones','piso 1','3')
Insert into Area
(Descripcion, Ubicacion, Id_Centro_Computo)
values ('Software','piso 1','4')
Insert into Area
(Descripcion, Ubicacion, Id_Centro_Computo)
values ('Call Center','Ala Este piso 1','5')
go


Insert into Computadora
(Tipo, Descripcion, NumeroSerie, SistemaOperativo, Estado, Id_Centro_Computo)
values ('Laptop','HP 14-DQ2055WM','VXUM5HFZ8C', 'Windows 10', 'Operativo', 1)
Insert into Computadora
(Tipo, Descripcion, NumeroSerie, SistemaOperativo, Estado, Id_Centro_Computo)
values ('Laptop',' MacBookPro16,3','CX7BPSL9C3', 'macOS Big Sur', 'Uso limitado', 1)
Insert into Computadora
(Tipo, Descripcion, NumeroSerie, SistemaOperativo, Estado, Id_Centro_Computo)
values ('Laptop','MacBookPro17,1','8N684U6QLC', 'macOS Big Sur', 'Operativo', 1)
Insert into Computadora
(Tipo, Descripcion, NumeroSerie, SistemaOperativo, Estado, Id_Centro_Computo)
values ('Laptop','MacBookPro16,2','WDYVWNUHML', 'macOS Big Sur', 'Operativo', 1)
Insert into Computadora
(Tipo, Descripcion, NumeroSerie, SistemaOperativo, Estado, Id_Centro_Computo)
values ('Laptop','ASUS ZENBOOK','X3NTQ9R84H', 'Windows 10', 'Operativo', 1)
Insert into Computadora
(Tipo, Descripcion, NumeroSerie, SistemaOperativo, Estado, Id_Centro_Computo)
values ('Laptop','DELL INSPIRON 14 5402','HG9HBS4LE4', 'Windows 10', 'Fuera de servicio', 1)
Insert into Computadora
(Tipo, Descripcion, NumeroSerie, SistemaOperativo, Estado, Id_Centro_Computo)
values ('Laptop','MSI MODERN 14 B4MW ','WBXSFKYSA5', 'Windows 10', 'Perdido', 1)
Insert into Computadora
(Tipo, Descripcion, SistemaOperativo, Estado, Id_Centro_Computo)
values ('Escritorio','AMD Ryzen 5 3600 32GB RAM DDR4 3600MHz 3070 Gigabyte 212 EVO Monitor AOC 24inch 144 Hz', 'Windows 11', 'Operativo', 1)
Insert into Computadora
(Tipo, Descripcion, NumeroSerie, SistemaOperativo, Estado, Id_Centro_Computo)
values ('Laptop','FRAMEWORK DIY EDITION Intel Core I7 32GB 3060m','F5NNQ9R94C', 'Windows 10', 'Operativo', 1)
Insert into Computadora
(Tipo, Descripcion, NumeroSerie, SistemaOperativo, Estado, Id_Centro_Computo)
values ('Laptop','FRAMEWORK DIY EDITION Intel Core I7 32GB 3060m','F5NNQ9R91C', 'Windows 10', 'Operativo', 1)
Insert into Computadora
(Tipo, Descripcion, NumeroSerie, SistemaOperativo, Estado, Id_Centro_Computo)
values ('Laptop','FRAMEWORK DIY EDITION Intel Core I7 32GB 3060m','F5NNQ9R92C', 'Windows 10', 'Operativo', 1)
Insert into Computadora
(Tipo, Descripcion, NumeroSerie, SistemaOperativo, Estado, Id_Centro_Computo)
values ('Laptop','FRAMEWORK DIY EDITION Intel Core I7 32GB 3060m','F5NNQ9R90C', 'Windows 10', 'Operativo', 1)
Insert into Computadora
(Tipo, Descripcion, NumeroSerie, SistemaOperativo, Estado, Id_Centro_Computo)
values ('Laptop','FRAMEWORK DIY EDITION Intel Core I7 32GB 3060m','F5NNQ9R93C', 'Windows 10', 'Operativo', 1)
Insert into Computadora
(Tipo, Descripcion, NumeroSerie, SistemaOperativo, Estado, Id_Centro_Computo)
values ('Laptop','FRAMEWORK ULTIMATE EDITION AMD 5600 64GB 3060m','F5NHQ9R99C', 'Windows 10', 'Operativo', 1)


insert into Otro_Dispositivo
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Mouse inalambrico Logitech G604 Lightspeed', 'Operativo', 'Almacén principal', 1)
insert into Otro_Dispositivo
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Mouse alambrico HyperX FPS Pro', 'Uso limitado', 'Almacén secundario', 1)
insert into Otro_Dispositivo
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Microfono USB Fifine', 'Perdido', 'Almacén principal', 2)
insert into Otro_Dispositivo
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Monitor AOC monitor aoc 24 144 g2460pf 144hz freesync 1ms', 'Fuera de servicio', 'Almacén principal', 3)
insert into Otro_Dispositivo
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Teclado TKL HyperX Alloy Origins Core', 'Operativo', 'Almacén principal', 2)
insert into Otro_Dispositivo
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Parlantes Logitech Z607', 'Operativo', 'Almacén principal', 5)
insert into Otro_Dispositivo
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Monitor BENQ 24inch 60Hz', 'Fuera de servicio', 'Almacén secundario', 4)
go


insert into Servidor
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Servidor emails Torre Dell Precision 7910 2X Intel Xeon E5-2660 – Nvidia Quadro K2000 2GB', 'Operativo', 'Cuarto Servidores 01, Piso 05', 1)
insert into Servidor
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Servidor NAS HPE 873830-S01 ProLiant MicroServer Gen10 Ultra Micro Tower 1 x AMD Opteron X3216', 'Uso limitado', 'Cuarto Servidores 01, Piso 05', 1)
insert into Servidor
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Servidor respaldo correos electronicos Dell PowerEdge R720 Server 2 x E5-2690 16 núcleos', 'Operativo', 'Cuarto Servidores 02, Piso 10', 2)
insert into Servidor
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Servidor respaldo NAS HPE 873830-S01 ProLiant MicroServer Gen10 Ultra Tower 1 x AMD Opteron X3216', 'Fuera de servicio', 'Cuarto Servidores 02, Piso 10', 2)
insert into Servidor
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Servidor red interna HPE 873830-S01 ProLiant MicroServer Gen10 Ultra', 'Operativo', 'Cuarto Servidores 01, Piso 05', 1)
insert into Servidor
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Servidor respaldo multiproposito Dell PowerEdge T40, BTX Intel Xeon E-2224G 3,5GHz', 'Uso limitado', 'Cuarto Servidores 02, Piso 10', 2)
go


insert into Software
(Descripcion, Estado, Id_Centro_Computo)
values('Microsoft Windows 10, Licencia por volumen VL', 'Operativo', 3)
insert into Software
(Descripcion, Estado, Id_Centro_Computo)
values('Microsoft Office 365, Licencia por suscripción anual', 'Operativo', 3)
insert into Software
(Descripcion, Estado, Id_Centro_Computo)
values('Zoom, Licencia por volumen', 'Uso limitado', 3)
insert into Software
(Descripcion, Estado, Id_Centro_Computo)
values('GitHub, Licencia por suscripcion', 'Operativo', 3)
insert into Software
(Descripcion, Estado, Id_Centro_Computo)
values('ASANA, Licencia por suscripcion', 'Operativo', 3)
insert into Software
(Descripcion, Estado, Id_Centro_Computo)
values('DaVinciResolve, Licencia por suscripcion anual', 'Operativo', 3)
insert into Software
(Descripcion, Estado, Id_Centro_Computo)
values('Discord Nitro', 'Operativo', 3)
go


insert into Impresora
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Impresora piso 1 Brother HL-L2395DW Monochrome Laser Wireless All-in-One', 'Operativo', 'Piso 1', 4)
insert into Impresora
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Impresora cuarto reuniones gerencia láser inalámbrica HP Color Laserjet Pro multifunciional M479fdw', 'Operativo', 'Piso 05', 4)
insert into Impresora
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Impresora respaldo Impresora multifunción Canon G7020', 'Operativo', 'Almacén principal', 4)
insert into Impresora
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Impresora portatil fotografiasZink Kodak Step Printer', 'Uso limitado', 'Almacén principal', 4)
insert into Impresora
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Impresora termica de etiquetas Impresora de etiquetas MUNBYN', 'Operativo', 'Bodega', 4)
go


insert into VideoBeam
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Proyector Anker Nebula Solar Proyector Portátil 1080p ', 'Operativo', 'Sala reuiniones gerencia', 4)
insert into VideoBeam
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Proyector Anker Nebula Solar Proyector Portátil 1080p ', 'Operativo', 'Sala reuiniones gerencia', 4)
insert into VideoBeam
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Proyector Nebula Mars 1080p ', 'Uso limitado', 'Almacén principal', 4)
insert into VideoBeam
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Proyector Anker Nebula Astro Mini Proyector Portátil 720p ', 'Operativo', 'Almacén principal', 4)
insert into VideoBeam
(Descripcion, Estado, Ubicacion, Id_Centro_Computo)
values('Proyector Nebula Mars Pro 4K ', 'Operativo', 'Almacén principal', 4)
go


insert into Usuario
(Nombre, Apellido1, Apellido2, Correo, Telefono, Id_Computadora)
values('Eduardo', 'Romaguera', 'Solano', 'eduardoromaguera@gmail.com', 50685679478, 8)
insert into Usuario
(Nombre, Apellido1, Apellido2, Correo, Telefono, Id_Computadora)
values('Ricardo', 'Rodriguez', 'Salvatierra', 'salvatierra@gmail.com', 50675483988, 1)
insert into Usuario
(Nombre, Apellido1, Apellido2, Correo, Telefono, Id_Computadora)
values('Tatiana', 'Araya', 'Muñoz', 'tatianamunoz@gmail.com', 50689564566, 2)
insert into Usuario
(Nombre, Apellido1, Apellido2, Correo, Telefono, Id_Computadora)
values('Ori', 'Calavera', 'Rosado', 'ocalavera99@gmail.com', 50678564783, 3)
insert into Usuario
(Nombre, Apellido1, Apellido2, Correo, Telefono, Id_Computadora)
values('Edward', 'Elric', '', 'edward@gmail.com', 50678564783, 4)
insert into Usuario
(Nombre, Apellido1, Apellido2, Correo, Telefono, Id_Computadora)
values('Roy', 'Mustang', 'Mustang', 'royfuego@gmail.com', 50798476355, 5)
insert into Usuario
(Nombre, Apellido1, Apellido2, Correo, Telefono, Id_Computadora)
values('Van', 'Hohenheim', 'Casidi', 'van04casid@gmail.com', 50778695844, 6)
insert into Usuario
(Nombre, Apellido1, Apellido2, Correo, Telefono, Id_Computadora)
values('Carmen', 'Solano', 'Cerdas', 'cerdascarm63@gmail.com', 50589765487, 7)
insert into Usuario
(Nombre, Apellido1, Apellido2, Correo, Telefono, Id_Computadora)
values('Early', 'Morales', 'Vargas', 'moralestemp@gmail.com', 50587659031, 9)
insert into Usuario
(Nombre, Apellido1, Apellido2, Correo, Telefono, Id_Computadora)
values('Luis', 'Cascante', 'Santorini', 'santorini89@gmail.com', 50578574633, 10)
insert into Usuario
(Nombre, Apellido1, Apellido2, Correo, Telefono, Id_Computadora)
values('Alphonse', 'Elric', 'Elric', 'elricmenor@gmail.com', 50578574633, 11)
insert into Usuario
(Nombre, Apellido1, Apellido2, Correo, Telefono, Id_Computadora)
values('Natalia', 'Chinchilla', 'Castro', 'naticastro092@gmail.com', 50587679030, 12)
insert into Usuario
(Nombre, Apellido1, Apellido2, Correo, Telefono, Id_Computadora)
values('Fidel', 'Benington', 'Salas', 'fidel987cr@gmail.com', 50587584933, 13)



use SochiSoftwareCMDB;
go


--Entrega final

--1. Funciones:
--1.1 Dos funciones de tipo escalar.

-- a) Función que indica cuantos equipos existen dado el tipo de dispositivo:
-- Indique el dispositivo según la simbología a continuación:
--		1= Computadora
--		2= VideoBeam
--		3= Impresora
--		4= Software
--		5= Servidor
--		6= Otro dispositivo
	
	create function F_CantDispositivos (@dispositivo int)
	returns int
	begin
	declare @contador int
	
	if @dispositivo=1
	set @contador = (
		select count(*)as test
		from Computadora)

	if @dispositivo=2 
	set @contador = (
		select count(*)as test
		from VideoBeam)

	if @dispositivo=3 
	set @contador = (
		select count(*)as test
		from Impresora)

	if @dispositivo=4 
	set @contador = (
		select count(*)as test
		from Software)

	if @dispositivo=5 
	set @contador = (
		select count(*)as test
		from Servidor)

	if @dispositivo=6 
	set @contador = (
		select count(*)as test
		from Otro_dispositivo)
	
	return (@contador)
	end
	go

-- test
-- select dbo.F_CantDispositivos(6)

-- select * from Computadora
-- select * from VideoBeam
-- select * from Impresora
-- select * from Software
-- select * from Servidor
-- select * from Otro_Dispositivo

-- b) Función que indica cuantas computadoras están sin asignar a un usuario
	
	create function F_DispositivosLibres()
	returns int
	begin
	declare @contador int
	set @contador = (
		select count(*)as test
		from Computadora
		where Id_Computadora not in
		(select Id_Computadora from Usuario)
		)
	return (@contador)
	end
	go

-- test
-- select dbo.F_DispositivosLibres()

-- select * from Computadora


--1.2 Dos funciones de tipo tabla
-- a) Función que muestra las computadoras en estado operativo

create function F_ComputadorasOperativas()
returns @F_ComputadorasEstado table (
			Id_Computadora int,
			Tipo varchar(100),
			Descripcion varchar(100),
			Estado varchar(20),
			Id_Centro_Computo int)
begin
	insert into @F_ComputadorasEstado
		select Id_Computadora, Tipo, Descripcion, Estado, Id_Centro_Computo from Computadora
		where Estado = 'Operativo'
	return
end
go

-- test
-- select * from dbo.F_ComputadorasOperativas()

-- select * from Computadora


-- b) Función que recibe por parámetro el Id_Usuario y retorna la información de la computadora que tiene asignada

create function F_ComputadoraUsuario(@usuario int)
returns @F_ComputadoraUsuario table (
			Id_Usuario int,
			Usuario varchar(100),
			Id_Computadora int,
			Tipo varchar(100),
			Descripcion varchar(100),
			Estado varchar(20),
			Id_Centro_Computo int)
begin
	declare @NombreUsuario varchar(100)
	
	select @NombreUsuario = Usuario.Nombre+' '+Usuario.Apellido1+' '+Usuario.Apellido2 from Usuario where Usuario.Id_Usuario=@usuario

	insert into @F_ComputadoraUsuario
		select Usuario.Id_Usuario, @NombreUsuario, Usuario.Id_Computadora, Tipo, Descripcion, Estado, Id_Centro_Computo 
		from Computadora join Usuario on Computadora.Id_Computadora = Usuario.Id_Computadora 
		where Usuario.Id_Usuario=@usuario;
		return
end
go

-- test
-- select * from dbo.F_ComputadoraUsuario(6)

-- select * from Computadora
-- select * from Usuario


--2. 4 Vistas
--2.1 Vista que muestra los principales datos de las computadoras asignadas a usuarios

create view Vw_computadoraUsuarios as
	select Id_Usuario, 
	Nombre,
	Apellido1,
	Apellido2,
	Correo,
	Computadora.Id_Computadora,
	Tipo,
	Descripcion,
	Estado
	from Computadora join Usuario on Computadora.Id_Computadora = Usuario.Id_Computadora
go

-- test
-- select * from Vw_computadoraUsuarios

-- select * from Computadora
-- select * from Usuario

--2.2 Vista que muestra el estado, ubicación, y el id y nombre del centro de computo asignados al servidor

create view Vw_servidorCentroComputo as
	select Servidor.Id_Servidor,
	Estado as Estado_Servidor,
	Ubicacion as Ubicacion_Servidor, 
	Servidor.Id_Centro_Computo,
	Centro_Computo.Nombre as Nombre_Centro_Computo
	from Servidor join Centro_Computo on Servidor.Id_Centro_Computo = Centro_Computo.Id_Centro_Computo
go

-- test
-- select * from Vw_servidorCentroComputo

-- select * from Servidor
-- select * from Centro_Computo

--2.3 Vista personalizada de usuarios sin información de contacto

create view Vw_usuarioSensible as
	select Id_Usuario,
	Nombre,
	Apellido1,
	Apellido2,
	Id_Computadora
	from Usuario;
go

-- test
-- select * from Vw_usuarioSensible

-- select * from Usuario

--2.4 Vista personalizada de servidores con un estado diferente a operativo

create view Vw_servidoresNoOperativos as
	select Servidor.Id_Servidor,
	Descripcion,
	Estado,
	Ubicacion, 
	Servidor.Id_Centro_Computo
	from Servidor where Estado != 'Operativo'
go

-- test
-- select * from Vw_servidoresNoOperativos

-- select * from Servidor


--3. 4 Procedimientos Almacenados.
--3.1 Procedimiento almacenado que inserta un registro en la tabla Usuario, recibe por parámetro todos los campos correspondientes (nombre, apellido1, apellido2, correo, telefono, id_computadora).

create procedure Pa_InsertarUsuario
@Nombre varchar(100),
@Apellido1 varchar(100),
@Apellido2 varchar(100),
@Correo varchar(100),
@Telefono bigint,
@Id_Computadora int
as
begin
	insert into Usuario(Nombre, Apellido1, Apellido2, Correo, Telefono, Id_Computadora)
	values (@Nombre, @Apellido1, @Apellido2, @Correo, @Telefono, @Id_Computadora)
end
go

-- test
-- dbo.Pa_InsertarUsuario 'Eliza', 'Muñoz', 'Ramirez', 'elizamunoz', 50683025510, 14

-- select * from Usuario


--3.2 Procedimiento almacenado que inserta un registro en la tabla Computadora, recibe por parámetro todos los campos correspondientes (nombre, apellido1, apellido2, correo, telefono, id_computadora).

create procedure Pa_InsertarComputadora
@Tipo varchar(100),
@Descripcion varchar(100),
@NumeroSerie varchar(100),
@SistemaOperativo varchar(100),
@Estado varchar(20),
@Id_Centro_Computo int
as
begin
	insert into Computadora(Tipo, Descripcion, NumeroSerie, SistemaOperativo, Estado, Id_Centro_Computo)
	values (@Tipo, @Descripcion, @NumeroSerie, @SistemaOperativo, @Estado, @Id_Centro_Computo)
end
go

-- test
-- dbo.Pa_InsertarComputadora 'Escritorio', 'iMac', 'EIDNSG34hI4', 'macOS', 'Operativo', 1

-- select * from Computadora


--3.3 Procedimiento almacenado que cambia el estado de una computadora según el parámetro de entrada, recibe por parámetro el Id_Computadora y el nuevo estado.
-- Simbología a utilizar para estado:
--		1= Operativo
--		2= Fuera de servicio
--		3= Uso limitado
--		4= Perdido

create procedure Pa_ComputadoraEstado
@Id_Computadora int,
@Estado int
as
begin
	if @Estado=1
		update Computadora
		set Estado = 'Operativo'
		where Computadora.Id_Computadora=@Id_Computadora
	if @Estado=2
		update Computadora
		set Estado = 'Fuera de servicio'
		where Computadora.Id_Computadora=@Id_Computadora
	if @Estado=3
		update Computadora
		set Estado = 'Uso limitado'
		where Computadora.Id_Computadora=@Id_Computadora
	if @Estado=4
		update Computadora
		set Estado = 'Perdido'
		where Computadora.Id_Computadora=@Id_Computadora
end
go

-- test
-- dbo.Pa_ComputadoraEstado 8, 4

-- select * from Computadora


--3.4 Procedimiento almacenado que asigna una computadora a un usuario, recibe por parámetro Id_Usuario y Id_Computadora

create procedure Pa_ComputadoraUsuario
@Id_Usuario int,
@Id_Computadora int
as
begin
	update Usuario
	set Usuario.Id_Computadora = @Id_Computadora
	where Usuario.Id_Usuario=@Id_Usuario
end
go

-- test
-- dbo.Pa_ComputadoraUsuario 3, 14

-- select * from Usuario
-- select * from Computadora

