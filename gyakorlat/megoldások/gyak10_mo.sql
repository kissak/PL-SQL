CREATE VIEW akarmi AS SELECT * FROM mszemely;

/*0. Töröljük a saját sémánk tartalmát.
A MINTA séma tábláinak másolásával hozzuk létre
a nem, szemely, kolcsonzes és film táblákat!*/
SELECT 
'drop '|| object_type ||' '
||object_name
||CASE WHEN lower(object_type)='table' THEN ' purge;' ELSE ';' END lefuttatni
FROM user_objects
WHERE /*lower(object_type) IN ('table','sequence') AND*/ lower(GENERATED)='n'
ORDER BY created DESC;

CREATE TABLE szemely
AS SELECT * FROM mszemely;
CREATE TABLE dvd
AS SELECT * FROM mdvd;
CREATE TABLE kolcsonzes
AS SELECT * FROM mkolcsonzes;

/*1. Készítsünk a szemely-bõl két nézetet, 
az egyik tartalmazza a férfiakat, a másik a nõket.*/

DESC szemely

CREATE OR REPLACE VIEW ferfiak AS 
SELECT * FROM szemely
WHERE nem='F';

SELECT * FROM ferfiak;

CREATE OR REPLACE VIEW nok AS
SELECT * FROM szemely
WHERE nem='N';

/*2. Kérdezzük le az 50 évesnél idõsebb nõket!*/
SELECT * FROM nok
WHERE szuldat<SYSDATE-50*365.25;

/*3. Kérdezzük le az azonos évben született nõket és férfiakat!*/
SELECT 
to_char(f.szuldat,'yyyy') szulev,f.kid,f.nev,n.kid,n.nev
FROM ferfiak f JOIN nok n
ON to_char(f.szuldat,'yyyy')=to_char(n.szuldat,'yyyy')
ORDER BY szulev;

/*Beágyazott lekérdezés: a nézet helyett 
kiírhattuk volna a teljes lekérdezést is.*/

/*4. Ismételjük meg a 2. feladatot nézet használata nélkül, beágyazott
lekérdezéssel!*/
SELECT * FROM 
/*nok*/
(SELECT * FROM szemely
WHERE nem='N') n
WHERE szuldat<SYSDATE-50*365.25;

/*5. Kérdezzük le, hogy az egyes személyek 
hányszor kölcsönöztek ki korhatár nélküli filmeket!
Azokat is lássuk, akik egyszer sem!*/
SELECT s.kid,s.nev, count(d.film)
FROM szemely s JOIN kolcsonzes k ON s.kid=k.kolcsonzo
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='Korhatár nélkül'
GROUP BY s.kid,s.nev; --így nincsenek benne a 0-k

SELECT s.kid,s.nev, count(d.film)
FROM szemely s LEFT JOIN 
(kolcsonzes k 
JOIN dvd d ON k.film=d.film)
ON s.kid=k.kolcsonzo
WHERE d.besorolas='Korhatár nélkül' 
GROUP BY s.kid,s.nev; --így sem jó, mert a besorolásra vonatkozó where miatt 
--megint csak létezõ kölcsönzések lesznek.
CREATE OR REPLACE VIEW kn_kolcsonzesek AS
SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='Korhatár nélkül' 
GROUP BY k.kolcsonzo;

SELECT  s.kid,s.nev, nvl(n.darab,0) darab
FROM szemely s LEFT JOIN kn_kolcsonzesek n ON s.kid=n.kolcsonzo
ORDER BY darab DESC, nev;

--beágyazással:
SELECT s.kid,s.nev, nvl(n.darab,0) darab
FROM szemely s LEFT JOIN 
--kn_kolcsonzesek
(SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='Korhatár nélkül' 
GROUP BY k.kolcsonzo)
n ON s.kid=n.kolcsonzo
ORDER BY darab DESC, nev;

/*6. Mi van ha más besorolásal kapcsolatban vagyunk kiváncsiak ugyanerre?*/
SELECT DISTINCT besorolas FROM dvd;

SELECT s.kid,s.nev, nvl(n.darab,0) darab
FROM szemely s LEFT JOIN 
--kn_kolcsonzesek
(SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='csak 6 éven felülieknek' 
GROUP BY k.kolcsonzo)
n ON s.kid=n.kolcsonzo
ORDER BY darab DESC, nev;


CREATE OR REPLACE VIEW kn_kolcsonzesek AS
SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='csak 6 éven felülieknek' 
GROUP BY k.kolcsonzo;

SELECT  s.kid,s.nev, nvl(n.darab,0) darab
FROM szemely s LEFT JOIN kn_kolcsonzesek n ON s.kid=n.kolcsonzo
ORDER BY darab DESC, nev;

/*7. Listázzuk ki az átlagnál nagyobb országokat!*/
SELECT * FROM orsz
WHERE terulet>
(SELECT avg(terulet) FROM orsz);

/*8. Melyik kontinensen a legkisebb az országok átlag területe?*/
/*múlt heti 13.	Mekkora a legkisebb átlagországméret kontinensenként?*/

SELECT foldresz, round(avg(terulet),2) átlagterület
FROM orsz
GROUP BY foldresz
ORDER BY átlagterület DESC;

SELECT MIN(round(avg(terulet),2)) legkisebb_átlagterület
FROM orsz
GROUP BY foldresz;

--Összekombinálva a fenti két lekérdezést:

SELECT foldresz, round(avg(terulet),2) átlagterület
FROM orsz
GROUP BY foldresz
HAVING round(avg(terulet),2)=
(SELECT MIN(round(avg(terulet),2)) legkisebb_átlagterület
FROM orsz
GROUP BY foldresz);

/*9. Ismételjük meg a 7. feladatot, de írjuk ki az 
átlagérétéket is minden rekordban, illetve, hogy mekkora
az eltérés.*/

SELECT orszag, terulet
, (SELECT round(avg(terulet),0) FROM orsz) atalg
, terulet-(SELECT round(avg(terulet),0) FROM orsz) kulonbseg  
, round(terulet/(SELECT avg(terulet) FROM orsz),2) arány  
FROM orsz
WHERE terulet>
(SELECT avg(terulet) FROM orsz)
ORDER BY terulet;

/*10. Kérdezzük le azokat a személyeket, akik még soha nem kölcsönöztek! 
Ezúttal ne használjunk külsõ joint!*/

--8. heti megoldás:
SELECT s.*
FROM mszemely s LEFT JOIN mkolcsonzes k
ON (s.kid=k.kolcsonzo)
WHERE k.sorszam IS NULL;

--semi join megoldás:
SELECT * FROM mszemely
WHERE kid NOT IN 
(SELECT DISTINCT kolcsonzo FROM mkolcsonzes);

/*11. Kérdezzük le azokat a filmeket minden adatukkal, amelyeket legalább 5-ször
kikölcsönöztek már. Ezuttal ne használjunk joint!*/
SELECT * FROM mdvd d
WHERE film IN 
(SELECT film FROM mkolcsonzes k
GROUP BY film
HAVING count(*)>=5);

/*12. Kérdezzük le azokat a filmeket,
amelyek imdb pontszáma magasabb, mint az adott
rendezõ filmjeinek pontátlaga.*/

SELECT film,rendezo,imdb_pontszam FROM mdvd d1
WHERE imdb_pontszam>
(SELECT avg(imdb_pontszam)
FROM mdvd d2
WHERE d2.rendezo=d1.rendezo
)
ORDER BY rendezo
;

/*13. Legyenek VIP ügyfelek, akik legalább egyszer kikölcsönözték 
valamelyik Keresztapa filmet!*/

UPDATE szemely s
SET vip=1
WHERE kid IN 
(SELECT kolcsonzo
FROM kolcsonzes
WHERE lower(film) LIKE 'keresztapa%');
COMMIT;

/*14. Legyenek vip ügyfelek, akik a születési
évüknél régebbi filmet is kölcsönöztek már ki!*/

UPDATE szemely s
SET vip=1
WHERE kid=
(SELECT DISTINCT kolcsonzo 
FROM kolcsonzes k
JOIN dvd d USING(film)
WHERE s.kid=k.kolcsonzo
AND EXTRACT(YEAR FROM s.szuldat)>d.ev
);
COMMIT;

/*15. Hozzunk létre két nézetet a tábláinkból, az egyikben minden 
kapcsolódó adat szerepeljen, a másikban összesen minden adat 
szerepeljen a tábláinkból!*/

CREATE OR REPLACE VIEW minden AS
SELECT film,kid,nev,nem,szuldat,beiratkozas,vip,k.sorszam k_sorszam,kolcsonzo,napok,d.sorszam d_sorszam,rendezo,
ev,hossz, mufaj1,mufaj2,besorolas,imdb_pontszam, gyarto_orszag 
FROM szemely s JOIN kolcsonzes k ON s.kid=k.kolcsonzo
JOIN dvd d USING(film);

CREATE OR REPLACE VIEW minden2 AS
SELECT film,kid,nev,nem,szuldat,beiratkozas,vip,k.sorszam k_sorszam,kolcsonzo,napok,d.sorszam d_sorszam,rendezo,
ev,hossz, mufaj1,mufaj2,besorolas,imdb_pontszam, gyarto_orszag
FROM (szemely s LEFT JOIN kolcsonzes k ON s.kid=k.kolcsonzo) 
RIGHT JOIN dvd d USING(film);

SELECT count(*) minden_kolcsonzes FROM minden;
SELECT count(*) minden_rekord FROM minden2;

/*******************/
/*Önálló feladatok:*/
/*******************/
/*1.	Kérdezzük le a VIP férfi ügyfeleinket. 
Használjuk az óra elején létrehozott nézetet!*/

select kid,nev,vip from ferfiak
where vip=1;

/*2.	Kérdezzük le a 40 évesnél fiatalabb férfiakat és a náluk 
fiatalabb nõket! Rendezzük a listát a férfiak neve szerint, 
azon belül a nõk neve szerint! 
Használjuk az óra elején létrehozott nézeteket!*/

SELECT f.kid,f.nev,round((sysdate-f.szuldat)/365.25,1) ferfi_kor
,n.kid,n.nev,round((sysdate-n.szuldat)/365.25,1) no_kor
FROM ferfiak f, nok n
WHERE
f.szuldat>sysdate-40*365.25
and n.szuldat>f.szuldat
order by ferfi_kor,no_kor;

/*3.	Kérdezzük le, hogy az egyes filmeket hány alkalommal kölcsönözték 
ki 3 napnál rövidebb idõre! Csak azokat listázzuk ki, 
amelyeknél egyáltalán volt ilyen kölcsönzés!*/

select film, count(*) darab
from kolcsonzes
where napok<3
group by film
order by darab desc;


/*4.	Ismételjük meg az elõzõ feladatot, kérdezzük le, hogy az 
egyes filmeket hány alkalommal kölcsönözték ki 3 napnál rövidebb idõre! 
Azok is jelenjenek meg a lekérdezésben, amelyeknél ez a szám 0!*/

create or replace view rovid_kolcsonzes as
select film, count(*) darab
from kolcsonzes
where napok<3
group by film;

select sorszam,film,rendezo,ev, nvl(darab,0) darab  from
dvd left join rovid_kolcsonzes
using(film)
order by darab desc;

/*5.	Listázzuk ki az átlaghossználh hosszabb filmeket!*/

select * from dvd
where hossz>
(select avg(hossz) from dvd);

/*6.	Listázzuk ki azokt a filmeket, amelyek hosszabbak a 
leghosszabb korhatár nélküli filmnél!*/


select * from dvd
where hossz>
(select max(hossz) from dvd
where besorolas='Korhatár nélkül');

/*7.	Listázzuk ki azokat a filmeket amelyek hosszabak a saját 
mûfajuk átlaghosszánál (csak a mûfaj1 oszlopot vegyük figyelembe!)*/

select * from dvd d1
where hossz>
(select avg(hossz) from dvd d2
where d2.mufaj1=d1.mufaj1)
order by mufaj1;

/*8.	(Nehéz) Listázzuk ki azokat a filmeket amelyek hosszabak a saját 
mûfajuk átlaghosszánál! Vegyük azonos mûfajúnak minden olyan filmet, 
amelynek a mûfaj1 vagy mûfaj 2 besorolása megegyezik az adott film 
mûfaj1 vagy mûfaj2 besorolásával!*/

select * from dvd d1
where hossz>
(select avg(hossz) from dvd d2
where d2.mufaj1=d1.mufaj1 
or    d2.mufaj1=d1.mufaj2 
or    d2.mufaj2=d1.mufaj1 
or    d2.mufaj2=d1.mufaj2)
order by mufaj1;

/*9.	Listázzuk ki, hogy melyik filmet hányszor kölcsönözték ki összesen, 
és hányszor kölcsönözték ki 4 napnál hosszabb idõre! Ha egyszer sem, 
az is jelenjen meg az eredményben!*/

select film, count(*) osszesen
from kolcsonzes
group by film;

select film,count(*) hosszu
from kolcsonzes
where napok>4
group by film;

select film, nvl(osszesen,0) osszesen, nvl(hosszu,0) hosszu
from (dvd d left join
(select film, count(*) osszesen
from kolcsonzes
group by film) o
using(film))
left join
(select film,count(*) hosszu
from kolcsonzes
where napok>4
group by film) h
using(film)
order by osszesen desc,hosszu desc;

/*10.	Listázzuk ki, hogy melyik ügyfelünk hány saját magánál 
öregebb filmet kölcsönzött már ki! Azt is lássuk, ha 0-t!*/
desc szemely
desc kolcsonzes
desc dvd

create or replace view regi_filmek as
select kid,count(*) darab
from szemely s, kolcsonzes k, dvd d
where s.kid=k.kolcsonzo
and k.film=d.film
and extract(year from szuldat)>d.ev
group by kid;

select kid,nev,szuldat,nvl(darab,0) darab
from szemely s left join regi_filmek
using(kid)
order by darab desc;
