/*K�rdezz�k le az mszemely �s mnem t�bl�kb�l a szem�lyek adatait!*/

SELECT * FROM
mszemely,mnem; -- Vigy�zat, ez �gy keresztszorzat! Mindenki egyszerre n� �s f�rfi.

--Nek�nk csak azok kellenek, ahol a nem stimmel!
DESC mszemely
DESC mnem

SELECT * FROM
mszemely, mnem
WHERE mszemely.nem=mnem.kod;

--Igaz�b�l a nemek k�dj�t felesleges ki�rni, pl�ne k�tszer.
SELECT kid, nev, nem
FROM mszemely, mnem
WHERE mszemely.nem=mnem.kod; -- mi�rt nem fut le?

SELECT kid, nev, mnem.nem
FROM mszemely, mnem
WHERE mszemely.nem=mnem.kod;

--vagy
SELECT s.kid, s.nev, n.nem
FROM mszemely s, mnem n
WHERE s.nem=n.kod;

-- milyen m�s m�don tudjuk m�g lek�rdezni ugyanezt?
SELECT s.kid, s.nev, n.nem
FROM mszemely s /*inner*/ JOIN mnem n
ON s.nem=n.kod;

-- mivel nem egyezik az oszlopn�v, m�s m�d nincs.

/*2. K�rdezz�k le, hogy melyik dvd-t kik k�lcs�n�zt�k ki (most el�g a k�lcs�nz�
k�dja)! Csak az 1970-ben, vagy azut�n k�sz�lt filmekre vagyunk kiv�ncsiak. Jelen�ts�k
meg az �veket is.*/
/*Pr�b�ljuk meg a lek�rdez�st k�l�nb�z� szintaktik�kkal!*/
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

--Mivel azonos az oszlopn�v, lehet using is.

SELECT d.film,d.ev,k.sorszam,k.kolcsonzo FROM
mdvd d JOIN mkolcsonzes k
USING (film)
WHERE ev >= 1970;

--mi�rt nem j�?

SELECT film,d.ev,k.sorszam,k.kolcsonzo FROM
mdvd d JOIN mkolcsonzes k
USING (film)
WHERE ev >= 1970;

--Mi t�rt�nik, ha a using-ot is elhagyjuk �s natural join-t haszn�lunk?

SELECT film,ev,sorszam,kolcsonzo FROM
mdvd NATURAL JOIN mkolcsonzes
WHERE ev >= 1970
;

--Mi�rt nincs eredm�nye? Mi volt most az �sszekapcsol� felt�tel?

/*3. K�rdezz�k le m�gegyszer, hogy kik k�lcs�n�zt�k ki az
1970-ben, vagy azut�n k�sz�lt filmeket,
de most neveket is szeretn�nk l�tni.*/

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
select d.film, d.ev,k.sorszam k�lcs�nz�s_sorsz�m
from mdvd d left /*outer*/ join mkolcsonzes k
on (d.film=k.film)
where d.ev >= 1970
order by d.film;
-- mi szerepel a k�lcs�nz�s_sorsz�m hely�n a m�g ki nem vett filmekn�l?

--ugyanez ford�tva:
select d.film, d.ev,k.sorszam k�lcs�nz�s_sorsz�m
from mkolcsonzes k right join mdvd d
on (d.film=k.film)
where d.ev >= 1970
order by d.film;

/*7. List�zzuk ki csak azokat a filmeket, amelyeket m�g senki nem k�lcs�nz�tt ki!*/
select d.sorszam,film,rendezo,ev
from mdvd d left join mkolcsonzes k
using(film)
where k.sorszam is null
order by ev;

/*8. Van-e olyan �gyfel�nk, aki soha nem k�lcs�nz�tt m�g? Kik azok?*/
select s.*
from mszemely s left join mkolcsonzes k
on (s.kid=k.kolcsonzo)
where k.sorszam is null;

/******************/
/*�n�ll� feladatok:*/
/******************/

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
