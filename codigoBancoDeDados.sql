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
  endereco_id INT,
  link VARCHAR(255),
  FOREIGN KEY (endereco_id) REFERENCES endereco(id)
);


-- Tabela: imagem_ong
CREATE TABLE imagem_ong (
  id_imagem_ong INT NOT NULL PRIMARY KEY auto_increment,
  link VARCHAR(255),
  fkOng VARCHAR(45),
  FOREIGN KEY (id_imagem_ong) REFERENCES ong(id)
);

-- Tabela: imagem_usuario
CREATE TABLE imagem_usuario (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  link VARCHAR(255),
  fkUsuario INT
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
  imagem_usuario_id INT UNIQUE,
  endereco_id INT,
  FOREIGN KEY (imagem_usuario_id) REFERENCES imagem_usuario(id),
  FOREIGN KEY (endereco_id) REFERENCES endereco(id)
);

-- Tabela: pet
CREATE TABLE pet (
  pet_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255),
  porte VARCHAR(255),
  idade DOUBLE,
  isAdopted TINYINT,
  isVacinado TINYINT,
  isVermifugo TINYINT,
  isCastrado DOUBLE,
  descricao LONGTEXT,
  curtidas INT,
  sexo VARCHAR(45),
  fkOng INT,
  FOREIGN KEY (fkOng) REFERENCES ong(id)
);

-- Tabela: statusPet
CREATE TABLE pet_status (
  id INT NOT NULL PRIMARY KEY,
  status ENUM('ADOPTED', 'LIKED', 'PENDING'),
  usuario_id INT,
  pet_id INT,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  FOREIGN KEY (pet_id) REFERENCES pet(pet_id)
);

-- Tabela: dashboard
CREATE TABLE dashboard (
  id INT NOT NULL,
  ong_idong INT NOT NULL,
  PRIMARY KEY (id, ong_idong),
  FOREIGN KEY (ong_idong) REFERENCES ong(id)
);

-- Tabela: imagem_pet
CREATE TABLE imagem_pet (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  link VARCHAR(255),
  fk_pet INT,
  FOREIGN KEY (fk_pet) REFERENCES pet(pet_id)
);

ALTER TABLE ong ADD CONSTRAINT fk_ong_imagem FOREIGN KEY (fkImagemOng) REFERENCES imagem_ong(id_imagem_ong);

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