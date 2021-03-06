USE [DevChallenge]
/*
   miércoles, 29 de enero de 202009:08:40 a. m.
   User: Jorge de la Rosa
   Server: [development-db.incremental.solutions]
   Database: DevChallenge
   Application: Reto Desarrollador
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Delegaciones (
	Id            int NOT NULL,
	Ruta          varchar(50)   COLLATE Modern_Spanish_CI_AS NOT NULL,
	Entidad       varchar(50)   COLLATE Modern_Spanish_CI_AS NOT NULL,
	Zona          varchar(50)   COLLATE Modern_Spanish_CI_AS NOT NULL,
	CodDelegacion varchar(30)   COLLATE Modern_Spanish_CI_AS NULL,
	Delegacion    varchar(100)  COLLATE Modern_Spanish_CI_AS NULL
)  ON [PRIMARY]
GO
ALTER TABLE dbo.Delegaciones ADD CONSTRAINT
	PK_Delegaciones PRIMARY KEY CLUSTERED (
	  Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Delegaciones SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Delegaciones', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Delegaciones', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Delegaciones', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Transportistas (
	Id                int NOT NULL,
	Ruta              varchar(50)   COLLATE Modern_Spanish_CI_AS NOT NULL,
	IdDelegacion      int NULL,
	CodTransportista  varchar(30)   COLLATE Modern_Spanish_CI_AS NULL,
	Transportista     varchar(200)  COLLATE Modern_Spanish_CI_AS NULL,
	DirLinea1         varchar(250)  COLLATE Modern_Spanish_CI_AS NULL,
	DirLinea2         varchar(250)  COLLATE Modern_Spanish_CI_AS NULL,
	DirCP             varchar(10)   COLLATE Modern_Spanish_CI_AS NULL,
	Telefonos         varchar(200)  COLLATE Modern_Spanish_CI_AS NULL,
	ConfigManiobra    varchar(500)  COLLATE Modern_Spanish_CI_AS NULL
)  ON [PRIMARY]
GO
ALTER TABLE dbo.Transportistas ADD CONSTRAINT
	PK_Transportistas PRIMARY KEY CLUSTERED (
	  Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Transportistas ADD CONSTRAINT
	FK_Transportistas_Delegaciones FOREIGN KEY (
	  IdDelegacion
	) 
  REFERENCES dbo.Delegaciones	(
	  Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 	
GO
ALTER TABLE dbo.Transportistas SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Transportistas', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Transportistas', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Transportistas', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Productos (
	Id              int NOT NULL,
	Familia         varchar(50)   COLLATE Modern_Spanish_CI_AS NOT NULL,
	CodProducto     varchar(30)   COLLATE Modern_Spanish_CI_AS NULL,
	Producto        varchar(100)  COLLATE Modern_Spanish_CI_AS NULL,
	PrecioUnitario  money NULL,
	PzasPaquete     int NULL
)  ON [PRIMARY]
GO
ALTER TABLE dbo.Productos ADD CONSTRAINT
	PK_Productos PRIMARY KEY CLUSTERED (
	  Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Productos SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Productos', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Productos', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Productos', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Clientes	(
	Id              int NOT NULL,
	CodCliente      varchar(10)   COLLATE Modern_Spanish_CI_AS NULL,
	Cliente         varchar(100)  COLLATE Modern_Spanish_CI_AS NULL,
	TipoUbicacion   varchar(50)   COLLATE Modern_Spanish_CI_AS NOT NULL,
	DirLinea1       varchar(250)  COLLATE Modern_Spanish_CI_AS NULL,
	DirLinea2       varchar(250)  COLLATE Modern_Spanish_CI_AS NULL,
	DirLinea3       varchar(250)  COLLATE Modern_Spanish_CI_AS NULL,
	DirCP           varchar(10)   COLLATE Modern_Spanish_CI_AS NULL,
	Pais            varchar(50)   COLLATE Modern_Spanish_CI_AS NULL,
	IdTransportista int NULL,
	IdDelegacion    int NULL,
	Contacto        varchar(100)  COLLATE Modern_Spanish_CI_AS NULL,
	eMail           varchar(100)  COLLATE Modern_Spanish_CI_AS NULL,
	Telefono        varchar(30)   COLLATE Modern_Spanish_CI_AS NULL
)  ON [PRIMARY]
GO
ALTER TABLE dbo.Clientes ADD CONSTRAINT
	PK_Clientes PRIMARY KEY CLUSTERED (
	  Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.Clientes SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Clientes', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Clientes', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Clientes', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Pedidos (
	Id                  int NOT NULL,
	IdCliente           int NOT NULL,
	StatusPedido        varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	NumPedido           varchar(10) COLLATE Modern_Spanish_CI_AS NULL,
	FechaEntProduccion  datetime NULL,
	FechaEstimadaComp   datetime NULL,
	FechaCompletado     datetime NULL,
	FechaEntrega        datetime NULL,
	Ruta                varchar(50)   COLLATE Modern_Spanish_CI_AS NOT NULL,	
	VehiculoDist        varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
	TipoDirEnvio        varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	IdDelegacion        int NOT NULL,
	DirLinea1           varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
	DirLinea2           varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
	DirLinea3           varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
	DirCP               varchar(10) COLLATE Modern_Spanish_CI_AS NULL,
	IdTransportista     int NULL,
	TipoEmbarque        varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	UsuarioAlmacen      varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
	UsuarioDist         varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
	Vendedor            varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
	Comentarios         varchar(500) COLLATE Modern_Spanish_CI_AS NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Pedidos ADD CONSTRAINT
	PK_Pedidos PRIMARY KEY CLUSTERED (
	  Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Pedidos ADD CONSTRAINT
	FK_Pedidos_Clientes FOREIGN KEY	(
	  IdCliente
	) 
  REFERENCES dbo.Clientes	(
	Id
	) ON UPDATE  CASCADE 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Pedidos SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Pedidos', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Pedidos', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Pedidos', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Seguimiento_Pedidos (
	Id          int NOT NULL,
	IdPedido    int NOT NULL,
	Comentario  varchar(MAX) COLLATE Modern_Spanish_CI_AS NULL,
	Fecha       datetime NULL,
	Usuario     varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL
)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Seguimiento_Pedidos ADD CONSTRAINT
	PK_Seguimiento_Pedidos PRIMARY KEY CLUSTERED (
	  Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Seguimiento_Pedidos ADD CONSTRAINT
	FK_Seguimiento_Pedidos_Pedidos FOREIGN KEY	(
	  IdPedido
	) 
  REFERENCES dbo.Pedidos	(
	  Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Seguimiento_Pedidos SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Seguimiento_Pedidos', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Seguimiento_Pedidos', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Seguimiento_Pedidos', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Productos_Pedido (
	Id                int NOT NULL,
	IdPedido          int NOT NULL,
	IdProducto        int NOT NULL,
	CantidadRequerida float NULL,
	CantidadBackOrder float NULL,
	EnviadoABackOrder bit NULL,
	Eliminado         bit NULL
)  ON [PRIMARY]
GO
ALTER TABLE dbo.Productos_Pedido ADD CONSTRAINT
	PK_Productos_Pedido PRIMARY KEY CLUSTERED (
	  Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Productos_Pedido ADD CONSTRAINT
	FK_Productos_Pedido_Pedidos FOREIGN KEY	(
	  IdPedido
	) 
  REFERENCES dbo.Pedidos	(
	  Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Productos_Pedido ADD CONSTRAINT
	FK_Productos_Pedido_Productos FOREIGN KEY	(
	  IdProducto
	) 
  REFERENCES dbo.Productos	(
	  Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Productos_Pedido SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Productos_Pedido', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Productos_Pedido', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Productos_Pedido', 'Object', 'CONTROL') as Contr_Per 