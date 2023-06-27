-- Criando database do projeto
create database ProjetoControleEstacionamento

-- Criando a primeira tabela do prijeto 
CREATE TABLE [dbo].[CarrosModelo](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Marca] [varchar](150) NULL,
    [Modelo] [varchar](150) NULL,
    [ano] [int] NULL,
 CONSTRAINT [PK_CarrosModelo] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Criando a segunda tabela do projeto
CREATE TABLE [dbo].[ControlePermanenciaCarros](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Placa] [varchar](10) NULL,
    [IdModelo] [int] NULL,
    [DataHoraEntrada] datetime NULL,
	[DataHoraSaida] datetime NULL,
 CONSTRAINT [PK_ControlePermanenciaCarros] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
 -- Alterando a coluna da tabela para NOTNULL
SELECT *
FROM ControlePermanenciaCarros
WHERE ISDATE(DataHoraEntrada) = 0

alter table ControlePermanenciaCarros alter column IdModelo int not null

alter table ControlePermanenciaCarros add constraint Relacionamento_CarrosModelo foreign key (IdModelo) references CarrosModelo (Id)


-- Mostar os dados das tabelas
SELECT * FROM CarrosModelo;

SELECT * FROM ControlePermanenciaCarros;