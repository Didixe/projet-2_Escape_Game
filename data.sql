-- SQLBook: Code
DROP DATABASE IF EXISTS escape_game;

CREATE DATABASE escape_game;

USE escape_game;

CREATE TABLE enigma (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    description VARCHAR (255),
    hint VARCHAR (255),
    answer VARCHAR (255),
    PRIMARY KEY (id)
);
CREATE TABLE object (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (50) NOT NULL,
    description VARCHAR (255),
    PRIMARY KEY (id)
);


CREATE TABLE user (
    id INT NOT NULL AUTO_INCREMENT,
    pseudo VARCHAR(50),
    password VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE progress (
    id INT NOT NULL AUTO_INCREMENT,
    success TINYINT,
    score INT,
    PRIMARY KEY (id)
);


CREATE TABLE inventory (
    id INT NOT NULL AUTO_INCREMENT,
    object_id INT,
    FOREIGN KEY (object_id) REFERENCES object(id),
    PRIMARY KEY (id)
);

CREATE TABLE session (
id INT NOT NULL AUTO_INCREMENT,
user_id INT,
inventory_id INT,
name VARCHAR(255),
FOREIGN KEY (user_id) REFERENCES user(id),
FOREIGN KEY (inventory_id) REFERENCES inventory(id),
PRIMARY KEY (id)
);

CREATE TABLE scenario (
id INT NOT NULL AUTO_INCREMENT,
enigma_id INT,
session_id INT,
progress_id INT,
FOREIGN KEY (session_id) REFERENCES session(id),
FOREIGN KEY (enigma_id) REFERENCES enigma(id),
FOREIGN KEY (progress_id) REFERENCES progress(id),
PRIMARY KEY (id)
);
