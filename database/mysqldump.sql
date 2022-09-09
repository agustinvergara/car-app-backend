DROP DATABASE IF EXISTS cars_app_db;

CREATE DATABASE cars_app_db;

USE cars_app_db;

CREATE TABLE brands(
	brand_id INTEGER NOT NULL UNIQUE AUTO_INCREMENT,
	brand_name VARCHAR(70)
);

CREATE TABLE segment(
	segment_id INTEGER NOT NULL UNIQUE AUTO_INCREMENT,
	segment_name VARCHAR(70)
);

CREATE TABLE model(
	model_id INTEGER NOT NULL UNIQUE AUTO_INCREMENT,
	brand_id INTEGER,
	segment_id INTEGER,
	model_name VARCHAR(70),
	FOREIGN KEY (segment_id) REFERENCES segment(segment_id),
	FOREIGN KEY (brand_id) REFERENCES brands(brand_id)
);

CREATE TABLE version(
	version_id INTEGER NOT NULL UNIQUE AUTO_INCREMENT,
	model_id INTEGER,
	version_name VARCHAR(70),
	year YEAR DEFAULT 2022,
	motor VARCHAR(20) DEFAULT NULL,
	fuelled_by VARCHAR(50) DEFAULT 'gasolina',
	power_hp INTEGER DEFAULT 0,
	torque INTEGER DEFAULT 0,
	traction VARCHAR(70) DEFAULT NULL,
	transmission VARCHAR(50) DEFAULT NULL,
	radio BOOLEAN DEFAULT 1,
	screen BOOLEAN DEFAULT 0,
	speakers INTEGER DEFAULT 4,
	interiors VARCHAR(70) DEFAULT 'tela',
	passengers INTEGER DEFAULT 4,
	sunroof BOOLEAN DEFAULT 0,
	tires VARCHAR(40),
	rims VARCHAR(70) DEFAULT 'genericos con copa',
	color_hexa VARCHAR(50) DEFAULT 'FFFFFF',
	FOREIGN KEY (model_id) REFERENCES model(model_id)
);

CREATE TABLE car_image(
	car_image_id INTEGER NOT NULL UNIQUE AUTO_INCREMENT,
	version_id INTEGER,
	car_image_1 VARCHAR(700),
	car_image_2 VARCHAR(700),
	car_image_3 VARCHAR(700),
	FOREIGN KEY (version_id) REFERENCES version(version_id)
);
