/*1. Hozzuk l�tre a MINTA s�ma DOLGOZO �s FONOK t�bl�inak m�solat�t
a saj�t s�m�nkban!*/

CREATE TABLE dolgozo AS SELECT * FROM minta.dolgozo;
CREATE TABLE fonok AS SELECT * FROM minta.fonok;

/*2. M�dos�tsuk a t�bl�kat �gy, hogy a DOLGOZO t�bl�nak legyen
kulcsa, a FONOK t�bla pedig idegen kulcsokkal hivatkozzon a 
DOLGOZO t�bla kulcs�ra!*/

DESC dolgozo
DESC fonok

ALTER TABLE dolgozo MODIFY
(ID PRIMARY KEY);

ALTER TABLE fonok MODIFY (
 ID REFERENCES dolgozo
,fonok_id REFERENCES dolgozo
);

/*3. K�rdezz�k le az egyes beosztottak �sszes f�n�k�t
(nem csak a k�zvetleneket)!
�rjuk ki azt is, hogy az adott f�n�k h�ny szinttel van
feljebb �s azt is, hogy kik a k�ztes f�n�k�k!*/

SELECT sys_connect_by_path(to_char(ID,'00'), '/' ) AS kapcsolati_ut
,LEVEL,ID,fonok_id
FROM fonok
CONNECT BY ID = PRIOR fonok_id
ORDER BY kapcsolati_ut,LEVEL,ID,fonok_id
;

/*4. K�rdezz�k le csak az 1-es k�d� dolgoz� f�n�keit!*/

SELECT sys_connect_by_path(to_char(ID,'00'), '/' ) AS kapcsolati_ut
,LEVEL,ID,fonok_id
FROM fonok
START WITH ID = 1
CONNECT BY ID = PRIOR fonok_id
ORDER BY kapcsolati_ut,LEVEL,ID,fonok_id
;

--egyszer�bben:
SELECT fonok_id
FROM fonok
START WITH ID = 1
CONNECT BY ID = PRIOR fonok_id
ORDER BY LEVEL
;

/*5. �rjuk ki az 1-es k�d� dolgoz� f�n�keinek azonos�t�j�t
�s a nev�t!*/

SELECT fonok_id, vnev||' '||knev bana_�rp�dn�_f�n�kei
FROM fonok JOIN dolgozo
ON (fonok.fonok_id=dolgozo.ID) --!!
START WITH fonok.ID = 1
CONNECT BY fonok.ID = PRIOR fonok_id
ORDER BY LEVEL
;

/*6. K�rdezz�k le az egyes f�n�k�k �sszes beosztottj�t
(nem csak a k�zvetlen beosztottakat)! 
�rjuk ki azt is, hogy h�nyadik szint� a beosztott �s azt
is, hogy kik a k�ztes f�n�k�k!
(Ford�tsuk meg a 3. feladatot!)*/

SELECT sys_connect_by_path(to_char(fonok_id,'00'), '/' ) AS kapcsolati_ut
,LEVEL,fonok_id,ID
FROM fonok
CONNECT BY fonok_id = PRIOR ID
ORDER BY kapcsolati_ut,LEVEL,fonok_id,ID
;

/*7. �rjuk ki csak a 40-es k�d� dolgoz� beosztottjait!*/

SELECT sys_connect_by_path(to_char(fonok_id,'00'), '/' ) AS kapcsolati_ut
,LEVEL,fonok_id,ID
FROM fonok
START WITH fonok_id=40
CONNECT BY fonok_id = PRIOR ID
ORDER BY kapcsolati_ut,LEVEL,fonok_id,ID
;

--egyszer�bben:
SELECT ID
FROM fonok
START WITH fonok_id=40
CONNECT BY fonok_id = PRIOR ID
ORDER BY LEVEL,ID
;

/*8. �rjuk ki azokat a f�n�k�ket, akiknek van 30 �vesn�l fiatalabb n�i
alkalmazottjuk!
�rjuk ki, hogy h�ny ilyen alkalmazottjuk van (csak azokat �rjuk ki,
akiknek egy�ltal�n van.*/

SELECT * FROM dolgozo
WHERE nem=1
AND szuldat>SYSDATE-30*365.25;

SELECT DISTINCT d2.ID fonok_id, d2.vnev||' '||d2.knev fonok_nev
FROM
dolgozo d1 JOIN fonok ON d1.ID=fonok.ID
JOIN dolgozo d2 ON fonok.fonok_id=d2.ID
START WITH d1.nem=1 AND d1.szuldat>SYSDATE-30*365.25
CONNECT BY fonok.ID = PRIOR fonok.fonok_id
;

SELECT  d2.ID fonok_id, d2.vnev||' '||d2.knev fonok_nev,
count(*) alkalmazottak_sz�ma
FROM
dolgozo d1 JOIN fonok ON d1.ID=fonok.ID
JOIN dolgozo d2 ON fonok.fonok_id=d2.ID
START WITH d1.nem=1 AND d1.szuldat>SYSDATE-30*365.25
CONNECT BY fonok.ID = PRIOR fonok.fonok_id
GROUP BY d2.ID, d2.vnev||' '||d2.knev
ORDER BY alkalmazottak_sz�ma DESC;

/*******************/
/*�n�ll� feladatok:*/
/*******************/

/*1. K�rdezz�k le a 4-es k�d� dolgoz� �sszes felettes�t n�vvel!*/
SELECT fonok_id, vnev||' '||knev kod4_f�n�kei
FROM fonok JOIN dolgozo
ON (fonok.fonok_id=dolgozo.ID) --!!
START WITH fonok.ID = 4
CONNECT BY fonok.ID = PRIOR fonok_id
ORDER BY LEVEL
;
/*2. K�rdezz�k le azokat a f�rfi dolgoz�kat, akiknek nincs beosztottjuk!*/

SELECT * FROM dolgozo
WHERE nem=0
AND ID NOT IN (SELECT DISTINCT fonok_id FROM fonok)
ORDER BY ID
;

/*3. K�rdezz�k le Veres Adri�n �sszes beosztottj�t n�vvel an�lk�l, 
hogy el�re kikeresn�nk Veres Adri�n k�dj�t!*/


SELECT beosztott.ID, beosztott.vnev||' '||beosztott.knev Veres_Adri�n_beosztottai, level szint
FROM fonok JOIN dolgozo felettes
ON (fonok.fonok_id=felettes.ID) 
JOIN dolgozo beosztott
ON fonok.ID=beosztott.ID--!!
START WITH felettes.vnev = 'Veres' AND felettes.knev='Adri�n'
CONNECT BY PRIOR fonok.ID = fonok_id
ORDER BY LEVEL, id
;

SELECT dolgozo.ID, vnev||' '||knev veres_adri�n_beosztottai, LEVEL szint
FROM fonok JOIN dolgozo ON fonok.id=dolgozo.ID
START WITH fonok_id IN 
(SELECT ID FROM dolgozo WHERE vnev = 'Veres' AND knev='Adri�n')
CONNECT BY PRIOR fonok.ID = fonok_id
ORDER BY LEVEL,id
;
/*4. K�rdezz�k le, hogy Komondi Alett�nak h�ny f�rfi 
�s h�ny n�i alkalmazottja van!*/

SELECT decode(nem,0,'F�rfi','N�') nem, count(*) f�
FROM fonok JOIN dolgozo ON fonok.id=dolgozo.ID
START WITH fonok_id IN 
(SELECT ID FROM dolgozo WHERE vnev = 'Komondi' AND knev='Aletta')
CONNECT BY PRIOR fonok.ID = fonok_id
GROUP BY nem
; 

/*5. NEH�Z! �rjuk ki a 30 �vesn�l fiatalabb n�ket n�vvel �s az �sszes felettes�k
nev�t azzal egy�tt, hogy h�ny szinttel vannak feljebb!*/
SELECT beosztott_id, b.vnev||' '||b.knev AS beosztott
, round((sysdate-b.szuldat)/365.25,1) kor
, szint, fonok_id, f.vnev||' '||f.knev as fonok  
FROM
(SELECT sys_connect_by_path(to_char(fonok_ID,'00'), '/' ) AS kapcsolati_ut
,substr(sys_connect_by_path(to_char(ID,'00'), '/' ),3,2) AS beosztott_id
,LEVEL AS szint
,ID,fonok_id
FROM fonok
START WITH ID IN (SELECT ID FROM dolgozo WHERE nem=1
AND szuldat>SYSDATE-30*365.25)
CONNECT BY ID = PRIOR fonok_id
) h
JOIN dolgozo b ON b.ID=h.beosztott_id
JOIN dolgozo f ON f.ID=h.fonok_id
order by b.id, szint 
;

/*5. vari�ns: �rjuk ki a legfiatalabb dolgoz� nev�t �s f�n�keit!*/
SELECT beosztott_id, b.vnev||' '||b.knev AS beosztott
, szint, fonok_id, f.vnev||' '||f.knev as fonok  
FROM
(SELECT sys_connect_by_path(to_char(ID,'00'), '/' ) AS kapcsolati_ut
,substr(sys_connect_by_path(to_char(ID,'00'), '/' ),3,2) AS beosztott_id
,LEVEL AS szint
,ID,fonok_id
FROM fonok
START WITH ID IN (SELECT ID FROM dolgozo WHERE --nem=0 and 
szuldat=(SELECT MAX(szuldat) FROM dolgozo)
)
CONNECT BY ID = PRIOR fonok_id
) h
JOIN dolgozo b ON b.ID=h.beosztott_id
JOIN dolgozo f ON f.ID=h.fonok_id
order by b.id, szint 
;

/*6. K�rdezz�k le a MINTA s�ma KATEG�RIA t�bl�j�b�l az �sszes ruha f�kateg�ri�ba
tartoz� alkateg�ri�t (ne csak a k�zvetleneket)!*/
DESC minta.kategoria
SELECT alkategoria, LEVEL 
FROM minta.kategoria
START WITH fokategoria='ruha'
CONNECT BY fokategoria=PRIOR alkategoria
ORDER BY 2,1;

/*7. K�rdezz�k le a MINTA s�ma TERM�K �s KATEGORIA t�bl�ib�l, 
hogy melyik legfels� term�kkateg�ri�ba tartozik a L019-NA207 k�d� term�k?*/
SELECT fokategoria, LEVEL 
FROM minta.kategoria
WHERE LEVEL=(SELECT MAX(LEVEL) FROM minta.kategoria 
START WITH alkategoria=(SELECT kategoria FROM minta.termek WHERE termekkod='L019-NA207')
CONNECT BY alkategoria=PRIOR fokategoria)
START WITH alkategoria=(SELECT kategoria FROM minta.termek WHERE termekkod='L019-NA207')
CONNECT BY alkategoria=PRIOR fokategoria
ORDER BY 2,1;


/*8. K�rdezz�k le a MINTA s�ma TERM�K �s KATEGORIA t�bl�ib�l, 
hogy �tlagosan milyen �ron kelnek el a kab�tok?*/
SELECT round(avg(egysegar),2) �tlag�r
FROM minta.termek JOIN minta.kategoria
ON kategoria=alkategoria
join minta.rendelesi_tetel using(termekkod)
START WITH fokategoria='kab�t'
CONNECT BY fokategoria= PRIOR alkategoria;
