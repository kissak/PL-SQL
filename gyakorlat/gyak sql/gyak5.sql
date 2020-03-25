/*1. Fejts�k meg az al�bbi utas�t�sokat!*/

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL = NULL;

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL <> NULL;

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL IS NULL;

SELECT 'Lefutott' AS megmi FROM dual WHERE '' = NULL;

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL LIKE '%';

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL LIKE NULL;

SELECT 'Lefutott' AS megmi FROM dual WHERE '' LIKE '%';

SELECT 'Lefutott' AS megmi FROM dual WHERE '' IS NULL;

SELECT 'Lefutott' AS megmi FROM dual WHERE NULL IS '';

/*2. K�rdezz�k le a MINTA s�ma 
orszagadatok t�bl�j�b�l azokat az 
orsz�gokat, akiknek az aut�jel�k nincs megadva!*/

SELECT * FROM minta.orszagadatok
WHERE autojel IS NULL;

/*3.	K�rdezz�k le a MINTA s�ma 
orszagadatok t�bl�j�b�l azokat az 
orsz�gokat, akiknek az �nnepnapjuk 
nincs megadva, de az aut�jel�k igen!*/

SELECT orszag, autojel, unnepnap 
FROM minta.orszagadatok
WHERE unnepnap IS NULL
AND autojel IS NOT NULL;

/*4. Fejts�k meg a lek�rdez�seket!*/

SELECT nvl('2', 'Na, ez mi?') AS megmi FROM dual;

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
  UNION ALL
SELECT cegnev
, '12.31'
FROM minta.cegek
WHERE uzletiev_vege IS NULL
ORDER BY 2;

/*6. fejts�k meg az al�bbi lek�rdez�seket!*/
/*COALESCE f�ggv�ny: kiterjesztett NVL: 
az els� nem null �rt�ket fogja eredm�ny�l adni*/

SELECT COALESCE(NULL,NULL, 500) 
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

--INSERT INTO ugyfel 
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



/*2.	K�rdezz�k le a MINTA.IRODALOM t�bl�b�l 
az �r�k nev�t �s eredeti nev�t �gy, 
hogy akinek nincs megadva az eredeti neve, 
azokn�l az eredeti n�vhez is az ismert nev�ket �rjuk ki!*/



/*3.	A minta.orszagadatok t�bl�b�l  list�zzuk ki az orsz�gokat
�s az �nnepnapokat is! 
Ahol NULL �rt�k van, ott �rjuk be a �nem ismert� sz�veget! 
Rendezz�k az eredm�nyt az �nnepnapok szerinti sorrendbe! */



/*4.	K�rdezz�k le a MINTA s�ma CEGEK t�bl�j�b�l az Rt-ket �gy, 
hogy az Rt ut�n legyen pont, de ha volt pont eleve, 
akkor ne legyen k�t pont ut�na!*/



/*5.	Hozzuk l�tre az al�bbi HALLGATO t�bl�t!
HAZ: hallgat� azonos�t�ja, 6 karakteres sz�veg, els�dleges kulcs
HVNEV: hallgat� vezet�kneve, k�telez�
HKNEV: hallgat� keresztneve, k�telez�
HSZDAT: hallgat� sz�let�si d�tuma
EVF: �vfolyam, 1 jegy� eg�sz sz�m, 1 �s 5 k�z�tt lehet, alap�rtelmezetten 1*/



/*6.	Vigy�nk be sql utas�t�ssal k�t rekordot, 
az egyik hallgat�nak ne legyen �vfolyama, a 
m�siknak engedj�k az alap�rtelmezett �vfolyamot be�rni!*/



/*7.	A Moodle-ben tal�lhat� Excel t�bl�zatb�l hozzuk 
l�tre az adatok be�r�s�ra alkalmas SQL utas�t�sokat!
(Excelben az egyszeres aposztr�fot a cella elej�n dupl�n kell be�rni)
M�soljuk be �ket �s futtassuk le! 
V�gleges�ts�k az adatbevitelt! 
(Csak az els� utas�t�st m�soljuk be A Moodle-be)*/



/*8. T�r�lj�k a hallgat�kat! Vonjuk vissza! 
T�r�lj�k csak a 6. �ves hallgat�kat! V�gleges�ts�k!*/



/*9. T�r�lj�k azokat a hallgat�kat, 
akik 2016. szeptember 1-n m�g nem voltak 18 �vesek! V�gleges�ts�k!*/



/*10. M�dos�tsuk mindenkinek az �vfolyam�t eggyel nagyobbra!
Vonjuk vissza!*/



/*11. Egy udas�t�ssal m�dos�tsuk a hallgat�k �vfolyam�t az al�bbiak szerint: 
a null-b�l legyen 1, mindenkinek az �vfolyama legyen eggyel nagyobb, az 5-b�l
pedig legyen null!*/


