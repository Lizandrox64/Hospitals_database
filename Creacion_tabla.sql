/* 

Created: 13/04/2024 

Modified: 29/04/2024 

Model: Microsoft SQL Server 2017 

Database: MS SQL Server 2017 

*/ 

 

 

 

-- Create tables section ------------------------------------------------- 

 

-- Table Contacto 

 

CREATE TABLE [Contacto] 

( 

 [id_contacto] Int IDENTITY(1,1) NOT NULL, 

 [Telefono] Varchar(50) NOT NULL, 

 [Correo] Varchar(50) NOT NULL, 

 [Comentarios] Text NOT NULL 

) 

go 

 

-- Add keys for table Contacto 

 

ALTER TABLE [Contacto] ADD CONSTRAINT [PK_Contacto] PRIMARY KEY ([id_contacto]) 

go 

 

-- Table Nacionalidad 

 

CREATE TABLE [Nacionalidad] 

( 

 [id_pais] Int IDENTITY(1,1) NOT NULL, 

 [nom_pais] Varchar(50) NOT NULL, 

 [id_comuna] Int NULL 

) 

go 

 

-- Create indexes for table Nacionalidad 

 

CREATE INDEX [IX_Relationship2] ON [Nacionalidad] ([id_comuna]) 

go 

 

-- Add keys for table Nacionalidad 

 

ALTER TABLE [Nacionalidad] ADD CONSTRAINT [PK_Nacionalidad] PRIMARY KEY ([id_pais]) 

go 

 

-- Table Cargo 

 

CREATE TABLE [Cargo] 

( 

 [id_cargo] Int IDENTITY(1,1) NOT NULL, 

 [nom_cargo] Varchar(50) NOT NULL, 

 [Descrip_cargo] Text NOT NULL 

) 

go 

 

-- Add keys for table Cargo 

 

ALTER TABLE [Cargo] ADD CONSTRAINT [PK_Cargo] PRIMARY KEY ([id_cargo]) 

go 

 

-- Table Direccion 

 

CREATE TABLE [Direccion] 

( 

 [id_direccion] Int NOT NULL, 

 [nom_calle] Varchar(50) NOT NULL, 

 [id_comuna] Int NULL 

) 

go 

 

-- Create indexes for table Direccion 

 

CREATE INDEX [IX_Relationship1] ON [Direccion] ([id_comuna]) 

go 

 

-- Add keys for table Direccion 

 

ALTER TABLE [Direccion] ADD CONSTRAINT [PK_Direccion] PRIMARY KEY ([id_direccion]) 

go 

 

-- Table Comuna 

 

CREATE TABLE [Comuna] 

( 

 [id_comuna] Int IDENTITY(1,1) NOT NULL, 

 [nom_comuna] Varchar(50) NOT NULL 

) 

go 

 

-- Add keys for table Comuna 

 

ALTER TABLE [Comuna] ADD CONSTRAINT [PK_Comuna] PRIMARY KEY ([id_comuna]) 

go 

 

-- Table Hospital 

 

CREATE TABLE [Hospital] 

( 

 [id_hopital] Int NOT NULL, 

 [nom_hospital] Varchar(50) NOT NULL 

) 

go 

 

-- Add keys for table Hospital 

 

ALTER TABLE [Hospital] ADD CONSTRAINT [PK_Hospital] PRIMARY KEY ([id_hopital]) 

go 

 

-- Table Especialidades_clinicas 

 

CREATE TABLE [Especialidades_clinicas] 

( 

 [id_especialidad] Int IDENTITY(1,1) NOT NULL, 

 [nom_especialidades] Varchar(50) NOT NULL 

) 

go 

 

-- Add keys for table Especialidades_clinicas 

 

ALTER TABLE [Especialidades_clinicas] ADD CONSTRAINT [PK_Especialidades_clinicas] PRIMARY KEY ([id_especialidad]) 

go 

 

-- Table Entity8 

 

CREATE TABLE [Entity8] 

( 

 [id_especialidad] Int NOT NULL 

) 

go 

 

-- Add keys for table Entity8 

 

ALTER TABLE [Entity8] ADD CONSTRAINT [PK_Entity8] PRIMARY KEY ([id_especialidad]) 

go 

 

-- Table id_hospital_especialidad 

 

CREATE TABLE [id_hospital_especialidad] 

( 

 [id_especialidad] Int NOT NULL 

) 

go 

 

-- Add keys for table id_hospital_especialidad 

 

ALTER TABLE [id_hospital_especialidad] ADD CONSTRAINT [PK_id_hospital_especialidad] PRIMARY KEY ([id_especialidad]) 

go 

 

-- Table Entity10 

 

CREATE TABLE [Entity10] 

( 

 [id_especialidad] Int NOT NULL, 

 [id_hopitar] Int NOT NULL 

) 

go 

 

-- Add keys for table Entity10 

 

ALTER TABLE [Entity10] ADD CONSTRAINT [PK_Entity10] PRIMARY KEY ([id_especialidad],[id_hopitar]) 

go 

 

-- Table Especialiadad_hospital 

 

CREATE TABLE [Especialiadad_hospital] 

( 

 [id_especialidad] Int NOT NULL, 

 [id_hopitar] Int NOT NULL 

) 

go 

 

-- Add keys for table Especialiadad_hospital 

 

ALTER TABLE [Especialiadad_hospital] ADD CONSTRAINT [PK_Especialiadad_hospital] PRIMARY KEY ([id_especialidad],[id_hopitar]) 

go 

 

-- Table Persona 

 

CREATE TABLE [Persona] 

( 

 [id_persona] Int IDENTITY(1,1) NOT NULL, 

 [rut] Varchar(20) NOT NULL, 

 [fecha_nacimiento] Date NOT NULL, 

 [nombre_1] Varchar(max) NOT NULL, 

 [nombre_2] Varchar(max) DEFAULT 50 NOT NULL, 

 [apellido_1] Varchar(50) NOT NULL, 

 [apellido_2] Varchar(50) NOT NULL 

) 

go 

 

-- Add keys for table Persona 

 

ALTER TABLE [Persona] ADD CONSTRAINT [PK_Persona] PRIMARY KEY ([id_persona]) 

go 

 

-- Table Pasiente 

 

CREATE TABLE [Pasiente] 

( 

 [id_pasiente] Int IDENTITY(1,1) NOT NULL, 

 [id_persona] Int NOT NULL, 

 [id_contacto] Int NOT NULL, 

 [id_direccion] Int NOT NULL, 

 [id_hopitar] Int NULL, 

 [id_atencion] Int NULL, 

 [id_examen] Int NOT NULL, 

 [id_previcion] Int NULL, 

 [id_diagonostico] Int NULL, 

 [id_tramiento] Int NULL, 

 [id_receta] Int NULL, 

 [id_pais] Int NULL, 

 [id_usuario] Int NOT NULL 

) 

go 

 

-- Create indexes for table Pasiente 

 

CREATE INDEX [IX_Relationship13] ON [Pasiente] ([id_contacto]) 

go 

 

CREATE INDEX [IX_Relationship21] ON [Pasiente] ([id_hopitar]) 

go 

 

CREATE INDEX [IX_Relationship25] ON [Pasiente] ([id_atencion],[id_diagonostico],[id_tramiento],[id_receta]) 

go 

 

CREATE INDEX [IX_Relationship31] ON [Pasiente] ([id_previcion]) 

go 

 

CREATE INDEX [IX_Relationship43] ON [Pasiente] ([id_pais]) 

go 

 

-- Add keys for table Pasiente 

 

ALTER TABLE [Pasiente] ADD CONSTRAINT [PK_Pasiente] PRIMARY KEY ([id_pasiente],[id_persona],[id_contacto],[id_direccion],[id_examen],[id_usuario]) 

go 

 

-- Table Personal 

 

CREATE TABLE [Personal] 

( 

 [id_personal] Int IDENTITY(1,1) NOT NULL, 

 [id_cargo] Int NOT NULL, 

 [id_persona] Int NULL, 

 [fecha_ingreso] Date NOT NULL, 

 [id_contacto] Int NOT NULL, 

 [id_especialidad] Int NULL, 

 [id_hopitar] Int NULL 

) 

go 

 

-- Create indexes for table Personal 

 

CREATE INDEX [IX_Relationship17] ON [Personal] ([id_persona]) 

go 

 

CREATE INDEX [IX_Relationship20] ON [Personal] ([id_especialidad]) 

go 

 

CREATE INDEX [IX_Relationship22] ON [Personal] ([id_hopitar]) 

go 

 

-- Add keys for table Personal 

 

ALTER TABLE [Personal] ADD CONSTRAINT [PK_Personal] PRIMARY KEY ([id_personal],[id_cargo],[id_contacto]) 

go 

 

-- Table Especialidad 

 

CREATE TABLE [Especialidad] 

( 

 [id_especialidad] Int IDENTITY(1,1) NOT NULL, 

 [nom_carrera] Varchar(50) NOT NULL, 

 [rut_profecional] Varchar(50) NOT NULL, 

 [comentario] Text NOT NULL, 

 [nom_especialidad] Varchar(50) NOT NULL 

) 

go 

 

-- Add keys for table Especialidad 

 

ALTER TABLE [Especialidad] ADD CONSTRAINT [PK_Especialidad] PRIMARY KEY ([id_especialidad]) 

go 

 

-- Table Atencion 

 

CREATE TABLE [Atencion] 

( 

 [id_atencion] Int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL, 

 [fecha] Datetime NOT NULL, 

 [Comentarios] Text NOT NULL, 

 [id_valor] Int NULL, 

 [id_personal] Int NULL, 

 [id_cargo] Int NULL, 

 [id_contacto] Int NULL, 

 [id_diagonostico] Int NOT NULL, 

 [id_tramiento] Int NOT NULL, 

 [id_receta] Int NOT NULL 

) 

go 

 

-- Create indexes for table Atencion 

 

CREATE INDEX [IX_Relationship24] ON [Atencion] ([id_valor]) 

go 

 

CREATE INDEX [IX_Relationship32] ON [Atencion] ([id_personal],[id_cargo],[id_contacto]) 

go 

 

-- Add keys for table Atencion 

 

ALTER TABLE [Atencion] ADD CONSTRAINT [PK_Atencion] PRIMARY KEY ([id_atencion],[id_diagonostico],[id_tramiento],[id_receta]) 

go 

 

-- Table Diagnostico 

 

CREATE TABLE [Diagnostico] 

( 

 [id_diagonostico] Int IDENTITY(1,1) NOT NULL, 

 [fecha] Date NOT NULL, 

 [nom_diagnostico] Char(1) NULL, 

 [id_tramiento] Int NOT NULL, 

 [id_receta] Int NOT NULL 

) 

go 

 

-- Add keys for table Diagnostico 

 

ALTER TABLE [Diagnostico] ADD CONSTRAINT [PK_Diagnostico] PRIMARY KEY ([id_diagonostico],[id_tramiento],[id_receta]) 

go 

 

-- Table Examenes 

 

CREATE TABLE [Examenes] 

( 

 [id_examen] Int IDENTITY(1,1) NOT NULL, 

 [nom_examen] Varchar(50) NULL, 

 [fecha] Date NULL, 

 [id_valor] Int NULL 

) 

go 

 

-- Create indexes for table Examenes 

 

CREATE INDEX [IX_Relationship30] ON [Examenes] ([id_valor]) 

go 

 

-- Add keys for table Examenes 

 

ALTER TABLE [Examenes] ADD CONSTRAINT [PK_Examenes] PRIMARY KEY ([id_examen]) 

go 

 

-- Table Valor 

 

CREATE   TABLE [Valor] (
    [id_valor] Int IDENTITY(1,1) NOT NULL,
    [fecha] Date NOT NULL,
    [descripcion] Text NOT NULL,
    [monto_dinero] Decimal(18, 2) NOT NULL
);

go 

 

-- Add keys for table Valor 

 

ALTER TABLE [Valor] ADD CONSTRAINT [PK_Valor] PRIMARY KEY ([id_valor]) 

go 

 

-- Table Previcion 

 

CREATE TABLE [Previcion] 

( 

 [id_previcion] Int NOT NULL, 

 [nombre_intitucion] Varchar(50) NOT NULL, 

 [tipo_previcion] Char(50) NOT NULL 

) 

go 

 

-- Add keys for table Previcion 

 

ALTER TABLE [Previcion] ADD CONSTRAINT [PK_Previcion] PRIMARY KEY ([id_previcion]) 

go 

 

-- Table Tratamiento 

 

CREATE TABLE [Tratamiento] 

( 

 [id_tramiento] Int NOT NULL, 

 [fecha] Date NOT NULL, 

 [descripcion] Text NOT NULL 

) 

go 

 

-- Add keys for table Tratamiento 

 

ALTER TABLE [Tratamiento] ADD CONSTRAINT [PK_Tratamiento] PRIMARY KEY ([id_tramiento]) 

go 

 

-- Table Receta 

 

CREATE TABLE [Receta] 

( 

 [id_receta] Int NOT NULL, 

 [fecha] Datetime2 NOT NULL, 

 [descripcion] Text NOT NULL 

) 

go 

 

-- Add keys for table Receta 

 

ALTER TABLE [Receta] ADD CONSTRAINT [PK_Receta] PRIMARY KEY ([id_receta]) 

go 

 

-- Table Historial 

 

CREATE TABLE [Historial] 

( 

 [Id_historial] Int IDENTITY(1,1) NOT NULL, 

 [descripcion] Text NOT NULL, 

 [id_grupo] Int NULL, 

 [id_alergia] Int NOT NULL, 

 [id_usuario] Int NULL 

) 

go 

 

-- Create indexes for table Historial 

 

CREATE INDEX [IX_Relationship32] ON [Historial] ([id_grupo]) 

go 

 

CREATE INDEX [IX_Relationship36] ON [Historial] ([id_usuario]) 

go 

 

-- Add keys for table Historial 

 

ALTER TABLE [Historial] ADD CONSTRAINT [PK_Historial] PRIMARY KEY ([Id_historial],[id_alergia]) 

go 

 

-- Table GrupoSangre 

 

CREATE TABLE [GrupoSangre] 

( 

 [id_grupo] Int IDENTITY(1,1) NOT NULL, 

 [nombre] Nvarchar(50) NOT NULL 

) 

go 

 

-- Add keys for table GrupoSangre 

 

ALTER TABLE [GrupoSangre] ADD CONSTRAINT [PK_GrupoSangre] PRIMARY KEY ([id_grupo]) 

go 

 

-- Table Alergia 

 

CREATE TABLE [Alergia] 

( 

 [id_alergia] Int NOT NULL, 

 [nombre] Varchar(50) NOT NULL, 

 [comentarios] Text NOT NULL 

) 

go 

 

-- Add keys for table Alergia 

 

ALTER TABLE [Alergia] ADD CONSTRAINT [PK_Alergia] PRIMARY KEY ([id_alergia]) 

go 

 

-- Table Empresa 

 

CREATE TABLE [Empresa] 

( 

 [id_empresa] Int NOT NULL, 

 [nom_empresa] Varchar(50) NOT NULL 

) 

go 

 

-- Add keys for table Empresa 

 

ALTER TABLE [Empresa] ADD CONSTRAINT [PK_Empresa] PRIMARY KEY ([id_empresa]) 

go 

 

-- Table Usuario 

 

CREATE TABLE [Usuario] 

( 

 [id_usuario] Int IDENTITY(1,1) NOT NULL, 

 [nom_usuario] Char(50) NOT NULL, 

 [id_empresa] Int NULL 

) 

go 

 

-- Create indexes for table Usuario 

 

CREATE INDEX [IX_Relationship35] ON [Usuario] ([id_empresa]) 

go 

 

-- Add keys for table Usuario 

 

ALTER TABLE [Usuario] ADD CONSTRAINT [PK_Usuario] PRIMARY KEY ([id_usuario]) 

go 

 

 

 

 

 

-- Create foreign keys (relationships) section -------------------------------------------------  

 

 

ALTER TABLE [Direccion] ADD CONSTRAINT [Relationship1] FOREIGN KEY ([id_comuna]) REFERENCES [Comuna] ([id_comuna]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Nacionalidad] ADD CONSTRAINT [Relationship2] FOREIGN KEY ([id_comuna]) REFERENCES [Comuna] ([id_comuna]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Entity8] ADD CONSTRAINT [Relationship4] FOREIGN KEY ([id_especialidad]) REFERENCES [Especialidades_clinicas] ([id_especialidad]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [id_hospital_especialidad] ADD CONSTRAINT [Relationship6] FOREIGN KEY ([id_especialidad]) REFERENCES [Especialidades_clinicas] ([id_especialidad]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Entity10] ADD CONSTRAINT [Relationship8] FOREIGN KEY ([id_especialidad]) REFERENCES [Especialidades_clinicas] ([id_especialidad]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Entity10] ADD CONSTRAINT [Relationship9] FOREIGN KEY ([id_hopitar]) REFERENCES [Hospital] ([id_hopital]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Especialiadad_hospital] ADD CONSTRAINT [Dispone de] FOREIGN KEY ([id_especialidad]) REFERENCES [Especialidades_clinicas] ([id_especialidad]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Especialiadad_hospital] ADD CONSTRAINT [Cuenta] FOREIGN KEY ([id_hopitar]) REFERENCES [Hospital] ([id_hopital]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Pasiente] ADD CONSTRAINT [Sus Datos son] FOREIGN KEY ([id_persona]) REFERENCES [Persona] ([id_persona]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Pasiente] ADD CONSTRAINT [Relationship13] FOREIGN KEY ([id_contacto]) REFERENCES [Contacto] ([id_contacto]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Pasiente] ADD CONSTRAINT [Se puede] FOREIGN KEY ([id_contacto]) REFERENCES [Contacto] ([id_contacto]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Pasiente] ADD CONSTRAINT [Vive] FOREIGN KEY ([id_direccion]) REFERENCES [Direccion] ([id_direccion]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Personal] ADD CONSTRAINT [funcion] FOREIGN KEY ([id_cargo]) REFERENCES [Cargo] ([id_cargo]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Personal] ADD CONSTRAINT [Sus Datos son_] FOREIGN KEY ([id_persona]) REFERENCES [Persona] ([id_persona]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Personal] ADD CONSTRAINT [Se puede encontrar] FOREIGN KEY ([id_contacto]) REFERENCES [Contacto] ([id_contacto]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Personal] ADD CONSTRAINT [Tiene_1] FOREIGN KEY ([id_especialidad]) REFERENCES [Especialidad] ([id_especialidad]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Pasiente] ADD CONSTRAINT [Se atiende] FOREIGN KEY ([id_hopitar]) REFERENCES [Hospital] ([id_hopital]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Personal] ADD CONSTRAINT [Trabaja] FOREIGN KEY ([id_hopitar]) REFERENCES [Hospital] ([id_hopital]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Atencion] ADD CONSTRAINT [Relationship24] FOREIGN KEY ([id_valor]) REFERENCES [Valor] ([id_valor]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Pasiente] ADD CONSTRAINT [Requiere] FOREIGN KEY ([id_atencion], [id_diagonostico], [id_tramiento], [id_receta]) REFERENCES [Atencion] ([id_atencion], [id_diagonostico], [id_tramiento], [id_receta]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Pasiente] ADD CONSTRAINT [Nesecita] FOREIGN KEY ([id_examen]) REFERENCES [Examenes] ([id_examen]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Examenes] ADD CONSTRAINT [tendria] FOREIGN KEY ([id_valor]) REFERENCES [Valor] ([id_valor]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Pasiente] ADD CONSTRAINT [Dispone] FOREIGN KEY ([id_previcion]) REFERENCES [Previcion] ([id_previcion]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Atencion] ADD CONSTRAINT [Atiende] FOREIGN KEY ([id_personal], [id_cargo], [id_contacto]) REFERENCES [Personal] ([id_personal], [id_cargo], [id_contacto]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Atencion] ADD CONSTRAINT [Se emite] FOREIGN KEY ([id_diagonostico], [id_tramiento], [id_receta]) REFERENCES [Diagnostico] ([id_diagonostico], [id_tramiento], [id_receta]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Diagnostico] ADD CONSTRAINT [Se recomienda] FOREIGN KEY ([id_tramiento]) REFERENCES [Tratamiento] ([id_tramiento]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Diagnostico] ADD CONSTRAINT [Tiene] FOREIGN KEY ([id_receta]) REFERENCES [Receta] ([id_receta]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Pasiente] ADD CONSTRAINT [Viene] FOREIGN KEY ([id_pais]) REFERENCES [Nacionalidad] ([id_pais]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Historial] ADD CONSTRAINT [que fack] FOREIGN KEY ([id_grupo]) REFERENCES [GrupoSangre] ([id_grupo]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Historial] ADD CONSTRAINT [posee] FOREIGN KEY ([id_alergia]) REFERENCES [Alergia] ([id_alergia]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Usuario] ADD CONSTRAINT [Relationship35] FOREIGN KEY ([id_empresa]) REFERENCES [Empresa] ([id_empresa]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Historial] ADD CONSTRAINT [Relationship36] FOREIGN KEY ([id_usuario]) REFERENCES [Usuario] ([id_usuario]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 

 

ALTER TABLE [Pasiente] ADD CONSTRAINT [Relationship38] FOREIGN KEY ([id_usuario]) REFERENCES [Usuario] ([id_usuario]) ON UPDATE NO ACTION ON DELETE NO ACTION 

go 

 