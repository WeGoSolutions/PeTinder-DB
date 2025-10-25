create DATABASE WeGo;
USE WeGo;

-- Tabela: endereco
CREATE TABLE endereco (
  id BINARY(16) NOT NULL PRIMARY KEY,
  cep VARCHAR(255),
  complemento VARCHAR(255),
  numero INT,
  cidade VARCHAR(255),
  rua VARCHAR(255),
  uf VARCHAR(255)
);

-- Tabela: imagem_ong
CREATE TABLE imagem_ong (
  id BINARY(16) NOT NULL PRIMARY KEY,
  arquivo VARCHAR(255),
  dados LONGBLOB
);

-- Tabela: imagem_usuario
CREATE TABLE imagem_usuario (
  id BINARY(16) NOT NULL PRIMARY KEY,
  arquivo VARCHAR(255),
  dados LONGBLOB
);

-- Tabela: ong
CREATE TABLE ong (
  id BINARY(16) NOT NULL PRIMARY KEY,
  cnpj CHAR(18),
  cpf CHAR(14),
  nome VARCHAR(100),
  razao_social VARCHAR(100),
  senha VARCHAR(255),
  email VARCHAR(100),
  fk_imagem_ong BINARY(16),
  fk_endereco BINARY(16),
  link VARCHAR(255),
  FOREIGN KEY (fk_endereco) REFERENCES endereco(id),
  FOREIGN KEY (fk_imagem_ong) REFERENCES imagem_ong(id)
);

-- Tabela: usuario
CREATE TABLE usuario (
  id BINARY(16) NOT NULL PRIMARY KEY,
  nome VARCHAR(255),
  cpf VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  senha VARCHAR(255),
  data_nasc DATE,
  user_novo BIT(1),
  fk_imagem_usuario BINARY(16),
  fk_endereco BINARY(16),
  FOREIGN KEY (fk_imagem_usuario) REFERENCES imagem_usuario(id),
  FOREIGN KEY (fk_endereco) REFERENCES endereco(id)
);

-- Tabela: pet
CREATE TABLE pet (
  id BINARY(16) NOT NULL PRIMARY KEY,
  nome VARCHAR(255),
  porte VARCHAR(255),
  idade DOUBLE,
  is_adopted TINYINT,
  is_vacinado TINYINT,
  is_vermifugo TINYINT,
  is_castrado TINYINT,
  descricao LONGTEXT,
  curtidas INT,
  sexo VARCHAR(45),
  fk_ong BINARY(16),
  FOREIGN KEY (fk_ong) REFERENCES ong(id)
);

-- Tabela: pet_status
CREATE TABLE pet_status (
  id BINARY(16) NOT NULL PRIMARY KEY,
  status ENUM('ADOPTED', 'LIKED', 'PENDING'),
  fk_usuario BINARY(16),
  fk_pet BINARY(16),
  alterado_para_pending DATETIME,
  FOREIGN KEY (fk_usuario) REFERENCES usuario(id),
  FOREIGN KEY (fk_pet) REFERENCES pet(id)
);

-- Tabela: dashboard
CREATE TABLE dashboard (
  id BINARY(16) NOT NULL,
  fk_ong BINARY(16) NOT NULL,
  PRIMARY KEY (id, fk_ong),
  FOREIGN KEY (fk_ong) REFERENCES ong(id)
);

-- Tabela: imagem_pet
CREATE TABLE imagem_pet (
  id BINARY(16) NOT NULL PRIMARY KEY,
  link VARCHAR(255),
  fk_pet BINARY(16),
  key_s3 VARCHAR(255),
  FOREIGN KEY (fk_pet) REFERENCES pet(id)
);

-- Tabela: pet_tags
CREATE TABLE pet_tags (
  pet_id BINARY(16) NOT NULL,
  tag VARCHAR(255),
  FOREIGN KEY (pet_id) REFERENCES pet(id)
);

-- Tabela: mensagem_chat
CREATE TABLE mensagem_chat (
    id BINARY(16) NOT NULL PRIMARY KEY,
    fk_usuario BINARY(16) NOT NULL,
    fk_ong BINARY(16) NOT NULL,
    mensagem LONGTEXT NOT NULL,
    enviado_por ENUM('USUARIO','ONG') NOT NULL,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id),
    FOREIGN KEY (fk_ong) REFERENCES ong(id)
);

-- Comandos de teste
SHOW TABLES;
SELECT * FROM usuario;
DESC usuario;
SELECT * FROM imagem_usuario;
SELECT * FROM pet;
SELECT * FROM imagem_pet;
SELECT * FROM pet_status;
SELECT * FROM ong;
SELECT * FROM imagem_ong;
SELECT * FROM endereco;	
SELECT * FROM dashboard;
SHOW TABLES;
