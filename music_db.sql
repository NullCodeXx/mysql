#Databases // is a databases to store all we like about music.
#DELETE THE DATABASE IF EXIST. 
DROP DATABASE IF EXISTS music_db; 


CREATE DATABASE music_db;

USE music_db;

CREATE TABLE `group` (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(64) NOT NULL, #Force input value. 
	start DATE NOT NULL,
	end DATE NOT NULL,
	origin VARCHAR(64)
);

CREATE TABLE `member` (
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(64) NOT NULL,
	last_name VARCHAR(128) NOT NULL,
	nickname VARCHAR(64), 
	role VARCHAR(64) NOT NULL,
	birth DATE NOT NULL,
	death DATE NOT NULL
);

CREATE TABLE `award` (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(128) NOT NULL
);

CREATE TABLE `album` (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(64) NOT NULL, 
	`date` DATE NOT NULL,
	label VARCHAR(64),
	genre VARCHAR(64)
);

# POUR FAIRE UNE ASSOCIATION DE TABLEAU COLOGNE.

#Modifier la table album et ajoute une cologne group_id qui aura une valeur entiere
# et qu'on force a voir une valeur entrer.
ALTER TABLE `album` ADD `group_id` INT NOT NULL;
#Modifie l'album et lui ajoute une clé de reference clés group(qui vise tout les id).
ALTER TABLE `album` ADD FOREIGN  KEY `group_id` REFERENCES `group`(id);


#N to M RELATION SHIP.
#Table de references entre deux table lien entre album et member.
CREATE TABLE `album_member` (
	`album_id` INT NOT NULL,
	`member_id` INT NOT NULL,
	FOREIGN KEY (`album_id`) REFERENCES `album`(id);
	FOREIGN KEY (`member_id`) REFERENCES `member`(id);
	PRIMARY KEY (`album_id` `member_id`);
);