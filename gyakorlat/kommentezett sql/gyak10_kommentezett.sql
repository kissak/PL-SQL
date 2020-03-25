create view akarmi as select * from mszemely;

/*0. Töröljük a saját sémánk tartalmát.
A MINTA séma tábláinak másolásával hozzuk létre
a nem, szemely, kolcsonzes és film táblákat!*/
SELECT 
'drop '|| object_type ||' '
||object_name
||case when lower(object_type)='table' then ' purge;' else ';' end Lefuttatni
FROM user_objects
WHERE /*lower(object_type) IN ('table','sequence') AND*/ lower(GENERATED)='n'
ORDER BY created DESC;

CREATE TABLE szemely
AS SELECT * FROM mszemely;
CREATE TABLE dvd
AS SELECT * FROM mdvd;
CREATE TABLE kolcsonzes
AS SELECT * FROM mkolcsonzes;


-- A nézeteknek két nagy felhasználási köre van: egyrészt egyszerusíthetik a 
-- lekérdezéseket: a beágyazott lekérdezést megcsináljuk külön és névvel látjuk
-- el, majd felhasználjuk abból való lekérdezésre.
-- Másrészt jogosultságkezelésre is lehet alkalmas. A mai órán csak a lekérdezések
-- írásának megkönnyítésére fogjuk használni. A lekérdezés eredményeként létrejött
-- relációt pontosan ugyanúgy használhatjuk lekérdezésekben, mint a táblákat.

-- Létrehozás
-- CREATE VIEW nézetnév [(oszlopnevek)] AS SELECT …;
-- Ha nem adunk meg oszlopneveket, akkor a select-ben szereplo oszlopnevekkel jön
-- létre a nézet, de ebben az esetben kötelezo a kifejezéseknek aliast adni a select listában. 
-- Ha a nézetet definiáló select-et szeretnénk módosítani, akkor:
-- CREATE OR REPLACE VIEW nézetnév AS SELECT …
-- Általában minden nézetet ezzel az utasítással szoktunk létrehozni.
-- Van módosító utasítás is, de az a nézet jellemzoit, illetve a nézetre létrehozott
-- kényszereket módosítja. Nem fogunk vele dolgozni, de a dokumentációban megnézheto: 
-- ALTERT VIEW
-- Törlés: DROP VIEW nézetnév.

-- Az jogosultsági kérdés, hogy hozhatunk-e létre nézetet más sémájában lévo táblák lekérdezésével.
-- Jelenleg ez nem engedélyezett. Ezért ma létrehozunk táblákat a saját sémájában mindenkinek,
-- hogy aztán lehessen a nézetesdit kipróbálni.

-- Tehát a 0. feladat, hogy dobjunk el mindent és másolással hozzuk magunknál létre a
-- 3 kölcsönzos táblát (a nem tábla nem fontos). Mivel ma csak lekérdezünk, nincs jelentosége annak,
-- hogy a kényszereket a másolás nem hozza át.


/*1. Készítsünk a szemely-bõl két nézetet, 
az egyik tartalmazza a férfiakat, a másik a nõket.*/

-- Ezt a lekérdezést simán meg tudnánk írni kapásból a szemely táblára is,
-- de tételezzük fel, hogy mi olyan felhasználók vagyunk, akik a szemely tábla
-- létezésérol nem is tudunk, számunkra csak a ferfiak és a nok táblák léteznek.
-- A lekérdezéseket író felhasználók gyakran nem is tudják, hogy az általuk használt
-- táblák valójában táblák-e vagy nézetek. Az o szemszögükbol nincs is ennek jelentosége.

DESC szemely

CREATE OR REPLACE VIEW ferfiak AS 
SELECT * FROM szemely
WHERE nem='F';

select * from ferfiak;

CREATE OR REPLACE VIEW nok AS
SELECT * FROM szemely
WHERE nem='N';

/*2. Kérdezzük le az 50 évesnél idõsebb nõket!*/
SELECT * FROM nok
where szuldat<sysdate-50*365.25;

/*3. Kérdezzük le az azonos évben született nõket és férfiakat!*/
SELECT 
to_char(f.szuldat,'yyyy') szulev,f.kid,f.nev,n.kid,n.nev
FROM ferfiak f JOIN nok n
ON to_char(f.szuldat,'yyyy')=to_char(n.szuldat,'yyyy')
order by szulev;

/*Beágyazott lekérdezés: a nézet helyett 
kiírhattuk volna a teljes lekérdezést is.*/

-- A lekérdezések eredménye mindig reláció. Ez az eredményreláció lehet
-- több soros, több oszlopos, de nem ritkán egyetlen oszlop (gyakorlatilag egy lista),
-- vagy akár egyetlen érték a lekérdezés eredménye. A lekérdezések eredményét fel lehet
-- használni egy újabb lekérdezésen belül.
-- A beágyazott lekérdezések néha a táblák összefuzésének alternatívái.

--a) a FROM után, akár JOIN részeként: több soros, több oszlopos
--b) WHERE ill. HAVING feltételben: lista, vagy érték lekérdezés. Lista jellemzoen az 
--   IN operátorral. Elofordulhat az is feltételben, hogy több értékbol álló feltételünk 
--   van, akkor az IN után is többoszlopos SELECT szerepelhet
--c) extrém esetben akár a select listában: értéklekérdezést, az új lekérdezés minden sorában
--   ugyanaz az érték fog megjelenni


/*4. Ismételjük meg a 2. feladatot nézet használata nélkül, beágyazott
lekérdezéssel!*/

-- Annyi történik, hogy lemásoltuk a 2. feladat megoldását. Kikommenteztük
-- belole a nézet nevét és helyette zárójelben beírtuk azt a lekérdezést, 
-- amivel a nézet létrejött. A beágyazott lekérdezést mindig így kell elképzelni.
-- Gyakran azért van szükség a beágyazott lekérdezésre, mert nincs is jogosultságunk
-- a szükséges nézetet létrehozni.

SELECT * FROM 
/*nok*/
(SELECT * FROM szemely
WHERE nem='N') n
WHERE szuldat<SYSDATE-50*365.25;

/*5. Kérdezzük le, hogy az egyes személyek 
hányszor kölcsönöztek ki korhatár nélküli filmeket!
Azokat is lássuk, akik egyszer sem!*/

-- A csoportfüggvényt a beágyazott lekérdezésben kell használni és azt külso joinnal
-- a szemely táblához kapcsolni, különben a where feltétel elrontaná a külso joint. 
-- A beágyazott lekérdezés helyett használhatunk nézetet is.

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

SELECT  s.kid,s.nev, sum(nvl(n.darab,0)) darab
FROM szemely s LEFT JOIN kn_kolcsonzesek n ON s.kid=n.kolcsonzo
GROUP BY s.kid,s.nev
order by darab desc, nev;

--beágyazással:
SELECT s.kid,s.nev, sum(nvl(n.darab,0)) darab
FROM szemely s LEFT JOIN 
--kn_kolcsonzesek
(SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='Korhatár nélkül' 
GROUP BY k.kolcsonzo)
n ON s.kid=n.kolcsonzo
GROUP BY s.kid,s.nev
order by darab desc, nev;

/*6. Mi van ha más besorolásal kapcsolatban vagyunk kiváncsiak ugyanerre?*/

-- Ha beágyazott lekérdezésünk van, akkor egyszeruen át tudjuk írni a WHERE
-- feltételt. Ha nézetet használtunk, akkor viszont a nézetet kell módosítanunk.
-- Ezért jó pl. az OR REPLACE létrehozási mód, mert akkor csak a nézet definíciójában
-- írjuk át a feltételt és újrafuttatjuk. Aztán futtathatjuk újra az ebbol készült lekérdezést.

select distinct besorolas from dvd;

SELECT s.kid,s.nev, sum(nvl(n.darab,0)) darab
FROM szemely s LEFT JOIN 
--kn_kolcsonzesek
(SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='csak 6 éven felülieknek' 
GROUP BY k.kolcsonzo)
n ON s.kid=n.kolcsonzo
GROUP BY s.kid,s.nev
order by darab desc, nev;


CREATE or replace VIEW kn_kolcsonzesek AS
SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='csak 6 éven felülieknek' 
GROUP BY k.kolcsonzo;

SELECT  s.kid,s.nev, sum(nvl(n.darab,0)) darab
FROM szemely s LEFT JOIN kn_kolcsonzesek n ON s.kid=n.kolcsonzo
GROUP BY s.kid,s.nev
order by darab desc, nev;

/*7. Listázzuk ki az átlagnál nagyobb országokat!*/

-- A megoldáshoz a múlt órán is használt ORSZ szinonímát használjuk.
-- Ha feltételben van a beágyazás, ott nem is kényelmesebb helyette a
-- nézet használata. Gyakoribb, hogy tényleg megírjuk a select-et.

select * from orsz
where terulet>
(select avg(terulet) from orsz);

/*8. Melyik kontinensen a legkisebb az országok átlag területe?*/
/*múlt heti 13.	Mekkora a legkisebb átlagországméret kontinensenként?*/



select foldresz, round(avg(terulet),2) átlagterület
from orsz
group by foldresz
order by átlagterület desc;

select min(round(avg(terulet),2)) legkisebb_átlagterület
from orsz
group by foldresz;

--Összekombinálva a fenti két lekérdezést:
-- HAVING feltételben van a beágyazás.
select foldresz, round(avg(terulet),2) átlagterület
from orsz
group by foldresz
having round(avg(terulet),2)=
(select min(round(avg(terulet),2)) legkisebb_átlagterület
from orsz
group by foldresz);

/*9. Ismételjük meg a 7. feladatot, de írjuk ki az 
átlagérétéket is minden rekordban, illetve, hogy mekkora
az eltérés.*/

-- Ennél a feladatnál a selectlistába kerül egy értéket eredményül adó
-- allekérdezés. A kiszámolt értékkel további számításokat is végezhetünk,
-- pl. különbség, vagy arány, kerekítés. Látszik pl. hogy Oroszország mérete
-- majdnem 25-szöröse az átlagméretnek.
-- A beágyazott lekérdezések használhatók a JOIN helyett is. Ezeket a 
-- lekérdezéseket semi-join-nak is szokták nevezni.


select orszag, terulet
, (select round(avg(terulet),0) from orsz) atalg
, terulet-(select round(avg(terulet),0) from orsz) kulonbseg  
, round(terulet/(select avg(terulet) from orsz),2) arány  
from orsz
where terulet>
(select avg(terulet) from orsz)
order by terulet;

/*10. Kérdezzük le azokat a személyeket, akik még soha nem kölcsönöztek! 
Ezúttal ne használjunk külsõ joint!*/

-- A megoldás elott megnézzük a 8. heti, külso joinos megoldásunkat erre a feladatra.
-- Ehelyett lekédezhetjük csak a SZEMELYEK táblát úgy, hogy a feltételben egy 
-- allekérdezést használunk a másik táblából. Az allekérdezés egy listát ad eredményül,
-- amit a feltételben úgy használunk fel, hogy azokra van szükségünk, akik nem szerepelnek
-- a listában, tehát az operátor: NOT IN.

--8. heti megoldás:
select s.*
from mszemely s left join mkolcsonzes k
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

-- Korrelált subselect
-- Eloadáson a DML-nél volt róla szó, de sima select-ben és DML utasításban egyarán elofordulhat,
-- hogy beágyazott lekérdezést használunk és néha szükséges, hogy a beágyazott lekérdezés a külso
-- utasítás által érintett minden rekordra külön-külön lefusson. Azaz a beágyazott lekérdezésben 
-- olyan feltétel van, ami a külso utasítás adott rekordjának az egyik mezojétol függ. Éppen ezért
-- nézünk példát select-ben lévo correlált subselectre is, illetve DML utasításban levore is. 
-- Korrelált subselect önmagában nem futtatható le, mert hivatkozik a külso utasítás táblájának egy
-- mezojére.

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
(SELECT distinct kolcsonzo 
FROM kolcsonzes k
JOIN dvd d USING(film)
WHERE s.kid=k.kolcsonzo
and extract(year from s.szuldat)>d.ev
);
commit;

/*15. Hozzunk létre két nézetet a tábláinkból, az egyikben minden 
kapcsolódó adat szerepeljen, a másikban összesen minden adat 
szerepeljen a tábláinkból!*/

-- Az utolsó feladatban hozzunk létre 2 nézetet a 3 táblánkból, ami alapból
-- megkönnyíti az összekapcsolásos lekérdezéseket. Az egyik nézetben csak a
-- tényleges kölcsönzések minden adata szerepeljen. A másikban minden olyan
-- személy és DVD is, amelyek nem szerepeltek egyetlen kölcsönzési eseménynél sem.

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
select count(*) minden_rekord from minden2;

/*******************/
/*Önálló feladatok:*/
/*******************/
/*1.	Kérdezzük le a VIP férfi ügyfeleinket. 
Használjuk az óra elején létrehozott nézetet!*/

/*2.	Kérdezzük le a 40 évesnél fiatalabb férfiakat és a náluk 
fiatalabb nõket! Rendezzük a listát a férfiak neve szerint, 
azon belül a nõk neve szerint! 
Használjuk az óra elején létrehozott nézeteket!*/

/*3.	Kérdezzük le, hogy az egyes filmeket hány alkalommal kölcsönözték 
ki 3 napnál rövidebb idõre! Csak azokat listázzuk ki, 
amelyeknél egyáltalán volt ilyen kölcsönzés!*/

/*4.	Ismételjük meg az elõzõ feladatot, kérdezzük le, hogy az 
egyes filmeket hány alkalommal kölcsönözték ki 3 napnál rövidebb idõre! 
Azok is jelenjenek meg a lekérdezésben, amelyeknél ez a szám 0!*/

/*5.	Listázzuk ki az átlaghossználh hosszabb filmeket!*/

/*6.	Listázzuk ki azokt a filmeket, amelyek hosszabbak a 
leghosszabb korhatár nélküli filmnél!*/

/*7.	Listázzuk ki azokat a filmeket amelyek hosszabak a saját 
mûfajuk átlaghosszánál (csak a mûfaj1 oszlopot vegyük figyelembe!)*/

/*8.	(Nehéz) Listázzuk ki azokat a filmeket amelyek hosszabak a saját 
mûfajuk átlaghosszánál! Vegyük azonos mûfajúnak minden olyan filmet, 
amelynek a mûfaj1 vagy mûfaj 2 besorolása megegyezik az adott film 
mûfaj1 vagy mûfaj2 besorolásával!*/

/*9.	Listázzuk ki, hogy melyik filmet hányszor kölcsönözték ki összesen, 
és hányszor kölcsönözték ki 4 napnál hosszabb idõre! Ha egyszer sem, 
az is jelenjen meg az eredményben!*/

/*10.	Listázzuk ki, hogy melyik ügyfelünk hány saját magánál 
öregebb filmet kölcsönzött már ki!*/


