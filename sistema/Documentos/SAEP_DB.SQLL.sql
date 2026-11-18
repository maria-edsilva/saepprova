CREATE DATABASE [ClinicaVetSimples];
GO
USE [ClinicaVetSimples];
GO

USE [ClinicaVetSimples]
GO

/****** Object:  Table [dbo].[Usuarios]    Script Date: 16/11/2026 10:52:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[SenhaHash] [nvarchar](max) NOT NULL,
	[Perfil] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Tutores]    Script Date: 16/11/2026 10:52:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tutores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](120) NOT NULL,
	[CpfCriptografado] [nvarchar](max) NOT NULL,
	[Telefone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Tutores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


USE [ClinicaVetSimples]
GO


/****** Object:  Table [dbo].[Pets]    Script Date: 16/11/2026 10:52:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](80) NOT NULL,
	[Especie] [nvarchar](50) NOT NULL,
	[Raca] [nvarchar](80) NULL,
	[DataNascimento] [datetime2](7) NULL,
	[TutorId] [int] NOT NULL,
 CONSTRAINT [PK_Pets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Pets]  WITH CHECK ADD  CONSTRAINT [FK_Pets_Tutores_TutorId] FOREIGN KEY([TutorId])
REFERENCES [dbo].[Tutores] ([Id])
GO

ALTER TABLE [dbo].[Pets] CHECK CONSTRAINT [FK_Pets_Tutores_TutorId]
GO


USE [ClinicaVetSimples]
GO



/****** Object:  Table [dbo].[Agendamentos]    Script Date: 16/11/2026 10:50:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Agendamentos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime2](7) NOT NULL,
	[Motivo] [nvarchar](200) NOT NULL,
	[Status] [nvarchar](30) NOT NULL,
	[TutorId] [int] NOT NULL,
	[PetId] [int] NOT NULL,
 CONSTRAINT [PK_Agendamentos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Agendamentos]  WITH CHECK ADD  CONSTRAINT [FK_Agendamentos_Pets_PetId] FOREIGN KEY([PetId])
REFERENCES [dbo].[Pets] ([Id])
GO

ALTER TABLE [dbo].[Agendamentos] CHECK CONSTRAINT [FK_Agendamentos_Pets_PetId]
GO

ALTER TABLE [dbo].[Agendamentos]  WITH CHECK ADD  CONSTRAINT [FK_Agendamentos_Tutores_TutorId] FOREIGN KEY([TutorId])
REFERENCES [dbo].[Tutores] ([Id])
GO

ALTER TABLE [dbo].[Agendamentos] CHECK CONSTRAINT [FK_Agendamentos_Tutores_TutorId]
GO


USE [ClinicaVetSimples]
GO

INSERT INTO Usuarios (Nome, Email, SenhaHash, Perfil) VALUES ('Administrador', 'admin@clinica.com', '$2a$11$eOvCsQoVzlidXZHAVesPlujck25G2hboOYkuO.tZRNvCRnOrd1xIq', 'Administrador');
INSERT INTO Usuarios (Nome, Email, SenhaHash, Perfil) VALUES ('Ana Recepção', 'ana@clinica.com', '$2a$11$TCYvKTKhjtgpY42CbgMuZuTTE8hIQhlTki767Pw3b59uaCKWHJ/ki', 'Usuario');
INSERT INTO Usuarios (Nome, Email, SenhaHash, Perfil) VALUES ('Carlos Recepção', 'carlos@clinica.com', '$2a$11$TxiYTyHNHNr.nzYD03qdwOAKFTY9YzfluB.19sowvI8wmMasFMd9e', 'Usuario');

INSERT INTO Tutores (Nome, CpfCriptografado, Telefone, Email) VALUES ('João Silva', 'CfDJ8M2seAtAqd1Kvg2CxcmiKerwa71PeASpKH_fnKxdP5-56lcDfJdtlBN2QApzua0mu9fW6KEgawmXaqfM65PdxgySE5l7iYDTTvDQSGmnOf3GbaqNkqccxA8TWJerqASc4Q', '54999990001', 'joao@email.com');
INSERT INTO Tutores (Nome, CpfCriptografado, Telefone, Email) VALUES ('Maria Souza', 'CfDJ8M2seAtAqd1Kvg2CxcmiKeoUGSXjpshf3uWSsQcdpiki77UQSwmFh_Yzpe9zh_eDdaRiGoIp8LK2yTP4e2qUCdH_59nFvL-u98UZhRGwywS2DOYsvU-h35SMvjm50FUQPQ', '54999990002', 'maria@email.com');
INSERT INTO Tutores (Nome, CpfCriptografado, Telefone, Email) VALUES ('Pedro Lima', 'CfDJ8M2seAtAqd1Kvg2CxcmiKepYAkC9ZKvjUovSGPDb7bMKrWienTiIDOg8S5q4H6uiYjX492j99UpBU0LdhJ0WAqXw-rEIHA0g0gH4LV6UKhpcqOcfhH89_XovRRWCQUodfg', '54999990003', 'pedro@email.com');
INSERT INTO Tutores (Nome, CpfCriptografado, Telefone, Email) VALUES ('Vanderléia', 'CfDJ8M2seAtAqd1Kvg2CxcmiKepl2wyafuk1YcW-uJBt6UCttXzvynhlkpARXt8lTar19aobtK9Xh1nWUSwIEtw8iWGJePRz1HjRYMoGhBxKzRhnzX6Txzqdn16gAx9JcaCerA', '54999990123', 'vanvan@gmail.com');
INSERT INTO Tutores (Nome, CpfCriptografado, Telefone, Email) VALUES ('maria eduarda', 'CfDJ8IjllfOFbVJHrkKMfL7ST7CnWJK5kB72eJ9c_vaGwxTb9cP7j713G-n1NoB7eBTa_Jzu4bYzPYaeWiILDEwACfbpmR6EqrUbjCvW23dklrnE2BwRGkX7uMXsZkEf8jIa9A', '54991763375', 'admin@clinica.com');
INSERT INTO Tutores (Nome, CpfCriptografado, Telefone, Email) VALUES ('maria eduarda', 'CfDJ8IjllfOFbVJHrkKMfL7ST7DABB4YJw5Dov2GQPb6wn56LRvBS1AyK7VF_L2kyyTYUWXtSpDj31ivnXrFXpX4S-UEHLRUkx2KG0tH2fIFfAOJE3o7YlplGK0pjU0YRkNGig', '54991763375', 'admin@clinica.com');


INSERT INTO Pets (Nome, Especie, Raca, DataNascimento, TutorId) VALUES ('Rex', 'Cachorro', 'Labrador', NULL, 1);
INSERT INTO Pets (Nome, Especie, Raca, DataNascimento, TutorId) VALUES ('Mia', 'Gato', 'Siamês', NULL, 2);
INSERT INTO Pets (Nome, Especie, Raca, DataNascimento, TutorId) VALUES ('Thor', 'Cachorro', 'SRD', NULL, 3);
INSERT INTO Pets (Nome, Especie, Raca, DataNascimento, TutorId) VALUES ('Po', 'Urso', 'Panda', '2024-06-14 00:00:00', 4);

INSERT INTO Agendamentos (DataHora, Motivo, Status, TutorId, PetId) VALUES ('2026-11-11 09:00:00', 'Vacinação', 'Agendado', 1, 1);
INSERT INTO Agendamentos (DataHora, Motivo, Status, TutorId, PetId) VALUES ('2026-11-12 14:00:00', 'Consulta', 'Agendado', 2, 2);
INSERT INTO Agendamentos (DataHora, Motivo, Status, TutorId, PetId) VALUES ('2026-11-13 10:00:00', 'Retorno', 'Agendado', 3, 3);
INSERT INTO Agendamentos (DataHora, Motivo, Status, TutorId, PetId) VALUES ('2026-11-11 12:00:23', 'Revisão', 'Agendado', 4, 4);