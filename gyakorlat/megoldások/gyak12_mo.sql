/*1. Hozzuk létre a MINTA séma DOLGOZO és FONOK tábláinak másolatát
a saját sémánkban!*/

CREATE TABLE dolgozo AS SELECT * FROM minta.dolgozo;
CREATE TABLE fonok AS SELECT * FROM minta.fonok;

/*2. Módosítsuk a táblákat úgy, hogy a DOLGOZO táblának legyen
kulcsa, a FONOK tábla pedig idegen kulcsokkal hivatkozzon a 
DOLGOZO tábla kulcsára!*/

DESC dolgozo
DESC fonok

ALTER TABLE dolgozo MODIFY
(ID PRIMARY KEY);

ALTER TABLE fonok MODIFY (
 ID REFERENCES dolgozo
,fonok_id REFERENCES dolgozo
);

/*3. Kérdezzük le az egyes beosztottak összes fõnökét
(nem csak a közvetleneket)!
Írjuk ki azt is, hogy az adott fõnök hány szinttel van
feljebb és azt is, hogy kik a köztes fõnökök!*/

SELECT sys_connect_by_path(to_char(ID,'00'), '/' ) AS kapcsolati_ut
,LEVEL,ID,fonok_id
FROM fonok
CONNECT BY ID = PRIOR fonok_id
ORDER BY kapcsolati_ut,LEVEL,ID,fonok_id
;

/*4. Kérdezzük le csak az 1-es kódú dolgozó fõnökeit!*/

SELECT sys_connect_by_path(to_char(ID,'00'), '/' ) AS kapcsolati_ut
,LEVEL,ID,fonok_id
FROM fonok
START WITH ID = 1
CONNECT BY ID = PRIOR fonok_id
ORDER BY kapcsolati_ut,LEVEL,ID,fonok_id
;

--egyszerûbben:
SELECT fonok_id
FROM fonok
START WITH ID = 1
CONNECT BY ID = PRIOR fonok_id
ORDER BY LEVEL
;

/*5. Írjuk ki az 1-es kódú dolgozó fõnökeinek azonosítóját
és a nevét!*/

SELECT fonok_id, vnev||' '||knev bana_árpádné_fõnökei
FROM fonok JOIN dolgozo
ON (fonok.fonok_id=dolgozo.ID) --!!
START WITH fonok.ID = 1
CONNECT BY fonok.ID = PRIOR fonok_id
ORDER BY LEVEL
;

/*6. Kérdezzük le az egyes fõnökök összes beosztottját
(nem csak a közvetlen beosztottakat)! 
Írjuk ki azt is, hogy hányadik szintû a beosztott és azt
is, hogy kik a köztes fõnökök!
(Fordítsuk meg a 3. feladatot!)*/

SELECT sys_connect_by_path(to_char(fonok_id,'00'), '/' ) AS kapcsolati_ut
,LEVEL,fonok_id,ID
FROM fonok
CONNECT BY fonok_id = PRIOR ID
ORDER BY kapcsolati_ut,LEVEL,fonok_id,ID
;

/*7. írjuk ki csak a 40-es kódú dolgozó beosztottjait!*/

SELECT sys_connect_by_path(to_char(fonok_id,'00'), '/' ) AS kapcsolati_ut
,LEVEL,fonok_id,ID
FROM fonok
START WITH fonok_id=40
CONNECT BY fonok_id = PRIOR ID
ORDER BY kapcsolati_ut,LEVEL,fonok_id,ID
;

--egyszerûbben:
SELECT ID
FROM fonok
START WITH fonok_id=40
CONNECT BY fonok_id = PRIOR ID
ORDER BY LEVEL,ID
;

/*8. Írjuk ki azokat a fõnököket, akiknek van 30 évesnél fiatalabb nõi
alkalmazottjuk!
Írjuk ki, hogy hány ilyen alkalmazottjuk van (csak azokat írjuk ki,
akiknek egyáltalán van.*/

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
count(*) alkalmazottak_száma
FROM
dolgozo d1 JOIN fonok ON d1.ID=fonok.ID
JOIN dolgozo d2 ON fonok.fonok_id=d2.ID
START WITH d1.nem=1 AND d1.szuldat>SYSDATE-30*365.25
CONNECT BY fonok.ID = PRIOR fonok.fonok_id
GROUP BY d2.ID, d2.vnev||' '||d2.knev
ORDER BY alkalmazottak_száma DESC;

/*******************/
/*Önálló feladatok:*/
/*******************/

/*1. Kérdezzük le a 4-es kódú dolgozó összes felettesét névvel!*/
SELECT fonok_id, vnev||' '||knev kod4_fõnökei
FROM fonok JOIN dolgozo
ON (fonok.fonok_id=dolgozo.ID) --!!
START WITH fonok.ID = 4
CONNECT BY fonok.ID = PRIOR fonok_id
ORDER BY LEVEL
;
/*2. Kérdezzük le azokat a férfi dolgozókat, akiknek nincs beosztottjuk!*/

SELECT * FROM dolgozo
WHERE nem=0
AND ID NOT IN (SELECT DISTINCT fonok_id FROM fonok)
ORDER BY ID
;

/*3. Kérdezzük le Veres Adrián összes beosztottját névvel anélkül, 
hogy elõre kikeresnénk Veres Adrián kódját!*/


SELECT beosztott.ID, beosztott.vnev||' '||beosztott.knev Veres_Adrián_beosztottai, level szint
FROM fonok JOIN dolgozo felettes
ON (fonok.fonok_id=felettes.ID) 
JOIN dolgozo beosztott
ON fonok.ID=beosztott.ID--!!
START WITH felettes.vnev = 'Veres' AND felettes.knev='Adrián'
CONNECT BY PRIOR fonok.ID = fonok_id
ORDER BY LEVEL, id
;

SELECT dolgozo.ID, vnev||' '||knev veres_adrián_beosztottai, LEVEL szint
FROM fonok JOIN dolgozo ON fonok.id=dolgozo.ID
START WITH fonok_id IN 
(SELECT ID FROM dolgozo WHERE vnev = 'Veres' AND knev='Adrián')
CONNECT BY PRIOR fonok.ID = fonok_id
ORDER BY LEVEL,id
;
/*4. Kérdezzük le, hogy Komondi Alettának hány férfi 
és hány nõi alkalmazottja van!*/

SELECT decode(nem,0,'Férfi','Nõ') nem, count(*) fõ
FROM fonok JOIN dolgozo ON fonok.id=dolgozo.ID
START WITH fonok_id IN 
(SELECT ID FROM dolgozo WHERE vnev = 'Komondi' AND knev='Aletta')
CONNECT BY PRIOR fonok.ID = fonok_id
GROUP BY nem
; 

/*5. NEHÉZ! Írjuk ki a 30 évesnél fiatalabb nõket névvel és az összes felettesük
nevét azzal együtt, hogy hány szinttel vannak feljebb!*/
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

/*5. variáns: írjuk ki a legfiatalabb dolgozó nevét és fõnökeit!*/
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

/*6. Kérdezzük le a MINTA séma KATEGÓRIA táblájából az összes ruha fõkategóriába
tartozó alkategóriát (ne csak a közvetleneket)!*/
DESC minta.kategoria
SELECT alkategoria, LEVEL 
FROM minta.kategoria
START WITH fokategoria='ruha'
CONNECT BY fokategoria=PRIOR alkategoria
ORDER BY 2,1;

/*7. Kérdezzük le a MINTA séma TERMÉK és KATEGORIA tábláiból, 
hogy melyik legfelsõ termékkategóriába tartozik a L019-NA207 kódú termék?*/
SELECT fokategoria, LEVEL 
FROM minta.kategoria
WHERE LEVEL=(SELECT MAX(LEVEL) FROM minta.kategoria 
START WITH alkategoria=(SELECT kategoria FROM minta.termek WHERE termekkod='L019-NA207')
CONNECT BY alkategoria=PRIOR fokategoria)
START WITH alkategoria=(SELECT kategoria FROM minta.termek WHERE termekkod='L019-NA207')
CONNECT BY alkategoria=PRIOR fokategoria
ORDER BY 2,1;


/*8. Kérdezzük le a MINTA séma TERMÉK és KATEGORIA tábláiból, 
hogy átlagosan milyen áron kelnek el a kabátok?*/
SELECT round(avg(egysegar),2) átlagár
FROM minta.termek JOIN minta.kategoria
ON kategoria=alkategoria
join minta.rendelesi_tetel using(termekkod)
START WITH fokategoria='kabát'
CONNECT BY fokategoria= PRIOR alkategoria;
