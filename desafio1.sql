DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
	plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(20) NOT NULL,
    valor_plano DECIMAL(4, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
    usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATE NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
) engine=InnoDB;

CREATE TABLE SpotifyClone.artistas(
	artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_artista VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
	album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
	cancao_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_cancao VARCHAR(50) NOT NULL,
    duracao_segundos INT NOT NULL,
    ano_lancamento YEAR(4) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns (album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historicos(
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    data_reproducao TIMESTAMP NOT NULL,
    PRIMARY KEY (usuario_id, cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguindo_artistas(
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) engine = InnoDB;


INSERT INTO SpotifyClone.planos (nome_plano, valor_plano)
VALUES
  ('gratuito', '0'),
  ('familiar', '7.99'),
  ('pessoal', '6.99'),
  ('universitário', '5.99');

INSERT INTO SpotifyClone.usuarios (nome_usuario, idade, plano_id, data_assinatura)
VALUES
  ('Thati', '23', '1', '2019-10-20'),
  ('Cintia', '35', '2', '2017-12-30'),
  ('Bill', '20', '4', '2019-06-05'),
  ('Roger', '45', '3', '2020-05-13'),
  ('Norman', '58', '3', '2017-02-17'),
  ('Patrick', '33', '2', '2017-01-06'),
  ('Vivian', '26', '4', '2018-01-05'),
  ('Carol', '19', '4', '2018-02-14'),
  ('Angelina', '42', '2', '2018-04-29'),
  ('Paul', '46', '2', '2017-01-17');
  
INSERT INTO SpotifyClone.artistas (nome_artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

INSERT INTO SpotifyClone.albuns (nome_album, artista_id)
VALUES
  ('Envious', '1'),
  ('Exuberant', '1'),
  ('Hallowed Steam', '2'),
  ('Incandescent', '3'),
  ('Temporary Culture', '4'),
  ('Library of liberty', '4'),
  ('Chained Down', '5'),
  ('Cabinet of fools', '5'),
  ('No guarantees', '5'),
  ('Apparatus', '6');
  
INSERT INTO SpotifyClone.cancoes (nome_cancao, duracao_segundos, ano_lancamento, album_id)
VALUES
  ('Soul For Us', '200', '1990', '1'),
  ('Reflections Of Magic', '163', '1990', '1'),
  ('Dance With Her Own', '116', '1990', '1'),
  
  ('Troubles Of My Inner Fire', '203', '1993', '2'),
  ('Time Fireworks', '152', '1993', '2'),
  
  ('Magic Circus', '105', '1955', '3'),
  ('Honey, So Do I', '207', '1955', '3'),
  ("Sweetie, Let's Go Wild", '139', '1955', '3'),
  ('She Knows', '244', '1955', '3'),

  ('Fantasy For Me', '100', '1998', '4'),
  ('Celebration Of More', '146', '1998', '4'),
  ('Rock His Everything', '223', '1998', '4'),
  ('Home Forever', '231', '1998', '4'),
  ('Diamond Power', '241', '1998', '4'),
  ("Let's Be Silly", '132', '1998', '4'),
  
  ("Thang Of Thunder", '240', '2001', '5'),
  ("Words Of Her Life", '185', '2001', '5'),
  ("Without My Streets", '176', '2001', '5'),
  
  ("Need Of The Evening", '190', '2003', '6'),
  ("History Of My Roses", '222', '2003', '6'),
  ("Without My Love", '111', '2003', '6'),
  ("Walking And Game", '123', '2003', '6'),
  ("Young And Father", '197', '2003', '6'),

  ("Finding My Traditions", '179', '2007', '7'),
  ("Walking And Man", '229', '2007', '7'),
  ("Hard And Time", '135', '2007', '7'),
  ("Honey, I'm A Lone Wolf", '150', '2007', '7'),

  ("She Thinks I Won't Stay Tonight", '166', '2012', '8'),
  ("He Heard You're Bad For Me", '154', '2012', '8'),
  ("He Hopes We Can't Stay", '210', '2012', '8'),
  ("I Know I Know", '117', '2012', '8'),
  
  ("He's Walking Away", '159', '2015', '9'),
  ("He's Trouble", '138', '2015', '9'),
  ("I Heard I Want To Bo Alone", '120', '2015', '9'),
  ("I Ride Alone", '151', '2015', '9'),
   
  ("Honey", '79', '2015', '10'),
  ("You Cheated On Me", '95', '2015', '10'),
  ("Baby", '213', '2015', '10'),
  ("You Make Me Feel So..", '136', '2015', '10'),
  ("Silly", '83', '2015', '10');

  
INSERT INTO SpotifyClone.historicos (usuario_id, cancao_id, data_reproducao)
VALUES
  ('1', '1', '2020-02-28 10:45:55'),
  ('1', '2', '2020-05-02 05:30:35'),
  ('1', '3', '2020-03-06 11:22:33'),
  ('1', '4', '2020-08-05 08:05:17'),
  ('1', '5', '2020-09-14 16:32:22'),

  ('2', '6', '2020-01-02 07:40:33'),
  ('2', '7', '2020-05-16 06:16:22'),
  ('2', '8', '2020-10-09 12:27:48'),
  ('2', '9', '2020-09-21 13:14:46'),

  ('3', '10', '2020-11-13 16:55:13'),
  ('3', '11', '2020-12-05 18:38:30'),
  ('3', '12', '2020-07-30 10:00:00'),

  ('4', '13', '2021-08-15 17:10:10'),
  ('4', '14', '2021-07-10 15:20:30'),
  ('4', '15', '2021-01-09 01:44:33'),

  ('5', '16', '2020-07-03 19:33:28'),
  ('5', '17', '2017-02-24 21:14:22'),
  ('5', '18', '2020-08-06 15:23:43'),
  ('5', '19', '2020-11-10 13:52:27'),
  
  ('6', '20', '2019-02-07 20:33:48'),
  ('6', '21', '2017-01-24 00:31:17'),
  ('6', '22', '2017-10-12 12:35:20'),
  ('6', '23', '2018-05-29 14:56:41'),
  
  ('7', '24', '2018-05-09 22:30:49'),
  ('7', '25', '2020-07-27 12:52:58'),
  ('7', '26', '2018-01-16 18:40:43'),
  
  ('8', '27', '2018-03-21 16:56:40'),
  ('8', '28', '2020-10-18 13:38:05'),
  ('8', '29', '2019-05-25 08:14:03'),
  ('8', '30', '2021-08-15 21:37:09'),

  ('9', '31', '2021-05-24 17:23:45'),
  ('9', '32', '2018-12-07 22:48:52'),
  ('9', '33', '2021-03-14 06:14:26'),
  ('9', '34', '2020-04-01 03:36:00'),
  
  ('10', '35', '2017-02-06 08:21:34'),
  ('10', '36', '2017-12-04 05:33:43'),
  ('10', '37', '2017-07-27 05:24:49'),
  ('10', '38', '2017-12-25 01:03:57');
  
INSERT INTO SpotifyClone.seguindo_artistas (usuario_id, artista_id)
VALUES
  ('1', '1'),
  ('1', '4'),
  ('1', '3'),
  ('2', '1'),
  ('2', '3'),
  ('3', '2'),
  ('3', '1'),
  ('4', '4'),
  ('5', '5'),
  ('5', '6'),
  ('6', '6'),
  ('6', '3'),
  ('6', '1'),
  ('7', '2'),
  ('7', '5'),
  ('8', '1'),
  ('8', '5'),
  ('9', '6'),
  ('9', '4'),
  ('9', '3'),
  ('10', '2'),
  ('10', '6');
  