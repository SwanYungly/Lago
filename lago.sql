-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/02/2024 às 20:07
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lago`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacaopendente`
--

CREATE TABLE `avaliacaopendente` (
  `idAvaliacao` varchar(42) NOT NULL,
  `usuario` int(11) NOT NULL,
  `evento` int(11) NOT NULL,
  `relacaoEvento` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `avaliacaopendente`
--

INSERT INTO `avaliacaopendente` (`idAvaliacao`, `usuario`, `evento`, `relacaoEvento`) VALUES
('A-11_33', 11, 33, '11_33'),
('A-9_6', 9, 6, '9_6');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nomeCategoria` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nomeCategoria`) VALUES
(1, 'Esportes'),
(2, 'Recreação'),
(3, 'jogo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarioevento`
--

CREATE TABLE `comentarioevento` (
  `idComentario` varchar(80) NOT NULL,
  `usuario` int(11) NOT NULL,
  `evento` int(11) NOT NULL,
  `relacaoEvento` varchar(40) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `ordem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `comentarioevento`
--

INSERT INTO `comentarioevento` (`idComentario`, `usuario`, `evento`, `relacaoEvento`, `comentario`, `ordem`) VALUES
('C1-11_33', 11, 33, '11_33', 'bom dia meu povo', 1),
('C1-1_6', 1, 6, '1_6', 'insano', 3),
('C1-2_6', 2, 6, '2_6', '#CSS', 1),
('C2-1_6', 1, 6, '1_6', 'ola', 4),
('C2-2_6', 2, 6, '2_6', 'muito foda', 2),
('C3-1_6', 1, 6, '1_6', 'incrivel', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `evento`
--

CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL,
  `terminadoManualmente` int(11) NOT NULL,
  `criadorEvento` int(11) NOT NULL,
  `nomeEvento` varchar(80) NOT NULL,
  `descricaoEvento` text NOT NULL,
  `qtdeParticipantes` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `CEPEvento` varchar(9) NOT NULL,
  `bairroEvento` varchar(80) NOT NULL,
  `enderecoEvento` varchar(100) NOT NULL,
  `numeroLugarEvento` int(10) NOT NULL,
  `complementoEvento` int(10) NOT NULL,
  `dataEvento` varchar(11) NOT NULL,
  `imagemEvento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `evento`
--

INSERT INTO `evento` (`idEvento`, `terminadoManualmente`, `criadorEvento`, `nomeEvento`, `descricaoEvento`, `qtdeParticipantes`, `idCategoria`, `CEPEvento`, `bairroEvento`, `enderecoEvento`, `numeroLugarEvento`, `complementoEvento`, `dataEvento`, `imagemEvento`) VALUES
(6, 0, 1, 'aaaa', 'aaaaaaa', 3, 1, '86046-430', 'Jardim Vilas Boas', 'Rua Ucrânia', 69, 420, '2024-02-29', '../img/imgEventos/idevento6_6.png'),
(32, 0, 1, 'Vôlei', 'Vamos jogar vôlei juntos! ', 14, 1, '22222-222', 'centro', 'Bandeirantes', 111, 3, '2024-02-29', '../img/imgEventos/bolavolei.png'),
(33, 0, 1, 'Partida de D&D com compromisso', 'preciso de pessoas comprometidas prontas para conseguir vivenciar essas coisas conosco.', 7, 3, '85020-400', 'Boqueirão', 'Rua Carlos Luz', 1790, 0, '2024-03-04', '../img/imgEventos/OIP.jpg'),
(34, 0, 11, 'Gincana na praça', 'Serão 5 partidas, sendo pega a pega, pique esconde, batata quente, cirandinha, pega bandeira.', 1, 2, '86026-110', 'Lago Igapó', 'Avenida Jorge Casoni', 0, 0, '2024-03-23', '../img/imgEventos/gettyimages-119704958_wide-7c310d1ed5ac9e27eed.webp'),
(35, 0, 11, 'partida de baska no zerão', 'precisamos de mais 8 pessoas para fecharmos um time.', 8, 1, '86020-400', 'Centro', 'Rua Pará', 1888, 0, '2024-03-30', '../img/imgEventos/baixados.jpg'),
(36, 0, 11, 'vamos no shopping ?', 'Vou fazer um rolê no shopping para conhecer novas pessoas, sou de outra cidade espero boas experências.', 6, 2, '86086-220', 'Catuai', 'Rua João Silveira de Camargo', 555, 0, '2024-03-16', '../img/imgEventos/R.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `relacaoevento`
--

CREATE TABLE `relacaoevento` (
  `idRelacao` varchar(40) NOT NULL,
  `usuario` int(11) NOT NULL,
  `evento` int(11) NOT NULL,
  `tipoUserRelation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `relacaoevento`
--

INSERT INTO `relacaoevento` (`idRelacao`, `usuario`, `evento`, `tipoUserRelation`) VALUES
('11_33', 11, 33, 0),
('11_34', 11, 34, 1),
('11_35', 11, 35, 1),
('11_36', 11, 36, 1),
('1_32', 1, 32, 1),
('1_33', 1, 33, 1),
('1_6', 1, 6, 1),
('2_6', 2, 6, 1),
('9_6', 9, 6, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUser` int(11) NOT NULL,
  `nomeUser` varchar(255) NOT NULL,
  `emailUser` varchar(255) NOT NULL,
  `senhaUser` varchar(255) NOT NULL,
  `fotoUser` varchar(255) NOT NULL,
  `bioUser` text NOT NULL,
  `cpfUser` varchar(15) NOT NULL,
  `dataNascUser` date NOT NULL,
  `aval1Estrela` int(11) NOT NULL,
  `aval2Estrela` int(11) NOT NULL,
  `aval3Estrela` int(11) NOT NULL,
  `aval4Estrela` int(11) NOT NULL,
  `aval5Estrela` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idUser`, `nomeUser`, `emailUser`, `senhaUser`, `fotoUser`, `bioUser`, `cpfUser`, `dataNascUser`, `aval1Estrela`, `aval2Estrela`, `aval3Estrela`, `aval4Estrela`, `aval5Estrela`) VALUES
(1, 'Victor', 'a@a.com', '$2y$10$4CvUT1/klxj6TxDdQjly5u9BReET8APKvDhyItXyBs8vFM9AAHOT2', '../img/perfil/1.png', 'amante da aventura e da descoberta. Explorador do mundo, seja nos livros ou nas trilhas da vida. Escritor em busca de inspiração em cada esquina. Apaixonado por histórias, viagens e novos desafios. 🌍✍️📚', '', '0000-00-00', 1, 10, 50, 401, 453),
(2, 'Gabriel Paduan', 'gp@gp.com', '$2y$10$/GFG7/MJwKJyTlZ6yGZUheT4GjFu5q86lQ7oHfOGCJYobH4c47ev2', '../img/perfil/vazio/blank-profile.jpg', '', '', '0000-00-00', 0, 5, 30, 300, 600),
(5, 'alo', 'opa@opa.com', '$2y$10$3Bc6VqqS5Hai9jBnLus/p.Jwfq06l9.Mli2EEWAs1QoDTKML4Xw7m', '../img/perfil/vazio/blank-profile.jpg', '', '', '0000-00-00', 5, 30, 90, 90, 30),
(6, 'Linguicius', 'linguicius@gmail.com', '$2y$10$GTtH4MpWYJKcjzJa/uXyN.GaUUmmAML/3yRBUlDZchZxI1cdd/kO.', '../img/perfil/vazio/blank-profile.jpg', '', '', '0000-00-00', 5, 20, 300, 150, 90),
(7, 'Altino', 'altino@gmail.com', '$2y$10$PSJnOgIroCf/1YiYofjdGOlugILwd7bpI/ca65AIoLychkH2/iuOy', '../img/perfil/vazio/blank-profile.jpg', '', '', '0000-00-00', 10, 90, 400, 60, 120),
(8, 'Russo', 'russolindo@gmail.com', '$2y$10$rg38VmYKRRtVPmtyjx2a2O2HxgcTUr7n4FyByrPzYSwjnA1XaULca', '../img/perfil/vazio/blank-profile.jpg', '', '', '0000-00-00', 500, 500, 500, 500, 500),
(9, 'Super Mano', 'mano@mano.com', '$2y$10$esvN457GwPkiyyszXD2AIe.FQy9cKmjraLT3AhZ7fp9dpYX.ncp/C', '../img/perfil/vazio/blank-profile.jpg', 'Super Mano', '', '2006-04-04', 0, 0, 1, 0, 1),
(10, 'nuno', 'nuno@gmail.com', '$2y$10$/6p9IzoK4e7HqOw.2xYcoOdbT1.RZAJ3KOo2LMQ6fzhE5G4xRgDIi', '../img/perfil/perfilDefault/perfil.jpg', '', '', '0000-00-00', 0, 0, 0, 0, 0),
(11, 'Roberto Gil', 'gil@gmail.com', '$2y$10$xM54hu/conK3j7sdpXuxM.K8pRQ1L6fI0eIx8p/SmGiCQOl.ZtRXS', '../img/perfil/perfilDefault/perfil.jpg', 'sou o gil, partiu ?', '121.219.989-85', '2005-03-21', 0, 0, 0, 0, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `avaliacaopendente`
--
ALTER TABLE `avaliacaopendente`
  ADD PRIMARY KEY (`idAvaliacao`),
  ADD KEY `FK_AvaliacaoUser` (`usuario`),
  ADD KEY `FK_AvaliacaoEvento` (`evento`),
  ADD KEY `FK_AvaliacaoRelacaoEvento` (`relacaoEvento`);

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Índices de tabela `comentarioevento`
--
ALTER TABLE `comentarioevento`
  ADD PRIMARY KEY (`idComentario`),
  ADD KEY `FK_UserComentario` (`usuario`),
  ADD KEY `FK_RelacaoEventoComentario` (`relacaoEvento`),
  ADD KEY `FK_EventoComentario` (`evento`);

--
-- Índices de tabela `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idEvento`),
  ADD KEY `FK_Categoria` (`idCategoria`),
  ADD KEY `FK_Criador` (`criadorEvento`);

--
-- Índices de tabela `relacaoevento`
--
ALTER TABLE `relacaoevento`
  ADD PRIMARY KEY (`idRelacao`),
  ADD KEY `FK_User` (`usuario`),
  ADD KEY `FK_evento` (`evento`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `evento`
--
ALTER TABLE `evento`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `avaliacaopendente`
--
ALTER TABLE `avaliacaopendente`
  ADD CONSTRAINT `FK_AvaliacaoEvento` FOREIGN KEY (`evento`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_AvaliacaoRelacaoEvento` FOREIGN KEY (`relacaoEvento`) REFERENCES `relacaoevento` (`idRelacao`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_AvaliacaoUser` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idUser`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `comentarioevento`
--
ALTER TABLE `comentarioevento`
  ADD CONSTRAINT `FK_EventoComentario` FOREIGN KEY (`evento`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RelacaoEventoComentario` FOREIGN KEY (`relacaoEvento`) REFERENCES `relacaoevento` (`idRelacao`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_UserComentario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idUser`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `FK_Categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Criador` FOREIGN KEY (`criadorEvento`) REFERENCES `usuario` (`idUser`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `relacaoevento`
--
ALTER TABLE `relacaoevento`
  ADD CONSTRAINT `FK_User` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idUser`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_evento` FOREIGN KEY (`evento`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
