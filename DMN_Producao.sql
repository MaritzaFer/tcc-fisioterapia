-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 29-Jun-2016 às 20:04
-- Versão do servidor: 5.5.49-0+deb8u1
-- PHP Version: 5.6.20-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `DMN_Producao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_auxilio_social`
--

CREATE TABLE IF NOT EXISTS `tb_auxilio_social` (
  `codigo_auxilio_social` int(11) NOT NULL COMMENT 'Este campo codifica os auxílios sociais cadastrados.',
  `nome` varchar(45) NOT NULL COMMENT 'Este campo rotula um determinado auxílio social. Por exemplo: Programa Bolsa Família, Programa do Leite, Passe Livre, Tarifa Social de Energia Elétrica, PETI - Programa de Erradicação do Trabalho Infantil, BPC - Benefício de Prestação Continuada, Cartão do Idoso, Programas Habitacionais: Rural e Urbano - Minha Casa Minha Vida, PRONATEC - Programa Nacional de Ensino Técnico Profissionalizante, Donas(o) de Casa - Contribuição Previdenciária, Situação de Rua (Morador), Telefonia Popular, Tarifa Social da Água, Concurso Público - Isenção de Taxa Inscrição. ',
  `origem` varchar(45) DEFAULT NULL COMMENT 'Indica a fonte pagadora do auxílio. Por exemplo: Governo Federal, Estadual ou Municipal. É um campo não obrigatório.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena uma lista de possíveis auxílios recebidos pelo paciente ou por sua família.';

--
-- Extraindo dados da tabela `tb_auxilio_social`
--

INSERT INTO `tb_auxilio_social` (`codigo_auxilio_social`, `nome`, `origem`) VALUES
(1, 'Bolsa Família', 'Governo Federal'),
(2, 'Programa do leite', 'Governo Estadual'),
(3, 'Passe livre', 'Governo Estadual'),
(4, 'Programa Bolsa Família', 'Governo Federal'),
(5, 'Tarifa social de energia elétrica', 'Governo Federal'),
(6, 'Programa de erradicação do trabalho infantil', 'Governo Federal'),
(7, 'Benefício de Prestação Continuada', 'Governo Federal'),
(8, 'Cartão do Idoso', 'Governo Municipal'),
(9, 'Minha Casa Minha Vida', 'Governo Estadual'),
(10, 'PRONATEC', 'Governo Federal'),
(11, 'Donas(o) de Casa - Contribuição Previdenciári', 'Governo Federal'),
(12, 'Situação de rua (Morador)', 'Governo Federal'),
(13, 'Programas Habitacionais: Rural e Urbano', 'Governo Estadual'),
(14, 'Telefonia Popular', 'Governo Federal'),
(15, 'Tarifa Social da Água', 'Governo Federal'),
(16, 'Concurso Público - Isenção de Taxa Inscrição', 'Governo Federal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_avaliacao`
--

CREATE TABLE IF NOT EXISTS `tb_avaliacao` (
`codigo_avaliacao` int(11) NOT NULL COMMENT 'Este campo armazena um código que referencia a avaliação.',
  `codigo_avaliador` int(11) NOT NULL COMMENT 'Este campo representa, por meio de um código, o avaliador que está realizando a avaliação.',
  `codigo_paciente` int(11) NOT NULL COMMENT 'Este campo representa, por meio de um código, o paciente que está sendo avaliado.',
  `data` date NOT NULL COMMENT 'Este campo registra a data de quando ocorreu a avaliação.',
  `horario` time NOT NULL COMMENT 'Esete campo registra o horário em que ocorreu a avaliação.',
  `idade_motora` int(11) NOT NULL COMMENT 'Este campo indica a idade motora, em meses, do paciente que está sendo avaliado.',
  `idade_cronologica` int(11) NOT NULL COMMENT 'Este campo indica a idade cronológica, em meses, do paciente que está sendo avaliado.',
  `peso_atual` float DEFAULT NULL COMMENT 'Este campo indica o peso atual do paciente.',
  `comprimento_atual` float DEFAULT NULL COMMENT 'Este campo indica o comprimento atuial do paciente.',
  `perimetro_cefalico_atual` float DEFAULT NULL COMMENT 'Este campo indica o perímetro encefálico atual do paciente.',
  `amamentacao_exclusiva` tinyint(4) DEFAULT NULL COMMENT 'Este campo indica se o paciente está sendo alimentado exclusivamente com leite materno. Se sim, o valor é 1, senão é 0.',
  `atraso_dmt` int(11) DEFAULT NULL COMMENT 'Este campo indica o atraso em meses no desenvolvimento motor normal.	',
  `parecer` text COMMENT 'Este campo destina-se a descrição de um parecer por parte do avaliador.',
  `observacao` text COMMENT 'Este campo registra o atraso motor do paciente em meses.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena as avaliações realizadas.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_avaliador`
--

CREATE TABLE IF NOT EXISTS `tb_avaliador` (
  `codigo_avaliador` int(11) NOT NULL COMMENT 'Este campo armazena o codigo do avaliador (fisioterapeuta).',
  `codigo_privilegio` int(11) NOT NULL COMMENT 'Este campo armazena o código do privilégio do avaliador.',
  `cpf_avaliador` varchar(45) NOT NULL COMMENT 'Este campo indica o cpf do avaliador.',
  `profissao` varchar(45) DEFAULT NULL COMMENT 'Este campo armazena a profissão do avaliador.',
  `numero_conselho` varchar(45) DEFAULT NULL COMMENT 'Este campo armazena o número de registro da classe do avaliador. Por exemplo o CREFITO caso o avaliador seja fisioterapeuta.',
  `nome` varchar(45) NOT NULL COMMENT 'Este campo armazena o nome do avaliador.',
  `email` varchar(45) NOT NULL COMMENT 'Este campo armazena o e-mail do avaliador.',
  `login` varchar(45) NOT NULL COMMENT 'Este campo armazena o login do avaliador.',
  `senha` varchar(45) NOT NULL COMMENT 'Campo que armazena o CPF do avalliador.',
  `ativo` tinyint(4) DEFAULT '0' COMMENT 'Este campo indica se o avaliador está ativo (1) ou não (0) no sistema.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena dados sobre os avaliadores (fisioterapeutas).';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cidade`
--

CREATE TABLE IF NOT EXISTS `tb_cidade` (
  `codigo_cidade` int(11) NOT NULL COMMENT 'Representa o código de uma determinada cidade.',
  `codigo_estado` int(11) NOT NULL COMMENT 'Este campo apresenta um código que referencia um determinado estado.',
  `nome` varchar(100) NOT NULL COMMENT 'Este campo armazena o nome da cidade.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena uma lista de cidades.';

--
-- Extraindo dados da tabela `tb_cidade`
--

INSERT INTO `tb_cidade` (`codigo_cidade`, `codigo_estado`, `nome`) VALUES
(1, 1, 'Acrelândia'),
(2, 1, 'Assis Brasil'),
(3, 1, 'Brasiléia'),
(4, 1, 'Bujari'),
(5, 1, 'Capixaba'),
(6, 1, 'Cruzeiro do Sul'),
(7, 1, 'Epitaciolândia'),
(8, 1, 'Feijó'),
(9, 1, 'Jordão'),
(10, 1, 'Mâncio Lima'),
(11, 1, 'Manoel Urbano'),
(12, 1, 'Marechal Thaumaturgo'),
(13, 1, 'Plácido de Castro'),
(14, 1, 'Porto Walter'),
(15, 1, 'Rio Branco'),
(16, 1, 'Rodrigues Alves'),
(17, 1, 'Santa Rosa do Purus'),
(18, 1, 'Senador Guiomard'),
(19, 1, 'Sena Madureira'),
(20, 1, 'Tarauacá'),
(21, 1, 'Xapuri'),
(22, 1, 'Porto Acre'),
(23, 2, 'Água Branca'),
(24, 2, 'Anadia'),
(25, 2, 'Arapiraca'),
(26, 2, 'Atalaia'),
(27, 2, 'Barra de Santo Antônio'),
(28, 2, 'Barra de São Miguel'),
(29, 2, 'Batalha'),
(30, 2, 'Belém'),
(31, 2, 'Belo Monte'),
(32, 2, 'Boca da Mata'),
(33, 2, 'Branquinha'),
(34, 2, 'Cacimbinhas'),
(35, 2, 'Cajueiro'),
(36, 2, 'Campestre'),
(37, 2, 'Campo Alegre'),
(38, 2, 'Campo Grande'),
(39, 2, 'Canapi'),
(40, 2, 'Capela'),
(41, 2, 'Carneiros'),
(42, 2, 'Chã Preta'),
(43, 2, 'Coité do Nóia'),
(44, 2, 'Colônia Leopoldina'),
(45, 2, 'Coqueiro Seco'),
(46, 2, 'Coruripe'),
(47, 2, 'Craíbas'),
(48, 2, 'Delmiro Gouveia'),
(49, 2, 'Dois Riachos'),
(50, 2, 'Estrela de Alagoas'),
(51, 2, 'Feira Grande'),
(52, 2, 'Feliz Deserto'),
(53, 2, 'Flexeiras'),
(54, 2, 'Girau do Ponciano'),
(55, 2, 'Ibateguara'),
(56, 2, 'Igaci'),
(57, 2, 'Igreja Nova'),
(58, 2, 'Inhapi'),
(59, 2, 'Jacaré dos Homens'),
(60, 2, 'Jacuípe'),
(61, 2, 'Japaratinga'),
(62, 2, 'Jaramataia'),
(63, 2, 'Jequiá da Praia'),
(64, 2, 'Joaquim Gomes'),
(65, 2, 'Jundiá'),
(66, 2, 'Junqueiro'),
(67, 2, 'Lagoa da Canoa'),
(68, 2, 'Limoeiro de Anadia'),
(69, 2, 'Maceió'),
(70, 2, 'Major Isidoro'),
(71, 2, 'Maragogi'),
(72, 2, 'Maravilha'),
(73, 2, 'Marechal Deodoro'),
(74, 2, 'Maribondo'),
(75, 2, 'Mar Vermelho'),
(76, 2, 'Mata Grande'),
(77, 2, 'Matriz de Camaragibe'),
(78, 2, 'Messias'),
(79, 2, 'Minador do Negrão'),
(80, 2, 'Monteirópolis'),
(81, 2, 'Murici'),
(82, 2, 'Novo Lino'),
(83, 2, 'Olho d''Água das Flores'),
(84, 2, 'Olho d''Água do Casado'),
(85, 2, 'Olho d''Água Grande'),
(86, 2, 'Olivença'),
(87, 2, 'Ouro Branco'),
(88, 2, 'Palestina'),
(89, 2, 'Palmeira dos Índios'),
(90, 2, 'Pão de Açúcar'),
(91, 2, 'Pariconha'),
(92, 2, 'Paripueira'),
(93, 2, 'Passo de Camaragibe'),
(94, 2, 'Paulo Jacinto'),
(95, 2, 'Penedo'),
(96, 2, 'Piaçabuçu'),
(97, 2, 'Pilar'),
(98, 2, 'Pindoba'),
(99, 2, 'Piranhas'),
(100, 2, 'Poço das Trincheiras'),
(101, 2, 'Porto Calvo'),
(102, 2, 'Porto de Pedras'),
(103, 2, 'Porto Real do Colégio'),
(104, 2, 'Quebrangulo'),
(105, 2, 'Rio Largo'),
(106, 2, 'Roteiro'),
(107, 2, 'Santa Luzia do Norte'),
(108, 2, 'Santana do Ipanema'),
(109, 2, 'Santana do Mundaú'),
(110, 2, 'São Brás'),
(111, 2, 'São José da Laje'),
(112, 2, 'São José da Tapera'),
(113, 2, 'São Luís do Quitunde'),
(114, 2, 'São Miguel dos Campos'),
(115, 2, 'São Miguel dos Milagres'),
(116, 2, 'São Sebastião'),
(117, 2, 'Satuba'),
(118, 2, 'Senador Rui Palmeira'),
(119, 2, 'Tanque d''Arca'),
(120, 2, 'Taquarana'),
(121, 2, 'Teotônio Vilela'),
(122, 2, 'Traipu'),
(123, 2, 'União dos Palmares'),
(124, 2, 'Viçosa'),
(125, 3, 'Serra do Navio'),
(126, 3, 'Amapá'),
(127, 3, 'Pedra Branca do Amapari'),
(128, 3, 'Calçoene'),
(129, 3, 'Cutias'),
(130, 3, 'Ferreira Gomes'),
(131, 3, 'Itaubal'),
(132, 3, 'Laranjal do Jari'),
(133, 3, 'Macapá'),
(134, 3, 'Mazagão'),
(135, 3, 'Oiapoque'),
(136, 3, 'Porto Grande'),
(137, 3, 'Pracuúba'),
(138, 3, 'Santana'),
(139, 3, 'Tartarugalzinho'),
(140, 3, 'Vitória do Jari'),
(141, 4, 'Alvarães'),
(142, 4, 'Amaturá'),
(143, 4, 'Anamã'),
(144, 4, 'Anori'),
(145, 4, 'Apuí'),
(146, 4, 'Atalaia do Norte'),
(147, 4, 'Autazes'),
(148, 4, 'Barcelos'),
(149, 4, 'Barreirinha'),
(150, 4, 'Benjamin Constant'),
(151, 4, 'Beruri'),
(152, 4, 'Boa Vista do Ramos'),
(153, 4, 'Boca do Acre'),
(154, 4, 'Borba'),
(155, 4, 'Caapiranga'),
(156, 4, 'Canutama'),
(157, 4, 'Carauari'),
(158, 4, 'Careiro'),
(159, 4, 'Careiro da Várzea'),
(160, 4, 'Coari'),
(161, 4, 'Codajás'),
(162, 4, 'Eirunepé'),
(163, 4, 'Envira'),
(164, 4, 'Fonte Boa'),
(165, 4, 'Guajará'),
(166, 4, 'Humaitá'),
(167, 4, 'Ipixuna'),
(168, 4, 'Iranduba'),
(169, 4, 'Itacoatiara'),
(170, 4, 'Itamarati'),
(171, 4, 'Itapiranga'),
(172, 4, 'Japurá'),
(173, 4, 'Juruá'),
(174, 4, 'Jutaí'),
(175, 4, 'Lábrea'),
(176, 4, 'Manacapuru'),
(177, 4, 'Manaquiri'),
(178, 4, 'Manaus'),
(179, 4, 'Manicoré'),
(180, 4, 'Maraã'),
(181, 4, 'Maués'),
(182, 4, 'Nhamundá'),
(183, 4, 'Nova Olinda do Norte'),
(184, 4, 'Novo Airão'),
(185, 4, 'Novo Aripuanã'),
(186, 4, 'Parintins'),
(187, 4, 'Pauini'),
(188, 4, 'Presidente Figueiredo'),
(189, 4, 'Rio Preto da Eva'),
(190, 4, 'Santa Isabel do Rio Negro'),
(191, 4, 'Santo Antônio do Içá'),
(192, 4, 'São Gabriel da Cachoeira'),
(193, 4, 'São Paulo de Olivença'),
(194, 4, 'São Sebastião do Uatumã'),
(195, 4, 'Silves'),
(196, 4, 'Tabatinga'),
(197, 4, 'Tapauá'),
(198, 4, 'Tefé'),
(199, 4, 'Tonantins'),
(200, 4, 'Uarini'),
(201, 4, 'Urucará'),
(202, 4, 'Urucurituba'),
(203, 5, 'Abaíra'),
(204, 5, 'Abaré'),
(205, 5, 'Acajutiba'),
(206, 5, 'Adustina'),
(207, 5, 'Água Fria'),
(208, 5, 'Érico Cardoso'),
(209, 5, 'Aiquara'),
(210, 5, 'Alagoinhas'),
(211, 5, 'Alcobaça'),
(212, 5, 'Almadina'),
(213, 5, 'Amargosa'),
(214, 5, 'Amélia Rodrigues'),
(215, 5, 'América Dourada'),
(216, 5, 'Anagé'),
(217, 5, 'Andaraí'),
(218, 5, 'Andorinha'),
(219, 5, 'Angical'),
(220, 5, 'Anguera'),
(221, 5, 'Antas'),
(222, 5, 'Antônio Cardoso'),
(223, 5, 'Antônio Gonçalves'),
(224, 5, 'Aporá'),
(225, 5, 'Apuarema'),
(226, 5, 'Aracatu'),
(227, 5, 'Araças'),
(228, 5, 'Araci'),
(229, 5, 'Aramari'),
(230, 5, 'Arataca'),
(231, 5, 'Aratuípe'),
(232, 5, 'Aurelino Leal'),
(233, 5, 'Baianópolis'),
(234, 5, 'Baixa Grande'),
(235, 5, 'Banzaê'),
(236, 5, 'Barra'),
(237, 5, 'Barra da Estiva'),
(238, 5, 'Barra do Choça'),
(239, 5, 'Barra do Mendes'),
(240, 5, 'Barra do Rocha'),
(241, 5, 'Barreiras'),
(242, 5, 'Barro Alto'),
(243, 5, 'Barrocas'),
(244, 5, 'Barro Preto'),
(245, 5, 'Belmonte'),
(246, 5, 'Belo Campo'),
(247, 5, 'Biritinga'),
(248, 5, 'Boa Nova'),
(249, 5, 'Boa Vista do Tupim'),
(250, 5, 'Bom Jesus da Lapa'),
(251, 5, 'Bom Jesus da Serra'),
(252, 5, 'Boninal'),
(253, 5, 'Bonito'),
(254, 5, 'Boquira'),
(255, 5, 'Botuporã'),
(256, 5, 'Brejões'),
(257, 5, 'Brejolândia'),
(258, 5, 'Brotas de Macaúbas'),
(259, 5, 'Brumado'),
(260, 5, 'Buerarema'),
(261, 5, 'Buritirama'),
(262, 5, 'Caatiba'),
(263, 5, 'Cabaceiras do Paraguaçu'),
(264, 5, 'Cachoeira'),
(265, 5, 'Caculé'),
(266, 5, 'Caém'),
(267, 5, 'Caetanos'),
(268, 5, 'Caetité'),
(269, 5, 'Cafarnaum'),
(270, 5, 'Cairu'),
(271, 5, 'Caldeirão Grande'),
(272, 5, 'Camacan'),
(273, 5, 'Camaçari'),
(274, 5, 'Camamu'),
(275, 5, 'Campo Alegre de Lourdes'),
(276, 5, 'Campo Formoso'),
(277, 5, 'Canápolis'),
(278, 5, 'Canarana'),
(279, 5, 'Canavieiras'),
(280, 5, 'Candeal'),
(281, 5, 'Candeias'),
(282, 5, 'Candiba'),
(283, 5, 'Cândido Sales'),
(284, 5, 'Cansanção'),
(285, 5, 'Canudos'),
(286, 5, 'Capela do Alto Alegre'),
(287, 5, 'Capim Grosso'),
(288, 5, 'Caraíbas'),
(289, 5, 'Caravelas'),
(290, 5, 'Cardeal da Silva'),
(291, 5, 'Carinhanha'),
(292, 5, 'Casa Nova'),
(293, 5, 'Castro Alves'),
(294, 5, 'Catolândia'),
(295, 5, 'Catu'),
(296, 5, 'Caturama'),
(297, 5, 'Central'),
(298, 5, 'Chorrochó'),
(299, 5, 'Cícero Dantas'),
(300, 5, 'Cipó'),
(301, 5, 'Coaraci'),
(302, 5, 'Cocos'),
(303, 5, 'Conceição da Feira'),
(304, 5, 'Conceição do Almeida'),
(305, 5, 'Conceição do Coité'),
(306, 5, 'Conceição do Jacuípe'),
(307, 5, 'Conde'),
(308, 5, 'Condeúba'),
(309, 5, 'Contendas do Sincorá'),
(310, 5, 'Coração de Maria'),
(311, 5, 'Cordeiros'),
(312, 5, 'Coribe'),
(313, 5, 'Coronel João Sá'),
(314, 5, 'Correntina'),
(315, 5, 'Cotegipe'),
(316, 5, 'Cravolândia'),
(317, 5, 'Crisópolis'),
(318, 5, 'Cristópolis'),
(319, 5, 'Cruz das Almas'),
(320, 5, 'Curaçá'),
(321, 5, 'Dário Meira'),
(322, 5, 'Dias d''Ávila'),
(323, 5, 'Dom Basílio'),
(324, 5, 'Dom Macedo Costa'),
(325, 5, 'Elísio Medrado'),
(326, 5, 'Encruzilhada'),
(327, 5, 'Entre Rios'),
(328, 5, 'Esplanada'),
(329, 5, 'Euclides da Cunha'),
(330, 5, 'Eunápolis'),
(331, 5, 'Fátima'),
(332, 5, 'Feira da Mata'),
(333, 5, 'Feira de Santana'),
(334, 5, 'Filadélfia'),
(335, 5, 'Firmino Alves'),
(336, 5, 'Floresta Azul'),
(337, 5, 'Formosa do Rio Preto'),
(338, 5, 'Gandu'),
(339, 5, 'Gavião'),
(340, 5, 'Gentio do Ouro'),
(341, 5, 'Glória'),
(342, 5, 'Gongogi'),
(343, 5, 'Governador Mangabeira'),
(344, 5, 'Guajeru'),
(345, 5, 'Guanambi'),
(346, 5, 'Guaratinga'),
(347, 5, 'Heliópolis'),
(348, 5, 'Iaçu'),
(349, 5, 'Ibiassucê'),
(350, 5, 'Ibicaraí'),
(351, 5, 'Ibicoara'),
(352, 5, 'Ibicuí'),
(353, 5, 'Ibipeba'),
(354, 5, 'Ibipitanga'),
(355, 5, 'Ibiquera'),
(356, 5, 'Ibirapitanga'),
(357, 5, 'Ibirapuã'),
(358, 5, 'Ibirataia'),
(359, 5, 'Ibitiara'),
(360, 5, 'Ibititá'),
(361, 5, 'Ibotirama'),
(362, 5, 'Ichu'),
(363, 5, 'Igaporã'),
(364, 5, 'Igrapiúna'),
(365, 5, 'Iguaí'),
(366, 5, 'Ilhéus'),
(367, 5, 'Inhambupe'),
(368, 5, 'Ipecaetá'),
(369, 5, 'Ipiaú'),
(370, 5, 'Ipirá'),
(371, 5, 'Ipupiara'),
(372, 5, 'Irajuba'),
(373, 5, 'Iramaia'),
(374, 5, 'Iraquara'),
(375, 5, 'Irará'),
(376, 5, 'Irecê'),
(377, 5, 'Itabela'),
(378, 5, 'Itaberaba'),
(379, 5, 'Itabuna'),
(380, 5, 'Itacaré'),
(381, 5, 'Itaeté'),
(382, 5, 'Itagi'),
(383, 5, 'Itagibá'),
(384, 5, 'Itagimirim'),
(385, 5, 'Itaguaçu da Bahia'),
(386, 5, 'Itaju do Colônia'),
(387, 5, 'Itajuípe'),
(388, 5, 'Itamaraju'),
(389, 5, 'Itamari'),
(390, 5, 'Itambé'),
(391, 5, 'Itanagra'),
(392, 5, 'Itanhém'),
(393, 5, 'Itaparica'),
(394, 5, 'Itapé'),
(395, 5, 'Itapebi'),
(396, 5, 'Itapetinga'),
(397, 5, 'Itapicuru'),
(398, 5, 'Itapitanga'),
(399, 5, 'Itaquara'),
(400, 5, 'Itarantim'),
(401, 5, 'Itatim'),
(402, 5, 'Itiruçu'),
(403, 5, 'Itiúba'),
(404, 5, 'Itororó'),
(405, 5, 'Ituaçu'),
(406, 5, 'Ituberá'),
(407, 5, 'Iuiú'),
(408, 5, 'Jaborandi'),
(409, 5, 'Jacaraci'),
(410, 5, 'Jacobina'),
(411, 5, 'Jaguaquara'),
(412, 5, 'Jaguarari'),
(413, 5, 'Jaguaripe'),
(414, 5, 'Jandaíra'),
(415, 5, 'Jequié'),
(416, 5, 'Jeremoabo'),
(417, 5, 'Jiquiriçá'),
(418, 5, 'Jitaúna'),
(419, 5, 'João Dourado'),
(420, 5, 'Juazeiro'),
(421, 5, 'Jucuruçu'),
(422, 5, 'Jussara'),
(423, 5, 'Jussari'),
(424, 5, 'Jussiape'),
(425, 5, 'Lafaiete Coutinho'),
(426, 5, 'Lagoa Real'),
(427, 5, 'Laje'),
(428, 5, 'Lajedão'),
(429, 5, 'Lajedinho'),
(430, 5, 'Lajedo do Tabocal'),
(431, 5, 'Lamarão'),
(432, 5, 'Lapão'),
(433, 5, 'Lauro de Freitas'),
(434, 5, 'Lençóis'),
(435, 5, 'Licínio de Almeida'),
(436, 5, 'Livramento de Nossa Senhora'),
(437, 5, 'Luís Eduardo Magalhães'),
(438, 5, 'Macajuba'),
(439, 5, 'Macarani'),
(440, 5, 'Macaúbas'),
(441, 5, 'Macururé'),
(442, 5, 'Madre de Deus'),
(443, 5, 'Maetinga'),
(444, 5, 'Maiquinique'),
(445, 5, 'Mairi'),
(446, 5, 'Malhada'),
(447, 5, 'Malhada de Pedras'),
(448, 5, 'Manoel Vitorino'),
(449, 5, 'Mansidão'),
(450, 5, 'Maracás'),
(451, 5, 'Maragogipe'),
(452, 5, 'Maraú'),
(453, 5, 'Marcionílio Souza'),
(454, 5, 'Mascote'),
(455, 5, 'Mata de São João'),
(456, 5, 'Matina'),
(457, 5, 'Medeiros Neto'),
(458, 5, 'Miguel Calmon'),
(459, 5, 'Milagres'),
(460, 5, 'Mirangaba'),
(461, 5, 'Mirante'),
(462, 5, 'Monte Santo'),
(463, 5, 'Morpará'),
(464, 5, 'Morro do Chapéu'),
(465, 5, 'Mortugaba'),
(466, 5, 'Mucugê'),
(467, 5, 'Mucuri'),
(468, 5, 'Mulungu do Morro'),
(469, 5, 'Mundo Novo'),
(470, 5, 'Muniz Ferreira'),
(471, 5, 'Muquém de São Francisco'),
(472, 5, 'Muritiba'),
(473, 5, 'Mutuípe'),
(474, 5, 'Nazaré'),
(475, 5, 'Nilo Peçanha'),
(476, 5, 'Nordestina'),
(477, 5, 'Nova Canaã'),
(478, 5, 'Nova Fátima'),
(479, 5, 'Nova Ibiá'),
(480, 5, 'Nova Itarana'),
(481, 5, 'Nova Redenção'),
(482, 5, 'Nova Soure'),
(483, 5, 'Nova Viçosa'),
(484, 5, 'Novo Horizonte'),
(485, 5, 'Novo Triunfo'),
(486, 5, 'Olindina'),
(487, 5, 'Oliveira dos Brejinhos'),
(488, 5, 'Ouriçangas'),
(489, 5, 'Ourolândia'),
(490, 5, 'Palmas de Monte Alto'),
(491, 5, 'Palmeiras'),
(492, 5, 'Paramirim'),
(493, 5, 'Paratinga'),
(494, 5, 'Paripiranga'),
(495, 5, 'Pau Brasil'),
(496, 5, 'Paulo Afonso'),
(497, 5, 'Pé de Serra'),
(498, 5, 'Pedrão'),
(499, 5, 'Pedro Alexandre'),
(500, 5, 'Piatã'),
(501, 5, 'Pilão Arcado'),
(502, 5, 'Pindaí'),
(503, 5, 'Pindobaçu'),
(504, 5, 'Pintadas'),
(505, 5, 'Piraí do Norte'),
(506, 5, 'Piripá'),
(507, 5, 'Piritiba'),
(508, 5, 'Planaltino'),
(509, 5, 'Planalto'),
(510, 5, 'Poções'),
(511, 5, 'Pojuca'),
(512, 5, 'Ponto Novo'),
(513, 5, 'Porto Seguro'),
(514, 5, 'Potiraguá'),
(515, 5, 'Prado'),
(516, 5, 'Presidente Dutra'),
(517, 5, 'Presidente Jânio Quadros'),
(518, 5, 'Presidente Tancredo Neves'),
(519, 5, 'Queimadas'),
(520, 5, 'Quijingue'),
(521, 5, 'Quixabeira'),
(522, 5, 'Rafael Jambeiro'),
(523, 5, 'Remanso'),
(524, 5, 'Retirolândia'),
(525, 5, 'Riachão das Neves'),
(526, 5, 'Riachão do Jacuípe'),
(527, 5, 'Riacho de Santana'),
(528, 5, 'Ribeira do Amparo'),
(529, 5, 'Ribeira do Pombal'),
(530, 5, 'Ribeirão do Largo'),
(531, 5, 'Rio de Contas'),
(532, 5, 'Rio do Antônio'),
(533, 5, 'Rio do Pires'),
(534, 5, 'Rio Real'),
(535, 5, 'Rodelas'),
(536, 5, 'Ruy Barbosa'),
(537, 5, 'Salinas da Margarida'),
(538, 5, 'Salvador'),
(539, 5, 'Santa Bárbara'),
(540, 5, 'Santa Brígida'),
(541, 5, 'Santa Cruz Cabrália'),
(542, 5, 'Santa Cruz da Vitória'),
(543, 5, 'Santa Inês'),
(544, 5, 'Santaluz'),
(545, 5, 'Santa Luzia'),
(546, 5, 'Santa Maria da Vitória'),
(547, 5, 'Santana'),
(548, 5, 'Santanópolis'),
(549, 5, 'Santa Rita de Cássia'),
(550, 5, 'Santa Teresinha'),
(551, 5, 'Santo Amaro'),
(552, 5, 'Santo Antônio de Jesus'),
(553, 5, 'Santo Estêvão'),
(554, 5, 'São Desidério'),
(555, 5, 'São Domingos'),
(556, 5, 'São Félix'),
(557, 5, 'São Félix do Coribe'),
(558, 5, 'São Felipe'),
(559, 5, 'São Francisco do Conde'),
(560, 5, 'São Gabriel'),
(561, 5, 'São Gonçalo dos Campos'),
(562, 5, 'São José da Vitória'),
(563, 5, 'São José do Jacuípe'),
(564, 5, 'São Miguel das Matas'),
(565, 5, 'São Sebastião do Passé'),
(566, 5, 'Sapeaçu'),
(567, 5, 'Sátiro Dias'),
(568, 5, 'Saubara'),
(569, 5, 'Saúde'),
(570, 5, 'Seabra'),
(571, 5, 'Sebastião Laranjeiras'),
(572, 5, 'Senhor do Bonfim'),
(573, 5, 'Serra do Ramalho'),
(574, 5, 'Sento Sé'),
(575, 5, 'Serra Dourada'),
(576, 5, 'Serra Preta'),
(577, 5, 'Serrinha'),
(578, 5, 'Serrolândia'),
(579, 5, 'Simões Filho'),
(580, 5, 'Sítio do Mato'),
(581, 5, 'Sítio do Quinto'),
(582, 5, 'Sobradinho'),
(583, 5, 'Souto Soares'),
(584, 5, 'Tabocas do Brejo Velho'),
(585, 5, 'Tanhaçu'),
(586, 5, 'Tanque Novo'),
(587, 5, 'Tanquinho'),
(588, 5, 'Taperoá'),
(589, 5, 'Tapiramutá'),
(590, 5, 'Teixeira de Freitas'),
(591, 5, 'Teodoro Sampaio'),
(592, 5, 'Teofilândia'),
(593, 5, 'Teolândia'),
(594, 5, 'Terra Nova'),
(595, 5, 'Tremedal'),
(596, 5, 'Tucano'),
(597, 5, 'Uauá'),
(598, 5, 'Ubaíra'),
(599, 5, 'Ubaitaba'),
(600, 5, 'Ubatã'),
(601, 5, 'Uibaí'),
(602, 5, 'Umburanas'),
(603, 5, 'Una'),
(604, 5, 'Urandi'),
(605, 5, 'Uruçuca'),
(606, 5, 'Utinga'),
(607, 5, 'Valença'),
(608, 5, 'Valente'),
(609, 5, 'Várzea da Roça'),
(610, 5, 'Várzea do Poço'),
(611, 5, 'Várzea Nova'),
(612, 5, 'Varzedo'),
(613, 5, 'Vera Cruz'),
(614, 5, 'Vereda'),
(615, 5, 'Vitória da Conquista'),
(616, 5, 'Wagner'),
(617, 5, 'Wanderley'),
(618, 5, 'Wenceslau Guimarães'),
(619, 5, 'Xique-Xique'),
(620, 6, 'Abaiara'),
(621, 6, 'Acarape'),
(622, 6, 'Acaraú'),
(623, 6, 'Acopiara'),
(624, 6, 'Aiuaba'),
(625, 6, 'Alcântaras'),
(626, 6, 'Altaneira'),
(627, 6, 'Alto Santo'),
(628, 6, 'Amontada'),
(629, 6, 'Antonina do Norte'),
(630, 6, 'Apuiarés'),
(631, 6, 'Aquiraz'),
(632, 6, 'Aracati'),
(633, 6, 'Aracoiaba'),
(634, 6, 'Ararendá'),
(635, 6, 'Araripe'),
(636, 6, 'Aratuba'),
(637, 6, 'Arneiroz'),
(638, 6, 'Assaré'),
(639, 6, 'Aurora'),
(640, 6, 'Baixio'),
(641, 6, 'Banabuiú'),
(642, 6, 'Barbalha'),
(643, 6, 'Barreira'),
(644, 6, 'Barro'),
(645, 6, 'Barroquinha'),
(646, 6, 'Baturité'),
(647, 6, 'Beberibe'),
(648, 6, 'Bela Cruz'),
(649, 6, 'Boa Viagem'),
(650, 6, 'Brejo Santo'),
(651, 6, 'Camocim'),
(652, 6, 'Campos Sales'),
(653, 6, 'Canindé'),
(654, 6, 'Capistrano'),
(655, 6, 'Caridade'),
(656, 6, 'Cariré'),
(657, 6, 'Caririaçu'),
(658, 6, 'Cariús'),
(659, 6, 'Carnaubal'),
(660, 6, 'Cascavel'),
(661, 6, 'Catarina'),
(662, 6, 'Catunda'),
(663, 6, 'Caucaia'),
(664, 6, 'Cedro'),
(665, 6, 'Chaval'),
(666, 6, 'Choró'),
(667, 6, 'Chorozinho'),
(668, 6, 'Coreaú'),
(669, 6, 'Crateús'),
(670, 6, 'Crato'),
(671, 6, 'Croatá'),
(672, 6, 'Cruz'),
(673, 6, 'Deputado Irapuan Pinheiro'),
(674, 6, 'Ererê'),
(675, 6, 'Eusébio'),
(676, 6, 'Farias Brito'),
(677, 6, 'Forquilha'),
(678, 6, 'Fortaleza'),
(679, 6, 'Fortim'),
(680, 6, 'Frecheirinha'),
(681, 6, 'General Sampaio'),
(682, 6, 'Graça'),
(683, 6, 'Granja'),
(684, 6, 'Granjeiro'),
(685, 6, 'Groaíras'),
(686, 6, 'Guaiúba'),
(687, 6, 'Guaraciaba do Norte'),
(688, 6, 'Guaramiranga'),
(689, 6, 'Hidrolândia'),
(690, 6, 'Horizonte'),
(691, 6, 'Ibaretama'),
(692, 6, 'Ibiapina'),
(693, 6, 'Ibicuitinga'),
(694, 6, 'Icapuí'),
(695, 6, 'Icó'),
(696, 6, 'Iguatu'),
(697, 6, 'Independência'),
(698, 6, 'Ipaporanga'),
(699, 6, 'Ipaumirim'),
(700, 6, 'Ipu'),
(701, 6, 'Ipueiras'),
(702, 6, 'Iracema'),
(703, 6, 'Irauçuba'),
(704, 6, 'Itaiçaba'),
(705, 6, 'Itaitinga'),
(706, 6, 'Itapagé'),
(707, 6, 'Itapipoca'),
(708, 6, 'Itapiúna'),
(709, 6, 'Itarema'),
(710, 6, 'Itatira'),
(711, 6, 'Jaguaretama'),
(712, 6, 'Jaguaribara'),
(713, 6, 'Jaguaribe'),
(714, 6, 'Jaguaruana'),
(715, 6, 'Jardim'),
(716, 6, 'Jati'),
(717, 6, 'Jijoca de Jericoacoara'),
(718, 6, 'Juazeiro do Norte'),
(719, 6, 'Jucás'),
(720, 6, 'Lavras da Mangabeira'),
(721, 6, 'Limoeiro do Norte'),
(722, 6, 'Madalena'),
(723, 6, 'Maracanaú'),
(724, 6, 'Maranguape'),
(725, 6, 'Marco'),
(726, 6, 'Martinópole'),
(727, 6, 'Massapê'),
(728, 6, 'Mauriti'),
(729, 6, 'Meruoca'),
(730, 6, 'Milagres'),
(731, 6, 'Milhã'),
(732, 6, 'Miraíma'),
(733, 6, 'Missão Velha'),
(734, 6, 'Mombaça'),
(735, 6, 'Monsenhor Tabosa'),
(736, 6, 'Morada Nova'),
(737, 6, 'Moraújo'),
(738, 6, 'Morrinhos'),
(739, 6, 'Mucambo'),
(740, 6, 'Mulungu'),
(741, 6, 'Nova Olinda'),
(742, 6, 'Nova Russas'),
(743, 6, 'Novo Oriente'),
(744, 6, 'Ocara'),
(745, 6, 'Orós'),
(746, 6, 'Pacajus'),
(747, 6, 'Pacatuba'),
(748, 6, 'Pacoti'),
(749, 6, 'Pacujá'),
(750, 6, 'Palhano'),
(751, 6, 'Palmácia'),
(752, 6, 'Paracuru'),
(753, 6, 'Paraipaba'),
(754, 6, 'Parambu'),
(755, 6, 'Paramoti'),
(756, 6, 'Pedra Branca'),
(757, 6, 'Penaforte'),
(758, 6, 'Pentecoste'),
(759, 6, 'Pereiro'),
(760, 6, 'Pindoretama'),
(761, 6, 'Piquet Carneiro'),
(762, 6, 'Pires Ferreira'),
(763, 6, 'Poranga'),
(764, 6, 'Porteiras'),
(765, 6, 'Potengi'),
(766, 6, 'Potiretama'),
(767, 6, 'Quiterianópolis'),
(768, 6, 'Quixadá'),
(769, 6, 'Quixelô'),
(770, 6, 'Quixeramobim'),
(771, 6, 'Quixeré'),
(772, 6, 'Redenção'),
(773, 6, 'Reriutaba'),
(774, 6, 'Russas'),
(775, 6, 'Saboeiro'),
(776, 6, 'Salitre'),
(777, 6, 'Santana do Acaraú'),
(778, 6, 'Santana do Cariri'),
(779, 6, 'Santa Quitéria'),
(780, 6, 'São Benedito'),
(781, 6, 'São Gonçalo do Amarante'),
(782, 6, 'São João do Jaguaribe'),
(783, 6, 'São Luís do Curu'),
(784, 6, 'Senador Pompeu'),
(785, 6, 'Senador Sá'),
(786, 6, 'Sobral'),
(787, 6, 'Solonópole'),
(788, 6, 'Tabuleiro do Norte'),
(789, 6, 'Tamboril'),
(790, 6, 'Tarrafas'),
(791, 6, 'Tauá'),
(792, 6, 'Tejuçuoca'),
(793, 6, 'Tianguá'),
(794, 6, 'Trairi'),
(795, 6, 'Tururu'),
(796, 6, 'Ubajara'),
(797, 6, 'Umari'),
(798, 6, 'Umirim'),
(799, 6, 'Uruburetama'),
(800, 6, 'Uruoca'),
(801, 6, 'Varjota'),
(802, 6, 'Várzea Alegre'),
(803, 6, 'Viçosa do Ceará'),
(804, 7, 'Brasília'),
(805, 8, 'Afonso Cláudio'),
(806, 8, 'Águia Branca'),
(807, 8, 'Água Doce do Norte'),
(808, 8, 'Alegre'),
(809, 8, 'Alfredo Chaves'),
(810, 8, 'Alto Rio Novo'),
(811, 8, 'Anchieta'),
(812, 8, 'Apiacá'),
(813, 8, 'Aracruz'),
(814, 8, 'Atilio Vivacqua'),
(815, 8, 'Baixo Guandu'),
(816, 8, 'Barra de São Francisco'),
(817, 8, 'Boa Esperança'),
(818, 8, 'Bom Jesus do Norte'),
(819, 8, 'Brejetuba'),
(820, 8, 'Cachoeiro de Itapemirim'),
(821, 8, 'Cariacica'),
(822, 8, 'Castelo'),
(823, 8, 'Colatina'),
(824, 8, 'Conceição da Barra'),
(825, 8, 'Conceição do Castelo'),
(826, 8, 'Divino de São Lourenço'),
(827, 8, 'Domingos Martins'),
(828, 8, 'Dores do Rio Preto'),
(829, 8, 'Ecoporanga'),
(830, 8, 'Fundão'),
(831, 8, 'Governador Lindenberg'),
(832, 8, 'Guaçuí'),
(833, 8, 'Guarapari'),
(834, 8, 'Ibatiba'),
(835, 8, 'Ibiraçu'),
(836, 8, 'Ibitirama'),
(837, 8, 'Iconha'),
(838, 8, 'Irupi'),
(839, 8, 'Itaguaçu'),
(840, 8, 'Itapemirim'),
(841, 8, 'Itarana'),
(842, 8, 'Iúna'),
(843, 8, 'Jaguaré'),
(844, 8, 'Jerônimo Monteiro'),
(845, 8, 'João Neiva'),
(846, 8, 'Laranja da Terra'),
(847, 8, 'Linhares'),
(848, 8, 'Mantenópolis'),
(849, 8, 'Marataízes'),
(850, 8, 'Marechal Floriano'),
(851, 8, 'Marilândia'),
(852, 8, 'Mimoso do Sul'),
(853, 8, 'Montanha'),
(854, 8, 'Mucurici'),
(855, 8, 'Muniz Freire'),
(856, 8, 'Muqui'),
(857, 8, 'Nova Venécia'),
(858, 8, 'Pancas'),
(859, 8, 'Pedro Canário'),
(860, 8, 'Pinheiros'),
(861, 8, 'Piúma'),
(862, 8, 'Ponto Belo'),
(863, 8, 'Presidente Kennedy'),
(864, 8, 'Rio Bananal'),
(865, 8, 'Rio Novo do Sul'),
(866, 8, 'Santa Leopoldina'),
(867, 8, 'Santa Maria de Jetibá'),
(868, 8, 'Santa Teresa'),
(869, 8, 'São Domingos do Norte'),
(870, 8, 'São Gabriel da Palha'),
(871, 8, 'São José do Calçado'),
(872, 8, 'São Mateus'),
(873, 8, 'São Roque do Canaã'),
(874, 8, 'Serra'),
(875, 8, 'Sooretama'),
(876, 8, 'Vargem Alta'),
(877, 8, 'Venda Nova do Imigrante'),
(878, 8, 'Viana'),
(879, 8, 'Vila Pavão'),
(880, 8, 'Vila Valério'),
(881, 8, 'Vila Velha'),
(882, 8, 'Vitória'),
(883, 9, 'Abadia de Goiás'),
(884, 9, 'Abadiânia'),
(885, 9, 'Acreúna'),
(886, 9, 'Adelândia'),
(887, 9, 'Água Fria de Goiás'),
(888, 9, 'Água Limpa'),
(889, 9, 'Águas Lindas de Goiás'),
(890, 9, 'Alexânia'),
(891, 9, 'Aloândia'),
(892, 9, 'Alto Horizonte'),
(893, 9, 'Alto Paraíso de Goiás'),
(894, 9, 'Alvorada do Norte'),
(895, 9, 'Amaralina'),
(896, 9, 'Americano do Brasil'),
(897, 9, 'Amorinópolis'),
(898, 9, 'Anápolis'),
(899, 9, 'Anhanguera'),
(900, 9, 'Anicuns'),
(901, 9, 'Aparecida de Goiânia'),
(902, 9, 'Aparecida do Rio Doce'),
(903, 9, 'Aporé'),
(904, 9, 'Araçu'),
(905, 9, 'Aragarças'),
(906, 9, 'Aragoiânia'),
(907, 9, 'Araguapaz'),
(908, 9, 'Arenópolis'),
(909, 9, 'Aruanã'),
(910, 9, 'Aurilândia'),
(911, 9, 'Avelinópolis'),
(912, 9, 'Baliza'),
(913, 9, 'Barro Alto'),
(914, 9, 'Bela Vista de Goiás'),
(915, 9, 'Bom Jardim de Goiás'),
(916, 9, 'Bom Jesus de Goiás'),
(917, 9, 'Bonfinópolis'),
(918, 9, 'Bonópolis'),
(919, 9, 'Brazabrantes'),
(920, 9, 'Britânia'),
(921, 9, 'Buriti Alegre'),
(922, 9, 'Buriti de Goiás'),
(923, 9, 'Buritinópolis'),
(924, 9, 'Cabeceiras'),
(925, 9, 'Cachoeira Alta'),
(926, 9, 'Cachoeira de Goiás'),
(927, 9, 'Cachoeira Dourada'),
(928, 9, 'Caçu'),
(929, 9, 'Caiapônia'),
(930, 9, 'Caldas Novas'),
(931, 9, 'Caldazinha'),
(932, 9, 'Campestre de Goiás'),
(933, 9, 'Campinaçu'),
(934, 9, 'Campinorte'),
(935, 9, 'Campo Alegre de Goiás'),
(936, 9, 'Campo Limpo de Goiás'),
(937, 9, 'Campos Belos'),
(938, 9, 'Campos Verdes'),
(939, 9, 'Carmo do Rio Verde'),
(940, 9, 'Castelândia'),
(941, 9, 'Catalão'),
(942, 9, 'Caturaí'),
(943, 9, 'Cavalcante'),
(944, 9, 'Ceres'),
(945, 9, 'Cezarina'),
(946, 9, 'Chapadão do Céu'),
(947, 9, 'Cidade Ocidental'),
(948, 9, 'Cocalzinho de Goiás'),
(949, 9, 'Colinas do Sul'),
(950, 9, 'Córrego do Ouro'),
(951, 9, 'Corumbá de Goiás'),
(952, 9, 'Corumbaíba'),
(953, 9, 'Cristalina'),
(954, 9, 'Cristianópolis'),
(955, 9, 'Crixás'),
(956, 9, 'Cromínia'),
(957, 9, 'Cumari'),
(958, 9, 'Damianópolis'),
(959, 9, 'Damolândia'),
(960, 9, 'Davinópolis'),
(961, 9, 'Diorama'),
(962, 9, 'Doverlândia'),
(963, 9, 'Edealina'),
(964, 9, 'Edéia'),
(965, 9, 'Estrela do Norte'),
(966, 9, 'Faina'),
(967, 9, 'Fazenda Nova'),
(968, 9, 'Firminópolis'),
(969, 9, 'Flores de Goiás'),
(970, 9, 'Formosa'),
(971, 9, 'Formoso'),
(972, 9, 'Gameleira de Goiás'),
(973, 9, 'Divinópolis de Goiás'),
(974, 9, 'Goianápolis'),
(975, 9, 'Goiandira'),
(976, 9, 'Goianésia'),
(977, 9, 'Goiânia'),
(978, 9, 'Goianira'),
(979, 9, 'Goiás'),
(980, 9, 'Goiatuba'),
(981, 9, 'Gouvelândia'),
(982, 9, 'Guapó'),
(983, 9, 'Guaraíta'),
(984, 9, 'Guarani de Goiás'),
(985, 9, 'Guarinos'),
(986, 9, 'Heitoraí'),
(987, 9, 'Hidrolândia'),
(988, 9, 'Hidrolina'),
(989, 9, 'Iaciara'),
(990, 9, 'Inaciolândia'),
(991, 9, 'Indiara'),
(992, 9, 'Inhumas'),
(993, 9, 'Ipameri'),
(994, 9, 'Ipiranga de Goiás'),
(995, 9, 'Iporá'),
(996, 9, 'Israelândia'),
(997, 9, 'Itaberaí'),
(998, 9, 'Itaguari'),
(999, 9, 'Itaguaru'),
(1000, 9, 'Itajá');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_classificacao`
--

CREATE TABLE IF NOT EXISTS `tb_classificacao` (
  `codigo_classificacao` int(11) NOT NULL COMMENT 'Este campo codifica as classificações.',
  `descricao` varchar(45) DEFAULT NULL COMMENT 'Este campo descreve cada uma das classificações.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela apresenta um classificação que será associada as questões. Por exemplo: reflexo.';

--
-- Extraindo dados da tabela `tb_classificacao`
--

INSERT INTO `tb_classificacao` (`codigo_classificacao`, `descricao`) VALUES
(1, 'Caracterização'),
(2, 'Reflexos'),
(3, 'Planos de Movimento'),
(4, 'Padrões de Movimento'),
(5, 'Reações'),
(6, 'Habilidades Motoras');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_doenca`
--

CREATE TABLE IF NOT EXISTS `tb_doenca` (
  `codigo_doenca` int(11) NOT NULL COMMENT 'Este campo apresenta um código para uma referida doença.',
  `nome` varchar(45) NOT NULL COMMENT 'Este campo apresenta o nome de uma determinada doença. Exemplos: diabetes, hipertensão, toxoplamose, rubéola, citomegalovírus, hérpes simples, sífilis, HIV, outra.',
  `orientacoes` varchar(45) DEFAULT NULL COMMENT 'Este campo não é obrigatório e pode ser utilizado para definição de orientações sobre a referida doença.',
  `observacoes` varchar(255) DEFAULT NULL COMMENT 'Campo não obrigatório para observações importantes a respeito da doença. Um exemplo de seria a apresentação de nomes populares para a doença.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena uma lista de doenças que a mãe pode possuir.';

--
-- Extraindo dados da tabela `tb_doenca`
--

INSERT INTO `tb_doenca` (`codigo_doenca`, `nome`, `orientacoes`, `observacoes`) VALUES
(1, 'Hipertensão', 'NULL', 'NULL'),
(2, 'Diabetes', 'NULL', 'NULL'),
(3, 'Toxoplasmose', 'NULL', 'NULL'),
(4, 'Rubéola', 'NULL', 'NULL'),
(5, 'Citomegalovírus', 'NULL', 'NULL'),
(6, 'Hérpes Simples', 'NULL', 'NULL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_escolaridade`
--

CREATE TABLE IF NOT EXISTS `tb_escolaridade` (
  `codigo_grau_escolaridade` int(11) NOT NULL COMMENT 'Este campo armazena um código que referencia um determinado grau de escolaridade.',
  `descricao` varchar(45) NOT NULL COMMENT 'Este campo armazena uma descrição para o grau de escolaridade. Por exmplo: analfabeto, fundamental incompleto, fundamental, médio, técnico, graduação, pós-graduação.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena uma lista de graus de escolaridade.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_estado`
--

CREATE TABLE IF NOT EXISTS `tb_estado` (
  `codigo_estado` int(11) NOT NULL COMMENT 'Esta campo armazena um código para um determinado estado.',
  `uf_estado` varchar(45) NOT NULL COMMENT 'Este campo armazena uma sigla para o estado.',
  `nome_estado` varchar(100) NOT NULL COMMENT 'Este campo armazena o nome do estado.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena uma lista de estados.';

--
-- Extraindo dados da tabela `tb_estado`
--

INSERT INTO `tb_estado` (`codigo_estado`, `uf_estado`, `nome_estado`) VALUES
(0, 'uf_estado', 'nome_estado'),
(1, 'AC', 'Acre'),
(2, 'AL', 'Alagoas'),
(3, 'AP', 'Amapá'),
(4, 'AM', 'Amazonas'),
(5, 'BA', 'Bahia'),
(6, 'CE', 'Ceará'),
(7, 'DF', 'Distrito Federal'),
(8, 'ES', 'Espírito Santo'),
(9, 'GO', 'Goiás'),
(10, 'MA', 'Maranhão'),
(11, 'MT', 'Mato Grosso'),
(12, 'MS', 'Mato Grosso do Sul'),
(13, 'MG', 'Minas Gerais'),
(14, 'PA', 'Pará'),
(15, 'PB', 'Paraíba'),
(16, 'PR', 'Paraná'),
(17, 'PE', 'Pernambuco'),
(18, 'PI', 'Piauí'),
(19, 'RJ', 'Rio de Janeiro'),
(20, 'RN', 'Rio Grande do Norte'),
(21, 'RS', 'Rio Grande do Sul'),
(22, 'RO', 'Rondônia'),
(23, 'RR', 'Roraima'),
(24, 'SC', 'Santa Catarina'),
(25, 'SP', 'São Paulo'),
(26, 'SE', 'Sergipe'),
(27, 'TO', 'Tocantins');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_grau_parentesco`
--

CREATE TABLE IF NOT EXISTS `tb_grau_parentesco` (
  `codigo_grau_parentesco` int(11) NOT NULL COMMENT 'Este campo atribui um código a um determinado grau de parentesco.',
  `descricao` varchar(45) NOT NULL COMMENT 'Este campo rotula um determinado grau de parentesco. Por exemplo: mão, pai, tio, tia, avô, avó, primo, prima, tutor, tutora, etc.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena uma lista de grau de parentesco.';

--
-- Extraindo dados da tabela `tb_grau_parentesco`
--

INSERT INTO `tb_grau_parentesco` (`codigo_grau_parentesco`, `descricao`) VALUES
(1, 'mãe'),
(2, 'pai'),
(3, 'tio'),
(4, 'tia'),
(5, 'avô'),
(6, 'avó'),
(7, 'primo'),
(8, 'prima'),
(9, 'tutor'),
(10, 'tutora');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_habito_alimentar`
--

CREATE TABLE IF NOT EXISTS `tb_habito_alimentar` (
  `codigo_habito_alimentar` int(11) NOT NULL COMMENT 'Este código representa um hábito alimentar.',
  `descricao` varchar(45) NOT NULL COMMENT 'Este campo descreve o hábito alimentar. Exemplos: peixe, carne, frutas e vegetais, leite e derivados, não respondeu.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armezana uma lista de hábitos alimentares relevantes.';

--
-- Extraindo dados da tabela `tb_habito_alimentar`
--

INSERT INTO `tb_habito_alimentar` (`codigo_habito_alimentar`, `descricao`) VALUES
(1, 'Peixe'),
(2, 'Carne'),
(3, 'FRUTAS E VEGETAIS'),
(4, 'Leite e Derivados'),
(5, 'Não Respondeu');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_intensidade`
--

CREATE TABLE IF NOT EXISTS `tb_intensidade` (
  `codigo_intensidade` int(11) NOT NULL COMMENT 'Este campo representa um código para uma determinada intensidade.',
  `intensidade` varchar(45) NOT NULL COMMENT 'Este campo descreve o valor de uma determinada intensidade. Por exemplo: ausente, fraco, normal, intenso, etc.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='As questões podem ser subdivididas em diferentes intensidades. Esta tabela realiza este controle através de uma lista de intensidades possíveis.';

--
-- Extraindo dados da tabela `tb_intensidade`
--

INSERT INTO `tb_intensidade` (`codigo_intensidade`, `intensidade`) VALUES
(1, 'Ausente'),
(2, 'Fraco'),
(3, 'Normal'),
(4, 'Intenso'),
(5, 'Presente'),
(6, 'Voluntário'),
(7, 'Involuntário'),
(8, 'Parcial'),
(9, 'Completo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_intensidade_questao`
--

CREATE TABLE IF NOT EXISTS `tb_intensidade_questao` (
  `codigo_questao` int(11) NOT NULL COMMENT 'Este campo representa o código de uma determinada questão.',
  `codigo_intensidade` int(11) NOT NULL COMMENT 'Este campo representa um código para uma determinada intensidade.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela de associação entre questão e intensidade. Nesta tabela associa-se uma determinada questão, por exemplo: Reflexo de Prensão Tônica Palmar a suas intensidades: Ausente, Fraco, Normal, Intenso.';

--
-- Extraindo dados da tabela `tb_intensidade_questao`
--

INSERT INTO `tb_intensidade_questao` (`codigo_questao`, `codigo_intensidade`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(12, 1),
(12, 5),
(13, 1),
(13, 5),
(14, 1),
(14, 5),
(15, 6),
(15, 7),
(16, 1),
(16, 6),
(16, 7),
(17, 1),
(17, 6),
(17, 7),
(18, 1),
(18, 6),
(18, 7),
(19, 1),
(19, 6),
(19, 7),
(20, 1),
(20, 6),
(20, 7),
(21, 1),
(21, 6),
(21, 7),
(22, 1),
(22, 6),
(22, 7),
(23, 1),
(23, 6),
(23, 7),
(24, 1),
(24, 6),
(24, 7),
(25, 1),
(25, 6),
(25, 7),
(26, 1),
(26, 8),
(26, 9),
(27, 1),
(27, 8),
(27, 9),
(28, 1),
(28, 8),
(28, 9),
(29, 1),
(29, 8),
(29, 9),
(30, 1),
(30, 8),
(30, 9),
(31, 1),
(31, 8),
(31, 9),
(32, 1),
(32, 8),
(32, 9),
(33, 1),
(33, 8),
(33, 9),
(34, 1),
(34, 8),
(34, 9),
(35, 1),
(35, 8),
(35, 9),
(36, 1),
(36, 8),
(36, 9),
(37, 1),
(37, 8),
(37, 9),
(38, 1),
(38, 8),
(38, 9),
(39, 1),
(39, 8),
(39, 9),
(40, 1),
(40, 8),
(40, 9),
(41, 1),
(41, 8),
(41, 9),
(42, 1),
(42, 8),
(42, 9),
(43, 1),
(43, 8),
(43, 9),
(44, 1),
(44, 8),
(44, 9),
(45, 1),
(45, 8),
(45, 9),
(46, 1),
(46, 8),
(46, 9),
(47, 1),
(47, 8),
(47, 9),
(48, 1),
(48, 8),
(48, 9),
(49, 1),
(49, 8),
(49, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_intensidade_questao_valor`
--

CREATE TABLE IF NOT EXISTS `tb_intensidade_questao_valor` (
  `codigo` int(11) NOT NULL COMMENT 'Este campo identifica unicamente cada registro dentro da tabela.',
  `codigo_questao` int(11) NOT NULL COMMENT 'Este campo indica o código da questão e é oriundo da tabela tb_intensidade_questão.',
  `codigo_intensidade` int(11) NOT NULL COMMENT 'Este campo indica o código de uma determinada questão.',
  `mes` int(11) NOT NULL COMMENT 'Este campo representa o mês a qual associa-se uma questão a uma intensidade e um valor.',
  `valor` int(11) NOT NULL COMMENT 'Este campo indica o valor que a associação questão - intensidade pode assumir. Este valor pode variar de 1 a 12.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela associa valores a uma determinada questão em uma determinada intensidade.Por exemplo. A questão: Reflexo de Prensão Tônica Palmar, com intensidade Intenso pode assumir os valores 1 e 2. Estes valores indicam meses, portanto podem variar de 1 a 12.';

--
-- Extraindo dados da tabela `tb_intensidade_questao_valor`
--

INSERT INTO `tb_intensidade_questao_valor` (`codigo`, `codigo_questao`, `codigo_intensidade`, `mes`, `valor`) VALUES
(1, 1, 4, 1, 1),
(2, 1, 4, 1, 2),
(3, 2, 4, 1, 1),
(4, 2, 4, 1, 2),
(5, 3, 2, 1, 2),
(6, 3, 4, 1, 1),
(7, 4, 3, 1, 2),
(8, 4, 4, 1, 1),
(9, 5, 2, 1, 2),
(10, 5, 4, 1, 1),
(11, 6, 3, 1, 2),
(12, 6, 4, 1, 1),
(13, 7, 2, 1, 2),
(14, 7, 4, 1, 1),
(15, 8, 3, 1, 1),
(16, 8, 4, 1, 2),
(17, 12, 5, 1, 1),
(18, 12, 5, 1, 2),
(19, 15, 6, 1, 1),
(20, 16, 6, 1, 1),
(21, 17, 7, 1, 2),
(22, 35, 8, 1, 2),
(23, 9, 2, 1, 2),
(24, 9, 3, 1, 1),
(25, 10, 4, 1, 1),
(26, 10, 4, 1, 2),
(27, 11, 3, 1, 2),
(28, 11, 4, 1, 1),
(29, 28, 9, 1, 1),
(30, 28, 9, 1, 2),
(31, 1, 2, 2, 3),
(32, 1, 4, 2, 1),
(33, 1, 4, 2, 2),
(34, 2, 4, 2, 1),
(35, 2, 4, 2, 2),
(36, 2, 4, 2, 3),
(37, 3, 2, 2, 2),
(38, 3, 4, 2, 1),
(39, 4, 2, 2, 3),
(40, 4, 4, 2, 2),
(41, 4, 4, 2, 1),
(42, 5, 2, 2, 2),
(43, 5, 4, 2, 1),
(44, 6, 3, 2, 2),
(45, 6, 4, 2, 1),
(46, 7, 2, 2, 2),
(47, 7, 4, 2, 1),
(48, 8, 2, 2, 3),
(49, 8, 3, 2, 1),
(50, 8, 4, 2, 2),
(51, 12, 5, 2, 1),
(52, 12, 5, 2, 2),
(53, 12, 5, 2, 3),
(54, 15, 6, 2, 1),
(55, 16, 6, 2, 1),
(56, 17, 7, 2, 2),
(57, 35, 8, 2, 2),
(58, 35, 9, 2, 3),
(59, 36, 9, 2, 3),
(60, 37, 9, 2, 3),
(61, 9, 2, 2, 3),
(62, 9, 3, 2, 1),
(63, 9, 3, 2, 2),
(64, 10, 4, 2, 1),
(65, 10, 4, 2, 2),
(66, 11, 3, 2, 2),
(67, 11, 4, 2, 1),
(68, 28, 9, 2, 1),
(69, 28, 9, 2, 2),
(70, 1, 2, 4, 3),
(71, 2, 4, 4, 4),
(72, 2, 4, 4, 5),
(73, 2, 4, 4, 3),
(74, 4, 2, 4, 3),
(75, 8, 2, 4, 3),
(76, 12, 5, 4, 3),
(77, 12, 5, 4, 4),
(78, 12, 5, 4, 5),
(79, 13, 5, 4, 5),
(80, 17, 7, 4, 3),
(81, 17, 7, 4, 4),
(82, 17, 6, 4, 5),
(83, 18, 7, 4, 4),
(84, 18, 6, 4, 5),
(85, 19, 6, 4, 5),
(86, 35, 9, 4, 3),
(87, 35, 9, 4, 4),
(88, 35, 9, 4, 5),
(89, 36, 9, 4, 3),
(90, 36, 9, 4, 4),
(91, 36, 9, 4, 5),
(92, 37, 9, 4, 3),
(93, 37, 9, 4, 4),
(94, 37, 9, 4, 5),
(95, 38, 8, 4, 4),
(96, 38, 9, 4, 5),
(97, 39, 8, 4, 4),
(98, 39, 9, 4, 5),
(99, 40, 8, 4, 5),
(100, 41, 9, 4, 5),
(101, 42, 9, 4, 5),
(102, 43, 8, 4, 5),
(103, 44, 8, 4, 4),
(104, 44, 9, 4, 5),
(105, 9, 2, 4, 3),
(106, 9, 2, 4, 4),
(107, 46, 9, 4, 3),
(108, 46, 9, 4, 4),
(109, 46, 9, 4, 5),
(110, 26, 8, 4, 4),
(111, 26, 8, 4, 5),
(112, 27, 8, 4, 5),
(113, 29, 9, 4, 3),
(114, 29, 9, 4, 4),
(115, 29, 9, 4, 5),
(116, 30, 9, 4, 3),
(117, 30, 9, 4, 4),
(118, 30, 9, 4, 5),
(119, 31, 9, 4, 5),
(120, 11, 2, 4, 3),
(121, 11, 2, 4, 4),
(122, 28, 9, 4, 3),
(123, 28, 9, 4, 4),
(124, 1, 2, 4, 3),
(125, 2, 4, 4, 4),
(126, 2, 4, 4, 5),
(127, 2, 4, 4, 3),
(128, 4, 2, 4, 3),
(129, 8, 2, 4, 3),
(130, 12, 5, 4, 3),
(131, 12, 5, 4, 4),
(132, 12, 5, 4, 5),
(133, 13, 5, 4, 5),
(134, 17, 7, 4, 3),
(135, 17, 7, 4, 4),
(136, 17, 6, 4, 5),
(137, 18, 7, 4, 4),
(138, 18, 6, 4, 5),
(139, 19, 6, 4, 5),
(140, 35, 9, 4, 3),
(141, 35, 9, 4, 4),
(142, 35, 9, 4, 5),
(143, 36, 9, 4, 3),
(144, 36, 9, 4, 4),
(145, 36, 9, 4, 5),
(146, 37, 9, 4, 3),
(147, 37, 9, 4, 4),
(148, 37, 9, 4, 5),
(149, 38, 8, 4, 4),
(150, 38, 9, 4, 5),
(151, 39, 8, 4, 4),
(152, 39, 9, 4, 5),
(153, 40, 8, 4, 5),
(154, 41, 9, 4, 5),
(155, 42, 9, 4, 5),
(156, 43, 8, 4, 5),
(157, 44, 8, 4, 4),
(158, 44, 9, 4, 5),
(159, 9, 2, 4, 3),
(160, 9, 2, 4, 4),
(161, 46, 9, 4, 3),
(162, 46, 9, 4, 4),
(163, 46, 9, 4, 5),
(164, 26, 8, 4, 4),
(165, 26, 8, 4, 5),
(166, 27, 8, 4, 5),
(167, 29, 9, 4, 3),
(168, 29, 9, 4, 4),
(169, 29, 9, 4, 5),
(170, 30, 9, 4, 3),
(171, 30, 9, 4, 4),
(172, 30, 9, 4, 5),
(173, 31, 9, 4, 5),
(174, 11, 2, 4, 3),
(175, 11, 2, 4, 4),
(176, 28, 9, 4, 3),
(177, 28, 9, 4, 4),
(178, 2, 4, 5, 4),
(179, 2, 4, 5, 5),
(180, 2, 4, 5, 6),
(181, 12, 5, 5, 4),
(182, 12, 5, 5, 5),
(183, 12, 5, 5, 6),
(184, 13, 5, 5, 5),
(185, 13, 5, 5, 6),
(186, 14, 5, 5, 6),
(187, 17, 7, 5, 4),
(188, 17, 6, 5, 5),
(189, 17, 6, 5, 6),
(190, 18, 7, 5, 4),
(191, 18, 6, 5, 5),
(192, 18, 6, 5, 6),
(193, 19, 6, 5, 5),
(194, 19, 6, 5, 6),
(195, 28, 9, 5, 4),
(196, 35, 9, 5, 4),
(197, 35, 9, 5, 5),
(198, 35, 9, 5, 6),
(199, 36, 9, 5, 4),
(200, 36, 9, 5, 5),
(201, 36, 9, 5, 6),
(202, 37, 9, 5, 4),
(203, 37, 9, 5, 5),
(204, 37, 9, 5, 6),
(205, 38, 8, 5, 4),
(206, 38, 9, 5, 5),
(207, 38, 9, 5, 6),
(208, 39, 8, 5, 4),
(209, 39, 9, 5, 5),
(210, 39, 9, 5, 6),
(211, 40, 8, 5, 5),
(212, 40, 9, 5, 6),
(213, 41, 9, 5, 5),
(214, 41, 9, 5, 6),
(215, 42, 9, 5, 5),
(216, 43, 8, 5, 5),
(217, 43, 8, 5, 6),
(218, 44, 8, 5, 4),
(219, 44, 9, 5, 5),
(220, 44, 9, 5, 6),
(221, 45, 8, 5, 6),
(222, 9, 2, 5, 4),
(223, 46, 9, 5, 4),
(224, 46, 9, 5, 5),
(225, 46, 9, 5, 6),
(226, 26, 8, 5, 4),
(227, 26, 8, 5, 5),
(228, 26, 9, 5, 6),
(229, 27, 8, 5, 5),
(230, 27, 9, 5, 6),
(231, 29, 9, 5, 4),
(232, 29, 9, 5, 5),
(233, 29, 9, 5, 6),
(234, 30, 9, 5, 4),
(235, 30, 9, 5, 5),
(236, 30, 9, 5, 6),
(237, 31, 8, 5, 5),
(238, 31, 9, 5, 6),
(239, 32, 9, 5, 6),
(240, 11, 2, 5, 4),
(241, 2, 4, 6, 5),
(242, 2, 4, 6, 6),
(243, 2, 4, 6, 7),
(244, 12, 5, 6, 5),
(245, 12, 5, 6, 6),
(246, 12, 5, 6, 7),
(247, 13, 5, 6, 5),
(248, 13, 5, 6, 6),
(249, 13, 5, 6, 7),
(250, 14, 5, 6, 5),
(251, 14, 5, 6, 6),
(252, 14, 5, 6, 7),
(253, 35, 9, 6, 5),
(254, 35, 9, 6, 6),
(255, 35, 9, 6, 7),
(256, 36, 9, 6, 5),
(257, 36, 9, 6, 6),
(258, 36, 9, 6, 7),
(259, 37, 9, 6, 5),
(260, 37, 9, 6, 6),
(261, 37, 9, 6, 7),
(262, 38, 9, 6, 5),
(263, 38, 9, 6, 6),
(264, 38, 9, 6, 7),
(265, 39, 9, 6, 5),
(266, 39, 9, 6, 6),
(267, 39, 9, 6, 7),
(268, 40, 9, 6, 5),
(269, 40, 9, 6, 6),
(270, 40, 9, 6, 7),
(271, 41, 9, 6, 5),
(272, 41, 9, 6, 6),
(273, 41, 9, 6, 7),
(274, 42, 9, 6, 5),
(275, 42, 9, 6, 6),
(276, 42, 9, 6, 7),
(277, 43, 9, 6, 5),
(278, 43, 9, 6, 6),
(279, 43, 9, 6, 7),
(280, 44, 8, 6, 5),
(281, 44, 9, 6, 6),
(282, 44, 9, 6, 7),
(283, 46, 9, 6, 5),
(284, 46, 9, 6, 6),
(285, 46, 9, 6, 7),
(286, 26, 9, 6, 5),
(287, 26, 9, 6, 6),
(288, 26, 9, 6, 7),
(289, 27, 9, 6, 5),
(290, 27, 9, 6, 6),
(291, 27, 9, 6, 7),
(292, 29, 9, 6, 5),
(293, 29, 9, 6, 6),
(294, 29, 9, 6, 7),
(295, 30, 9, 6, 5),
(296, 30, 9, 6, 6),
(297, 30, 9, 6, 7),
(298, 31, 9, 6, 5),
(299, 31, 9, 6, 6),
(300, 31, 9, 6, 7),
(301, 32, 9, 6, 5),
(302, 32, 9, 6, 6),
(303, 32, 9, 6, 7),
(304, 33, 8, 6, 7),
(305, 20, 6, 6, 7),
(306, 21, 7, 6, 6),
(307, 22, 7, 6, 7),
(308, 23, 7, 6, 7),
(309, 2, 3, 7, 8),
(310, 2, 4, 7, 6),
(311, 2, 4, 7, 7),
(312, 12, 5, 7, 6),
(313, 12, 5, 7, 7),
(314, 12, 5, 7, 8),
(315, 13, 5, 7, 6),
(316, 13, 5, 7, 7),
(317, 13, 5, 7, 8),
(318, 14, 5, 7, 6),
(319, 14, 5, 7, 7),
(320, 14, 5, 7, 8),
(321, 17, 6, 7, 6),
(322, 17, 6, 7, 7),
(323, 17, 6, 7, 8),
(324, 18, 6, 7, 6),
(325, 18, 6, 7, 7),
(326, 18, 6, 7, 8),
(327, 19, 6, 7, 6),
(328, 19, 6, 7, 7),
(329, 19, 6, 7, 8),
(330, 35, 9, 7, 6),
(331, 35, 9, 7, 7),
(332, 35, 9, 7, 8),
(333, 36, 9, 7, 6),
(334, 36, 9, 7, 7),
(335, 36, 9, 7, 8),
(336, 37, 9, 7, 6),
(337, 37, 9, 7, 7),
(338, 37, 9, 7, 8),
(339, 38, 9, 7, 6),
(340, 38, 9, 7, 7),
(341, 38, 9, 7, 8),
(342, 39, 9, 7, 6),
(343, 39, 9, 7, 8),
(344, 40, 9, 7, 6),
(345, 40, 9, 7, 7),
(346, 40, 9, 7, 8),
(347, 41, 9, 7, 6),
(348, 41, 9, 7, 7),
(349, 41, 9, 7, 8),
(350, 42, 9, 7, 6),
(351, 42, 9, 7, 7),
(352, 42, 9, 7, 8),
(353, 43, 9, 7, 6),
(354, 43, 9, 7, 7),
(355, 43, 9, 7, 8),
(356, 44, 8, 7, 6),
(357, 44, 9, 7, 7),
(358, 44, 9, 7, 8),
(359, 46, 9, 7, 6),
(360, 46, 9, 7, 7),
(361, 46, 9, 7, 8),
(362, 26, 9, 7, 8),
(363, 26, 9, 7, 6),
(364, 26, 9, 7, 7),
(365, 27, 9, 7, 8),
(366, 27, 9, 7, 6),
(367, 27, 9, 7, 7),
(368, 29, 9, 7, 8),
(369, 29, 9, 7, 6),
(370, 29, 9, 7, 7),
(371, 30, 9, 7, 8),
(372, 30, 9, 7, 6),
(373, 30, 9, 7, 7),
(374, 31, 9, 7, 8),
(375, 31, 9, 7, 6),
(376, 31, 9, 7, 7),
(377, 32, 9, 7, 8),
(378, 32, 9, 7, 6),
(379, 32, 9, 7, 7),
(380, 33, 9, 7, 8),
(381, 33, 9, 7, 7),
(382, 20, 6, 7, 7),
(383, 21, 7, 7, 6),
(384, 22, 7, 7, 7),
(385, 22, 6, 7, 8),
(386, 23, 7, 7, 7),
(387, 23, 6, 7, 8),
(388, 24, 6, 7, 8),
(389, 25, 6, 7, 8),
(390, 47, 8, 7, 8),
(391, 2, 2, 8, 9),
(392, 2, 3, 8, 8),
(393, 2, 4, 8, 7),
(394, 12, 5, 8, 9),
(395, 12, 5, 8, 7),
(396, 12, 5, 8, 8),
(397, 13, 5, 8, 9),
(398, 13, 5, 8, 7),
(399, 13, 5, 8, 8),
(400, 14, 5, 8, 9),
(401, 14, 5, 8, 7),
(402, 14, 5, 8, 8),
(403, 17, 6, 8, 9),
(404, 17, 6, 8, 7),
(405, 17, 6, 8, 8),
(406, 18, 6, 8, 9),
(407, 18, 6, 8, 7),
(408, 18, 6, 8, 8),
(409, 19, 6, 8, 9),
(410, 19, 6, 8, 7),
(411, 19, 6, 8, 8),
(412, 35, 9, 8, 9),
(413, 35, 9, 8, 7),
(414, 35, 9, 8, 8),
(415, 36, 9, 8, 9),
(416, 36, 9, 8, 7),
(417, 36, 9, 8, 8),
(418, 37, 9, 8, 9),
(419, 37, 9, 8, 7),
(420, 37, 9, 8, 8),
(421, 38, 9, 8, 9),
(422, 38, 9, 8, 7),
(423, 38, 9, 8, 8),
(424, 39, 9, 8, 9),
(425, 39, 9, 8, 7),
(426, 39, 9, 8, 8),
(427, 40, 9, 8, 9),
(428, 40, 9, 8, 7),
(429, 40, 9, 8, 8),
(430, 41, 9, 8, 9),
(431, 41, 9, 8, 7),
(432, 41, 9, 8, 8),
(433, 42, 9, 8, 9),
(434, 42, 9, 8, 7),
(435, 42, 9, 8, 8),
(436, 43, 9, 8, 9),
(437, 43, 9, 8, 7),
(438, 43, 9, 8, 8),
(439, 44, 8, 8, 9),
(440, 44, 9, 8, 7),
(441, 44, 9, 8, 8),
(442, 46, 9, 8, 9),
(443, 46, 9, 8, 7),
(444, 46, 9, 8, 8),
(445, 26, 9, 8, 8),
(446, 26, 9, 8, 9),
(447, 26, 9, 8, 7),
(448, 27, 9, 8, 8),
(449, 27, 9, 8, 9),
(450, 27, 9, 8, 7),
(451, 29, 9, 8, 8),
(452, 29, 9, 8, 9),
(453, 29, 9, 8, 7),
(454, 30, 9, 8, 8),
(455, 30, 9, 8, 9),
(456, 30, 9, 8, 7),
(457, 31, 9, 8, 8),
(458, 31, 9, 8, 9),
(459, 31, 9, 8, 7),
(460, 32, 9, 8, 8),
(461, 32, 9, 8, 9),
(462, 32, 9, 8, 7),
(463, 33, 9, 8, 8),
(464, 33, 9, 8, 9),
(465, 33, 8, 8, 7),
(466, 34, 8, 8, 9),
(467, 20, 6, 8, 7),
(468, 20, 6, 8, 8),
(469, 20, 6, 8, 9),
(470, 22, 7, 8, 7),
(471, 22, 6, 8, 9),
(472, 22, 6, 8, 8),
(473, 23, 7, 8, 7),
(474, 23, 6, 8, 9),
(475, 23, 6, 8, 8),
(476, 24, 6, 8, 8),
(477, 24, 6, 8, 9),
(478, 25, 6, 8, 8),
(479, 25, 6, 8, 9),
(480, 47, 8, 8, 8),
(481, 47, 9, 8, 9),
(482, 2, 2, 9, 9),
(483, 2, 3, 9, 8),
(484, 12, 5, 9, 9),
(485, 12, 5, 9, 10),
(486, 12, 5, 9, 8),
(487, 13, 5, 9, 9),
(488, 13, 5, 9, 10),
(489, 13, 5, 9, 8),
(490, 14, 5, 9, 9),
(491, 14, 5, 9, 10),
(492, 14, 5, 9, 8),
(493, 17, 6, 9, 9),
(494, 17, 6, 9, 10),
(495, 17, 6, 9, 8),
(496, 18, 6, 9, 9),
(497, 18, 6, 9, 10),
(498, 18, 6, 9, 8),
(499, 19, 6, 9, 9),
(500, 19, 6, 9, 10),
(501, 19, 6, 9, 8),
(502, 35, 9, 9, 9),
(503, 35, 9, 9, 10),
(504, 35, 9, 9, 8),
(505, 36, 9, 9, 9),
(506, 36, 9, 9, 10),
(507, 36, 9, 9, 8),
(508, 37, 9, 9, 9),
(509, 37, 9, 9, 10),
(510, 37, 9, 9, 8),
(511, 38, 9, 9, 9),
(512, 38, 9, 9, 10),
(513, 38, 9, 9, 8),
(514, 39, 9, 9, 9),
(515, 39, 9, 9, 10),
(516, 39, 9, 9, 8),
(517, 40, 9, 9, 9),
(518, 40, 9, 9, 10),
(519, 40, 9, 9, 8),
(520, 41, 9, 9, 9),
(521, 41, 9, 9, 10),
(522, 41, 9, 9, 8),
(523, 42, 9, 9, 9),
(524, 42, 9, 9, 10),
(525, 42, 9, 9, 8),
(526, 43, 9, 9, 9),
(527, 43, 9, 9, 10),
(528, 43, 9, 9, 8),
(529, 44, 8, 9, 9),
(530, 44, 9, 9, 10),
(531, 44, 9, 9, 8),
(532, 46, 9, 9, 9),
(533, 46, 9, 9, 10),
(534, 46, 9, 9, 8),
(535, 26, 9, 9, 8),
(536, 26, 9, 9, 9),
(537, 26, 9, 9, 10),
(538, 27, 9, 9, 8),
(539, 27, 9, 9, 9),
(540, 27, 9, 9, 10),
(541, 29, 9, 9, 8),
(542, 29, 9, 9, 9),
(543, 29, 9, 9, 10),
(544, 30, 9, 9, 8),
(545, 30, 9, 9, 9),
(546, 30, 9, 9, 10),
(547, 31, 9, 9, 8),
(548, 31, 9, 9, 9),
(549, 31, 9, 9, 10),
(550, 32, 9, 9, 8),
(551, 32, 9, 9, 9),
(552, 32, 9, 9, 10),
(553, 33, 9, 9, 8),
(554, 33, 9, 9, 9),
(555, 33, 9, 9, 10),
(556, 34, 8, 9, 9),
(557, 34, 9, 9, 10),
(558, 20, 6, 9, 8),
(559, 20, 6, 9, 9),
(560, 20, 6, 9, 10),
(561, 22, 6, 9, 10),
(562, 22, 6, 9, 9),
(563, 22, 6, 9, 8),
(564, 23, 6, 9, 10),
(565, 23, 6, 9, 9),
(566, 23, 6, 9, 8),
(567, 24, 6, 9, 8),
(568, 24, 6, 9, 9),
(569, 24, 6, 9, 10),
(570, 25, 6, 9, 8),
(571, 25, 6, 9, 9),
(572, 25, 6, 9, 10),
(573, 47, 8, 9, 8),
(574, 47, 9, 9, 9),
(575, 47, 9, 9, 10),
(576, 48, 8, 9, 10),
(577, 2, 2, 10, 9),
(578, 12, 5, 10, 9),
(579, 12, 5, 10, 10),
(580, 12, 5, 10, 11),
(581, 13, 5, 10, 9),
(582, 13, 5, 10, 10),
(583, 13, 5, 10, 11),
(584, 14, 5, 10, 9),
(585, 14, 5, 10, 10),
(586, 14, 5, 10, 11),
(587, 17, 6, 10, 9),
(588, 17, 6, 10, 10),
(589, 17, 6, 10, 11),
(590, 18, 6, 10, 9),
(591, 18, 6, 10, 10),
(592, 18, 6, 10, 11),
(593, 19, 6, 10, 9),
(594, 19, 6, 10, 10),
(595, 19, 6, 10, 11),
(596, 35, 9, 10, 9),
(597, 35, 9, 10, 10),
(598, 35, 9, 10, 11),
(599, 36, 9, 10, 9),
(600, 36, 9, 10, 10),
(601, 36, 9, 10, 11),
(602, 37, 9, 10, 9),
(603, 37, 9, 10, 10),
(604, 37, 9, 10, 11),
(605, 38, 9, 10, 9),
(606, 38, 9, 10, 10),
(607, 38, 9, 10, 11),
(608, 39, 9, 10, 9),
(609, 39, 9, 10, 10),
(610, 39, 9, 10, 11),
(611, 40, 9, 10, 9),
(612, 40, 9, 10, 10),
(613, 40, 9, 10, 11),
(614, 41, 9, 10, 9),
(615, 41, 9, 10, 10),
(616, 41, 9, 10, 11),
(617, 42, 9, 10, 9),
(618, 42, 9, 10, 10),
(619, 42, 9, 10, 11),
(620, 43, 9, 10, 9),
(621, 43, 9, 10, 10),
(622, 43, 9, 10, 11),
(623, 44, 8, 10, 9),
(624, 44, 9, 10, 10),
(625, 44, 9, 10, 11),
(626, 46, 9, 10, 9),
(627, 46, 9, 10, 10),
(628, 46, 9, 10, 11),
(629, 26, 9, 10, 11),
(630, 26, 9, 10, 9),
(631, 26, 9, 10, 10),
(632, 27, 9, 10, 11),
(633, 27, 9, 10, 9),
(634, 27, 9, 10, 10),
(635, 29, 9, 10, 11),
(636, 29, 9, 10, 9),
(637, 29, 9, 10, 10),
(638, 30, 9, 10, 11),
(639, 30, 9, 10, 9),
(640, 30, 9, 10, 10),
(641, 31, 9, 10, 11),
(642, 31, 9, 10, 9),
(643, 31, 9, 10, 10),
(644, 32, 9, 10, 11),
(645, 32, 9, 10, 9),
(646, 32, 9, 10, 10),
(647, 33, 9, 10, 11),
(648, 33, 9, 10, 9),
(649, 33, 9, 10, 10),
(650, 34, 8, 10, 9),
(651, 34, 9, 10, 10),
(652, 34, 9, 10, 11),
(653, 20, 6, 10, 11),
(654, 20, 6, 10, 9),
(655, 20, 6, 10, 10),
(656, 22, 6, 10, 10),
(657, 22, 6, 10, 9),
(658, 22, 6, 10, 11),
(659, 23, 6, 10, 10),
(660, 23, 6, 10, 9),
(661, 23, 6, 10, 11),
(662, 24, 6, 10, 11),
(663, 24, 6, 10, 9),
(664, 24, 6, 10, 10),
(665, 25, 6, 10, 11),
(666, 25, 6, 10, 9),
(667, 25, 6, 10, 10),
(668, 47, 8, 10, 11),
(669, 47, 9, 10, 9),
(670, 47, 9, 10, 10),
(671, 48, 8, 10, 10),
(672, 48, 9, 10, 11),
(673, 49, 8, 10, 11),
(674, 12, 5, 11, 12),
(675, 12, 5, 11, 10),
(676, 12, 5, 11, 11),
(677, 13, 5, 11, 12),
(678, 13, 5, 11, 10),
(679, 13, 5, 11, 11),
(680, 14, 5, 11, 12),
(681, 14, 5, 11, 10),
(682, 14, 5, 11, 11),
(683, 17, 6, 11, 12),
(684, 17, 6, 11, 10),
(685, 17, 6, 11, 11),
(686, 18, 6, 11, 12),
(687, 18, 6, 11, 10),
(688, 18, 6, 11, 11),
(689, 19, 6, 11, 12),
(690, 19, 6, 11, 10),
(691, 19, 6, 11, 11),
(692, 35, 9, 11, 12),
(693, 35, 9, 11, 10),
(694, 35, 9, 11, 11),
(695, 36, 9, 11, 12),
(696, 36, 9, 11, 10),
(697, 36, 9, 11, 11),
(698, 37, 9, 11, 12),
(699, 37, 9, 11, 10),
(700, 37, 9, 11, 11),
(701, 38, 9, 11, 12),
(702, 38, 9, 11, 10),
(703, 38, 9, 11, 11),
(704, 39, 9, 11, 12),
(705, 39, 9, 11, 10),
(706, 39, 9, 11, 11),
(707, 40, 9, 11, 12),
(708, 40, 9, 11, 10),
(709, 40, 9, 11, 11),
(710, 41, 9, 11, 12),
(711, 41, 9, 11, 10),
(712, 41, 9, 11, 11),
(713, 42, 9, 11, 12),
(714, 42, 9, 11, 10),
(715, 42, 9, 11, 11),
(716, 43, 9, 11, 12),
(717, 43, 9, 11, 10),
(718, 43, 9, 11, 11),
(719, 44, 8, 11, 12),
(720, 44, 9, 11, 10),
(721, 44, 9, 11, 11),
(722, 46, 9, 11, 12),
(723, 46, 9, 11, 10),
(724, 46, 9, 11, 11),
(725, 26, 9, 11, 11),
(726, 26, 9, 11, 12),
(727, 26, 9, 11, 10),
(728, 27, 9, 11, 11),
(729, 27, 9, 11, 12),
(730, 27, 9, 11, 10),
(731, 29, 9, 11, 11),
(732, 29, 9, 11, 12),
(733, 29, 9, 11, 10),
(734, 30, 9, 11, 11),
(735, 30, 9, 11, 12),
(736, 30, 9, 11, 10),
(737, 31, 9, 11, 11),
(738, 31, 9, 11, 12),
(739, 31, 9, 11, 10),
(740, 32, 9, 11, 11),
(741, 32, 9, 11, 12),
(742, 32, 9, 11, 10),
(743, 33, 9, 11, 11),
(744, 33, 9, 11, 12),
(745, 33, 9, 11, 10),
(746, 34, 8, 11, 12),
(747, 34, 9, 11, 10),
(748, 34, 9, 11, 11),
(749, 20, 6, 11, 11),
(750, 20, 6, 11, 12),
(751, 20, 6, 11, 10),
(752, 22, 6, 11, 10),
(753, 22, 6, 11, 12),
(754, 22, 6, 11, 11),
(755, 23, 6, 11, 10),
(756, 23, 6, 11, 12),
(757, 23, 6, 11, 11),
(758, 24, 6, 11, 11),
(759, 24, 6, 11, 12),
(760, 24, 6, 11, 10),
(761, 25, 6, 11, 11),
(762, 25, 6, 11, 12),
(763, 25, 6, 11, 10),
(764, 47, 9, 11, 11),
(765, 47, 9, 11, 12),
(766, 47, 9, 11, 10),
(767, 48, 8, 11, 10),
(768, 48, 9, 11, 11),
(769, 48, 9, 11, 12),
(770, 49, 8, 11, 11),
(771, 49, 9, 11, 12),
(772, 12, 5, 12, 12),
(773, 12, 5, 12, 11),
(774, 13, 5, 12, 12),
(775, 13, 5, 12, 11),
(776, 14, 5, 12, 12),
(777, 14, 5, 12, 11),
(778, 17, 6, 12, 12),
(779, 17, 6, 12, 11),
(780, 18, 6, 12, 12),
(781, 18, 6, 12, 11),
(782, 19, 6, 12, 12),
(783, 19, 6, 12, 11),
(784, 35, 9, 12, 12),
(785, 35, 9, 12, 11),
(786, 36, 9, 12, 12),
(787, 36, 9, 12, 11),
(788, 37, 9, 12, 12),
(789, 37, 9, 12, 11),
(790, 38, 9, 12, 12),
(791, 38, 9, 12, 11),
(792, 39, 9, 12, 12),
(793, 39, 9, 12, 11),
(794, 40, 9, 12, 12),
(795, 40, 9, 12, 11),
(796, 41, 9, 12, 12),
(797, 41, 9, 12, 11),
(798, 42, 9, 12, 12),
(799, 42, 9, 12, 11),
(800, 43, 9, 12, 12),
(801, 43, 9, 12, 11),
(802, 44, 8, 12, 12),
(803, 44, 9, 12, 11),
(804, 46, 9, 12, 12),
(805, 46, 9, 12, 11),
(806, 26, 9, 12, 11),
(807, 26, 9, 12, 12),
(808, 27, 9, 12, 11),
(809, 27, 9, 12, 12),
(810, 29, 9, 12, 11),
(811, 29, 9, 12, 12),
(812, 30, 9, 12, 11),
(813, 30, 9, 12, 12),
(814, 31, 9, 12, 11),
(815, 31, 9, 12, 12),
(816, 32, 9, 12, 11),
(817, 32, 9, 12, 12),
(818, 33, 9, 12, 11),
(819, 33, 9, 12, 12),
(820, 34, 8, 12, 12),
(821, 34, 9, 12, 11),
(822, 20, 6, 12, 11),
(823, 20, 6, 12, 12),
(824, 22, 6, 12, 12),
(825, 22, 6, 12, 11),
(826, 23, 6, 12, 12),
(827, 23, 6, 12, 11),
(828, 24, 6, 12, 11),
(829, 24, 6, 12, 12),
(830, 25, 6, 12, 11),
(831, 25, 6, 12, 12),
(832, 47, 9, 12, 11),
(833, 47, 9, 12, 12),
(834, 48, 9, 12, 11),
(835, 48, 9, 12, 12),
(836, 49, 8, 12, 11),
(837, 49, 9, 12, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_mes`
--

CREATE TABLE IF NOT EXISTS `tb_mes` (
  `codigo_mes` int(11) NOT NULL COMMENT 'Este campo armazena o mes relacionado a questão. Este campo pode assumir valores entre 1 e 12.',
  `codigo_questao` int(11) NOT NULL COMMENT 'Este campo indica a questão por meio de seu código.',
  `posicao_no_questionario` int(11) NOT NULL COMMENT 'Este campo indica a posição, ou ordem, na qual a questão deve aparecer dentro do questionário. Por exemplo, se será a primeira, segunda ou terceira questão no questionário de um determinado mês.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Uma questão da avaliação pode aparecer em diferentes meses do desenvolvimento. Esta tabela relaciona as questões com os meses nas quais elas devem ser aplicadas. Definindo também a ordem, ou posição, da questão dentro do questionário de avaliação.';

--
-- Extraindo dados da tabela `tb_mes`
--

INSERT INTO `tb_mes` (`codigo_mes`, `codigo_questao`, `posicao_no_questionario`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(1, 2, 2),
(2, 2, 2),
(3, 2, 2),
(4, 2, 2),
(5, 2, 1),
(6, 2, 1),
(7, 2, 1),
(8, 2, 1),
(9, 2, 1),
(10, 2, 1),
(1, 3, 3),
(2, 3, 3),
(3, 3, 3),
(1, 4, 4),
(2, 4, 4),
(3, 4, 4),
(4, 4, 3),
(1, 5, 5),
(2, 5, 5),
(3, 5, 5),
(1, 6, 6),
(2, 6, 6),
(3, 6, 6),
(1, 7, 7),
(2, 7, 7),
(3, 7, 7),
(1, 8, 8),
(2, 8, 8),
(3, 8, 8),
(4, 8, 4),
(1, 9, 14),
(2, 9, 16),
(3, 9, 17),
(4, 9, 20),
(5, 9, 20),
(1, 10, 15),
(2, 10, 17),
(1, 11, 16),
(2, 11, 18),
(3, 11, 22),
(4, 11, 27),
(5, 11, 28),
(1, 12, 9),
(2, 12, 9),
(3, 12, 9),
(4, 12, 5),
(5, 12, 2),
(6, 12, 2),
(7, 12, 2),
(8, 12, 2),
(9, 12, 2),
(10, 12, 2),
(11, 12, 1),
(12, 12, 1),
(4, 13, 6),
(5, 13, 3),
(6, 13, 3),
(7, 13, 3),
(8, 13, 3),
(9, 13, 3),
(10, 13, 3),
(11, 13, 2),
(12, 13, 2),
(5, 14, 4),
(6, 14, 4),
(7, 14, 4),
(8, 14, 4),
(9, 14, 4),
(10, 14, 4),
(11, 14, 3),
(12, 14, 3),
(1, 15, 10),
(2, 15, 10),
(1, 16, 11),
(2, 16, 11),
(1, 17, 12),
(2, 17, 12),
(3, 17, 10),
(4, 17, 7),
(5, 17, 5),
(6, 17, 5),
(7, 17, 5),
(8, 17, 5),
(9, 17, 5),
(10, 17, 5),
(11, 17, 4),
(12, 17, 4),
(4, 18, 8),
(5, 18, 6),
(6, 18, 6),
(7, 18, 6),
(8, 18, 6),
(9, 18, 6),
(10, 18, 6),
(11, 18, 5),
(12, 18, 5),
(4, 19, 9),
(5, 19, 7),
(6, 19, 7),
(7, 19, 7),
(8, 19, 7),
(9, 19, 7),
(10, 19, 7),
(11, 19, 6),
(12, 19, 6),
(6, 20, 27),
(7, 20, 26),
(8, 20, 27),
(9, 20, 27),
(10, 20, 27),
(11, 20, 26),
(12, 20, 26),
(6, 21, 28),
(7, 21, 27),
(6, 22, 29),
(7, 22, 28),
(8, 22, 28),
(9, 22, 28),
(10, 22, 28),
(11, 22, 27),
(12, 22, 27),
(6, 23, 30),
(7, 23, 29),
(8, 23, 29),
(9, 23, 29),
(10, 23, 29),
(11, 23, 28),
(12, 23, 28),
(7, 24, 30),
(8, 24, 30),
(9, 24, 30),
(10, 24, 30),
(11, 24, 29),
(12, 24, 29),
(7, 25, 31),
(8, 25, 31),
(9, 25, 31),
(10, 25, 31),
(11, 25, 30),
(12, 25, 30),
(3, 26, 19),
(4, 26, 22),
(5, 26, 22),
(6, 26, 20),
(7, 26, 19),
(8, 26, 19),
(9, 26, 19),
(10, 26, 19),
(11, 26, 18),
(12, 26, 18),
(4, 27, 23),
(5, 27, 23),
(6, 27, 21),
(7, 27, 20),
(8, 27, 20),
(9, 27, 20),
(10, 27, 20),
(11, 27, 19),
(12, 27, 19),
(1, 28, 17),
(2, 28, 19),
(3, 28, 23),
(4, 28, 28),
(5, 28, 8),
(3, 29, 20),
(4, 29, 24),
(5, 29, 24),
(6, 29, 22),
(7, 29, 21),
(8, 29, 21),
(9, 29, 21),
(10, 29, 21),
(11, 29, 20),
(12, 29, 20),
(3, 30, 21),
(4, 30, 25),
(5, 30, 25),
(6, 30, 23),
(7, 30, 22),
(8, 30, 22),
(9, 30, 22),
(10, 30, 22),
(11, 30, 21),
(12, 30, 21),
(4, 31, 26),
(5, 31, 26),
(6, 31, 24),
(7, 31, 23),
(8, 31, 23),
(9, 31, 23),
(10, 31, 23),
(11, 31, 22),
(12, 31, 22),
(5, 32, 27),
(6, 32, 25),
(7, 32, 24),
(8, 32, 24),
(9, 32, 24),
(10, 32, 24),
(11, 32, 23),
(12, 32, 23),
(6, 33, 26),
(7, 33, 25),
(8, 33, 25),
(9, 33, 25),
(10, 33, 25),
(11, 33, 24),
(12, 33, 24),
(8, 34, 26),
(9, 34, 26),
(10, 34, 26),
(11, 34, 25),
(12, 34, 25),
(1, 35, 13),
(2, 35, 13),
(3, 35, 11),
(4, 35, 10),
(5, 35, 9),
(6, 35, 8),
(7, 35, 8),
(8, 35, 8),
(9, 35, 8),
(10, 35, 8),
(11, 35, 7),
(12, 35, 7),
(2, 36, 14),
(3, 36, 12),
(4, 36, 11),
(5, 36, 10),
(6, 36, 9),
(7, 36, 9),
(8, 36, 9),
(9, 36, 9),
(10, 36, 9),
(11, 36, 8),
(12, 36, 8),
(2, 37, 15),
(3, 37, 13),
(4, 37, 12),
(5, 37, 11),
(6, 37, 10),
(7, 37, 10),
(8, 37, 10),
(9, 37, 10),
(10, 37, 10),
(11, 37, 9),
(12, 37, 9),
(3, 38, 14),
(4, 38, 13),
(5, 38, 12),
(6, 38, 11),
(7, 38, 11),
(8, 38, 11),
(9, 38, 11),
(10, 38, 11),
(11, 38, 10),
(12, 38, 10),
(3, 39, 15),
(4, 39, 14),
(5, 39, 13),
(6, 39, 12),
(7, 39, 12),
(8, 39, 12),
(9, 39, 12),
(10, 39, 12),
(11, 39, 11),
(12, 39, 11),
(4, 40, 15),
(5, 40, 14),
(6, 40, 13),
(7, 40, 13),
(8, 40, 13),
(9, 40, 13),
(10, 40, 13),
(11, 40, 12),
(12, 40, 12),
(4, 41, 16),
(5, 41, 15),
(6, 41, 14),
(7, 41, 14),
(8, 41, 14),
(9, 41, 14),
(10, 41, 14),
(11, 41, 13),
(12, 41, 13),
(4, 42, 17),
(5, 42, 16),
(6, 42, 15),
(4, 43, 18),
(5, 43, 17),
(6, 43, 16),
(7, 43, 15),
(8, 43, 15),
(9, 43, 15),
(10, 43, 15),
(11, 43, 14),
(12, 43, 14),
(3, 44, 16),
(4, 44, 19),
(5, 44, 18),
(6, 44, 17),
(7, 44, 16),
(8, 44, 16),
(9, 44, 16),
(10, 44, 16),
(11, 44, 15),
(12, 44, 15),
(5, 45, 19),
(6, 45, 18),
(7, 45, 17),
(8, 45, 17),
(9, 45, 17),
(10, 45, 17),
(11, 45, 16),
(12, 45, 16),
(3, 46, 18),
(4, 46, 21),
(5, 46, 21),
(6, 46, 19),
(7, 46, 18),
(8, 46, 18),
(9, 46, 18),
(10, 46, 18),
(11, 46, 17),
(12, 46, 17),
(7, 47, 32),
(8, 47, 32),
(9, 47, 32),
(10, 47, 32),
(11, 47, 31),
(12, 47, 31),
(9, 48, 33),
(10, 48, 33),
(11, 48, 32),
(12, 48, 32),
(10, 49, 34),
(11, 49, 33),
(12, 49, 33);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_paciente`
--

CREATE TABLE IF NOT EXISTS `tb_paciente` (
`codigo_paciente` int(11) NOT NULL COMMENT 'Este campo armazena um código que representa um paciente. Este código é gerado automaticamente pelo banco de dados.',
  `codigo_responsavel` int(11) NOT NULL COMMENT 'Este campo armazena o CPF do responsável pelo paciente.',
  `codigo_renda` int(11) NOT NULL COMMENT 'Este campo possui um código que repreesnta a faixa de renda familiar do paciente oriunda da tabela tb_renda_familiar.',
  `codigo_cidade` int(11) NOT NULL COMMENT 'Este campo armazena a cidade de nascimento do paciente.',
  `nome_paciente` varchar(100) NOT NULL COMMENT 'Este campo armazena o nome do paciente',
  `iniciais_nome_paciente` varchar(10) NOT NULL COMMENT 'Este campo armazena as iniciais do nome do paciente para identificação em relatórios.',
  `nome_mae` varchar(100) NOT NULL COMMENT 'Este campo armazena o nome da mãe do paciente.',
  `data_nascimento` date NOT NULL COMMENT 'Este campo armazena a data de nascimento do paciente.',
  `sexo` varchar(45) NOT NULL COMMENT 'Este campo armazena o sexo paciente. Por exemplo: masculino, feminino.',
  `passou_pela_uti` tinyint(1) NOT NULL COMMENT 'Este campo indica se paciente passou ou não pela UTI. Caso tenha passado o valor armazenado é 1 , caso não é 0.',
  `pq_passou_pela_uti` varchar(1000) DEFAULT NULL COMMENT 'Este campo armazena uma descrição detalhado nos motivos que levaram o paciente para UTI.',
  `tipo_parto` varchar(45) NOT NULL COMMENT 'Este campo armazena o tipo de parto do paciente, Por exemplo: normal ou cesária.',
  `idade_gestacional_nascimento` float NOT NULL COMMENT 'Este campo indica o período de gestação do paciente mensurado em meses.',
  `presenca_icterisia_neonatal` tinyint(1) NOT NULL COMMENT 'Este campo registra a presença de icterisia neonatal. Caso sim registra-se 1, caso não 0.',
  `comprimento_nascimento` float NOT NULL COMMENT 'Este campo registra o comprimento do paciente ao nascimento.',
  `peso_nascimento` float NOT NULL COMMENT 'Este campo registra o peso do paciente ao nascimento.',
  `perimetro_encefalico_nascimento` float NOT NULL COMMENT 'Este campo registra o perímetro encefácilo do paciente ao nascimento.',
  `apgar_1_min` int(11) NOT NULL COMMENT 'Este campo registra a nota do apgar ao primeiro minuto de vida. Deve variar de 0 a 10.',
  `apgar_5_min` int(11) NOT NULL COMMENT 'Este campo registra a nota do apgar no quinto minuto de vida. Deve variar de 0 a 10.',
  `apgar_10_min` int(11) DEFAULT NULL COMMENT 'Este campo registra a nota do apgar no décimo minuto de vida. Deve variar de 0 a 10.',
  `idade_mae_parto` int(11) NOT NULL COMMENT 'Este campo registra a idade da mãe no nascimento do paciente.',
  `numero_gestacoes_mae` int(11) NOT NULL COMMENT 'Este campo registra o número de gestações da mãe.',
  `numero_abortos_mae` int(11) NOT NULL COMMENT 'Este campo registra o número de abortos da mãe.',
  `data_cadastro` date NOT NULL COMMENT 'Este campo registra a data do cadastro do paciente.',
  `ativo` tinyint(4) NOT NULL COMMENT 'Este campo indica se o paciente está ativo. Para ativo o valor é 1, caso contrário é 0.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena a relação de pacientes.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_paciente_auxilio_social`
--

CREATE TABLE IF NOT EXISTS `tb_paciente_auxilio_social` (
  `codigo_paciente` int(11) NOT NULL COMMENT 'Este campo representa um paciente por meio de seu código.',
  `codigo_auxilio_social` int(11) NOT NULL COMMENT 'Este campo representa um auxílio social por meio de seu código.',
  `data_inicio_auxilio` date NOT NULL COMMENT 'Este campo indica a data em que o paciente ou sua família começou a receber o auxílio.',
  `data_termino_auxilio` date DEFAULT NULL COMMENT 'Este campo indica a data em que o paciente ou sua família deixou de receber o auxílio.',
  `data_cadastro` date NOT NULL COMMENT 'Este campo armazana a data de cadastro do auxílio associado ao paciente.',
  `valor` float DEFAULT NULL COMMENT 'Este campo armazena o valor do auxílio. Não é obrigatório.',
  `observacao` varchar(255) DEFAULT NULL COMMENT 'Este é um campo não obrigatório para o registro de observações.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela relaciona o paciente a auxílios recebidos por ele ou por sua família.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_paciente_doenca_mae`
--

CREATE TABLE IF NOT EXISTS `tb_paciente_doenca_mae` (
  `codigo_doenca` int(11) NOT NULL COMMENT 'Campo que apresenta o código da doença da mãe.',
  `codigo_paciente` int(11) NOT NULL COMMENT 'Campo que apresenta o código do paciente.',
  `observacao` varchar(255) NOT NULL COMMENT 'Campo destinado ao cadastro de observações referentes ao paciente e a doença de sua mãe.',
  `data_cadastro` date NOT NULL COMMENT 'Campo utilizado para registrar a data de cadastro no sistema da associação paciente - doença da mãe.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela relaciona um paciente a doenças de sua mãe.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_paciente_habito_alimentar_mae`
--

CREATE TABLE IF NOT EXISTS `tb_paciente_habito_alimentar_mae` (
  `codigo_paciente` int(11) NOT NULL COMMENT 'Este vampo representa o paciente por meio de seu código.',
  `codigo_habito_alimentar` int(11) NOT NULL COMMENT 'Este campo representa o hábito halimentar por meio de seu código.',
  `frequencia_semanal` int(11) NOT NULL COMMENT 'Este campo representa a frequencia semanal de consumo do hábito alimentar. Deve ser mensurado em dias, podendo variar de 1 a 7.',
  `data_cadastro` date NOT NULL COMMENT 'Este campo registra a data do cadastro da relação entre paciente e hábito alimentar da mãe.',
  `observacao` varchar(45) DEFAULT NULL COMMENT 'Campo não obrigatório para registro de observações sobre a associação paciente - hábito alimentar.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela relaciona os hábitos alimentares da mãe com o paciente.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_paciente_substancia`
--

CREATE TABLE IF NOT EXISTS `tb_paciente_substancia` (
  `codigo_paciente` int(11) NOT NULL COMMENT 'Este campo representa o paciente através de seu código.',
  `codigo_substancia` int(11) NOT NULL COMMENT 'Este campo representa a substância consumida pela mãe do paciente por meio de um código.',
  `frequencia_semanal` int(11) NOT NULL COMMENT 'Este campo representa a frequencia de consumo semanal de uma substância. Deve ser mensurado em dias, variando de 1 a 7.',
  `data_cadastro` date NOT NULL COMMENT 'Este campo representa a data de cadastro da associação entre paciente e substância consumida pela mãe.',
  `observacao` varchar(45) DEFAULT NULL COMMENT 'Campo não obrigatório destinado ao registro de observações.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela relaciona o paciente a substância consumidas pela mãe.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pergunta`
--

CREATE TABLE IF NOT EXISTS `tb_pergunta` (
  `codigo_pergunta` int(11) NOT NULL COMMENT 'Este campo representa um código para cada pergunta.',
  `pergunta` varchar(255) NOT NULL COMMENT 'Este campo apresenta uma descrição das perguntas que darão origem aos questionários de avaliação.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena as perguntas utilizadas nos questionários de avaliação independentemente do mês.';

--
-- Extraindo dados da tabela `tb_pergunta`
--

INSERT INTO `tb_pergunta` (`codigo_pergunta`, `pergunta`) VALUES
(1, 'Preensão Tônica Palmar'),
(2, 'Preensão Tônica Plantar'),
(3, '4 Pontos Cardeais'),
(4, 'Sucção'),
(5, 'Colocação do MI'),
(6, 'Sustentação de Peso'),
(7, 'Marcha Automática'),
(8, 'RTCA'),
(9, 'Galant'),
(10, 'Liberação das Vias Aéreas'),
(11, 'Moro'),
(12, 'Movimento Anteroposterior'),
(13, 'Movimento Látero-Lateral'),
(14, 'Movimento Rotacional'),
(15, 'Cabeça Lateralizada'),
(16, 'Flexão Fisiológica'),
(17, 'Decúbito Dorsal'),
(18, 'Decúbito Lateral'),
(19, 'Decúbito Ventral'),
(20, 'Long-sitting'),
(21, 'Sentado com apoio'),
(22, 'Gatas'),
(23, 'Em pé'),
(24, 'Semi-ajoelhado'),
(25, 'Ajoelhado'),
(26, 'Landau'),
(27, 'Anfíbio'),
(28, 'Cervical de retificação'),
(29, 'Óptica de retificação'),
(30, 'Labirintica de retificação'),
(31, 'Corporal de retificação'),
(32, 'Proteção para frente'),
(33, 'Proteção para os lados'),
(34, 'Proteção para trás'),
(35, 'Controle de Cabeça'),
(36, 'Simetria'),
(37, 'Kiking'),
(38, 'Ponte'),
(39, 'Preensão'),
(40, 'Pivotear'),
(41, 'Colocar pé na boca'),
(42, 'Rolar em bloco'),
(43, 'Rolar dissociado'),
(44, 'Controle de tronco superior'),
(45, 'Controle de tronco inferior'),
(46, 'Puppy'),
(47, 'Engatinhar'),
(48, 'Marcha lateral'),
(49, 'Marcha independente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_posicao`
--

CREATE TABLE IF NOT EXISTS `tb_posicao` (
  `codigo_posicao` int(11) NOT NULL COMMENT 'Este campo apresenta um código para uma posição específica	',
  `posicao` varchar(100) NOT NULL COMMENT 'Este campo descreve a posição. Por exemplo: no colo da mãe, criança em pé, decúbito dorsal, decúbito ventral, etc.',
  `observacao` varchar(255) NOT NULL COMMENT 'Campo disponível para o registro de orientações a respeito da posição'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela apresenta uma lista das posições físicas assumidas pelo paciente durante a avaliação.';

--
-- Extraindo dados da tabela `tb_posicao`
--

INSERT INTO `tb_posicao` (`codigo_posicao`, `posicao`, `observacao`) VALUES
(1, 'No colo da mãe', ' '),
(2, 'Criança em pé', ' '),
(3, 'Decúbito dorsal', ' '),
(4, 'Decúbito ventral', ' '),
(5, 'outras', ' ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_privilegio`
--

CREATE TABLE IF NOT EXISTS `tb_privilegio` (
  `codigo_privilegio` int(11) NOT NULL COMMENT 'Este campo atribui um código para cada privilégio dentro do sistema.',
  `descricao` varchar(45) NOT NULL COMMENT 'Este campo apresenta a descrição do privilégio. Por exemplo: administrador, usuário.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena uma lista dos privilégios relacionados aos usuários do sistema. ';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_questao`
--

CREATE TABLE IF NOT EXISTS `tb_questao` (
  `codigo_questao` int(11) NOT NULL COMMENT 'Este campo armazena um código de referencia para questão.',
  `codigo_posicao` int(11) NOT NULL COMMENT 'Este campo armazena um codigo que representa a posição na qual a questão deve ser avaliada. Por exemplo: decúbito dorsa.',
  `codigo_classificacao` int(11) NOT NULL COMMENT 'Este campo indica o código da classificação da questão oriundo da tabela tb_classificacao.',
  `codigo_pergunta` int(11) NOT NULL COMMENT 'Este campo apresenta o código de uma pergunta oriundo da tabela tb_pergunta. Por exemplo: Reflexo de prensão tônica palmar, reflexo da marcha automática, etc.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armezena todas as questões referentes ao processo de avaliação.';

--
-- Extraindo dados da tabela `tb_questao`
--

INSERT INTO `tb_questao` (`codigo_questao`, `codigo_posicao`, `codigo_classificacao`, `codigo_pergunta`) VALUES
(1, 1, 2, 1),
(2, 1, 2, 2),
(3, 1, 2, 3),
(4, 1, 2, 4),
(5, 2, 2, 5),
(6, 2, 2, 6),
(7, 2, 2, 7),
(8, 3, 2, 8),
(9, 3, 3, 9),
(10, 3, 4, 10),
(11, 3, 4, 11),
(12, 3, 4, 12),
(13, 3, 6, 13),
(14, 4, 2, 14),
(15, 4, 2, 15),
(16, 3, 2, 16),
(17, 3, 5, 17),
(18, 3, 6, 18),
(19, 3, 6, 19),
(20, 4, 6, 20),
(21, 4, 5, 21),
(22, 4, 5, 22),
(23, 4, 5, 23),
(24, 3, 6, 24),
(25, 3, 6, 25),
(26, 3, 6, 26),
(27, 3, 3, 27),
(28, 3, 4, 28),
(29, 3, 4, 29),
(30, 3, 4, 30),
(31, 3, 6, 31),
(32, 3, 6, 32),
(33, 3, 6, 33),
(34, 3, 6, 34),
(35, 4, 5, 35),
(36, 3, 6, 36),
(37, 3, 6, 37),
(38, 3, 6, 38),
(39, 3, 6, 39),
(40, 3, 6, 39),
(41, 3, 6, 40),
(42, 3, 6, 42),
(43, 3, 6, 43),
(44, 3, 6, 44),
(45, 3, 6, 45),
(46, 4, 6, 46),
(47, 2, 6, 47),
(48, 2, 6, 48),
(49, 2, 6, 49);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_questao_avaliacao`
--

CREATE TABLE IF NOT EXISTS `tb_questao_avaliacao` (
  `codigo_avaliacao` int(11) NOT NULL COMMENT 'Este campo representa o código da avaliação que esta sendo armazenada.',
  `codigo_questao` int(11) NOT NULL COMMENT 'Este campo representa o código da questão que está sendo armazenada.',
  `codigo_intensidade` int(11) NOT NULL COMMENT 'Este campo representa o código da intensiodade a qual a quiestão foi associada.',
  `valor` int(11) DEFAULT NULL COMMENT 'Este campo indica o valor associado a intensidade marcada.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela associa as questões de uma avaliação a suas respectivas intensidades e valores indicados pelo avaliador .';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_renda_familiar`
--

CREATE TABLE IF NOT EXISTS `tb_renda_familiar` (
  `codigo_renda` int(11) NOT NULL COMMENT 'Este campo codifica a renda familiar.',
  `descricao` varchar(80) NOT NULL COMMENT 'Este campo descreve um intervalo de valores para renda familiar.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena intervalos para representação da renda familiar.';

--
-- Extraindo dados da tabela `tb_renda_familiar`
--

INSERT INTO `tb_renda_familiar` (`codigo_renda`, `descricao`) VALUES
(1, 'Até 1 salário mínimo'),
(2, 'Entre 1 e 3 salários mínimos'),
(3, 'Entre 3 e 5 salários mínimos'),
(4, 'Mais que 5 salários mínimos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_responsavel`
--

CREATE TABLE IF NOT EXISTS `tb_responsavel` (
  `codigo_responsavel` int(11) NOT NULL COMMENT 'Este campo armazena o código do responsável.',
  `codigo_cidade` int(11) NOT NULL COMMENT 'Este campo armazena um código que indica a cidade onde mora o respponsável.',
  `codigo_grau_escolaridade` int(11) NOT NULL COMMENT 'Este campo armazena um código que indica o grau de escolaridade do responsável.',
  `codigo_grau_parentesco` int(11) NOT NULL COMMENT 'Este campo armazena um código que indica o grau de parentesco eexistente entre o responsável e o paciente.',
  `nome_responsavel` varchar(100) NOT NULL COMMENT 'Este campo armazena o nome do responsável.',
  `sexo` varchar(45) NOT NULL COMMENT 'Este campo armazena o sexo do responsável. Por exemplo: masculino, feminino.',
  `rua` varchar(100) NOT NULL COMMENT 'Este campo armazena a rua onde mora o paciente.',
  `numero` int(11) NOT NULL COMMENT 'Este campo armazena o número da residência do responsável.',
  `complemento` varchar(255) NOT NULL COMMENT 'Este campo armazena um complemento para o endereço, se necessário.',
  `bairro` varchar(45) NOT NULL COMMENT 'Este campo armazena o bairro da residencia do responsável.',
  `cep` varchar(10) NOT NULL COMMENT 'Este campo armazena o CEP do endereço do responsável.',
  `ativo` tinyint(4) NOT NULL COMMENT 'Este campo indica se o responsável ainda está ativo no sistema. Para ativo o valor é 1, caso contrário é 0.',
  `cpf_responsavel` varchar(45) NOT NULL COMMENT 'Este campo armazena o CPF do responsável.',
  `email` varchar(50) DEFAULT NULL COMMENT 'Este campo armazena o e-mail do responsável.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena informações a respeito dos responsáveis pelos pacientes.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_substancia_gestacao_mae`
--

CREATE TABLE IF NOT EXISTS `tb_substancia_gestacao_mae` (
  `codigo_substancia` int(11) NOT NULL COMMENT 'Este campo registra o código da substância.',
  `nome` varchar(45) NOT NULL COMMENT 'Este campo registra o nome da substância. Por exemplo: drogas, álcool, cigarro, não respondeu.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena uma lista de substâncias que podem ter sido consumidas pela mãe do paciente.';

--
-- Extraindo dados da tabela `tb_substancia_gestacao_mae`
--

INSERT INTO `tb_substancia_gestacao_mae` (`codigo_substancia`, `nome`) VALUES
(1, 'Drogas'),
(2, 'Cigarro'),
(3, 'Alcool'),
(4, 'Não Respondeu');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_telefone_avaliador`
--

CREATE TABLE IF NOT EXISTS `tb_telefone_avaliador` (
  `numero_telefone` varchar(45) NOT NULL COMMENT 'Este campo armazena o telefone de um determinado avaliador (fisioterapeuta).',
  `codigo_avaliador` int(11) NOT NULL COMMENT 'Este campo armazena o codigo do avaliador (fisioterapeuta).'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela armazena os telefones dos fisioterapeutas.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_telefone_responsavel`
--

CREATE TABLE IF NOT EXISTS `tb_telefone_responsavel` (
  `numero_telefone` varchar(14) NOT NULL COMMENT 'Este campo armazena um número de telefone.',
  `codigo_responsavel` int(11) NOT NULL COMMENT 'Este campo representa um responsável por meio de seu código.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabela associa um responsável a seus contatos telefônicos.';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_auxilio_social`
--
ALTER TABLE `tb_auxilio_social`
 ADD PRIMARY KEY (`codigo_auxilio_social`);

--
-- Indexes for table `tb_avaliacao`
--
ALTER TABLE `tb_avaliacao`
 ADD PRIMARY KEY (`codigo_avaliacao`), ADD KEY `fk_avaliacao_fisioterapeuta1_idx` (`codigo_avaliador`), ADD KEY `fk_avaliacao_paciente1_idx` (`codigo_paciente`);

--
-- Indexes for table `tb_avaliador`
--
ALTER TABLE `tb_avaliador`
 ADD PRIMARY KEY (`codigo_avaliador`), ADD KEY `fk_fisioterapeuta_privilegio1_idx` (`codigo_privilegio`);

--
-- Indexes for table `tb_cidade`
--
ALTER TABLE `tb_cidade`
 ADD PRIMARY KEY (`codigo_cidade`), ADD KEY `fk_cidade_estado1_idx` (`codigo_estado`);

--
-- Indexes for table `tb_classificacao`
--
ALTER TABLE `tb_classificacao`
 ADD PRIMARY KEY (`codigo_classificacao`);

--
-- Indexes for table `tb_doenca`
--
ALTER TABLE `tb_doenca`
 ADD PRIMARY KEY (`codigo_doenca`);

--
-- Indexes for table `tb_escolaridade`
--
ALTER TABLE `tb_escolaridade`
 ADD PRIMARY KEY (`codigo_grau_escolaridade`);

--
-- Indexes for table `tb_estado`
--
ALTER TABLE `tb_estado`
 ADD PRIMARY KEY (`codigo_estado`);

--
-- Indexes for table `tb_grau_parentesco`
--
ALTER TABLE `tb_grau_parentesco`
 ADD PRIMARY KEY (`codigo_grau_parentesco`);

--
-- Indexes for table `tb_habito_alimentar`
--
ALTER TABLE `tb_habito_alimentar`
 ADD PRIMARY KEY (`codigo_habito_alimentar`);

--
-- Indexes for table `tb_intensidade`
--
ALTER TABLE `tb_intensidade`
 ADD PRIMARY KEY (`codigo_intensidade`);

--
-- Indexes for table `tb_intensidade_questao`
--
ALTER TABLE `tb_intensidade_questao`
 ADD PRIMARY KEY (`codigo_questao`,`codigo_intensidade`), ADD KEY `fk_Intensidade_has_Questões_Questões1_idx` (`codigo_questao`), ADD KEY `fk_Intensidade_has_Questões_Intensidade1_idx` (`codigo_intensidade`);

--
-- Indexes for table `tb_intensidade_questao_valor`
--
ALTER TABLE `tb_intensidade_questao_valor`
 ADD PRIMARY KEY (`codigo`), ADD KEY `fk_intensidade_questao_valor_intensidade_questao1_idx` (`codigo_intensidade`,`codigo_questao`);

--
-- Indexes for table `tb_mes`
--
ALTER TABLE `tb_mes`
 ADD PRIMARY KEY (`codigo_questao`,`codigo_mes`);

--
-- Indexes for table `tb_paciente`
--
ALTER TABLE `tb_paciente`
 ADD PRIMARY KEY (`codigo_paciente`), ADD KEY `fk_Paciente_Responsável1_idx` (`codigo_responsavel`), ADD KEY `fk_paciente_cidade1_idx` (`codigo_cidade`), ADD KEY `fk_tb_paciente_tb_renda_familiar1_idx` (`codigo_renda`);

--
-- Indexes for table `tb_paciente_auxilio_social`
--
ALTER TABLE `tb_paciente_auxilio_social`
 ADD PRIMARY KEY (`codigo_paciente`,`codigo_auxilio_social`), ADD KEY `fk_auxilio_social_has_paciente_paciente1_idx` (`codigo_paciente`), ADD KEY `fk_auxilio_social_has_paciente_auxilio_social1_idx` (`codigo_auxilio_social`);

--
-- Indexes for table `tb_paciente_doenca_mae`
--
ALTER TABLE `tb_paciente_doenca_mae`
 ADD PRIMARY KEY (`codigo_doenca`,`codigo_paciente`), ADD KEY `fk_paciente_has_doencas_mae_doencas_mae1_idx` (`codigo_doenca`), ADD KEY `fk_paciente_has_doencas_mae_paciente1_idx` (`codigo_paciente`);

--
-- Indexes for table `tb_paciente_habito_alimentar_mae`
--
ALTER TABLE `tb_paciente_habito_alimentar_mae`
 ADD PRIMARY KEY (`codigo_paciente`,`codigo_habito_alimentar`), ADD KEY `fk_paciente_has_habitos_alimentares_mae_habitos_alimentares_idx` (`codigo_habito_alimentar`), ADD KEY `fk_paciente_has_habitos_alimentares_mae_paciente1_idx` (`codigo_paciente`);

--
-- Indexes for table `tb_paciente_substancia`
--
ALTER TABLE `tb_paciente_substancia`
 ADD PRIMARY KEY (`codigo_paciente`,`codigo_substancia`), ADD KEY `fk_paciente_has_substancias_gestacao_mae_substancias_gestac_idx` (`codigo_substancia`), ADD KEY `fk_paciente_has_substancias_gestacao_mae_paciente1_idx` (`codigo_paciente`);

--
-- Indexes for table `tb_pergunta`
--
ALTER TABLE `tb_pergunta`
 ADD PRIMARY KEY (`codigo_pergunta`);

--
-- Indexes for table `tb_posicao`
--
ALTER TABLE `tb_posicao`
 ADD PRIMARY KEY (`codigo_posicao`);

--
-- Indexes for table `tb_privilegio`
--
ALTER TABLE `tb_privilegio`
 ADD PRIMARY KEY (`codigo_privilegio`);

--
-- Indexes for table `tb_questao`
--
ALTER TABLE `tb_questao`
 ADD PRIMARY KEY (`codigo_questao`), ADD KEY `fk_questoes_posicao1_idx` (`codigo_posicao`), ADD KEY `fk_tb_questao_tb_pergunta1_idx` (`codigo_pergunta`), ADD KEY `fk_tb_questao_tb_classificacao1_idx` (`codigo_classificacao`);

--
-- Indexes for table `tb_questao_avaliacao`
--
ALTER TABLE `tb_questao_avaliacao`
 ADD PRIMARY KEY (`codigo_avaliacao`,`codigo_questao`), ADD KEY `fk_Avaliação_has_Questões_Questões1_idx` (`codigo_questao`), ADD KEY `fk_Avaliação_has_Questões_Avaliação1_idx` (`codigo_avaliacao`), ADD KEY `fk_questoes_avaliacao_intensidade1_idx` (`codigo_intensidade`);

--
-- Indexes for table `tb_renda_familiar`
--
ALTER TABLE `tb_renda_familiar`
 ADD PRIMARY KEY (`codigo_renda`);

--
-- Indexes for table `tb_responsavel`
--
ALTER TABLE `tb_responsavel`
 ADD PRIMARY KEY (`codigo_responsavel`), ADD KEY `fk_responsavel_escolaridade1_idx` (`codigo_grau_escolaridade`), ADD KEY `fk_responsavel_cidade1_idx` (`codigo_cidade`), ADD KEY `fk_responsavel_grau_parentesco1_idx` (`codigo_grau_parentesco`);

--
-- Indexes for table `tb_substancia_gestacao_mae`
--
ALTER TABLE `tb_substancia_gestacao_mae`
 ADD PRIMARY KEY (`codigo_substancia`);

--
-- Indexes for table `tb_telefone_avaliador`
--
ALTER TABLE `tb_telefone_avaliador`
 ADD PRIMARY KEY (`numero_telefone`,`codigo_avaliador`), ADD KEY `fk_telefone_fisioterapeuta1` (`codigo_avaliador`);

--
-- Indexes for table `tb_telefone_responsavel`
--
ALTER TABLE `tb_telefone_responsavel`
 ADD PRIMARY KEY (`numero_telefone`,`codigo_responsavel`), ADD KEY `fk_telefone_responsavel1_idx` (`codigo_responsavel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_avaliacao`
--
ALTER TABLE `tb_avaliacao`
MODIFY `codigo_avaliacao` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este campo armazena um código que referencia a avaliação.';
--
-- AUTO_INCREMENT for table `tb_paciente`
--
ALTER TABLE `tb_paciente`
MODIFY `codigo_paciente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este campo armazena um código que representa um paciente. Este código é gerado automaticamente pelo banco de dados.';
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_avaliacao`
--
ALTER TABLE `tb_avaliacao`
ADD CONSTRAINT `fk_avaliacao_fisioterapeuta1` FOREIGN KEY (`codigo_avaliador`) REFERENCES `tb_avaliador` (`codigo_avaliador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_avaliacao_paciente1` FOREIGN KEY (`codigo_paciente`) REFERENCES `tb_paciente` (`codigo_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_avaliador`
--
ALTER TABLE `tb_avaliador`
ADD CONSTRAINT `fk_fisioterapeuta_privilegio1` FOREIGN KEY (`codigo_privilegio`) REFERENCES `tb_privilegio` (`codigo_privilegio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_cidade`
--
ALTER TABLE `tb_cidade`
ADD CONSTRAINT `fk_cidade_estado1` FOREIGN KEY (`codigo_estado`) REFERENCES `tb_estado` (`codigo_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_intensidade_questao`
--
ALTER TABLE `tb_intensidade_questao`
ADD CONSTRAINT `fk_Intensidade_has_Questões_Intensidade1` FOREIGN KEY (`codigo_intensidade`) REFERENCES `tb_intensidade` (`codigo_intensidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Intensidade_has_Questões_Questões1` FOREIGN KEY (`codigo_questao`) REFERENCES `tb_questao` (`codigo_questao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_intensidade_questao_valor`
--
ALTER TABLE `tb_intensidade_questao_valor`
ADD CONSTRAINT `fk_intensidade_questao_valor_intensidade_questao1` FOREIGN KEY (`codigo_intensidade`, `codigo_questao`) REFERENCES `tb_intensidade_questao` (`codigo_intensidade`, `codigo_questao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_mes`
--
ALTER TABLE `tb_mes`
ADD CONSTRAINT `fk_mes_questoes1` FOREIGN KEY (`codigo_questao`) REFERENCES `tb_questao` (`codigo_questao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_paciente`
--
ALTER TABLE `tb_paciente`
ADD CONSTRAINT `fk_paciente_cidade1` FOREIGN KEY (`codigo_cidade`) REFERENCES `tb_cidade` (`codigo_cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Paciente_Responsável1` FOREIGN KEY (`codigo_responsavel`) REFERENCES `tb_responsavel` (`codigo_responsavel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tb_paciente_tb_renda_familiar1` FOREIGN KEY (`codigo_renda`) REFERENCES `tb_renda_familiar` (`codigo_renda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_paciente_auxilio_social`
--
ALTER TABLE `tb_paciente_auxilio_social`
ADD CONSTRAINT `fk_auxilio_social_has_paciente_auxilio_social1` FOREIGN KEY (`codigo_auxilio_social`) REFERENCES `tb_auxilio_social` (`codigo_auxilio_social`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_auxilio_social_has_paciente_paciente1` FOREIGN KEY (`codigo_paciente`) REFERENCES `tb_paciente` (`codigo_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_paciente_doenca_mae`
--
ALTER TABLE `tb_paciente_doenca_mae`
ADD CONSTRAINT `fk_paciente_has_doencas_mae_doencas_mae1` FOREIGN KEY (`codigo_doenca`) REFERENCES `tb_doenca` (`codigo_doenca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_paciente_has_doencas_mae_paciente1` FOREIGN KEY (`codigo_paciente`) REFERENCES `tb_paciente` (`codigo_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_paciente_habito_alimentar_mae`
--
ALTER TABLE `tb_paciente_habito_alimentar_mae`
ADD CONSTRAINT `fk_paciente_has_habitos_alimentares_mae_habitos_alimentares_m1` FOREIGN KEY (`codigo_habito_alimentar`) REFERENCES `tb_habito_alimentar` (`codigo_habito_alimentar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_paciente_has_habitos_alimentares_mae_paciente1` FOREIGN KEY (`codigo_paciente`) REFERENCES `tb_paciente` (`codigo_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_paciente_substancia`
--
ALTER TABLE `tb_paciente_substancia`
ADD CONSTRAINT `fk_paciente_has_substancias_gestacao_mae_paciente1` FOREIGN KEY (`codigo_paciente`) REFERENCES `tb_paciente` (`codigo_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_paciente_has_substancias_gestacao_mae_substancias_gestacao1` FOREIGN KEY (`codigo_substancia`) REFERENCES `tb_substancia_gestacao_mae` (`codigo_substancia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_questao`
--
ALTER TABLE `tb_questao`
ADD CONSTRAINT `fk_questoes_posicao1` FOREIGN KEY (`codigo_posicao`) REFERENCES `tb_posicao` (`codigo_posicao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tb_questao_tb_classificacao1` FOREIGN KEY (`codigo_classificacao`) REFERENCES `tb_classificacao` (`codigo_classificacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tb_questao_tb_pergunta1` FOREIGN KEY (`codigo_pergunta`) REFERENCES `tb_pergunta` (`codigo_pergunta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_questao_avaliacao`
--
ALTER TABLE `tb_questao_avaliacao`
ADD CONSTRAINT `fk_Avaliação_has_Questões_Avaliação1` FOREIGN KEY (`codigo_avaliacao`) REFERENCES `tb_avaliacao` (`codigo_avaliacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Avaliação_has_Questões_Questões1` FOREIGN KEY (`codigo_questao`) REFERENCES `tb_questao` (`codigo_questao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_questoes_avaliacao_intensidade1` FOREIGN KEY (`codigo_intensidade`) REFERENCES `tb_intensidade` (`codigo_intensidade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_responsavel`
--
ALTER TABLE `tb_responsavel`
ADD CONSTRAINT `fk_responsavel_cidade1` FOREIGN KEY (`codigo_cidade`) REFERENCES `tb_cidade` (`codigo_cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_responsavel_escolaridade1` FOREIGN KEY (`codigo_grau_escolaridade`) REFERENCES `tb_escolaridade` (`codigo_grau_escolaridade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_responsavel_grau_parentesco1` FOREIGN KEY (`codigo_grau_parentesco`) REFERENCES `tb_grau_parentesco` (`codigo_grau_parentesco`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_telefone_avaliador`
--
ALTER TABLE `tb_telefone_avaliador`
ADD CONSTRAINT `fk_telefone_fisioterapeuta1` FOREIGN KEY (`codigo_avaliador`) REFERENCES `tb_avaliador` (`codigo_avaliador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_telefone_responsavel`
--
ALTER TABLE `tb_telefone_responsavel`
ADD CONSTRAINT `fk_telefone_responsavel1` FOREIGN KEY (`codigo_responsavel`) REFERENCES `tb_responsavel` (`codigo_responsavel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
