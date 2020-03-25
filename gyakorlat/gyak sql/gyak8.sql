/*Kérdezzük le az mszemely és mnem táblákból a személyek adatait!*/

SELECT * FROM
mszemely,mnem; -- Vigyázat, ez így keresztszorzat! Mindenki egyszerre nõ és férfi.

--Nekünk csak azok kellenek, ahol a nem stimmel!
DESC mszemely
DESC mnem

SELECT * FROM
mszemely, mnem
WHERE mszemely.nem=mnem.kod;

--Igazából a nemek kódját felesleges kiírni, pláne kétszer.
SELECT kid, nev, nem
FROM mszemely, mnem
WHERE mszemely.nem=mnem.kod; -- miért nem fut le?

SELECT kid, nev, mnem.nem
FROM mszemely, mnem
WHERE mszemely.nem=mnem.kod;

--vagy
SELECT s.kid, s.nev, n.nem
FROM mszemely s, mnem n
WHERE s.nem=n.kod;

-- milyen más módon tudjuk még lekérdezni ugyanezt?
SELECT s.kid, s.nev, n.nem
FROM mszemely s /*inner*/ JOIN mnem n
ON s.nem=n.kod;

-- mivel nem egyezik az oszlopnév, más mód nincs.

/*2. Kérdezzük le, hogy melyik dvd-t kik kölcsönözték ki (most elég a kölcsönzõ
kódja)! Csak az 1970-ben, vagy azután készült filmekre vagyunk kiváncsiak. Jelenítsük
meg az éveket is.*/
/*Próbáljuk meg a lekérdezést különbözõ szintaktikákkal!*/
DESC mdvd
DESC mkolcsonzes

SELECT * FROM
mdvd d,mkolcsonzes k
WHERE d.film=k.film
AND ev >= 1970;

SELECT d.film,d.ev,k.sorszam,k.kolcsonzo FROM
mdvd d JOIN mkolcsonzes k
ON d.film=k.film
WHERE ev >= 1970;

--Mivel azonos az oszlopnév, lehet using is.

SELECT d.film,d.ev,k.sorszam,k.kolcsonzo FROM
mdvd d JOIN mkolcsonzes k
USING (film)
WHERE ev >= 1970;

--miért nem jó?

SELECT film,d.ev,k.sorszam,k.kolcsonzo FROM
mdvd d JOIN mkolcsonzes k
USING (film)
WHERE ev >= 1970;

--Mi történik, ha a using-ot is elhagyjuk és natural join-t használunk?

SELECT film,ev,sorszam,kolcsonzo FROM
mdvd NATURAL JOIN mkolcsonzes
WHERE ev >= 1970
;

--Miért nincs eredménye? Mi volt most az összekapcsoló feltétel?

/*3. Kérdezzük le mégegyszer, hogy kik kölcsönözték ki az
1970-ben, vagy azután készült filmeket,
de most neveket is szeretnénk látni.*/

SELECT d.film,d.ev, k.sorszam, s.nev
FROM mdvd d, mkolcsonzes k, mszemely s
WHERE d.film=k.film AND k.kolcsonzo=s.kid
AND ev >= 1970
ORDER BY film,nev;

SELECT film,d.ev, k.sorszam, s.nev
FROM 
(mdvd d JOIN mkolcsonzes k USING(film))
JOIN mszemely s ON(k.kolcsonzo=s.kid)
AND ev >= 1970
ORDER BY film,nev;

/*4. Összekapcsolás nem csak egyenlõség mentén lehet. Tételezzük fel 
(csak a példa kedvéért), hogy úgy szeretnénk filmeket ajánlani az 
ügyfeleinknek, hogy a nevük kezdõbtûjével megegyezõ kezdõbetûjû 
filmeket ajánljuk nekik. Kinek mit ajánlunk?*/

SELECT s.nev,d.film
FROM mszemely s, mdvd d
WHERE substr(s.nev,1,1)=substr(d.film,1,1)
ORDER BY 1,2;

--Menne join-nal is?
SELECT s.nev,d.film
FROM mszemely s JOIN mdvd d
ON (substr(s.nev,1,1)=substr(d.film,1,1))
ORDER BY 1,2;

/*5. Táblákat önmagukkal is összekapcsolhatunk.
Kérdezzük le az azonos nevû ügyfeleinket!
Minden párost csak egyszer írjunk ki!*/
SELECT m1.nev, m1.kid, m2.kid FROM
mszemely m1, mszemely m2
WHERE m1.nev=m2.nev
AND m1.kid<m2.kid
ORDER BY m1.nev;

-- ugyanez joinnal
SELECT m1.nev, m1.kid, m2.kid FROM
mszemely m1 JOIN mszemely m2
ON (m1.nev=m2.nev)
WHERE m1.kid<m2.kid
ORDER BY m1.nev;

/*6. Listázzuk ki a 70-ben, vagy azután készült filmeket és azt, 
hogy hányadik kölcsönzés alkalmával kölcsönözték ki õket! 
Ezúttal szerepeljenek a listában azok a filmek is, amelyeket még
nem kölcsönöztek ki!*/
select d.film, d.ev,k.sorszam kölcsönzés_sorszám
from mdvd d left /*outer*/ join mkolcsonzes k
on (d.film=k.film)
where d.ev >= 1970
order by d.film;
-- mi szerepel a kölcsönzés_sorszám helyén a még ki nem vett filmeknél?

--ugyanez fordítva:
select d.film, d.ev,k.sorszam kölcsönzés_sorszám
from mkolcsonzes k right join mdvd d
on (d.film=k.film)
where d.ev >= 1970
order by d.film;

/*7. Listázzuk ki csak azokat a filmeket, amelyeket még senki nem kölcsönzött ki!*/
select d.sorszam,film,rendezo,ev
from mdvd d left join mkolcsonzes k
using(film)
where k.sorszam is null
order by ev;

/*8. Van-e olyan ügyfelünk, aki soha nem kölcsönzött még? Kik azok?*/
select s.*
from mszemely s left join mkolcsonzes k
on (s.kid=k.kolcsonzo)
where k.sorszam is null;

/******************/
/*Önálló feladatok:*/
/******************/

/*A feladatokhoz használható sémák:
G01_Szallashely
G12_Szallashely
G02_Szallashely
G11_Szallashely
G03_Szallashely
G04_Egyetem
G06_Egyetem
G08_Egyetem
G13_Egyetem
G05_Webshop
G07_Webshop
G14_Webshop
G09_Webshop
G10_Webshop
*/

/*1. Listázzuk ki a szálláshelyfoglaló oldalunk 
ügyfeleit és azt, hogy mikori érkezéssel foglaltak 
szállást!
(Csak azok az ügyfelek kellenek, akik legalább egyszer foglaltak.)*/

/*2. Listázzuk ki a szálláshelyfoglaló oldalunkon szereplõ szálláshelyeket
és azok szobáit. Csak a 3 csillagos szálláshelyek klímás szobáit szeretnénk
látni.*/

/*3. Listázzuk ki azokat a szálláshelyeket, amelyekhez még nincsenek 
felvíve a szobák az adatbázisunkban! Van ilyen?*/

/*4. Listázzuk ki a szálláshelyfoglaló oldalunk 
azon ügyfeleit, akik még nem foglaltak!*/

/*5. Ajánljunk az ügyfeleinknek olyan szállodát, ami a saját városukban van 
(az irányítószám a címek elsõ 4 karaktere)*/

/*6. Listázzuk ki azokat az ügyfeleket, akik a 
születésnapjukat a szállodánkban töltik!*/

/*7. Listázzuk ki az egyetemi adatbázisunkból a hallgatókat és a 
tárgyak kódját, amiket felvettek. Azt is, hogy az adott tárgyat melyik 
félévben vették fel. (Csak azok a hallgatók kellenek, akik vettek már
fel tárgyat.)*/

/*8. Listázzuk ki az egyetemi adatbázisunkból a tantárgyfelvételeket
és az azokhoz tartozó erdményeket. Csak a 2015-16-os elsõ félév
5-ös osztályzataira vagyunk kiváncsiak.*/


/*9. Listázzuk ki egyetemünk azon hallgatóit, akik még nem vettek
fel tárgyat! Van ilyen?*/

/*10. Listázzuk ki azokat a tárgyakat, amelyeket még senki nem vett
fel!*/

/*11. Ajánljunk hallgatóinknak olyan tárgyat, ahol a tantárgyfelelõs 
vezetékneve megegyezik az övékkel!*/

/*12. Listázzuk ki azokat a hallgatókat, akik a 2015-16-os tanév második 
félévben a 2. vizsgájukon legalább 3 jeggyel jobbat értek el,
mint az elsõn!*/

/*13. Listázzuk ki a webshopunk adatbázisából az ügyfeleket és azt, hogy 
melyik napokon rendeltek. (Csak azok az ügyfelek kellenek, akiknek
volt már rendelésük.)*/

/*14. Listázzuk ki a webshopunk adatbázisából az iskolaszer
kategóriájú termékeket és a hozzájuk tartozó rendelések azonosítóját
és a darabszámokat! Csak azok a rendelések kellenek, ahol legalább 50db-ot
rendeltek.*/

/*15. Listázzuk a webáruházunkból azokat a vevõket, akik
még soha nem rendeltek. Van ilyen?*/

/*16. Listázzuk ki a webáruházunkból azokat a termékeket,
amelyekbõl még soha nem rendeltek!*/

/*17. Csak a gyakorlás kedvéért ajánljunk az ügyfeleinknek olyan
termékeket, amelyek listaára alacsonyabb, mint az ügyfelek életkora.*/

/*18. Azt tervezzük, hogy a születésnapos ügyfeleinknek 10% kedvezményt adunk.
Hogy lássuk, ez az eddigi rendeléseinket hogyan érintette volna, ha már korábban
bevezettük volna, listázzuk ki azokat a rendeléseket, amelyeket az ügyfél a
születésnapja elõtti egy hétben adott fel, és a tételek ára mellett irassuk
ki a feltételezett kedvezmény összegét is.*/
