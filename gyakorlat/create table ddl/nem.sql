--------------------------------------------------------
--  File created - p�ntek-m�jus-12-2017   
--------------------------------------------------------
-- Unable to render TABLE DDL for object NEM with DBMS_METADATA attempting internal generator.


CREATE TABLE NEM 
(
  KOD VARCHAR2(1 BYTE) NOT NULL 
, NEM NVARCHAR2(5) 
);

ALTER TABLE NEM
ADD CONSTRAINT SYS_C0031860 PRIMARY KEY 
(
  KOD 
);

CREATE UNIQUE INDEX SYS_C0031860 ON NEM (KOD ASC);

REM INSERTING into NEM
SET DEFINE OFF;
Insert into NEM (KOD,NEM) values ('N','n�');
Insert into NEM (KOD,NEM) values ('F','f�rfi');
commit;

-- Unable to render INDEX DDL for object SYS_C0031860 with DBMS_METADATA attempting internal generator.
CREATE UNIQUE INDEX SYS_C0031860 ON NEM (KOD ASC);