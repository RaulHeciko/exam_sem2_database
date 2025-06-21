CREATE EXTENSION postgis;

CREATE TABLE IF NOT EXISTS campus_universitar(
	fid serial primary key not null,
	nume varchar(100) not null,
	geom geometry('Polygon', 4326) not null
);

CREATE TABLE IF NOT EXISTS evenimente(
	fid serial primary key not null,
	denumire varchar(100) not null,
	tip_eveniment varchar(50) not null,
	date date not null,
	contra_cost boolean not null
);

CREATE TABLE IF NOT EXISTS evenimente_campus(
	fid serial primary key not null,
	campus_universitar_fid integer not null,
	evenimente_fid integer not null,
	foreign key(campus_universitar_fid) references campus_universitar(fid),
	foreign key(evenimente_fid) references evenimente(fid)
);

CREATE TABLE IF NOT EXISTS piste_alergat(
	fid serial primary key not null,
	numar_piste integer not null,
	lungime_piste integer not null,
	latime_piste integer not null,
	geom geometry('LineString', 4326) not null,
	campus_universitar_fid integer not null,
	foreign key(campus_universitar_fid) references campus_universitar(fid)
);

CREATE TABLE IF NOT EXISTS terenuri(
	fid serial primary key not null,
	tip_teren varchar(50) not null,
	geom geometry('Polygon', 4326) not null,
	campus_universitar_fid integer not null,
	foreign key(campus_universitar_fid) references campus_universitar(fid)
);

CREATE TABLE IF NOT EXISTS retea_utilitati(
	fid serial primary key not null,
	tip_utilitate varchar(50) not null,
	geom geometry('LineString', 4326),
	campus_universitar_fid integer not null,
	foreign key(campus_universitar_fid) references campus_universitar(fid)
);

CREATE TABLE IF NOT EXISTS parcari(
	fid serial primary key not null,
	capacitate integer not null,
	geom geometry('Polygon', 4326) not null,
	campus_universitar_fid integer not null,
	foreign key(campus_universitar_fid) references campus_universitar(fid)
);

CREATE TABLE IF NOT EXISTS administratie_campus(
	fid serial primary key not null,
	nume varchar(100) not null,
	numar_telefon varchar(20) not null,
	campus_universitar_fid integer not null unique,
	foreign key(campus_universitar_fid) references campus_universitar(fid)
);

CREATE TABLE IF NOT EXISTS centru_ajutor(
	fid serial primary key not null,
	numar_telefon varchar(20) not null,
	geom geometry('Point', 4326) not null,
	campus_universitar_fid integer not null,
	foreign key(campus_universitar_fid) references campus_universitar(fid)
);