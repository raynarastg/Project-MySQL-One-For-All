DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;


  CREATE TABLE SpotifyClone.signature(
      signature_id INT PRIMARY KEY AUTO_INCREMENT,
      plan VARCHAR(100) NOT NULL,
      value_plan DOUBLE NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.users(
      user_name VARCHAR(100) NOT NULL,
      user_age INT NOT NULL,
      user_id INT PRIMARY KEY AUTO_INCREMENT,
      date_signature DATE NOT NULL,
      signature_id INT NOT NULL,
      FOREIGN KEY (signature_id) REFERENCES signature(signature_id)
  ) engine = InnoDB;


  CREATE TABLE SpotifyClone.artist(
      artist_name VARCHAR(200) NOT NULL,
      artist_id INT PRIMARY KEY AUTO_INCREMENT
        ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      albuns_id INT PRIMARY KEY AUTO_INCREMENT,
      album_name VARCHAR(200) NOT NULL,
      year_release INT NOT NULL,
      artist_id INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.musics(
      music VARCHAR(200) NOT NULL,
      music_id INT PRIMARY KEY AUTO_INCREMENT,
      duration_seconds INT,
      albuns_id INT NOT NULL,
      FOREIGN KEY (albuns_id) REFERENCES albuns(albuns_id))
      engine = InnoDB;

  CREATE TABLE SpotifyClone.history(
      music_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY(user_id, music_id),
      user_id INT NOT NULL,
      reproduction_history VARCHAR(200) NOT NULL,
      reproduction_date DATE NOT NULL,
      FOREIGN KEY (music_id) REFERENCES musics(music_id),
      FOREIGN KEY (user_id) REFERENCES users(user_id)
  ) engine = InnoDB;


  CREATE TABLE SpotifyClone.following(
      following_artist VARCHAR(200),
      CONSTRAINT PRIMARY KEY(user_id, artist_id),
	    artist_id INT NOT NULL,
      user_id INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
      FOREIGN KEY (user_id) REFERENCES users(user_id)
      ) engine = InnoDB;


  INSERT INTO SpotifyClone.signature(plan, value_plan)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

  INSERT INTO SpotifyClone.users(user_name, user_age, date_signature, signature_id)
  VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 2),
    ('Martin Fowler', 46, '2017-01-17', 2),
    ('Sandi Metz', 58, '2018-04-29', 2),
    ('Paulo Freire', 19, '2018-02-14', 3),
    ('Bell Hooks', 26, '2018-01-05', 3),
    ('Christopher Alexander', 85, '2019-06-05', 4),
    ('Judith Butler', 45, '2020-05-13', 4),
    ('Jorge Amado', 58, '2017-02-17', 4);

    
     INSERT INTO SpotifyClone.artist(artist_name)
    VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

    INSERT INTO SpotifyClone.albuns(album_name, year_release, artist_id)
  VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

    INSERT INTO SpotifyClone.musics(music, duration_seconds, albuns_id)
  VALUES
    ('BREAK MY SOUL', '279', 1),
    ('VIRGOS GROOVE', '369', 1),
    ('ALIEN SUPERSTAR', '116', 1),
    ('Don’t Stop Me Now', '203', 2),
    ('Under Pressure', '152', 3),
    ('Como Nossos Pais', '105', 4),
    ('O Medo de Amar é o Medo de Ser Livre', '207', 5),
    ('Samba em Paris', '267', 6),
    ('The Bard’s Song', '244', 7),
    ('Feeling Good', '100', 8);


    INSERT INTO SpotifyClone.history(reproduction_history, reproduction_date, music_id, user_id)
  VALUES
    ('Samba em Paris', '2022-02-28 10:45:55', 8, 1),
    ('VIRGO’S GROOVE', '2020-05-02 05:30:35', 2, 1),
    ('Feeling Good', '2020-03-06 11:22:33', 10, 1),
    ('Feeling Good', '2022-08-05 08:05:17', 10, 2),
    ('O Medo de Amar é o Medo de Ser Livre', '2020-01-02 07:40:33', 7, 2),
    ('Feeling Good', '2020-11-13 16:55:13', 10, 3),
    ('VIRGO’S GROOVE', '2020-12-05 18:38:30', 2, 3),
    ('Samba em Paris', '2021-08-15 17:10:10', 8, 4),
    ('Samba em Paris', '2022-01-09 01:44:33', 8, 5),
    ('Under Pressure', '2020-08-06 15:23:43', 5, 5),
    ('O Medo de Amar é o Medo de Ser Livre', '2017-01-24 00:31:17', 7, 6),
    ('BREAK MY SOUL', '2017-10-12 12:35:20', 1, 6),
    ('Don’t Stop Me Now', '2011-12-15 22:30:49', 4, 7),
    ('Don’t Stop Me Now', '2012-03-17 14:56:41', 4, 8),
    ('The Bard’s Song', '2022-02-24 21:14:22', 9, 9),
    ('ALIEN SUPERSTAR', '2015-12-13 08:30:22', 3, 10);

    INSERT INTO SpotifyClone.following(following_artist, artist_id, user_id)
  VALUES
    ('Beyoncé', 1, 1),
    ('Queen', 2, 1),
    ('Elis Regina', 3, 1),
    ('Beyoncé', 1, 2),
    ('Elis Regina', 3, 2),
    ('Queen', 2, 3),
    ('Baco Exu do Blues', 4, 4),
    ('Blind Guardian', 5, 5),
    ('Nina Simone', 6, 5),
    ('Nina Simone', 6, 6),
    ('Beyoncé', 1, 6),
    ('Nina Simone', 6, 7),
    ('Elis Regina', 3, 9),
    ('Queen', 2, 10);