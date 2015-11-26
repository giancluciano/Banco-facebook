CREATE TABLE USUARIO(
  NOME VARCHAR(20) NOT NULL,
  EMAIL VARCHAR(50) NOT NULL,
  DATANASC DATE NOT NULL,
  GENERO CHAR(1) NOT NULL,
  NUMCELULAR NUMBER(11),
  NUMAMIGOS NUMBER(5),
  COD_ENDERECO NUMBER(8),
  
  CONSTRAINT PK_EMAIL PRIMARY KEY(EMAIL),
  CONSTRAINT AK_NUMCELULAR UNIQUE(NUMCELULAR),
  CONSTRAINT CK_GENERO CHECK (GENERO IN ('M', 'F')),
  CONSTRAINT FK_ENDERECO FOREIGN KEY (COD_ENDERECO)REFERENCES ENDERECO
);

CREATE TABLE PAGINA(
  NOME VARCHAR(40) NOT NULL,
  CATEGORIA VARCHAR(15) NOT NULL,
  DATACRIACAO DATE NOT NULL,
  QNTDCURTIDAS NUMBER(30) NOT NULL,
  EMAIL VARCHAR(50) NOT NULL,
  COD_ENDERECO NUMBER(8),
  
  CONSTRAINT PK_NOME PRIMARY KEY (NOME),
  CONSTRAINT CK_CATEGORIA CHECK (CATEGORIA IN ('Negócios','Empresa','Marca','Artista','Entretenimento','Causa')),
  CONSTRAINT FK_ENDERECO_PAGINA FOREIGN KEY (COD_ENDERECO)REFERENCES ENDERECO
);

CREATE TABLE GRUPO(
  NOME VARCHAR(40) NOT NULL,
  STATUS VARCHAR(40) NOT NULL,
  CATEGORIA VARCHAR(20) NULL,
  DESCRICAO VARCHAR(200) NULL,
  NUMEROGRUPO NUMBER(38) NOT NULL,
  QNTDMEMBROS NUMBER(6) NOT NULL,
  
  CONSTRAINT PK_NUMEROGRUPO_GRUPO PRIMARY KEY (NUMEROGRUPO),
  CONSTRAINT CK_STATUS_GRUPO CHECK (STATUS IN ('Publico', 'Fechado', 'Secreto'))
);

CREATE TABLE EVENTO(
  NOME VARCHAR(40) NOT NULL,
  IDEVENTO NUMBER(38)NOT NULL,
  DATAEVENTO DATE NOT NULL,
  NUMCONFIRMADOS NUMBER(8),
  STATUS VARCHAR(20) NOT NULL,
  COD_ENDERECO NUMBER(8),
  
  CONSTRAINT PK_EVENTO PRIMARY KEY(IDEVENTO),
  CONSTRAINT CK_STATUS_EVENTO CHECK (STATUS IN ('Publico', 'Privado')),
  CONSTRAINT FK_ENDERECO_EVENTO FOREIGN KEY (COD_ENDERECO)REFERENCES ENDERECO
);

CREATE TABLE ENDERECO(
  COD_ENDERECO NUMBER(8) NOT NULL,
  ESTADO VARCHAR(40) NOT NULL,
  CIDADE VARCHAR(40) NOT NULL,
  PAIS VARCHAR(40) NOT NULL,
  CEP NUMBER(8) NOT NULL,
  NUMERORESIDENCIA NUMBER(6) NOT NULL,
  
  CONSTRAINT PK_ENDERECO PRIMARY KEY(COD_ENDERECO),
  CONSTRAINT CK_RESIDENCIA CHECK (NUMERORESIDENCIA > 0)
);

CREATE TABLE USUARIO_PAGINA(
  EMAIL VARCHAR(50) NOT NULL,
  NOME VARCHAR(40) NOT NULL,
  
  CONSTRAINT PK_USUARIO_PAGINA PRIMARY KEY(EMAIL),
  CONSTRAINT FK_USUARIO FOREIGN KEY (EMAIL) REFERENCES USUARIO,
  CONSTRAINT FK_PAGINA FOREIGN KEY (NOME) REFERENCES PAGINA
);

CREATE TABLE USUARIO_GRUPO(
  EMAIL VARCHAR(50) NOT NULL,
  NUMEROGRUPO NUMBER(38) NOT NULL,
  
  CONSTRAINT PK_USUARIO_GRUPO PRIMARY KEY (EMAIL),
  CONSTRAINT FK_USUARIO_USU_GRUP FOREIGN KEY (EMAIL) REFERENCES USUARIO,
  CONSTRAINT FK_GRUPO FOREIGN KEY (NUMEROGRUPO) REFERENCES GRUPO
);

CREATE TABLE USUARIO_EVENTO(
  EMAIL VARCHAR(50) NOT NULL,
  IDEVENTO NUMBER(38)NOT NULL,
  
  CONSTRAINT PK_USUARIO_EVENTO PRIMARY KEY (EMAIL),
  CONSTRAINT FK_USUARIO_USU_EVE FOREIGN KEY (EMAIL) REFERENCES USUARIO,
  CONSTRAINT FK_EVENTO FOREIGN KEY (IDEVENTO) REFERENCES EVENTO
);

CREATE TABLE EVENTO_ENDERECO(
  IDEVENTO NUMBER(38)NOT NULL,
  COD_ENDERECO NUMBER(8) NOT NULL,
  
  CONSTRAINT PK_EVENTO_ENDERECO PRIMARY KEY (IDEVENTO),
  CONSTRAINT FK_EVENTO_EVE_END FOREIGN KEY (IDEVENTO) REFERENCES EVENTO,
  CONSTRAINT FK_ENDERECO_EVE_END FOREIGN KEY (COD_ENDERECO) REFERENCES ENDERECO
);

--inserir enderecos (COD_ENDERECO,ESTADO,CIDADE,PAIS,CEP,NUMERORESIDENCIA)
INSERT INTO ENDERECO
VALUES(1,'RS','Porto Alegre','Brasil','91450155', 165);
INSERT INTO ENDERECO
VALUES(2,'RS','Canoas','Brasil','95762485', 562);
INSERT INTO ENDERECO
VALUES(3,'RS','Alvorada','Brasil','68234876', 85);
INSERT INTO ENDERECO
VALUES(4,'RS','Viamão','Brasil','75168359', 65);
INSERT INTO ENDERECO
VALUES(5,'SP','São Paulo','Brasil','98659825', 15);
INSERT INTO ENDERECO
VALUES(6,'RJ','Rio De Janeiro','Brasil','76598652', 69);
INSERT INTO ENDERECO
VALUES(7,'RS','Porto Alegre','Brasil','53894586', 75);
INSERT INTO ENDERECO
VALUES(8,'RS','Guaiba','Brasil','85498625', 45);
INSERT INTO ENDERECO
VALUES(9,'AC','Rio Branco','Brasil','75924685', 54);
INSERT INTO ENDERECO
VALUES(10,'MT','Cuiabá','Brasil','42689758', 78);
INSERT INTO ENDERECO
VALUES(11,'PE','Recife','Brasil','46582579', 65);
INSERT INTO ENDERECO
VALUES(12,'MG','Belo Horizonte','Brasil','93515785', 25);
INSERT INTO ENDERECO
VALUES(13,'SC','Florianópolis','Brasil','86482879', 85);
INSERT INTO ENDERECO
VALUES(14,'TO','Palmas','Brasil','91548625', 75);
INSERT INTO ENDERECO
VALUES(15,'RR','Boa Vista','Brasil','78564985', 23);
INSERT INTO ENDERECO
VALUES(16,'PI','Teresina','Brasil','16875498', 98);
INSERT INTO ENDERECO
VALUES(17,'PR','Curitiba','Brasil','63982571', 21);
INSERT INTO ENDERECO
VALUES(18,'PA','Belém','Brasil','76842398', 42);
INSERT INTO ENDERECO
VALUES(19,'MS','Campo Grande','Brasil','68975485', 96);
INSERT INTO ENDERECO
VALUES(20,'RN','Natal','Brasil','13467985', 12);
--inserir usuarios
INSERT INTO USUARIO
VALUES ('Gian Carlo','giancluciano@gmail.com',TO_DATE('06/06/1997','dd/mm/yyyy') , 'M',5192668962,0 ,1);

--inserir paginas

--inserir grupos

--inserir evencos

--inserir usuario-pagica

--usuario_grupo

--usuario_evento

--evento_endereco

--5 consutas basicas

--5 consutas com juncoes entre tabelas

--5 consutas com group by e having

--5 consutas com sub-consutas

