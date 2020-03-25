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

/*2. Kérdezzük le azokat a férfi dolgozókat, akiknek nincs beosztottjuk!*/

/*3. Kérdezzük le Veres Adrián összes beosztottját névvel anélkül, 
hogy elõre kikeresnénk Veres Adrián kódját!*/

/*4. Kérdezzük le, hogy Komondi Alettának hány férfi 
és hány nõi alkalmazottja van!*/

/*5. NEHÉZ! Írjuk ki a 30 évesnél fiatalabb nõket névvel és az összes felettesük
nevét azzal együtt, hogy hány szinttel vannak feljebb!*/

/*6. Kérdezzük le a MINTA séma KATEGÓRIA táblájából az összes ruha fõkategóriába
tartozó alkategóriát (ne csak a közvetleneket)!*/

/*7. Kérdezzük le a MINTA séma TERMÉK és KATEGORIA tábláiból, 
hogy melyik legfelsõ termékkategóriába tartozik a L019-NA207 kódú termék?*/

/*8. Kérdezzük le a MINTA séma TERMÉK és KATEGORIA tábláiból, 
hogy átlagosan milyen áron kelnek el a kabátok?*/
