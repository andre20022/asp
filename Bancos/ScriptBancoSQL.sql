USE [tcmAtualizado]
GO
/****** Object:  Table [dbo].[tb_agenda]    Script Date: 30/11/2019 20:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_agenda](
	[agd_cod] [int] IDENTITY(1,1) NOT NULL,
	[agd_cliente] [int] NOT NULL,
	[agd_profissional] [int] NOT NULL,
	[agd_dta_servico] [datetime] NOT NULL,
	[agd_servico] [int] NOT NULL,
 CONSTRAINT [PK_tb_agenda] PRIMARY KEY CLUSTERED 
(
	[agd_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_agendamento]    Script Date: 30/11/2019 20:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_agendamento](
	[cod_agendamento] [int] IDENTITY(1,1) NOT NULL,
	[profissional] [int] NOT NULL,
	[cliente] [int] NOT NULL,
	[data] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_agendamento] PRIMARY KEY CLUSTERED 
(
	[cod_agendamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_caixa]    Script Date: 30/11/2019 20:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_caixa](
	[cxa_cod] [int] IDENTITY(1,1) NOT NULL,
	[cxa_entrada] [decimal](10, 2) NOT NULL,
	[cxa_saida] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_tb_caixa] PRIMARY KEY CLUSTERED 
(
	[cxa_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_categoria]    Script Date: 30/11/2019 20:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_categoria](
	[ctg_cod] [int] IDENTITY(1,1) NOT NULL,
	[ctg_nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_categoria] PRIMARY KEY CLUSTERED 
(
	[ctg_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_cliente]    Script Date: 30/11/2019 20:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_cliente](
	[cli_cod] [int] IDENTITY(1,1) NOT NULL,
	[cli_nome] [varchar](50) NOT NULL,
	[cli_cpf] [varchar](20) NOT NULL,
	[cli_email] [varchar](50) NOT NULL,
	[cli_telefone] [varchar](20) NOT NULL,
	[cli_cep] [varchar](9) NOT NULL,
	[cli_numero] [int] NOT NULL,
	[cli_estado] [varchar](50) NOT NULL,
	[cli_cidade] [varchar](50) NOT NULL,
	[cli_logradouro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_cliente] PRIMARY KEY CLUSTERED 
(
	[cli_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_estoque]    Script Date: 30/11/2019 20:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_estoque](
	[cod_esto] [int] NOT NULL,
	[estoque] [int] NOT NULL,
 CONSTRAINT [PK_tb_estoque] PRIMARY KEY CLUSTERED 
(
	[cod_esto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_funcionario]    Script Date: 30/11/2019 20:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_funcionario](
	[cod_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nome_usuario] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[senha] [varchar](50) NOT NULL,
	[fotoUsuario] [varchar](50) NOT NULL,
	[descricao] [varchar](100) NOT NULL,
	[sobrenome] [varchar](50) NOT NULL,
	[cargo] [varchar](50) NOT NULL,
	[cpf] [varchar](20) NOT NULL,
	[nivel] [varchar](2) NOT NULL,
 CONSTRAINT [PK_tb_funcoionario] PRIMARY KEY CLUSTERED 
(
	[cod_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_pagamento]    Script Date: 30/11/2019 20:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_pagamento](
	[pgt_cod] [int] IDENTITY(1,1) NOT NULL,
	[pgt_valor_total] [decimal](10, 2) NOT NULL,
	[pgt_servico] [varchar](50) NOT NULL,
	[pgt_forma_pagamento] [varchar](50) NOT NULL,
	[pgt_dta_emissao] [datetime] NOT NULL,
	[pgt_emissor] [int] NOT NULL,
	[pgt_cliente] [int] NOT NULL,
 CONSTRAINT [PK_tb_pagamento] PRIMARY KEY CLUSTERED 
(
	[pgt_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_produto]    Script Date: 30/11/2019 20:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_produto](
	[prd_cod] [int] IDENTITY(1,1) NOT NULL,
	[prd_nome] [varchar](50) NOT NULL,
	[prd_qtde] [int] NOT NULL,
	[prd_validade] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_produto] PRIMARY KEY CLUSTERED 
(
	[prd_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_servico]    Script Date: 30/11/2019 20:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_servico](
	[srv_cod] [int] IDENTITY(1,1) NOT NULL,
	[srv_nome] [varchar](50) NOT NULL,
	[srv_valor] [decimal](10, 2) NOT NULL,
	[srv_profissional] [int] NOT NULL,
	[descricao] [varchar](100) NULL,
 CONSTRAINT [PK_tb_servico] PRIMARY KEY CLUSTERED 
(
	[srv_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tb_agenda]  WITH CHECK ADD  CONSTRAINT [fk_agenda] FOREIGN KEY([agd_cliente])
REFERENCES [dbo].[tb_cliente] ([cli_cod])
GO
ALTER TABLE [dbo].[tb_agenda] CHECK CONSTRAINT [fk_agenda]
GO
ALTER TABLE [dbo].[tb_agenda]  WITH CHECK ADD  CONSTRAINT [fk_agenda_funcionario] FOREIGN KEY([agd_profissional])
REFERENCES [dbo].[tb_funcionario] ([cod_usuario])
GO
ALTER TABLE [dbo].[tb_agenda] CHECK CONSTRAINT [fk_agenda_funcionario]
GO
ALTER TABLE [dbo].[tb_agenda]  WITH CHECK ADD  CONSTRAINT [fk_agenda_servico] FOREIGN KEY([agd_servico])
REFERENCES [dbo].[tb_servico] ([srv_cod])
GO
ALTER TABLE [dbo].[tb_agenda] CHECK CONSTRAINT [fk_agenda_servico]
GO
ALTER TABLE [dbo].[tb_estoque]  WITH CHECK ADD  CONSTRAINT [fk_estoque] FOREIGN KEY([cod_esto])
REFERENCES [dbo].[tb_produto] ([prd_cod])
GO
ALTER TABLE [dbo].[tb_estoque] CHECK CONSTRAINT [fk_estoque]
GO
ALTER TABLE [dbo].[tb_pagamento]  WITH CHECK ADD  CONSTRAINT [fk_cliente] FOREIGN KEY([pgt_cliente])
REFERENCES [dbo].[tb_cliente] ([cli_cod])
GO
ALTER TABLE [dbo].[tb_pagamento] CHECK CONSTRAINT [fk_cliente]
GO
ALTER TABLE [dbo].[tb_pagamento]  WITH CHECK ADD  CONSTRAINT [fk_emissor] FOREIGN KEY([pgt_emissor])
REFERENCES [dbo].[tb_funcionario] ([cod_usuario])
GO
ALTER TABLE [dbo].[tb_pagamento] CHECK CONSTRAINT [fk_emissor]
GO
ALTER TABLE [dbo].[tb_servico]  WITH CHECK ADD  CONSTRAINT [fk_cliente_servico] FOREIGN KEY([srv_profissional])
REFERENCES [dbo].[tb_funcionario] ([cod_usuario])
GO
ALTER TABLE [dbo].[tb_servico] CHECK CONSTRAINT [fk_cliente_servico]
GO
