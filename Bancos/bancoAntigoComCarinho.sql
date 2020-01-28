-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 09-Nov-2019 às 21:27
-- Versão do servidor: 5.7.26-log
-- versão do PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tcm`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE `agenda` (
  `cod_agenda` int(11) NOT NULL,
  `horario` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `agenda`
--

INSERT INTO `agenda` (`cod_agenda`, `horario`) VALUES
(1, '2019-10-28 05:29:16'),
(2, '2019-10-28 11:17:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `cod_carrinho` int(11) NOT NULL,
  `cliente_carrinho` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `carrinho`
--

INSERT INTO `carrinho` (`cod_carrinho`, `cliente_carrinho`) VALUES
(2, 1),
(3, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cod_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(50) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `cpf` varchar(12) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `nivel` int(1) NOT NULL,
  `dta_nasc` date NOT NULL,
  `dta_acesso` datetime NOT NULL,
  `fotoUsuario` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cod_cliente`, `nome_cliente`, `sobrenome`, `cpf`, `senha`, `nivel`, `dta_nasc`, `dta_acesso`, `fotoUsuario`, `email`) VALUES
(1, 'andrezin', 'silva', '06743611131', '1234', 1, '2019-10-09', '2019-10-30 08:25:15', 'imagem.png', 'andresilvay6@gmail.com'),
(2, 'juliana', 'nascimento', '79634432244', '12345', 2, '2019-10-09', '2019-10-23 09:11:37', 'foto.png', 'juliana@gmail.com'),
(3, 'alvaro', 'lima', '345345322266', '12345678', 1, '2019-10-09', '2019-10-17 10:44:21', 'fotografia.jpeg', 'alvarooliveira@gmail.com'),
(4, 'pedro', 'viera', '45632611166', '123455', 2, '2019-10-09', '2019-10-25 13:54:29', 'imagemn.jpg', 'pedro@gmail.com'),
(5, 'ana', 'ferreira', '44466677798', '676688', 2, '2019-10-18', '2019-10-30 21:55:47', 'iihhgambne.png', 'ana@gmail.com'),
(6, 'laura', 'prado', '22211109789', '09876', 2, '2019-10-02', '2019-10-30 16:29:19', 'laura@gmail.com', 'laura@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE `comentario` (
  `cliente` int(11) NOT NULL,
  `cod_comentario` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `data_cometario` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `comentario`
--

INSERT INTO `comentario` (`cliente`, `cod_comentario`, `comentario`, `data_cometario`) VALUES
(1, 1, 'o plano de lipo e otimo adoreiii', '2019-10-30 06:24:00'),
(1, 2, 'otimo muito bom ', '2019-10-28 13:11:00'),
(1, 3, 'gostei da limpeza me deixou otima', '2019-10-18 14:19:00'),
(2, 4, 'parabens', '2019-10-11 00:00:00'),
(3, 5, 'adorei otimo procedimento', '2019-10-24 11:14:29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `cod_compra` int(11) NOT NULL,
  `carrinho` int(11) NOT NULL,
  `data_compra` datetime NOT NULL,
  `forma_pagamento` int(11) NOT NULL,
  `valor_compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `compra`
--

INSERT INTO `compra` (`cod_compra`, `carrinho`, `data_compra`, `forma_pagamento`, `valor_compra`) VALUES
(3, 1, '2019-10-16 08:12:31', 2, 1500),
(4, 2, '2019-10-18 04:26:00', 1, 3800),
(5, 1, '2019-10-09 10:14:00', 3, 50);

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `cod_departamento` int(11) NOT NULL,
  `nome_departamento` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`cod_departamento`, `nome_departamento`) VALUES
(1, 'plastica'),
(2, 'massagem');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_cliente`
--

CREATE TABLE `endereco_cliente` (
  `cliente` int(11) NOT NULL,
  `cod_endereco` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `tipo_de_logradouro` varchar(7) NOT NULL,
  `numero` mediumint(9) NOT NULL,
  `cep` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `endereco_cliente`
--

INSERT INTO `endereco_cliente` (`cliente`, `cod_endereco`, `estado`, `cidade`, `logradouro`, `tipo_de_logradouro`, `numero`, `cep`) VALUES
(1, 3, 'são paulo', 'São Paulo', 'monte alegre do sul', 'rua', 77, '02859080'),
(2, 4, 'rio de janeiro', 'rio de janerio', 'monte azul', 'avenida', 1134, '06844780'),
(3, 5, 'bahia', 'porto de galinhas', 'logo ali', 'travesa', 34, '45633000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_funcionario`
--

CREATE TABLE `endereco_funcionario` (
  `funcionario` int(11) NOT NULL,
  `cod_endereco_funcionario` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `tipo_de_logradouro` varchar(8) NOT NULL,
  `numero` mediumint(9) NOT NULL,
  `cep` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `endereco_funcionario`
--

INSERT INTO `endereco_funcionario` (`funcionario`, `cod_endereco_funcionario`, `estado`, `cidade`, `logradouro`, `tipo_de_logradouro`, `numero`, `cep`) VALUES
(1, 1, 'são paulo', 'São Paulo', 'mario peixoto', 'rua', 543, '45633000'),
(2, 2, 'são paulo', 'são paulo', 'monte palado', 'avenida', 332, '06844780');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `cod_funcionario` int(11) NOT NULL,
  `departamento` int(11) NOT NULL,
  `nome_funcionario` varchar(30) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  `inicio_carga_horaria` time NOT NULL,
  `final_carga_horaria` time NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `email` varchar(50) NOT NULL,
  `descricao_funcionario` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`cod_funcionario`, `departamento`, `nome_funcionario`, `cargo`, `inicio_carga_horaria`, `final_carga_horaria`, `salario`, `email`, `descricao_funcionario`) VALUES
(1, 1, 'jose', 'indefinido', '47:38:12', '60:17:41', '1500.00', 'jose@gmail.com', 'funcionario graduado'),
(2, 1, 'cleber', 'limpar', '09:00:00', '18:15:08', '3000.00', 'cleber@gmail.com', 'funcionario com tres anos de esperiencia\r\n');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_carrinho`
--

CREATE TABLE `item_carrinho` (
  `cod_item` int(11) NOT NULL,
  `plano` int(11) NOT NULL,
  `carrinho` int(11) NOT NULL,
  `qtd` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `item_carrinho`
--

INSERT INTO `item_carrinho` (`cod_item`, `plano`, `carrinho`, `qtd`) VALUES
(1, 6, 1, 1),
(2, 7, 1, 2),
(3, 7, 2, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `cod_pagamento` int(11) NOT NULL,
  `compra` int(11) NOT NULL,
  `situacao` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`cod_pagamento`, `compra`, `situacao`) VALUES
(1, 3, 'aguardando'),
(2, 4, 'pago');

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano`
--

CREATE TABLE `plano` (
  `cod_plano` int(11) NOT NULL,
  `agenda` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `nome_plano` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `promocao` decimal(10,2) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `plano`
--

INSERT INTO `plano` (`cod_plano`, `agenda`, `funcionario`, `nome_plano`, `valor`, `promocao`, `descricao`) VALUES
(6, 1, 1, 'limpeza', '479.00', '100.00', 'otimo plano'),
(7, 2, 2, 'lipo', '10000.00', '1000.00', 'otimo para tirar gordura');

-- --------------------------------------------------------

--
-- Estrutura da tabela `relacionamento_comentario_plano`
--

CREATE TABLE `relacionamento_comentario_plano` (
  `cod_plano_plano` int(11) NOT NULL,
  `cod_comentario_comentario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_cliente`
--

CREATE TABLE `telefone_cliente` (
  `cliente` int(11) NOT NULL,
  `cod_telefone` int(11) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `tipo_de_telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `telefone_cliente`
--

INSERT INTO `telefone_cliente` (`cliente`, `cod_telefone`, `telefone`, `tipo_de_telefone`) VALUES
(1, 1, '11950918423', 'celular'),
(1, 2, '1139767145', 'telefone'),
(2, 3, '1134567822', 'telefone'),
(2, 4, '98679996956', 'celular'),
(3, 5, '1139565434', 'telefone'),
(3, 6, '11945363678', 'celular');

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_funcionario`
--

CREATE TABLE `telefone_funcionario` (
  `funcionario` int(11) NOT NULL,
  `cod_telefone_funcionario` int(11) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `tipo_de_telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `telefone_funcionario`
--

INSERT INTO `telefone_funcionario` (`funcionario`, `cod_telefone_funcionario`, `telefone`, `tipo_de_telefone`) VALUES
(1, 1, '11945362712', 'celular'),
(1, 2, '1139767145', 'telefone'),
(2, 3, '11987657690', 'celular'),
(2, 4, '1123456789', 'telefone');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_forma`
--

CREATE TABLE `tipo_forma` (
  `cod_tipo_forma` int(11) NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_forma`
--

INSERT INTO `tipo_forma` (`cod_tipo_forma`, `forma_pagamento`) VALUES
(1, 'boleto'),
(2, 'cartao'),
(3, 'tranferencia');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`cod_agenda`);

--
-- Índices para tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`cod_carrinho`) USING BTREE,
  ADD KEY `cliente_carrinho` (`cliente_carrinho`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Índices para tabela `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`cod_comentario`) USING BTREE,
  ADD KEY `cliente` (`cliente`);

--
-- Índices para tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`cod_compra`) USING BTREE,
  ADD KEY `carrinho` (`carrinho`) USING BTREE,
  ADD KEY `forma_pagamento` (`forma_pagamento`);

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`cod_departamento`);

--
-- Índices para tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD PRIMARY KEY (`cod_endereco`,`cliente`) USING BTREE,
  ADD UNIQUE KEY `cliente_2` (`cliente`),
  ADD KEY `cliente` (`cliente`);

--
-- Índices para tabela `endereco_funcionario`
--
ALTER TABLE `endereco_funcionario`
  ADD PRIMARY KEY (`cod_endereco_funcionario`,`funcionario`) USING BTREE,
  ADD UNIQUE KEY `funcionario_2` (`funcionario`),
  ADD KEY `funcionario` (`funcionario`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`cod_funcionario`,`departamento`) USING BTREE,
  ADD KEY `departamento` (`departamento`);

--
-- Índices para tabela `item_carrinho`
--
ALTER TABLE `item_carrinho`
  ADD PRIMARY KEY (`cod_item`,`plano`,`carrinho`) USING BTREE,
  ADD KEY `plano` (`plano`),
  ADD KEY `carrinho` (`carrinho`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`cod_pagamento`),
  ADD KEY `compra` (`compra`);

--
-- Índices para tabela `plano`
--
ALTER TABLE `plano`
  ADD PRIMARY KEY (`cod_plano`,`agenda`) USING BTREE,
  ADD KEY `agenda` (`agenda`),
  ADD KEY `funcionario` (`funcionario`);

--
-- Índices para tabela `relacionamento_comentario_plano`
--
ALTER TABLE `relacionamento_comentario_plano`
  ADD PRIMARY KEY (`cod_plano_plano`,`cod_comentario_comentario`) USING BTREE,
  ADD KEY `cod_plano_plano` (`cod_plano_plano`),
  ADD KEY `cod_comentario_comentario` (`cod_comentario_comentario`);

--
-- Índices para tabela `telefone_cliente`
--
ALTER TABLE `telefone_cliente`
  ADD PRIMARY KEY (`cod_telefone`,`cliente`) USING BTREE,
  ADD KEY `cliente` (`cliente`);

--
-- Índices para tabela `telefone_funcionario`
--
ALTER TABLE `telefone_funcionario`
  ADD PRIMARY KEY (`cod_telefone_funcionario`,`funcionario`) USING BTREE,
  ADD KEY `funcionario` (`funcionario`);

--
-- Índices para tabela `tipo_forma`
--
ALTER TABLE `tipo_forma`
  ADD PRIMARY KEY (`cod_tipo_forma`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda`
--
ALTER TABLE `agenda`
  MODIFY `cod_agenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `cod_carrinho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cod_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `comentario`
--
ALTER TABLE `comentario`
  MODIFY `cod_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `compra`
--
ALTER TABLE `compra`
  MODIFY `cod_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `cod_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  MODIFY `cod_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `endereco_funcionario`
--
ALTER TABLE `endereco_funcionario`
  MODIFY `cod_endereco_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `cod_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `item_carrinho`
--
ALTER TABLE `item_carrinho`
  MODIFY `cod_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `cod_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `plano`
--
ALTER TABLE `plano`
  MODIFY `cod_plano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `telefone_cliente`
--
ALTER TABLE `telefone_cliente`
  MODIFY `cod_telefone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `telefone_funcionario`
--
ALTER TABLE `telefone_funcionario`
  MODIFY `cod_telefone_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipo_forma`
--
ALTER TABLE `tipo_forma`
  MODIFY `cod_tipo_forma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `fk_cliente_carrinho` FOREIGN KEY (`cliente_carrinho`) REFERENCES `cliente` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comentario_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_compra_carrinho` FOREIGN KEY (`carrinho`) REFERENCES `carrinho` (`cod_carrinho`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_compra_forma` FOREIGN KEY (`forma_pagamento`) REFERENCES `tipo_forma` (`cod_tipo_forma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD CONSTRAINT `fk_endereco_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `endereco_funcionario`
--
ALTER TABLE `endereco_funcionario`
  ADD CONSTRAINT `fk_endereco_funcionario` FOREIGN KEY (`funcionario`) REFERENCES `funcionario` (`cod_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_funcionario_departamento` FOREIGN KEY (`departamento`) REFERENCES `departamento` (`cod_departamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `item_carrinho`
--
ALTER TABLE `item_carrinho`
  ADD CONSTRAINT `fk_item_carrinho` FOREIGN KEY (`carrinho`) REFERENCES `carrinho` (`cod_carrinho`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_item_plano` FOREIGN KEY (`plano`) REFERENCES `plano` (`cod_plano`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_pagamento` FOREIGN KEY (`compra`) REFERENCES `compra` (`cod_compra`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `plano`
--
ALTER TABLE `plano`
  ADD CONSTRAINT `fk_plano_agenda` FOREIGN KEY (`agenda`) REFERENCES `agenda` (`cod_agenda`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_plano_funcionario` FOREIGN KEY (`funcionario`) REFERENCES `funcionario` (`cod_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `relacionamento_comentario_plano`
--
ALTER TABLE `relacionamento_comentario_plano`
  ADD CONSTRAINT `fk_comentario_associacao` FOREIGN KEY (`cod_comentario_comentario`) REFERENCES `comentario` (`cod_comentario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_plano_associacao` FOREIGN KEY (`cod_plano_plano`) REFERENCES `plano` (`cod_plano`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `telefone_cliente`
--
ALTER TABLE `telefone_cliente`
  ADD CONSTRAINT `fk_telefone_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `telefone_funcionario`
--
ALTER TABLE `telefone_funcionario`
  ADD CONSTRAINT `fk_telefone_funcionario` FOREIGN KEY (`funcionario`) REFERENCES `funcionario` (`cod_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
