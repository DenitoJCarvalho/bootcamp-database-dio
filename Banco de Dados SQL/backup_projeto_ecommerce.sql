CREATE DATABASE  IF NOT EXISTS `projeto_ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projeto_ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: projeto_ecommerce
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `categoriaId` int NOT NULL,
  `descricao` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`categoriaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Componentes'),(2,'memória ram'),(3,'ssd'),(4,'Hd'),(5,'processador'),(6,'cooler'),(7,'fonte de alimentação'),(8,'placa-mãe'),(9,'placa de vídeo'),(10,'gabinete');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `clienteId` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataNascimento` date NOT NULL,
  `endereco` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexoId` int NOT NULL,
  `tipoCadastroId` tinyint NOT NULL,
  `pedidoId` int NOT NULL,
  `pagamentoId` int NOT NULL,
  `telefoneId` int NOT NULL,
  PRIMARY KEY (`clienteId`),
  KEY `sexo_cliente` (`sexoId`),
  KEY `tipoDeCadastro_cliente` (`tipoCadastroId`),
  KEY `pedido_cliente` (`pedidoId`),
  KEY `pagamento_cliente` (`pagamentoId`),
  KEY `telefone_cliente` (`telefoneId`),
  CONSTRAINT `pagamento_cliente` FOREIGN KEY (`pagamentoId`) REFERENCES `pagamento` (`pagamentoId`),
  CONSTRAINT `pedido_cliente` FOREIGN KEY (`pedidoId`) REFERENCES `pedido` (`pedidoId`),
  CONSTRAINT `sexo_cliente` FOREIGN KEY (`sexoId`) REFERENCES `sexo` (`sexoId`),
  CONSTRAINT `telefone_cliente` FOREIGN KEY (`telefoneId`) REFERENCES `telefone` (`telefoneId`),
  CONSTRAINT `tipoDeCadastro_cliente` FOREIGN KEY (`tipoCadastroId`) REFERENCES `tipodecadastro` (`tipoCadastroId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Adrian D. de Carvalho','1990-01-25','rua A, 100, Jd dos Testes, Itu, SP','bebe@gmail.com',1,1,1,1,8),(2,'Cliente A','1992-01-25','rua A, 200, Jd dos Testes, Itu, SP','clienteA@gmail.com',1,1,1,1,7),(3,'Cliente B','2000-01-25','rua B, 300, Jd dos Testes, Itu, SP','clienteB@gmail.com',1,1,1,1,6);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `estoqueId` int NOT NULL AUTO_INCREMENT,
  `endereco` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`estoqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formadepagamento`
--

DROP TABLE IF EXISTS `formadepagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formadepagamento` (
  `formaPagamentoId` tinyint NOT NULL,
  `descricao` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`formaPagamentoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formadepagamento`
--

LOCK TABLES `formadepagamento` WRITE;
/*!40000 ALTER TABLE `formadepagamento` DISABLE KEYS */;
INSERT INTO `formadepagamento` VALUES (1,'Cartão de crédito'),(2,'Cartão débito'),(3,'Boleto bancário'),(4,'Pix'),(5,'Paypal');
/*!40000 ALTER TABLE `formadepagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `fornecedorId` int NOT NULL AUTO_INCREMENT,
  `razaoSocial` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomeFantasia` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipoCadastroId` tinyint NOT NULL,
  `telefoneId` int NOT NULL,
  PRIMARY KEY (`fornecedorId`),
  KEY `tipoCadastro_fornecedor` (`tipoCadastroId`),
  KEY `telefone_fornecedor` (`telefoneId`),
  CONSTRAINT `telefone_fornecedor` FOREIGN KEY (`telefoneId`) REFERENCES `telefone` (`telefoneId`),
  CONSTRAINT `tipoCadastro_fornecedor` FOREIGN KEY (`tipoCadastroId`) REFERENCES `tipodecadastro` (`tipoCadastroId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (7,'Mercado-1','MarketOne','rua dos Fornecedores, 10, Jd dos fornecedores',2,5),(8,'Mercado-2','MarketTwo','rua dos Fornecedores, 12, Jd dos fornecedores',2,6),(9,'Mercado-3','MarketThree','rua dos Fornecedores, 15, Jd dos fornecedores',2,7),(10,'Mercado-4','MarketFour','rua dos Fornecedores, 17, Jd dos fornecedores',2,8);
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor_has_produtos`
--

DROP TABLE IF EXISTS `fornecedor_has_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor_has_produtos` (
  `fornecedorID` int NOT NULL,
  `produtoID` int NOT NULL,
  `entradaEm` datetime NOT NULL,
  KEY `fk_fornecedor` (`fornecedorID`),
  KEY `fk_produto` (`produtoID`),
  CONSTRAINT `fk_fornecedor` FOREIGN KEY (`fornecedorID`) REFERENCES `fornecedor` (`fornecedorId`),
  CONSTRAINT `fk_produto` FOREIGN KEY (`produtoID`) REFERENCES `produtos` (`produtoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_has_produtos`
--

LOCK TABLES `fornecedor_has_produtos` WRITE;
/*!40000 ALTER TABLE `fornecedor_has_produtos` DISABLE KEYS */;
INSERT INTO `fornecedor_has_produtos` VALUES (7,1,'2022-09-23 00:00:00'),(8,2,'2022-09-23 00:00:00'),(9,3,'2022-09-23 00:00:00'),(10,4,'2022-09-23 00:00:00');
/*!40000 ALTER TABLE `fornecedor_has_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `pagamentoId` int NOT NULL AUTO_INCREMENT,
  `valorFinal` decimal(10,2) NOT NULL,
  `formaPagamentoId` tinyint DEFAULT NULL,
  PRIMARY KEY (`pagamentoId`),
  KEY `formaDePagamento_pagamento` (`formaPagamentoId`),
  CONSTRAINT `formaDePagamento_pagamento` FOREIGN KEY (`formaPagamentoId`) REFERENCES `formadepagamento` (`formaPagamentoId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,350.00,1),(2,150.00,2),(3,300.20,3),(4,1225.66,5);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parceiro`
--

DROP TABLE IF EXISTS `parceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parceiro` (
  `parceiroId` int NOT NULL AUTO_INCREMENT,
  `nomeParceiro` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipoCadastroId` tinyint NOT NULL,
  `telefoneId` int NOT NULL,
  PRIMARY KEY (`parceiroId`),
  KEY `tipoDeCadastro_parceiro` (`tipoCadastroId`),
  KEY `telefone_parceiro` (`telefoneId`),
  CONSTRAINT `telefone_parceiro` FOREIGN KEY (`telefoneId`) REFERENCES `telefone` (`telefoneId`),
  CONSTRAINT `tipoDeCadastro_parceiro` FOREIGN KEY (`tipoCadastroId`) REFERENCES `tipodecadastro` (`tipoCadastroId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro`
--

LOCK TABLES `parceiro` WRITE;
/*!40000 ALTER TABLE `parceiro` DISABLE KEYS */;
INSERT INTO `parceiro` VALUES (1,'vendedor-1','vendedor-1@gmail.com','rua ASD, 1000, Jd dos Parceiros, Itu, SP',2,1),(2,'vendedor-2','vendedor-2@gmail.com','rua FGH, 1000, Jd dos Parceiros, Itu, SP',2,2),(3,'vendedor-3','vendedor-3@gmail.com','rua JKL, 1000, Jd dos Parceiros, Itu, SP',1,3),(4,'vendedor-4','vendedor-4@gmail.com','rua ZXC, 1000, Jd dos Parceiros, Itu, SP',2,4);
/*!40000 ALTER TABLE `parceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `pedidoId` int NOT NULL,
  `localEntrega` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedidoStatusId` tinyint NOT NULL,
  `codigoRastreio` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`pedidoId`),
  KEY `pedidoStatus_pedido` (`pedidoStatusId`),
  CONSTRAINT `pedidoStatus_pedido` FOREIGN KEY (`pedidoStatusId`) REFERENCES `pedidostatus` (`pedidoStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'rua A, 100, Jd dos Testes, Itu, SP',1,'AS1234F4567BR'),(2,'rua B, 200, Jd dos Testes, Itu, SP',1,'DF1234F4567BR'),(3,'rua C, 300, Jd dos Testes, Itu, SP',1,'GH1234F4567BR'),(4,'rua D, 400, Jd dos Testes, Itu, SP',1,'JK1234F4567BR');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidostatus`
--

DROP TABLE IF EXISTS `pedidostatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidostatus` (
  `pedidoStatusId` tinyint NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pedidoStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidostatus`
--

LOCK TABLES `pedidostatus` WRITE;
/*!40000 ALTER TABLE `pedidostatus` DISABLE KEYS */;
INSERT INTO `pedidostatus` VALUES (1,'Aguardando Pagamento'),(2,'Pedido Confirmado'),(3,'Em andamento'),(4,'Em separação'),(5,'Em produção'),(6,'Em faturamento'),(7,'Pronto para ser enviado'),(8,'Entregue a transportadora'),(9,'Entregue'),(10,'Pagamento não realizado'),(11,'Devolvido'),(12,'Em disputa'),(13,'Cancelado'),(14,'Fraude');
/*!40000 ALTER TABLE `pedidostatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `produtoId` int NOT NULL,
  `nomeProduto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marca` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `categoriaId` int NOT NULL,
  `quantidade` decimal(10,0) NOT NULL DEFAULT (0.00),
  PRIMARY KEY (`produtoId`),
  KEY `cateoria_produtdo` (`categoriaId`),
  CONSTRAINT `cateoria_produtdo` FOREIGN KEY (`categoriaId`) REFERENCES `categoria` (`categoriaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'memoria ram 2gb','kingstone',120.99,2,100),(2,'memoria ram 4gb','kingstone',120.99,2,50),(3,'memoria ram 16gb','kingstone',120.99,2,50),(4,'SSD 400gb','scandisk',299.89,2,100);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_has_estoque`
--

DROP TABLE IF EXISTS `produtos_has_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_has_estoque` (
  `quantidade` int DEFAULT (0),
  `produtoID` int NOT NULL,
  `estoqueID` int NOT NULL,
  KEY `fk_quantidade_produto` (`produtoID`),
  KEY `fk_estoque` (`estoqueID`),
  CONSTRAINT `fk_estoque` FOREIGN KEY (`estoqueID`) REFERENCES `estoque` (`estoqueId`),
  CONSTRAINT `fk_quantidade_produto` FOREIGN KEY (`produtoID`) REFERENCES `produtos` (`produtoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_has_estoque`
--

LOCK TABLES `produtos_has_estoque` WRITE;
/*!40000 ALTER TABLE `produtos_has_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos_has_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_has_pedido`
--

DROP TABLE IF EXISTS `produtos_has_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_has_pedido` (
  `quantidade` int DEFAULT (_utf8mb4'0.00'),
  `produtoID` int NOT NULL,
  `pedidoID` int NOT NULL,
  KEY `fk_controle_de_produtos` (`produtoID`),
  KEY `fk_controle_de_pedidos` (`pedidoID`),
  CONSTRAINT `fk_controle_de_pedidos` FOREIGN KEY (`pedidoID`) REFERENCES `pedido` (`pedidoId`),
  CONSTRAINT `fk_controle_de_produtos` FOREIGN KEY (`produtoID`) REFERENCES `produtos` (`produtoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_has_pedido`
--

LOCK TABLES `produtos_has_pedido` WRITE;
/*!40000 ALTER TABLE `produtos_has_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos_has_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexo` (
  `sexoId` int NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sexoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino'),(2,'feminino');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone` (
  `telefoneId` int NOT NULL AUTO_INCREMENT,
  `clienteId` int NOT NULL,
  `telefoneFixo` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT (_utf8mb4'110000-0000'),
  `telefoneCelular` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isWhatsApp` bit(1) NOT NULL DEFAULT (0),
  PRIMARY KEY (`telefoneId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` VALUES (1,1,'110000-1111','1191111-0000',_binary ''),(2,2,'112222-1111','1192222-0000',_binary '\0'),(3,3,'113333-1111','1193333-0000',_binary ''),(4,4,'114444-1111','1194444-0000',_binary '\0'),(5,5,'110000-0000','1191234-5678',_binary ''),(6,6,'110000-0000','1190000-5678',_binary ''),(7,7,'110000-0000','1191234-0000',_binary '\0'),(8,8,'110000-0000','1191230-5678',_binary ''),(9,9,'110000-0000','1191234-0078',_binary ''),(10,10,'110000-0000','1191234-5228',_binary ''),(11,11,'110000-0000','1191234-1111',_binary '');
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodecadastro`
--

DROP TABLE IF EXISTS `tipodecadastro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodecadastro` (
  `tipoCadastroId` tinyint NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tipoCadastroId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodecadastro`
--

LOCK TABLES `tipodecadastro` WRITE;
/*!40000 ALTER TABLE `tipodecadastro` DISABLE KEYS */;
INSERT INTO `tipodecadastro` VALUES (1,'CPF'),(2,'CNPJ');
/*!40000 ALTER TABLE `tipodecadastro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'projeto_ecommerce'
--

--
-- Dumping routines for database 'projeto_ecommerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-24 15:33:24
