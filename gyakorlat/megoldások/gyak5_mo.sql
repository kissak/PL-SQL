/*1. Fejts�k meg az al�bbi utas�t�sokat!*/

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL = NULL; --�res

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL <> NULL; --�res

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL IS NULL; --Lefutott

SELECT 'Lefutott' AS megmi FROM dual WHERE '' = NULL; --�res

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL LIKE '%'; --�res

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL LIKE NULL; --�res

SELECT 'Lefutott' AS megmi FROM dual WHERE '' LIKE '%'; --�res

SELECT 'Lefutott' AS megmi FROM dual WHERE '' IS NULL; --Lefutott

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL IS ''; --�res

/*2. K�rdezz�k le a MINTA s�ma 
orszagadatok t�bl�j�b�l azokat az 
orsz�gokat, akiknek az aut�jel�k nincs megadva!*/

SELECT * FROM minta.orszagadatok
WHERE autojel IS NULL; --8 rekord az eredm�nye

/*3.	K�rdezz�k le a MINTA s�ma 
orszagadatok t�bl�j�b�l azokat az 
orsz�gokat, akiknek az �nnepnapjuk 
nincs megadva, de az aut�jel�k igen!*/

SELECT orszag, autojel, unnepnap 
FROM minta.orszagadatok
WHERE unnepnap IS NULL
AND autojel IS NOT NULL; --6 rekord

/*4. Fejts�k meg a lek�rdez�seket!*/

SELECT nvl('2', 'Na, ez mi?') AS megmi FROM dual; --pr�b�ljuk ki aposztr�f n�lk�l �s to_char f�ggv�nnyel is

SELECT nvl(NULL, 'Na, ez mi?') AS megmi FROM dual;

SELECT nvl('', 'Na, ez mi?') AS megmi FROM dual;

/*5.	K�rdezz�k le a MINTA s�ma C�GEK t�bl�j�b�l 
a c�gek �zleti �v�nek v�g�t �vsz�m n�lk�l! 
Akikn�l nincs megadva, ott december 31-et �rjunk ki!
Elhagyhatn�nk-e a 2. megold�sb�l az ALL-t?*/

DESC minta.c�gek

SELECT * FROM all_tables
WHERE owner='MINTA';

DESC minta.cegek

SELECT cegnev 
--, uzletiev_vege
, nvl(to_char(uzletiev_vege, 'mm.dd'),'12.31') �zleti_�v_v�ge
FROM minta.cegek
ORDER BY 2;

SELECT cegnev
, to_char(uzletiev_vege, 'mm.dd') �zleti_�v_v�ge
FROM minta.cegek
WHERE uzletiev_vege IS NOT NULL
  UNION --ALL --az�rt hagyhat� el az ALL, mert egyr�szt a cegnev egyedi, m�sr�szt a k�t lek�rdez�s felt�tele disjunkt, teh�t biztosan nins ism�tl�d�s
SELECT cegnev
, '12.31'
FROM minta.cegek
WHERE uzletiev_vege IS NULL
ORDER BY 2;

/*6. fejts�k meg az al�bbi lek�rdez�seket!*/
/*COALESCE f�ggv�ny: kiterjesztett NVL: 
az els� nem null �rt�ket fogja eredm�ny�l adni*/

SELECT COALESCE(NULL,NULL, 500) --�rk�ljuk �t n�h�nyf�le k�ppen
AS megmi FROM dual;

SELECT to_char( SYSDATE, 'D' ) AS megmi FROM dual;

/*DECODE f�ggv�ny: a v�g�n megadott argumentum az egy�bb,
ha elhagyjuk, akkor az egy�b a NULL �rt�k.*/

SELECT decode(to_char( SYSDATE, 'D' ) ,
	1, 'H�tf�', 
	2, 'Kedd', 
	3, 'Szerda', 
	4, 'Cs�t�rt�k',
	5, 'P�ntek',
	6, 'Szombat',
	   'Vas�rnap' ) AS megmi FROM dual;

--CASE WHEN: felt�telhez k�t�tt el�gaz�s
     
SELECT CASE WHEN to_char( SYSDATE, 'D' ) < 6 
	THEN 'H�tk�znap'
	ELSE 'H�tv�ge' END AS megmi FROM dual;
  
--ugyanez decode-dal

SELECT decode (to_char( SYSDATE, 'D' ),  
	6, 'H�tv�ge',
  7, 'H�tv�ge',
  'H�tk�znap') AS megmi FROM dual;
  
/*�NULLIF( a, b )� megegyezik pontosan 
a �CASE WHEN a = b THEN NULL ELSE a� kifejez�ssel.*/

SELECT nullif( 'valami', 'valami' ) AS megmi FROM dual;
SELECT nullif( 'valami', 'm�s' ) AS megmi FROM dual;

/*7.	Hozzuk l�tre az UGYFEL t�bl�t az al�bbiak szerint!
- UGYFELID: 3 jegy� azonos�t� sz�m, a t�bla els�dleges kulcsa
- NEV: az �gyf�l teljes neve, k�telez� megadni
- NEM: egy karakteres sz�veg, F vagy N
- MIKORTOL: az els� szerz�d�sk�t�s d�tuma, alap�rtelmezetten az aktu�lis d�tum id� n�lk�l
- VIP: egy sz�mjegy, csak 1 �s 0 lehet, alap�rtelmezetten 0.*/

CREATE TABLE ugyfel(
 ugyfelid NUMBER(3) PRIMARY KEY
,nev VARCHAR2(50) NOT NULL
,nem VARCHAR2(1) CHECK (nem='F' OR nem='N')
,mikortol DATE DEFAULT trunc(SYSDATE)
,vip NUMBER(1) DEFAULT 0 CHECK (vip BETWEEN 0 AND 1) 
);

DESC ugyfel

/*8.	Vigy�nk be a t�bl�ba egy szem�lyt, 0-s k�ddal �gy, hogy minden adatot megadunk!
Figyelj�nk az adatt�pusokra!*/

INSERT INTO ugyfel
VALUES (
  0 --sz�m, aposztr�fok n�lk�l!
, 'B�r�nd �d�n' --sz�veg, aposztr�fok k�z�tt
, 'F' --sz�veg
, to_date('10.05.01','YY.MM.DD') --d�tum
, 1 --sz�m
);

SELECT * FROM ugyfel;

/*9.	N�zz�nk meg a tov�bbi adatbeviteleket!*/

INSERT INTO ugyfel
VALUES (
  100
, 'Kiss Piroska'
, NULL
, NULL
, NULL
);

SELECT * FROM ugyfel;

INSERT INTO ugyfel (ugyfelid, nev)
VALUES (
  200
, 'Fekete P�ter'
);

SELECT * FROM ugyfel;

/*10.	V�gleges�ts�k az adatbevitelt a COMMIT utas�t�ssal!*/
COMMIT;

/*11.	�rjuk be az ugyfel t�bl�ba a minta.alkalmazott 
t�bla adatai k�z�l az azonos�t�t �s a nevet! 
A hi�nyz� �rt�kekn�l hagyjuk az alap�rtelmezettet! V�gleges�ts�k a bevitelt!*/

DESC minta.alkalmazott

INSERT INTO ugyfel(ugyfelid,nev)
SELECT aid, nev FROM minta.alkalmazott;

SELECT * FROM ugyfel;

COMMIT;

/*12.	�rjuk be az ugyfel t�bl�ba a minta.dolgozo t�bla adatait az al�bbiak szerint: 
- az azonos�t�kat toljuk el 100-zal
- a neveket f�zz�k �ssze
- a nemeket k�doljuk �t
- a mikort�l egyezzen meg a felv_nap �rt�k�vel
- a VIP maradjon �resen (ne �rja be az alap�rtelmez�st!)
V�gleges�ts�k az adatbevitelt!
*/

DESC minta.dolgozo

INSERT INTO ugyfel 
SELECT
 ID+100
,vnev||' '||knev
,decode(nem,0,'F',1,'N')
,felv_nap
,NULL
FROM minta.dolgozo
;

SELECT * FROM ugyfel
ORDER BY 1 DESC;

COMMIT;

/*13.	K�rdezz�k le az �gyf�l t�bla adatait, t�r�lj�nk minden adatot, 
k�rdezz�k le �jra, majd vonjuk vissza a t�rl�st �s k�rdezz�k le �jra!*/

SELECT * FROM ugyfel;

DELETE FROM ugyfel;

SELECT * FROM ugyfel;

ROLLBACK;

SELECT * FROM ugyfel;

/*14.	T�r�lj�k az ugyfel t�bl�b�l a 100-zal oszthat� 
azonos�t�j� �gyfeleket! V�gleges�ts�k!*/

DELETE FROM ugyfel
WHERE mod(ugyfelid,100)=0;

SELECT * FROM ugyfel
ORDER BY 1 DESC;

COMMIT;

/*15.	T�r�lj�k az ugyfel t�bl�b�l azokat, 
akiknek nem tudjuk a nem�t! V�gleges�ts�k!*/

DELETE FROM ugyfel
WHERE nem IS NULL;

SELECT * FROM ugyfel;

COMMIT;


/*16.	M�dos�tsuk az adatokat: 
mindenkin�l �rjuk be a VIP oszlopba a 0 �rt�ket! 
V�gleges�ts�k!*/

UPDATE ugyfel
SET vip=0;

SELECT * FROM ugyfel;
COMMIT;

/*17.	M�dos�tsuk az adatokat: 
mindenkinek az azonos�t�j�b�l vonjunk ki 100-at! 
V�gleges�ts�k!*/

UPDATE ugyfel
SET ugyfelid=ugyfelid-100;

SELECT * FROM ugyfel;
COMMIT;

/*18.	M�dos�tsuk az adatokat: 
mindenki, aki 2010 el�tt k�t�tt szerz�d�st, 
legyen VIP �gyf�l! V�gleges�ts�k!*/

UPDATE ugyfel
SET vip=1
WHERE mikortol<to_date('100101','YYMMDD');

SELECT * FROM ugyfel;

COMMIT;

/*19. M�soljuk le az ugyfel t�bl�nakt ugyfel2 n�ven! T�r�lj�k a tartalm�t visszavonhatatlanul!*/

CREATE TABLE ugyfel2
AS SELECT * FROM ugyfel;

SELECT * FROM ugyfel2;

TRUNCATE TABLE ugyfel2;

SELECT * FROM ugyfel2;

ROLLBACK;

SELECT * FROM ugyfel2;

/******************/
/*�N�LL� FELADATOK*/
/******************/
/*1.	K�rdezz�k le a MINTA.IRODALOM t�bl�b�l azokat az �r�kat, 
akiknek nincs megadva eredeti nev�k!*/

DESC minta.irodalom
SELECT * FROM minta.irodalom
WHERE eredeti_n�v IS NULL;

/*2.	K�rdezz�k le a MINTA.IRODALOM t�bl�b�l 
az �r�k nev�t �s eredeti nev�t �gy, 
hogy akinek nincs megadva az eredeti neve, 
azokn�l az eredeti n�vhez is az ismert nev�ket �rjuk ki!*/

SELECT n�v, nvl(eredeti_n�v,n�v) eredeti_n�v
FROM minta.irodalom;

/*3.	A minta.orszagadatok t�bl�b�l  list�zzuk ki az orsz�gokat
�s az �nnepnapokat is! 
Ahol NULL �rt�k van, ott �rjuk be a �nem ismert� sz�veget! 
Rendezz�k az eredm�nyt az �nnepnapok szerinti sorrendbe! */

DESC minta.orszagadatok
SELECT orszag
, nvl(to_char(unnepnap, 'month dd.'),'nem ismert') unnepnap
FROM minta.orszagadatok;

/*4.	K�rdezz�k le a MINTA s�ma CEGEK t�bl�j�b�l az Rt-ket �gy, 
hogy az Rt ut�n legyen pont, de ha volt pont eleve, 
akkor ne legyen k�t pont ut�na!*/

DESC minta.cegek

SELECT cegnev
FROM minta.cegek
WHERE lower(cegnev) LIKE '% rt%';

SELECT REPLACE(cegnev,' Rt',' Rt.') c�gn�v
FROM minta.cegek
WHERE lower(cegnev) LIKE '% rt%'
AND lower(cegnev) NOT LIKE '% rt.%'
UNION
SELECT cegnev
FROM minta.cegek
WHERE lower(cegnev) LIKE '% rt.%';

/*5.	Hozzuk l�tre az al�bbi HALLGATO t�bl�t!
HAZ: hallgat� azonos�t�ja, 6 karakteres sz�veg, els�dleges kulcs
HVNEV: hallgat� vezet�kneve, k�telez�
HKNEV: hallgat� keresztneve, k�telez�
HSZDAT: hallgat� sz�let�si d�tuma
EVF: �vfolyam, 1 jegy� eg�sz sz�m, 1 �s 5 k�z�tt lehet, alap�rtelmezetten 1*/

CREATE TABLE hallgato(
haz VARCHAR2(6)
,hvnev VARCHAR2(20) NOT NULL
,hknev VARCHAR2(20) NOT NULL
,hszdat DATE
,evf NUMBER(1) DEFAULT 1 CHECK (evf BETWEEN 1 AND 6)
);

DESC hallgato

/*6.	Vigy�nk be sql utas�t�ssal k�t rekordot, 
az egyik hallgat�nak ne legyen �vfolyama, a 
m�siknak engedj�k az alap�rtelmezett �vfolyamot be�rni!*/

INSERT INTO hallgato
VALUES (
 'ABCDEF'
 ,'Alma'
 ,'Alad�r'
 ,to_date('951001','RRMMDD')
 ,NULL
 );

INSERT INTO hallgato(haz,hvnev,hknev,hszdat)
VALUES (
 'BBCDEF'
 ,'Ban�n'
 ,'Be�ta'
 ,to_date('951002','RRMMDD')
 );

SELECT * FROM hallgato;
COMMIT;

/*7.	A Moodle-ben tal�lhat� Excel t�bl�zatb�l hozzuk 
l�tre az adatok be�r�s�ra alkalmas SQL utas�t�sokat! 
(Excelben az egyszeres aposztr�fot a cella elej�n dupl�n kell be�rni)
M�soljuk be �ket �s futtassuk le! 
V�gleges�ts�k az adatbevitelt! 
(Csak az els� utas�t�st m�soljuk be A Moodle-be)*/

INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RMP5C5','�cs','Boldizs�r',to_date('1999.11.15','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('P00K2I','Tak�cs','Iv�n',to_date('1995.09.02','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YHB7VS','Horv�th','Zsolt',to_date('1997.03.15','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('IFQAZD','Cs�r�s','Salamon',to_date('1999.06.27','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LA5I05','Kov�cs','L�r�nt',to_date('1995.07.27','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LVXW3C','B�s','Bendeg�z',to_date('1998.06.30','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('IQ525X','Kiss','Elek',to_date('1999.06.28','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('F0WRLG','T�th','Abig�l',to_date('1994.09.19','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('AADDQT','F�t�','G�bor',to_date('1995.09.16','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YWM7IR','Papp','Bernadett',to_date('1997.07.12','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GV1BO4','Hamar','Imre',to_date('1996.10.11','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('PLNRLJ','Kis','Korn�lia',to_date('1995.03.12','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('N5E0NN','Nagy','Tiham�r',to_date('1998.12.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('IXXM6E','K�d�r','Anett',to_date('1996.02.14','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('X2Y3OY','Sz�r','�gnes',to_date('1996.01.14','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('NVNZYL','Oll�s','Nikolett',to_date('1997.02.17','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('HPYDT8','Csik�s','B�la',to_date('1995.05.02','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('DD3TYH','Szab�','Norbert',to_date('1994.12.23','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('V6WVGT','Sz�cs','Anita',to_date('1995.03.12','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('JUYXIC','Buda','Botond',to_date('1997.12.13','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VB8CVI','Brenner','Krisztina',to_date('1999.05.07','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WXM33G','Fodor','Zita',to_date('1995.10.20','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KGAWZO','N�meth','Iv�n',to_date('1997.12.08','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BW80OJ','K�r�sz','Zsolt',to_date('1995.03.03','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('P6BT3Q','B�r�','P�ter',to_date('1998.02.04','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('EVXND3','Gombos','Tibor',to_date('1996.07.30','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('JM5PG4','Lengyel','�gnes',to_date('1999.09.17','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('SZNVSC','K�v�r','Nikoletta',to_date('1999.06.28','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('Y1J7YC','Bozsik','Bal�zs',to_date('1996.04.15','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('EO82AB','Gergely','J�zsef',to_date('1995.05.25','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('TAF71A','Mogyr�di','Kriszti�n',to_date('1998.03.05','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('ENQGVO','Sarodi','D�ra',to_date('1998.06.18','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FW6XCY','T�th','Anik�',to_date('1996.10.13','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KTYV3F','Vajda','Zsuzsa',to_date('1996.02.15','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('CE6U6N','Ferencz','Roland',to_date('1994.10.31','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('IZU671','Moln�r','B�lint',to_date('1996.07.28','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FD7BFB','Kelemen','�ron',to_date('1998.04.16','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('P5MCFK','Kuruc','Emese',to_date('1999.08.09','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('PG8N5D','Orosz','Ferenc',to_date('1997.12.19','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GHOUFH','Szalai','Szil�rd',to_date('1995.08.01','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FQDJLT','Tari','Szilvia',to_date('1996.10.07','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GVYK0R','F�','N�ndor',to_date('1996.06.21','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KRHQ8B','T�th','Zolt�n',to_date('1995.01.17','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('P8SBLU','F�l�p','Eszter',to_date('1995.10.15','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XEV4AM','Harty�nszky','�gnes',to_date('1995.09.06','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BIRFKW','Antal','Tam�s',to_date('1995.10.05','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LPABAP','Csiger','Bertalan',to_date('1999.11.05','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('UX75TE','Komj�ti','Andr�s',to_date('1998.09.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('JLKHC1','Ker�nyi','Beatrix',to_date('1995.09.20','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('D8F0QX','Barab�s','P�l',to_date('1994.10.23','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YWIOOH','Szomor','Andrea',to_date('1999.10.01','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XEOW3V','Nagy','L�szl�',to_date('1995.07.04','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('AOYQ1O','Botka','M�ty�s',to_date('1995.01.07','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FZF7ZW','H�dasi','Judit',to_date('1996.10.14','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('HS2YOB','Simon','Anik�',to_date('1998.11.24','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('OIX2FM','Kardos','Ren�ta',to_date('1995.01.16','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('N1P4CB','Ambrus','D�vid',to_date('1995.07.08','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XJGRG6','Bar�ti','Attila',to_date('1998.01.13','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('IBGDKL','Szedl�r','Krisztina',to_date('1999.04.30','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VCHGW5','Dunai','Alad�r',to_date('1999.04.13','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('SRP5RO','Szekendi','Beatrix',to_date('1996.10.10','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XUKHMS','F�nyes','Tam�s',to_date('1996.12.29','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XAGJCI','Bodor','Szabolcs',to_date('1996.01.27','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WCQB55','Kiss','�d�m',to_date('1997.04.09','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('TDJW8X','Erdei','Andr�s',to_date('1997.09.19','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('S6RBDJ','T�th','J�lia',to_date('1995.03.25','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VGXH5S','Kozma','P�ter',to_date('1995.11.11','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YTZ5I7','Horv�th','M�rk',to_date('1997.10.25','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('HAHD0B','Pataki','Brigitta',to_date('1995.12.19','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WKHPEN','Andor','Ibolya',to_date('1997.07.08','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RY7SPX','Endresz','B�lint',to_date('1999.04.04','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('UGJW6T','Perlinger','�va',to_date('1996.10.05','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('EHJK02','Farkas','L�szl�',to_date('1995.01.15','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RDFO45','Mohos','M�nika',to_date('1995.07.02','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('SXXLNB','B�r�','�kos',to_date('1996.05.25','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KGK0D4','Jakab','�ron',to_date('1997.11.17','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RWA2J0','Barna','Zolt�n',to_date('1995.07.16','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('QXCCEV','Antal','L�szl�',to_date('1997.04.23','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('QKEGUQ','Balogh','Eszter',to_date('1999.06.24','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WH86F6','T�th','Roland',to_date('1999.05.13','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BBCZZS','Sz�kely','Brigitta',to_date('1998.10.27','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('TOWYV0','Enyedi','�va',to_date('1995.07.08','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('F3I336','Moln�r','Andr�s',to_date('1996.01.28','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BGFQAN','Mikl�s','Szabolcs',to_date('1999.07.29','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('UWOIHJ','Keszler','D�niel',to_date('1996.07.17','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XSQB6F','Rab','Sebesty�n',to_date('1995.12.08','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YK065N','Bucsk�','R�za',to_date('1995.11.28','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FXOYVK','Bar�th','M�ria',to_date('1999.07.23','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RAGA1R','Gy�rf�s','Krisztina',to_date('1996.12.06','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GGYMQZ','Reg�s','Annam�ria',to_date('1996.10.10','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KVN0EF','J�zsa','Zsolt',to_date('1997.08.08','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('R8QYPL','Pint�r','Zolt�n',to_date('1998.02.08','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('UPSQHX','Tornyos','Andrea',to_date('1999.02.18','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RSYHSU','K�ves','G�bor',to_date('1998.10.15','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('G0G7XK','Harangoz�','J�nos',to_date('1998.05.22','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('MT64JV','�rsek','Eszter',to_date('1998.01.07','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('MOTXD6','P�sztor','R�bert',to_date('1999.11.12','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('X5AA7E','Vars�nyi','Zsuzsa',to_date('1997.03.29','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('PTQN20','B�res','Norbert',to_date('1998.10.08','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('A7MLIN','Bosny�k','Ilona',to_date('1995.04.27','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('O4QE3H','Pusztai','Zsuzsanna',to_date('1999.01.28','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('C2V28U','Kalacsi','M�rton',to_date('1997.11.26','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('AHB5UJ','Sz�cs','Annam�ria',to_date('1998.11.01','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('ICCORG','Horv�th','Krisztina',to_date('1999.01.07','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('J14UW7','Szirmai','Ren�ta',to_date('1996.06.28','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('G8YG1A','Nagy','J�lia',to_date('1998.09.01','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('DY2X2O','Berendi','P�ter',to_date('1999.04.09','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('I0X3L7','Kov�cs','Bernadett',to_date('1995.06.21','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('MTKY7W','Balla','Mikl�s',to_date('1998.03.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('N5IAW7','V�gh','Andr�s',to_date('1999.09.20','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('K22KBQ','Ny�ri','Georgij',to_date('1995.01.03','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('Y3PDQ8','Barta','Zsuzsanna',to_date('1994.10.06','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('OAVG08','Giliga','J�nos',to_date('1995.10.15','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KPO3KI','Vajda','J�zsef',to_date('1999.03.29','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('SF1DAE','Luk�cs','Korn�l',to_date('1999.09.29','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('IM074V','Gy�rffy','Bence',to_date('1996.11.24','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FSOWTU','Bak�dy','Bal�zs',to_date('1998.01.21','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('N4G3WQ','Horv�th','�gnes',to_date('1996.05.29','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('M2GLRE','M�ricz','�rp�d',to_date('1997.02.24','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('W7HWEK','R�cz','Rajmond',to_date('1996.08.16','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('I4YSE0','Heged�s','Norbert',to_date('1996.11.28','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('EIMKZM','Sz�ll�si','G�bor',to_date('1994.09.17','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VVWHWK','Gondos','Katalin',to_date('1999.03.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('L8LF0Z','Nagy','S�ndor',to_date('1998.05.30','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FBXMJL','Mile','Norbert',to_date('1997.08.04','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GXL665','Horv�th','B�lint',to_date('1998.06.06','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('UIO6B0','P�link�s','J�nos',to_date('1999.04.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VIGYKB','Gondos','Mikl�s',to_date('1997.10.12','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('A8S44K','So�s','Istv�n',to_date('1999.05.12','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('T4SGBF','Horv�th','�rp�d',to_date('1995.05.22','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WMM02P','Bak�','Klaudia',to_date('1997.11.18','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('Y4YHW6','Tank�','Veronika',to_date('1997.07.02','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LAQHVY','Urb�n','Viktoria',to_date('1996.08.29','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('O3E71C','T�mb�ly','D�nes',to_date('1997.09.13','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('UGUJAT','Bittmann','Edit',to_date('1995.05.19','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('B347PK','Pulai','Zsolt',to_date('1995.04.17','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WQ73SB','Back','Andr�s',to_date('1994.11.17','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('CB86RB','Orb�n','Bernadett',to_date('1996.11.04','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('CXXHK3','Farkas','S�ndor',to_date('1999.02.10','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('L1UTC7','Cz�rna','Kriszti�n',to_date('1999.10.14','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WZEVCB','Kov�cs','�gnes',to_date('1995.07.28','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('TTPE53','Opra','Attila',to_date('1997.04.14','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('A80FZ6','Viktor','�va',to_date('1996.06.21','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GLK7YY','Vida','Gabriella',to_date('1997.09.25','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('H81VPY','Mar�di','Andrea',to_date('1997.12.18','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('NFORHD','Szalai','P�ter',to_date('1996.06.10','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WD7C5H','Kornse�','Gy�ngyi',to_date('1999.04.10','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('H1M60E','Kov�cs','Katalin',to_date('1999.07.10','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('G8X7ES','Farkas','B�la',to_date('1999.01.11','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('PLJ5EU','Nagy','Andr�s',to_date('1997.05.26','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BFSKWQ','D�niel','Tibor',to_date('1999.03.11','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('MN5LQP','B�rci','Guszt�v',to_date('1997.01.27','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VREZAV','Simon','Bernadett',to_date('1995.02.20','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('U2R8KQ','Szab�','Julianna',to_date('1999.04.18','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LZRA0M','Iv�n','R�bert',to_date('1997.04.22','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('P02KSM','Sz�cs','Bal�zs',to_date('1996.04.04','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('SOG1NS','Bozs�','P�ter',to_date('1996.03.29','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('OO2RHY','Oroszi','Gy�rgy',to_date('1997.11.29','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LBYXXR','Fodor','Zolt�n',to_date('1996.02.23','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YKY0P3','Kiss','Andrea',to_date('1999.04.08','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GEQE0G','Bag�czki','Alexandra',to_date('1999.06.02','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('IOIY18','Nagymih�ly','Lajos',to_date('1995.10.18','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('Q5TL6B','V�r�s','D�niel',to_date('1994.07.20','YYYY.MM.DD'),6);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GZLN5S','Papp','Imre',to_date('1995.10.18','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LVWTPK','B�r�cz','Anik�',to_date('1994.09.20','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('FZ72I4','B�za','Imre',to_date('1996.06.15','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('REZPUK','Sobj�k','D�vid',to_date('1999.07.10','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YQAVHR','Bieniek','�d�m',to_date('1994.07.20','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('PA53FQ','Kisp�l','M�rk',to_date('1997.04.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('J84M0I','�tv�s','�rp�d',to_date('1998.08.04','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LAX38Q','R�cz','D�niel',to_date('1995.10.19','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('C71GDN','Kereszt�ri','Viktor',to_date('1996.05.25','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('NAHIGM','Horv�th','Nikolett',to_date('1995.03.05','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('Y3B0HE','Fer�','Valentin',to_date('1997.04.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('K3AFMD','Szikszai','R�ka',to_date('1999.02.25','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BEGMBS','Pal�gyi','Polla',to_date('1995.03.29','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('EYTBUB','Koza','M�t�',to_date('1998.06.29','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('HXX4R3','Nagymih�ly','Csongor',to_date('1994.07.08','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('D46QFE','Zatyk�','Katalin',to_date('1998.11.03','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('H7YVXG','M�ra','L�szl�',to_date('1999.08.17','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('OCYDKS','Sz�cs','Norbert',to_date('1994.08.07','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('WWTBT4','Szil�gyi','M�ty�s',to_date('1995.08.08','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('PAP46I','Boros','Vivien',to_date('1996.01.13','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('SBZO8D','N�dudvari','Henrik',to_date('1995.06.11','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LS66NF','Bark�ci','�d�m',to_date('1996.03.12','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('J15VYF','Barna','Deb�ra',to_date('1995.05.26','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('D150EZ','Bajusz','Bence',to_date('1997.12.15','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BBUD6K','Dusha','T�mea',to_date('1995.12.14','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('A7PN20','Telek','G�bor',to_date('1996.12.18','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('V1BQQ3','Turcsik','T�nde',to_date('1995.09.16','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('F3IWFU','Varga','Istv�n',to_date('1999.11.10','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('MIONDZ','Popr�di','Krist�f',to_date('1997.05.22','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('JBUZ4G','Tat�r','Nikoletta',to_date('1995.04.24','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YGDA05','Karasz','S�ndor',to_date('1999.01.22','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XTRK78','Berta','D�vid',to_date('1994.07.10','YYYY.MM.DD'),5);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('JPSC1N','Gyuris','J�zsef',to_date('1998.08.24','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('NDIQG3','Mikl�s','Tamara',to_date('1997.12.11','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('YBD1TD','Farkas','S�ra',to_date('1999.03.28','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('P8QCF4','Guly�s','Attila',to_date('1998.02.01','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('C7MAW3','Folt�nyi','Sebasti�n',to_date('1995.04.09','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('CD2YOT','Pivarcsi','Anett',to_date('1995.08.03','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('GNKOUG','Moln�r','Zs�fi',to_date('1998.10.27','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('OKR4M4','Juh�sz','Mih�ly',to_date('1997.09.06','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('TBQEW3','Frank','Fruzsina',to_date('1996.11.10','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('QJQXQE','V�gfalvin�','Kazy',to_date('1996.05.22','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KKLTTI','Kert�sz','Katalin',to_date('1997.12.02','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BGXO8V','T�th','Andr�s',to_date('1995.06.15','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('S63LYN','Vizi','Istv�n',to_date('1998.01.11','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('MFUK7Y','Hamvay-Kov�cs','Anita',to_date('1998.07.01','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('LDUW1E','Patay','R�bert',to_date('1996.02.23','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('CYOH4M','Pap�s','T�mea',to_date('1997.03.24','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RZS13T','Bagi','Be�ta',to_date('1996.09.06','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VK85WO','Moln�r','Eszter',to_date('1999.03.18','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('XYQPBG','Cs�ti','Attila',to_date('1996.09.29','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('NY6W8Z','Vukasinovity','B�lint',to_date('1995.10.04','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('R3B3OQ','Bori','Krisztina',to_date('1996.10.21','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KRR2WW','Horv�th','Katalin',to_date('1996.04.24','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('ON8J62','Neizer','Andrea',to_date('1996.05.28','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('RT4YHY','Kois','Norbert',to_date('1998.11.20','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('VMGZFV','Pigniczki','Martin',to_date('1998.02.02','YYYY.MM.DD'),2);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('Y1PV7X','Kov�cs','Katalin',to_date('1997.10.18','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('F0ER0S','Simon','Zsuzsanna',to_date('1996.09.18','YYYY.MM.DD'),3);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('BRKP88','Sajt�','N�ndor',to_date('1999.04.18','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('KV8MSG','Fekete','Istv�nn�',to_date('1996.11.12','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('TR3EWO','Szendr�di','Simon',to_date('1999.04.05','YYYY.MM.DD'),1);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('DLKL40','Alap','P�ter',to_date('1995.06.12','YYYY.MM.DD'),4);
INSERT INTO hallgato (haz,hvnev,hknev,hszdat,evf) VALUES ('UR462R','Cs�csi','Krist�f',to_date('1997.05.08','YYYY.MM.DD'),2);

SELECT * FROM hallgato;
COMMIT;

/*8. T�r�lj�k a hallgat�kat! Vonjuk vissza! 
T�r�lj�k csak a 6. �ves hallgat�kat! V�gleges�ts�k!*/

DELETE FROM hallgato;

ROLLBACK;

SELECT * FROM hallgato
WHERE evf=6;

DELETE FROM hallgato
WHERE evf=6;

COMMIT;

/*9. T�r�lj�k azokat a hallgat�kat, 
akik 2016. szeptember 1-n m�g nem voltak 18 �vesek! V�gleges�ts�k!*/

SELECT * FROM hallgato
WHERE
hszdat>to_date('1998.09.01.','YYYY.MM.DD.');

DELETE FROM hallgato
WHERE
hszdat>to_date('1998.09.01.','YYYY.MM.DD.');

COMMIT;

/*10. M�dos�tsuk mindenkinek az �vfolyam�t eggyel nagyobbra!
Vonjuk vissza!*/

UPDATE hallgato
SET evf=evf+1;

SELECT * FROM hallgato;
ROLLBACK;

/*11. Egy udas�t�ssal m�dos�tsuk a hallgat�k �vfolyam�t az al�bbiak szerint: 
a null-b�l legyen 1, mindenkinek az �vfolyama legyen eggyel nagyobb, az 5-b�l
pedig legyen null!*/

UPDATE hallgato
SET evf=decode(evf
,NULL,1
,1,2
,2,3
,3,4
,4,5);

SELECT * FROM hallgato;
COMMIT;