create database WeGo;
use WeGo;

-- Tabela: endereco
CREATE TABLE endereco (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cep VARCHAR(255),
  complemento VARCHAR(255),
  numero INT,
  cidade VARCHAR(255),
  rua VARCHAR(255),
  uf VARCHAR(255)
);

-- Tabela: imagem_ong
CREATE TABLE imagem_ong (
  id INT NOT NULL PRIMARY KEY auto_increment,
  link VARCHAR(255)
);

-- Tabela: imagem_usuario
CREATE TABLE imagem_usuario (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  arquivo VARCHAR(255),
  dados LONGBLOB
);

-- Tabela: ong
CREATE TABLE ong (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cnpj CHAR(18),
  cpf CHAR(14),
  nome VARCHAR(100),
  razao_social VARCHAR(100),
  senha VARCHAR(255),
  email VARCHAR(100),
  fkImagemOng INT,
  fkEndereco INT,
  link VARCHAR(255),
  FOREIGN KEY (fkEndereco) REFERENCES endereco(id),
  foreign key (fkImagemOng) REFERENCES imagem_ong(id)
);

-- Tabela: usuario
CREATE TABLE usuario (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255),
  cpf VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  senha VARCHAR(255),
  dataNasc DATE,
  userNovo BIT(1),
  fkImagemUsuario INT,
  fkEndereco INT,
  FOREIGN KEY (fkImagemUsuario) REFERENCES imagem_usuario(id),
  FOREIGN KEY (fkEndereco) REFERENCES endereco(id)
);

-- Tabela: pet
CREATE TABLE pet (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255),
  porte VARCHAR(255),
  idade DOUBLE,
  isAdopted TINYINT,
  isVacinado TINYINT,
  isVermifugo TINYINT,
  isCastrado TINYINT,
  descricao LONGTEXT,
  curtidas INT,
  sexo VARCHAR(45),
  fkOng INT,
  FOREIGN KEY (fkOng) REFERENCES ong(id)
);

-- Tabela: statusPet
CREATE TABLE pet_status (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  status ENUM('ADOPTED', 'LIKED', 'PENDING'),
  fkUsuario INT,
  fkPet INT,
  alterado_para_pending DATETIME,
  FOREIGN KEY (fkUsuario) REFERENCES usuario(id),
  FOREIGN KEY (fkPet) REFERENCES pet(id)
);


-- Tabela: dashboard
CREATE TABLE dashboard (
  id INT NOT NULL,
  fkOng INT NOT NULL,
  PRIMARY KEY (id, fkOng),
  FOREIGN KEY (fkOng) REFERENCES ong(id)
);

-- Tabela: imagem_pet
CREATE TABLE imagem_pet (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  link VARCHAR(255),
  fkPet INT,
  FOREIGN KEY (fkPet) REFERENCES pet(id)
);

CREATE TABLE pet_tags (
  pet_id INT NOT NULL,
  tag VARCHAR(255),
  FOREIGN KEY (pet_id) REFERENCES pet(id)
);



show tables;
select * from usuario;
desc usuario;
select * from imagem_usuario;
select * from pet;
select * from imagem_pet;
select * from pet_status;
select * from ong;
select * from imagem_ong;
select * from endereco;
select * from dashboard;
show tables;