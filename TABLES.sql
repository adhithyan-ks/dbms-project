DROP DATABASE IF EXISTS SPORTS_DAY;
CREATE DATABASE SPORTS_DAY;
USE SPORTS_DAY;

CREATE TABLE DEPARTMENTS (
  DEPT_ID CHAR(2) PRIMARY KEY,
  DEPT_NAME VARCHAR(20)
);

CREATE TABLE ITEMS (
  ITEM_ID INT PRIMARY KEY,
  ITEM_NAME VARCHAR(15)
);

CREATE TABLE PARTICIPANTS (
  P_ID INT PRIMARY KEY,
  P_NAME VARCHAR(20),
  AGE INT,
  GENDER CHAR(1),
  DEPT_ID CHAR(2),
  CONTACT_NO CHAR(10) UNIQUE,
  FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENTS(DEPT_ID)
);

CREATE TABLE PARTICIPATION (
  ITEM_ID INT,
  P_ID INT,
  POSITION INT DEFAULT 0,
  PRIMARY KEY (ITEM_ID, P_ID),
  FOREIGN KEY (P_ID) REFERENCES PARTICIPANTS(P_ID),
  FOREIGN KEY (ITEM_ID) REFERENCES ITEMS(ITEM_ID)
);

CREATE TABLE RESULT (
  P_ID INT,
  P_NAME VARCHAR(20),
  GENDER CHAR(1),
  ITEM_ID INT,
  ITEM_NAME VARCHAR(15),
  POSITION INT
);