-- JOIN-kat nagyon kell tudni

/*K�rdezz�k le az mszemely �s mnem t�bl�kb�l a szem�lyek adatait!*/

-- A Minta s�m�ban tal�lhat� kolcsonzo,nem, dvd �s kolcsonzes t�bl�kara a DBA l�trehozott �n. publikus szinon�m�kat
-- mszemely,mnem, mdvd �s mkolcsonzes n�ven. Ha ezeket a neveket haszn�ljuk a lek�rdez�seinkben, 
-- akkor nem sz�ks�ges a s�manevet el��rnunk. 
-- Ha azonos n�ven van saj�t objektumunk is, akkor a lek�rdez�s a saj�tunkra fog vonatkozni.

SELECT * FROM
mszemely,mnem; -- Vigy�zat, ez �gy keresztszorzat! Mindenki egyszerre n� �s f�rfi.

--Nek�nk csak azok kellenek, ahol a nem stimmel!
DESC mszemely
DESC mnem

-- Oracle szintaxis
-- join val�j�ban a keresztszorzat sz�r�se az �sszetartoz� �rt�kekre

SELECT * FROM
mszemely, mnem
WHERE mszemely.nem=mnem.kod;

-- Igaz�b�l a nemek k�dj�t felesleges ki�rni, pl�ne k�tszer.
-- ha az �sszekapcsolt t�bl�knak vannak azonos nev� oszlopaik, akkor azokat min�s�ten�nk kell, azaz el� kell �rnunk, hogy melyik t�bla ilyen nev� oszlop�ra gondolunk
-- a p�ld�ban az azonos n�v nem is azonos tartalm� oszlop, de ha azonos tartalm� lenne, a min�s�t�s akkor is k�ne

SELECT kid, nev, nem
FROM mszemely, mnem
WHERE mszemely.nem=mnem.kod; -- mi�rt nem fut le?

SELECT kid, nev, mnem.nem
FROM mszemely, mnem
WHERE mszemely.nem=mnem.kod;

--A min�s�t�sre nem csak a t�bl�k teljes nev�t lehet felhaszn�lni, hanem a lek�rdez�sben megadott r�vid�tett nevet is
SELECT s.kid, s.nev, n.nem
FROM mszemely s, mnem n
WHERE s.nem=n.kod;

-- milyen m�s m�don tudjuk m�g lek�rdezni ugyanezt?
-- Mivel a kapcsol� oszlop neve nem egyezik a k�t t�bl�ban, a join szintaxisok k�z�l csak az ON-osat haszn�lhatjuk ebben a feladatban
-- inner sz� elhagyhat�
-- ON ut�n nem k�telez� a z�r�jel �s ak�r �sszetett felt�tel is j�het ut�na, de az�rt �tl�that�bb
-- ha csak a join felt�telt �rjuk �s k�l�n WHERE ut�n �rjuk az egy�b megszor�t�st (l�sd a k�vetkez� feladatban)
SELECT s.kid, s.nev, n.nem
FROM mszemely s /*inner*/ JOIN mnem n
ON s.nem=n.kod;

-- mivel nem egyezik az oszlopn�v, m�s m�d nincs.

/*2. K�rdezz�k le, hogy melyik dvd-t kik k�lcs�n�zt�k ki (most el�g a k�lcs�nz�
k�dja)! Csak az 1970-ben, vagy azut�n k�sz�lt filmekre vagyunk kiv�ncsiak. Jelen�ts�k
meg az �veket is.*/
/*Pr�b�ljuk meg a lek�rdez�st k�l�nb�z� szintaktik�kkal!*/

--mindk�t t�bl�nak a sorszam az els�dleges kulcsa, de a dvd t�bl�ban a film is egyedi (be is van r� �ll�tva a unique k�nyszer)
--a kolcsonzes t�bl�ban a film oszlop a dvd t�bla film oszlop�ra hivatkozik idegen kulcsk�nt. 
--A k�t t�bla sorszam oszlopainak semmi k�ze nincs egym�shoz!

DESC mdvd
DESC mkolcsonzes

-- Oracle szintaxis
-- ha felt�tel is van, akkor a join felt�telhez azt AND-del tudjuk hozz�f�zni
SELECT * FROM
mdvd d,mkolcsonzes k
WHERE d.film=k.film
AND ev >= 1970;

--  ON-os megold�sn�l nem and-del van most (�gy is m�k�d�tt volna, de nem logikus), hanem k�l�n where-be
SELECT d.film,d.ev,k.sorszam,k.kolcsonzo FROM
mdvd d JOIN mkolcsonzes k
ON d.film=k.film
WHERE ev >= 1970;

--Mivel azonos az oszlopn�v, lehet using is.
--mi�rt nem j�? 
SELECT d.film,d.ev,k.sorszam,k.kolcsonzo FROM
mdvd d JOIN mkolcsonzes k
USING (film)
WHERE ev >= 1970;

--A USING (�s a NATURAL JOIN) szintaxis haszn�lat�n�l arra kell vigy�zni, hogy ezekben az esetekben a kapcsol� 
--oszlop(ok) az eredm�nyrel�ci�ban csak egyszer szerepelnek (akkor is, ha * a select lista). 
--�gy viszont nem kell, s�t nem is szabad min�s�teni ezeket az oszlopokat
SELECT film,d.ev,k.sorszam,k.kolcsonzo FROM
mdvd d JOIN mkolcsonzes k
USING (film)
WHERE ev >= 1970;

-- Mi t�rt�nik, ha a using-ot is elhagyjuk �s natural join-t haszn�lunk?
-- Mi�rt nincs eredm�nye? Mi volt most az �sszekapcsol� felt�tel?
-- A NATURAL JOIN viszont nem j�, mert az az �sszes azonos nev� oszlop alapj�n illeszt, azaz annak felene meg, hogy WHERE d.film=k.film AND d.sorszam=k.sorszam. 
-- Ennek jelen esetben egyetlen rekord sem felel meg, de ha v�letlen�l lenne is ilyen sor, annak sem lenne semmi �rtelme (a dvd sorsz�ma megegyezik a k�lcs�nz�s sorsz�m�val).
SELECT film,ev,sorszam,kolcsonzo FROM
mdvd NATURAL JOIN mkolcsonzes
WHERE ev >= 1970
;

/*3. K�rdezz�k le m�gegyszer, hogy kik k�lcs�n�zt�k ki az
1970-ben, vagy azut�n k�sz�lt filmeket,
de most neveket is szeretn�nk l�tni.*/

--Nem csak kett� t�bl�t lehet �sszekapcsolni. 
-- Ilyenkor �gy kell elk�pzelni, hogy k�t t�bla �sszekapcsol�s�val keletkezik egy rel�ci�,
-- amihez azt�n hozz�kapcsolhatunk egy �jabb rel�ci�t �s �gy tov�bb. 
-- A JOIN m�veleteket is lehet z�r�jelezni. 
-- Inner join-n�l nem felt�tlen�l van jelent�s�ge, de outer joinn�l mindenk�ppen. 
-- T�bb t�bla �sszekapcsol�s�n�l kombin�lhatjuk is a k�l�nb�z� szintaxisokat.

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

/*4. �sszekapcsol�s nem csak egyenl�s�g ment�n lehet. T�telezz�k fel 
(csak a p�lda kedv��rt), hogy �gy szeretn�nk filmeket aj�nlani az 
�gyfeleinknek, hogy a nev�k kezd�bt�j�vel megegyez� kezd�bet�j� 
filmeket aj�nljuk nekik. Kinek mit aj�nlunk?*/

-- Ez a p�lda �gynevezett non equijoint tartalmaz. 
-- Az el�ad�son az hangzott el, hogy ez igen ritka, �s egy fizet�si kateg�ri�s betweenes p�lda szerepelt.  
-- itt b�rmi lehet, kisebb, nagyobb, b�rmif�le f�ggv�nyek, transzform�ci�k a k�t oldalon
-- Az lehet m�g p�lda, ha tervez�si hiba miatt nem azonos az adatt�pus a k�t t�bl�ban (az idegen kulcs nem is �p�thet� fel), 
-- pl. az egyik t�bl�ban fix hossz�s�g�, m�g a m�sikban v�ltoz� hossz�s�g� sz�veg van. 
-- Ebben az esetben a fix hossz�s�g�t TRIM f�ggv�nnyel kell �kezelni�.

SELECT s.nev,d.film
FROM mszemely s, mdvd d
WHERE substr(s.nev,1,1)=substr(d.film,1,1)
ORDER BY 1,2;

--Menne join-nal is?
SELECT s.nev,d.film
FROM mszemely s JOIN mdvd d
ON (substr(s.nev,1,1)=substr(d.film,1,1))
ORDER BY 1,2;

/*5. T�bl�kat �nmagukkal is �sszekapcsolhatunk.
K�rdezz�k le az azonos nev� �gyfeleinket!
Minden p�rost csak egyszer �rjunk ki!*/

-- Ha a m�sodik felt�telt nem �rjuk hozz�, akkor mindenkit �sszep�ros�t saj�t mag�val is,
-- illetve oda vissza is ki�rja a p�rosokat. 
-- Kikommentez�ssel ki lehet pr�b�lni. Megkapjuk mind a 62 szem�lyt �nmag�val p�ros�tva, meg m�g azt a 2-t,
-- ahol t�nyleg n�vegyez�s van, de �ket meg oda vissza is, �gy 66 eredm�nysorunk lesz.)

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

/*6. List�zzuk ki a 70-ben, vagy azut�n k�sz�lt filmeket �s azt, 
hogy h�nyadik k�lcs�nz�s alkalm�val k�lcs�n�zt�k ki �ket! 
Ez�ttal szerepeljenek a list�ban azok a filmek is, amelyeket m�g
nem k�lcs�n�ztek ki!*/

-- Az OUTER sz�t szint�n nem k�telez� ki�rni. 
-- Azzal, hogy a left, right vagy full szavak valamelyike szerepel, m�r egy�rtelm�, hogy outerr�l van sz�. 
-- Ahol nincs �rt�k a kapcsol�d� t�bl�ban, ott null �rt�ket kapunk. 
-- Idegen kulccsal �sszekapcsolt t�bl�kn�l nyilv�n csak az egyik oldali k�ls� joinnak van �rtelme, 
-- a m�sik oldalr�l a k�nyszer miatt egy�rtelm�, hogy a kapcsol�d� t�bl�ban is mindig lesz adat. 
-- Az ilyen ir�nyban �rt k�ls� join logikai hib�nak sz�m�t, m�g akkor is, ha az eredm�nyben konr�tan nem jelentkezik hiba.
-- csak akkor haszn�ljunk k�ls� joint, ha azt a feladat val�ban megk�v�nja.


select d.film, d.ev,k.sorszam k�lcs�nz�s_sorsz�m
from mdvd d left /*outer*/ join mkolcsonzes k
on (d.film=k.film)
where d.ev >= 1970
order by d.film;
-- mi szerepel a k�lcs�nz�s_sorsz�m hely�n a m�g ki nem vett filmekn�l?

--ugyanez ford�tva:
--ugyanazt jelenti, mint az el�z�
select d.film, d.ev,k.sorszam k�lcs�nz�s_sorsz�m
from mkolcsonzes k right join mdvd d
on (d.film=k.film)
where d.ev >= 1970
order by d.film;

/*7. List�zzuk ki csak azokat a filmeket, amelyeket m�g senki nem k�lcs�nz�tt ki!*/

-- Itt megint k�ls� join kell, a felt�telben pedig kihaszn�ljuk, hogy a kapcsol�d� t�bl�ban null �rt�k szerepel.
-- Fontos, hogy a kulcs oszlopban (de mindenk�ppen not null oszlopban) vizsg�ljuk a null �rt�ket, k�l�nben olyan
-- is el�fordulhat, hogy van kapcsol�d� rekord, csak �ppen a vizsg�lt mez� �rt�ke nem volt megadva.

select d.sorszam,film,rendezo,ev
from mdvd d left join mkolcsonzes k
using(film)
where k.sorszam is null
order by ev;

/*8. Van-e olyan �gyfel�nk, aki soha nem k�lcs�nz�tt m�g? Kik azok?*/

--Annyit mutat be pluszban a feladat, hogy a * el� is lehet min�s�t�st �rni (kiv�ve USING �s NATURAL eset�ben).

select s.*
from mszemely s left join mkolcsonzes k
on (s.kid=k.kolcsonzo)
where k.sorszam is null;

/******************/
/*�n�ll� feladatok:*/
/******************/

--Az �n�ll� feladatok a csoports�m�kra vonatkoznak
-- Fontos, hogy nem mindegyik csoport egyforma logik�val oldotta meg a 
-- tervez�st, �gy ugyanannak a feladatnak is elt�r� megold�sai lehetnek 
-- a k�l�nb�z� s�m�kban. �rdemes mindegyik megold�s el�tt felder�teni az adott s�ma szerkezet�t
-- az els� 4 feladat alap, csukl�b�l meg kell tudni majd oldani a vizsg�n
-- El�fordulhatnak olyan feladatok is, amelyekhez hi�nyzik adat egy-egy s�m�b�l, akkor m�sikban pr�b�ljuk meg megoldani.

/*A feladatokhoz haszn�lhat� s�m�k:
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

/*1. List�zzuk ki a sz�ll�shelyfoglal� oldalunk 
�gyfeleit �s azt, hogy mikori �rkez�ssel foglaltak 
sz�ll�st!
(Csak azok az �gyfelek kellenek, akik legal�bb egyszer foglaltak.)*/

/*2. List�zzuk ki a sz�ll�shelyfoglal� oldalunkon szerepl� sz�ll�shelyeket
�s azok szob�it. Csak a 3 csillagos sz�ll�shelyek kl�m�s szob�it szeretn�nk
l�tni.*/

/*3. List�zzuk ki azokat a sz�ll�shelyeket, amelyekhez m�g nincsenek 
felv�ve a szob�k az adatb�zisunkban! Van ilyen?*/

/*4. List�zzuk ki a sz�ll�shelyfoglal� oldalunk 
azon �gyfeleit, akik m�g nem foglaltak!*/

/*5. Aj�nljunk az �gyfeleinknek olyan sz�llod�t, ami a saj�t v�rosukban van 
(az ir�ny�t�sz�m a c�mek els� 4 karaktere)*/

/*6. List�zzuk ki azokat az �gyfeleket, akik a 
sz�let�snapjukat a sz�llod�nkban t�ltik!*/

/*7. List�zzuk ki az egyetemi adatb�zisunkb�l a hallgat�kat �s a 
t�rgyak k�dj�t, amiket felvettek. Azt is, hogy az adott t�rgyat melyik 
f�l�vben vett�k fel. (Csak azok a hallgat�k kellenek, akik vettek m�r
fel t�rgyat.)*/

/*8. List�zzuk ki az egyetemi adatb�zisunkb�l a tant�rgyfelv�teleket
�s az azokhoz tartoz� erdm�nyeket. Csak a 2015-16-os els� f�l�v
5-�s oszt�lyzataira vagyunk kiv�ncsiak.*/


/*9. List�zzuk ki egyetem�nk azon hallgat�it, akik m�g nem vettek
fel t�rgyat! Van ilyen?*/

/*10. List�zzuk ki azokat a t�rgyakat, amelyeket m�g senki nem vett
fel!*/

/*11. Aj�nljunk hallgat�inknak olyan t�rgyat, ahol a tant�rgyfelel�s 
vezet�kneve megegyezik az �v�kkel!*/

/*12. List�zzuk ki azokat a hallgat�kat, akik a 2015-16-os tan�v m�sodik 
f�l�vben a 2. vizsg�jukon legal�bb 3 jeggyel jobbat �rtek el,
mint az els�n!*/

/*13. List�zzuk ki a webshopunk adatb�zis�b�l az �gyfeleket �s azt, hogy 
melyik napokon rendeltek. (Csak azok az �gyfelek kellenek, akiknek
volt m�r rendel�s�k.)*/

/*14. List�zzuk ki a webshopunk adatb�zis�b�l az iskolaszer
kateg�ri�j� term�keket �s a hozz�juk tartoz� rendel�sek azonos�t�j�t
�s a darabsz�mokat! Csak azok a rendel�sek kellenek, ahol legal�bb 50db-ot
rendeltek.*/

/*15. List�zzuk a web�ruh�zunkb�l azokat a vev�ket, akik
m�g soha nem rendeltek. Van ilyen?*/

/*16. List�zzuk ki a web�ruh�zunkb�l azokat a term�keket,
amelyekb�l m�g soha nem rendeltek!*/

/*17. Csak a gyakorl�s kedv��rt aj�nljunk az �gyfeleinknek olyan
term�keket, amelyek lista�ra alacsonyabb, mint az �gyfelek �letkora.*/

/*18. Azt tervezz�k, hogy a sz�let�snapos �gyfeleinknek 10% kedvezm�nyt adunk.
Hogy l�ssuk, ez az eddigi rendel�seinket hogyan �rintette volna, ha m�r kor�bban
bevezett�k volna, list�zzuk ki azokat a rendel�seket, amelyeket az �gyf�l a
sz�let�snapja el�tti egy h�tben adott fel, �s a t�telek �ra mellett irassuk
ki a felt�telezett kedvezm�ny �sszeg�t is.*/
