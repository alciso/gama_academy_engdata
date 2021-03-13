/*
 * Projeto Final
 * Grupo 1: DataRangers
 * Script para a criação do DataBase com o Schema para armazenar
 * os registros dos países e os dados de COVID-19 por todo o mundo.
 */

CREATE DATABASE DB_COVID_NINETEEN;

-- USE DB_COVID_NINETEEN

CREATE TABLE COUNTRY (
	ID		INT			NOT NULL IDENTITY(1, 1),
	NAME	VARCHAR(50)	NOT NULL,
	ISO2	VARCHAR(2)	NOT NULL,
	SLUG	VARCHAR(60) NOT NULL,
	CONSTRAINT PK_COUNTRY PRIMARY KEY (ID)
);

CREATE TABLE CASE_TYPE (
	ID				INT				NOT NULL,
	NAME			VARCHAR(10)		NOT NULL,
	DESCRIPTION		VARCHAR(30)		NULL,
	CONSTRAINT PK_CASE_TYPE PRIMARY KEY (ID)	
);

CREATE TABLE COUNTRY_COVID_DAILY_CASES (
	ID				INT		NOT NULL IDENTITY(1, 1),
	ID_COUNTRY		INT		NOT NULL,
	ID_CASE_TYPE	INT		NOT NULL,
	TOTAL_CASES		INT		NOT NULL,
	DATE			DATE	NOT NULL,
	CONSTRAINT PK_COUNTRY_COVID_DAILY_CASES PRIMARY KEY (ID),
	CONSTRAINT FK_COUNTRY_COVID_DAILY_CASES_COUNTRY FOREIGN KEY (ID_COUNTRY)
	REFERENCES COUNTRY (ID),
	CONSTRAINT FK_COUNTRY_COVID_DAILY_CASES_CASE_TYPE FOREIGN KEY (ID_CASE_TYPE)
	REFERENCES CASE_TYPE (ID)
);