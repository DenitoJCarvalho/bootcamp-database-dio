
create database projeto_ecommerce;

use projeto_ecommerce;

create table cliente(
	clienteId int unsigned not null auto_increment,
    nome varchar(45) not null,
    dataNascimento date not null,
    endereco varchar(100),
    email varchar(45) not null,
    sexoId int not null,
    tipoCadastroId tinyint not null,
    pedidoId int not null,
    pagamentoId int not null,
    
    primary key (clienteId),
    
    constraint sexo_cliente  foreign key (sexoId) references sexo(sexoId),
    constraint tipoDeCadastro_cliente foreign key (tipoCadastroId) references tipoDeCadastro(tipoCadastroId),
    constraint pedido_cliente foreign key (pedidoId) references pedido(pedidoId),
    constraint pagamento_cliente foreign key (pagamentoId) references pagamento(pagamentoId)
);

desc cliente;
alter table cliente add column telefoneId int not null;
alter table cliente add constraint telefone_cliente foreign key (telefoneId) references telefone(telefoneId);
insert into cliente(nome, dataNascimento, endereco, email, telefoneId, sexoId, tipoCadastroId, pedidoId, pagamentoId )
values('Cliente A', '19920125', 'rua A, 200, Jd dos Testes, Itu, SP', 'clienteA@gmail.com',7, 1, 1,1,1),
('Cliente B', '20000125', 'rua B, 300, Jd dos Testes, Itu, SP', 'clienteB@gmail.com',6, 1, 1,1,1);
select * from cliente;

create table sexo(
	sexoId int unsigned not null,
    descricao varchar(45),
    
    primary key (sexoId)
);
alter table sexo modify sexoId int not null;
insert into sexo values (1, 'Masculino'), (2, 'Femenino');
update sexo set descricao = 'feminino' where sexoid  = 2;
select * from sexo;

create table tipoDeCadastro(
	tipoCadastroId tinyint not null,
    descricao varchar(45),
    
    primary key (tipoCadastroId)
);

insert into tipoDeCadastro values (1, 'CPF'), (2, 'CNPJ');

create table pedido(
	pedidoId int unsigned not null,
    localEntrega varchar(100) not null,
    pedidoStatusId tinyint not null,
    codigoRastreio varchar(45) not null,
    
    primary key(pedidoId),
    
    constraint pedidoStatus_pedido foreign key (pedidoStatusId) references pedidoStatus(pedidoStatusId)
);

insert into pedido values (003, 'rua C, 300, Jd dos Testes, Itu, SP', 1, 'GH1234F4567BR'), (004, 'rua D, 400, Jd dos Testes, Itu, SP', 1, 'JK1234F4567BR');
select * from pedido;

alter table pedido modify column pedidoId int not null;
alter table pedido add column codigoRastreio varchar(45) not null;

create table pedidoStatus(
	pedidoStatusId tinyint not null,
    descricao varchar(45),
    
    primary key(pedidoStatusId)
);

insert into pedidoStatus values (1, 'Aguardando Pagamento'), (2, 'Pedido Confirmado'), (3, 'Em andamento'), (4, 'Em separação'), (5, 'Em produção'), (6, 'Em faturamento'),
(7, 'Pronto para ser enviado'), (8, 'Entregue a transportadora'), (9, 'Entregue'), (10, 'Pagamento não realizado'), (11, 'Devolvido'), (12, 'Em disputa'), (13, 'Cancelado'),
(14, 'Fraude');
select * from pedidoStatus;

create table pagamento(
	pagamentoId int unsigned not null auto_increment,
    valorFinal decimal(10, 2) not null,
    formaPagamentoId tinyint,
    
    primary key (pagamentoId),
    
    constraint formaDePagamento_pagamento foreign key (formaPagamentoId) references formaDePagamento(formaPagamentoId)
);

alter table pagamento modify column pagamentoId int not null auto_increment;
insert into pagamento values(1, 350.00, 1), (2, 150.00, 2), (3, 300.20, 3), (4, 1225.66, 5);
select * from pagamento;

create table formaDePagamento(
	formaPagamentoId tinyint unsigned not null,
    descricao varchar(45),
    
    primary key(formaPagamentoId)
);

alter table formaDePagamento modify formaPagamentoId tinyint not null;
insert into formaDePagamento values (1, 'Cartão de crédito'), (2, 'Cartão débito'), (3, 'Boleto bancário'), (4, 'Pix'), (5, 'Paypal');
select * from formaDePagamento;

create table parceiro(
	parceiroId int not null auto_increment,
    nomeParceiro varchar(100) not null,
    email varchar(45) not null,
    endereco varchar(100) not null,
    tipoCadastroId tinyint not null,
    telefoneId int not null,
    
    primary key (parceiroId),
    
    constraint tipoDeCadastro_parceiro foreign key (tipoCadastroId) references tipoDeCadastro(tipoCadastroId),
    constraint telefone_parceiro foreign key (telefoneId) references telefone(telefoneId)
);

insert into parceiro (nomeParceiro, email, endereco, tipoCadastroId, telefoneId)
values ('vendedor-1', 'vendedor-1@gmail.com', 'rua ASD, 1000, Jd dos Parceiros, Itu, SP', 2, 1),
('vendedor-2', 'vendedor-2@gmail.com', 'rua FGH, 1000, Jd dos Parceiros, Itu, SP', 2, 2),
('vendedor-3', 'vendedor-3@gmail.com', 'rua JKL, 1000, Jd dos Parceiros, Itu, SP', 1, 3),
('vendedor-4', 'vendedor-4@gmail.com', 'rua ZXC, 1000, Jd dos Parceiros, Itu, SP', 2, 4);
select * from parceiro;

create table telefone(
	telefoneId int not null,
	clienteId int not null,
	telefoneFixo varchar(11) default('110000-0000'),
    telefoneCelular varchar(12) not null,
    isWhatsApp bit not null default(0),
    
    primary key (telefoneId)
);
insert into telefone (clienteId, telefoneCelular, isWhatsApp) 
values (5, '1191234-5678', 1), (6, '1190000-5678', 1), (7, '1191234-0000', 0), (8, '1191230-5678', 1),
(9, '1191234-0078', 1), (10, '1191234-5228', 1), (11, '1191234-1111', 1);
alter table telefone modify column telefoneId int not null auto_increment;
delete from telefone where telefoneId in (1, 4);
select * from telefone;

create table fornecedor(
	fornecedorId int not null auto_increment,
    razaoSocial varchar(50) not null,
    nomeFantasia varchar(50) not null,
    endereco varchar(100) not null,
    tipoCadastroId tinyint not null,
    telefoneId int not null,
    
    primary key (fornecedorId),
    
    constraint tipoCadastro_fornecedor foreign key (tipoCadastroId) references tipoDeCadastro(tipoCadastroId),
    constraint telefone_fonecedor foreign key (telefoneId) references telefone(telefoneId)
);
alter table fornecedor add constraint telefone_fornecedor foreign key (telefoneId) references telefone(telefoneId);
insert into fornecedor (razaoSocial, nomeFantasia, endereco, tipoCadastroId, telefoneId)
values('Mercado-2', 'MarketTwo', 'rua dos Fornecedores, 12, Jd dos fornecedores', 2, 6),
('Mercado-3', 'MarketThree', 'rua dos Fornecedores, 15, Jd dos fornecedores', 2, 7),
('Mercado-4', 'MarketFour', 'rua dos Fornecedores, 17, Jd dos fornecedores', 2, 8);
select * from fornecedor;

create table if not exists produtos(
	produtoId int not null,
    nomeProduto varchar(100) not null,
    descricao varchar(100) not null,
    valor decimal(10,2) not null,
    categoriaId int not null,
    
    primary key (produtoId),
    
    constraint cateoria_produtdo foreign key (categoriaId) references categoria(categoriaId)
);
alter table produtos rename column descricao to marca;
alter table produtos add column quantidade decimal(10.2) not null default(0.00);
insert into produtos 
values(1, 'memoria ram 2gb', 'kingstone', 120.99, 2),
(2, 'memoria ram 4gb', 'kingstone', 120.99, 2),
(3, 'memoria ram 16gb', 'kingstone', 120.99, 2),
(4, 'SSD 400gb', 'scandisk', 299.89, 2);
select * from produtos;
update produtos set quantidade = 50 where produtoId in (2, 3);

create table if not exists categoria(
	categoriaId int not null,
    descricao varchar(45)
);

insert into categoria values (1, 'Componentes'), (2, 'memória ram'), (3, 'ssd'), (4, 'Hd'), (5, 'processador'), (6, 'cooler'),
(7, 'fonte de alimentação'), (8, 'placa-mãe'), (9, 'placa de vídeo'), (10, 'gabinete');
select * from categoria;
alter table categoria add primary key (categoriaId);

create table if not exists fornecedor_has_produtos(
	fornecedorID int not null,
    produtoID int not null,
    
    constraint fk_fornecedor foreign key (fornecedorID) references fornecedor(fornecedorId),
    constraint fk_produto foreign key (produtoID) references produtos(produtoId)
);
alter table fornecedor_has_produtos add column entradaEm datetime not null;
insert into fornecedor_has_produtos
values(7, 1, '20220923'), (8, 2, '20220923'), (9, 3, '20220923'), (10, 4, '20220923');
select * from fornecedor_has_produtos;
truncate fornecedor_has_produtos;

create table if not exists produtos_has_pedido(
	quantidade int default ('0.00'),
    produtoID int not null,
    pedidoID int not null,
    
    constraint fk_controle_de_produtos foreign key (produtoID) references produtos(produtoId),
    constraint fk_controle_de_pedidos foreign key (pedidoID) references pedido(pedidoId)
);

create table if not exists estoque(
	estoqueId int unsigned not null auto_increment,
    endereco varchar(45) not null,
    
    primary key (estoqueId)
);

alter table estoque modify column estoqueId int not null auto_increment;

create table if not exists produtos_has_estoque(
	quantidade int default(0),
    produtoID int not null,
    estoqueID int not null,
    
    constraint fk_quantidade_produto foreign key (produtoID) references produtos(produtoId),
    constraint fk_estoque foreign key (estoqueID) references estoque(estoqueId)
);

select c.clienteId, c.nome, c.email,
	s.descricao as sexo,
    tc.descricao as documento,
    p.localEntrega as `Local de Entrega`,
    p.codigoRastreio as `Código de Rastreio`,
    pg.valorFinal as Total,
    t.telefoneFixo,
    t.telefoneCelular,
    t.isWhatsApp as Whatsapp
from cliente c
join sexo s on s.sexoId = c.sexoId
join tipoDeCadastro tc on tc.tipoCadastroId = c.tipoCadastroId
join pedido p on p.pedidoId = c.pedidoId
join pagamento pg on pg.pagamentoId = c.pagamentoId
join telefone t on t.telefoneId = c.telefoneId
where c.clienteId = 3;



