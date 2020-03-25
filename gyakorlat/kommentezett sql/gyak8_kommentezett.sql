-- JOIN-kat nagyon kell tudni

/*Kérdezzük le az mszemely és mnem táblákból a személyek adatait!*/

-- A Minta sémában található kolcsonzo,nem, dvd és kolcsonzes táblákara a DBA létrehozott ún. publikus szinonímákat
-- mszemely,mnem, mdvd és mkolcsonzes néven. Ha ezeket a neveket használjuk a lekérdezéseinkben, 
-- akkor nem szükséges a sémanevet eléírnunk. 
-- Ha azonos néven van saját objektumunk is, akkor a lekérdezés a sajátunkra fog vonatkozni.

SELECT * FROM
mszemely,mnem; -- Vigyázat, ez így keresztszorzat! Mindenki egyszerre nõ és férfi.

--Nekünk csak azok kellenek, ahol a nem stimmel!
DESC mszemely
DESC mnem

-- Oracle szintaxis
-- join valójában a keresztszorzat szûrése az összetartozó értékekre

SELECT * FROM
mszemely, mnem
WHERE mszemely.nem=mnem.kod;

-- Igazából a nemek kódját felesleges kiírni, pláne kétszer.
-- ha az összekapcsolt tábláknak vannak azonos nevû oszlopaik, akkor azokat minõsítenünk kell, azaz elé kell írnunk, hogy melyik tábla ilyen nevû oszlopára gondolunk
-- a példában az azonos név nem is azonos tartalmú oszlop, de ha azonos tartalmú lenne, a minõsítés akkor is kéne

SELECT kid, nev, nem
FROM mszemely, mnem
WHERE mszemely.nem=mnem.kod; -- miért nem fut le?

SELECT kid, nev, mnem.nem
FROM mszemely, mnem
WHERE mszemely.nem=mnem.kod;

--A minõsítésre nem csak a táblák teljes nevét lehet felhasználni, hanem a lekérdezésben megadott rövidített nevet is
SELECT s.kid, s.nev, n.nem
FROM mszemely s, mnem n
WHERE s.nem=n.kod;

-- milyen más módon tudjuk még lekérdezni ugyanezt?
-- Mivel a kapcsoló oszlop neve nem egyezik a két táblában, a join szintaxisok közül csak az ON-osat használhatjuk ebben a feladatban
-- inner szó elhagyható
-- ON után nem kötelezõ a zárójel és akár összetett feltétel is jöhet utána, de azért átláthatóbb
-- ha csak a join feltételt írjuk és külön WHERE után írjuk az egyéb megszorítást (lásd a következõ feladatban)
SELECT s.kid, s.nev, n.nem
FROM mszemely s /*inner*/ JOIN mnem n
ON s.nem=n.kod;

-- mivel nem egyezik az oszlopnév, más mód nincs.

/*2. Kérdezzük le, hogy melyik dvd-t kik kölcsönözték ki (most elég a kölcsönzõ
kódja)! Csak az 1970-ben, vagy azután készült filmekre vagyunk kiváncsiak. Jelenítsük
meg az éveket is.*/
/*Próbáljuk meg a lekérdezést különbözõ szintaktikákkal!*/

--mindkét táblának a sorszam az elsõdleges kulcsa, de a dvd táblában a film is egyedi (be is van rá állítva a unique kényszer)
--a kolcsonzes táblában a film oszlop a dvd tábla film oszlopára hivatkozik idegen kulcsként. 
--A két tábla sorszam oszlopainak semmi köze nincs egymáshoz!

DESC mdvd
DESC mkolcsonzes

-- Oracle szintaxis
-- ha feltétel is van, akkor a join feltételhez azt AND-del tudjuk hozzáfûzni
SELECT * FROM
mdvd d,mkolcsonzes k
WHERE d.film=k.film
AND ev >= 1970;

--  ON-os megoldásnál nem and-del van most (úgy is mûködött volna, de nem logikus), hanem külön where-be
SELECT d.film,d.ev,k.sorszam,k.kolcsonzo FROM
mdvd d JOIN mkolcsonzes k
ON d.film=k.film
WHERE ev >= 1970;

--Mivel azonos az oszlopnév, lehet using is.
--miért nem jó? 
SELECT d.film,d.ev,k.sorszam,k.kolcsonzo FROM
mdvd d JOIN mkolcsonzes k
USING (film)
WHERE ev >= 1970;

--A USING (és a NATURAL JOIN) szintaxis használatánál arra kell vigyázni, hogy ezekben az esetekben a kapcsoló 
--oszlop(ok) az eredményrelációban csak egyszer szerepelnek (akkor is, ha * a select lista). 
--Így viszont nem kell, sõt nem is szabad minõsíteni ezeket az oszlopokat
SELECT film,d.ev,k.sorszam,k.kolcsonzo FROM
mdvd d JOIN mkolcsonzes k
USING (film)
WHERE ev >= 1970;

-- Mi történik, ha a using-ot is elhagyjuk és natural join-t használunk?
-- Miért nincs eredménye? Mi volt most az összekapcsoló feltétel?
-- A NATURAL JOIN viszont nem jó, mert az az összes azonos nevû oszlop alapján illeszt, azaz annak felene meg, hogy WHERE d.film=k.film AND d.sorszam=k.sorszam. 
-- Ennek jelen esetben egyetlen rekord sem felel meg, de ha véletlenül lenne is ilyen sor, annak sem lenne semmi értelme (a dvd sorszáma megegyezik a kölcsönzés sorszámával).
SELECT film,ev,sorszam,kolcsonzo FROM
mdvd NATURAL JOIN mkolcsonzes
WHERE ev >= 1970
;

/*3. Kérdezzük le mégegyszer, hogy kik kölcsönözték ki az
1970-ben, vagy azután készült filmeket,
de most neveket is szeretnénk látni.*/

--Nem csak kettõ táblát lehet összekapcsolni. 
-- Ilyenkor úgy kell elképzelni, hogy két tábla összekapcsolásával keletkezik egy reláció,
-- amihez aztán hozzákapcsolhatunk egy újabb relációt és így tovább. 
-- A JOIN mûveleteket is lehet zárójelezni. 
-- Inner join-nál nem feltétlenül van jelentõsége, de outer joinnál mindenképpen. 
-- Több tábla összekapcsolásánál kombinálhatjuk is a különbözõ szintaxisokat.

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

-- Ez a példa úgynevezett non equijoint tartalmaz. 
-- Az elõadáson az hangzott el, hogy ez igen ritka, és egy fizetési kategóriás betweenes példa szerepelt.  
-- itt bármi lehet, kisebb, nagyobb, bármiféle függvények, transzformációk a két oldalon
-- Az lehet még példa, ha tervezési hiba miatt nem azonos az adattípus a két táblában (az idegen kulcs nem is építhetõ fel), 
-- pl. az egyik táblában fix hosszúságú, míg a másikban változó hosszúságú szöveg van. 
-- Ebben az esetben a fix hosszúságút TRIM függvénnyel kell „kezelni”.

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

-- Ha a második feltételt nem írjuk hozzá, akkor mindenkit összepárosít saját magával is,
-- illetve oda vissza is kiírja a párosokat. 
-- Kikommentezéssel ki lehet próbálni. Megkapjuk mind a 62 személyt önmagával párosítva, meg még azt a 2-t,
-- ahol tényleg névegyezés van, de õket meg oda vissza is, így 66 eredménysorunk lesz.)

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

-- Az OUTER szót szintén nem kötelezõ kiírni. 
-- Azzal, hogy a left, right vagy full szavak valamelyike szerepel, már egyértelmû, hogy outerrõl van szó. 
-- Ahol nincs érték a kapcsolódó táblában, ott null értéket kapunk. 
-- Idegen kulccsal összekapcsolt tábláknál nyilván csak az egyik oldali külsõ joinnak van értelme, 
-- a másik oldalról a kényszer miatt egyértelmû, hogy a kapcsolódó táblában is mindig lesz adat. 
-- Az ilyen irányban írt külsõ join logikai hibának számít, még akkor is, ha az eredményben konrétan nem jelentkezik hiba.
-- csak akkor használjunk külsõ joint, ha azt a feladat valóban megkívánja.


select d.film, d.ev,k.sorszam kölcsönzés_sorszám
from mdvd d left /*outer*/ join mkolcsonzes k
on (d.film=k.film)
where d.ev >= 1970
order by d.film;
-- mi szerepel a kölcsönzés_sorszám helyén a még ki nem vett filmeknél?

--ugyanez fordítva:
--ugyanazt jelenti, mint az elõzõ
select d.film, d.ev,k.sorszam kölcsönzés_sorszám
from mkolcsonzes k right join mdvd d
on (d.film=k.film)
where d.ev >= 1970
order by d.film;

/*7. Listázzuk ki csak azokat a filmeket, amelyeket még senki nem kölcsönzött ki!*/

-- Itt megint külsõ join kell, a feltételben pedig kihasználjuk, hogy a kapcsolódó táblában null érték szerepel.
-- Fontos, hogy a kulcs oszlopban (de mindenképpen not null oszlopban) vizsgáljuk a null értéket, különben olyan
-- is elõfordulhat, hogy van kapcsolódó rekord, csak éppen a vizsgált mezõ értéke nem volt megadva.

select d.sorszam,film,rendezo,ev
from mdvd d left join mkolcsonzes k
using(film)
where k.sorszam is null
order by ev;

/*8. Van-e olyan ügyfelünk, aki soha nem kölcsönzött még? Kik azok?*/

--Annyit mutat be pluszban a feladat, hogy a * elé is lehet minõsítést írni (kivéve USING és NATURAL esetében).

select s.*
from mszemely s left join mkolcsonzes k
on (s.kid=k.kolcsonzo)
where k.sorszam is null;

/******************/
/*Önálló feladatok:*/
/******************/

--Az önálló feladatok a csoportsémákra vonatkoznak
-- Fontos, hogy nem mindegyik csoport egyforma logikával oldotta meg a 
-- tervezést, így ugyanannak a feladatnak is eltérõ megoldásai lehetnek 
-- a különbözõ sémákban. Érdemes mindegyik megoldás elõtt felderíteni az adott séma szerkezetét
-- az elsõ 4 feladat alap, csuklóból meg kell tudni majd oldani a vizsgán
-- Elõfordulhatnak olyan feladatok is, amelyekhez hiányzik adat egy-egy sémából, akkor másikban próbáljuk meg megoldani.

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
