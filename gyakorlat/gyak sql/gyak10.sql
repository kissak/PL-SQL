create view akarmi as select * from mszemely;

/*0. T�r�lj�k a saj�t s�m�nk tartalm�t.
A MINTA s�ma t�bl�inak m�sol�s�val hozzuk l�tre
a nem, szemely, kolcsonzes �s film t�bl�kat!*/
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

/*1. K�sz�ts�nk a szemely-b�l k�t n�zetet, 
az egyik tartalmazza a f�rfiakat, a m�sik a n�ket.*/

DESC szemely

CREATE OR REPLACE VIEW ferfiak AS 
SELECT * FROM szemely
WHERE nem='F';

select * from ferfiak;

CREATE OR REPLACE VIEW nok AS
SELECT * FROM szemely
WHERE nem='N';

/*2. K�rdezz�k le az 50 �vesn�l id�sebb n�ket!*/
SELECT * FROM nok
where szuldat<sysdate-50*365.25;

/*3. K�rdezz�k le az azonos �vben sz�letett n�ket �s f�rfiakat!*/
SELECT 
to_char(f.szuldat,'yyyy') szulev,f.kid,f.nev,n.kid,n.nev
FROM ferfiak f JOIN nok n
ON to_char(f.szuldat,'yyyy')=to_char(n.szuldat,'yyyy')
order by szulev;

/*Be�gyazott lek�rdez�s: a n�zet helyett 
ki�rhattuk volna a teljes lek�rdez�st is.*/

/*4. Ism�telj�k meg a 2. feladatot n�zet haszn�lata n�lk�l, be�gyazott
lek�rdez�ssel!*/
SELECT * FROM 
/*nok*/
(SELECT * FROM szemely
WHERE nem='N') n
WHERE szuldat<SYSDATE-50*365.25;

/*5. K�rdezz�k le, hogy az egyes szem�lyek 
h�nyszor k�lcs�n�ztek ki korhat�r n�lk�li filmeket!
Azokat is l�ssuk, akik egyszer sem!*/
SELECT s.kid,s.nev, count(d.film)
FROM szemely s JOIN kolcsonzes k ON s.kid=k.kolcsonzo
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='Korhat�r n�lk�l'
GROUP BY s.kid,s.nev; --�gy nincsenek benne a 0-k

SELECT s.kid,s.nev, count(d.film)
FROM szemely s LEFT JOIN 
(kolcsonzes k 
JOIN dvd d ON k.film=d.film)
ON s.kid=k.kolcsonzo
WHERE d.besorolas='Korhat�r n�lk�l' 
GROUP BY s.kid,s.nev; --�gy sem j�, mert a besorol�sra vonatkoz� where miatt 
--megint csak l�tez� k�lcs�nz�sek lesznek.
CREATE OR REPLACE VIEW kn_kolcsonzesek AS
SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='Korhat�r n�lk�l' 
GROUP BY k.kolcsonzo;

SELECT  s.kid,s.nev, sum(nvl(n.darab,0)) darab
FROM szemely s LEFT JOIN kn_kolcsonzesek n ON s.kid=n.kolcsonzo
GROUP BY s.kid,s.nev
order by darab desc, nev;

--be�gyaz�ssal:
SELECT s.kid,s.nev, sum(nvl(n.darab,0)) darab
FROM szemely s LEFT JOIN 
--kn_kolcsonzesek
(SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='Korhat�r n�lk�l' 
GROUP BY k.kolcsonzo)
n ON s.kid=n.kolcsonzo
GROUP BY s.kid,s.nev
order by darab desc, nev;

/*6. Mi van ha m�s besorol�sal kapcsolatban vagyunk kiv�ncsiak ugyanerre?*/
select distinct besorolas from dvd;

SELECT s.kid,s.nev, sum(nvl(n.darab,0)) darab
FROM szemely s LEFT JOIN 
--kn_kolcsonzesek
(SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='csak 6 �ven fel�lieknek' 
GROUP BY k.kolcsonzo)
n ON s.kid=n.kolcsonzo
GROUP BY s.kid,s.nev
order by darab desc, nev;


CREATE or replace VIEW kn_kolcsonzesek AS
SELECT k.kolcsonzo,count(d.film) darab
FROM kolcsonzes k 
JOIN dvd d ON k.film=d.film
WHERE d.besorolas='csak 6 �ven fel�lieknek' 
GROUP BY k.kolcsonzo;

SELECT  s.kid,s.nev, sum(nvl(n.darab,0)) darab
FROM szemely s LEFT JOIN kn_kolcsonzesek n ON s.kid=n.kolcsonzo
GROUP BY s.kid,s.nev
order by darab desc, nev;

/*7. List�zzuk ki az �tlagn�l nagyobb orsz�gokat!*/
select * from orsz
where terulet>
(select avg(terulet) from orsz);

/*8. Melyik kontinensen a legkisebb az orsz�gok �tlag ter�lete?*/
/*m�lt heti 13.	Mekkora a legkisebb �tlagorsz�gm�ret kontinensenk�nt?*/

select foldresz, round(avg(terulet),2) �tlagter�let
from orsz
group by foldresz
order by �tlagter�let desc;

select min(round(avg(terulet),2)) legkisebb_�tlagter�let
from orsz
group by foldresz;

--�sszekombin�lva a fenti k�t lek�rdez�st:

select foldresz, round(avg(terulet),2) �tlagter�let
from orsz
group by foldresz
having round(avg(terulet),2)=
(select min(round(avg(terulet),2)) legkisebb_�tlagter�let
from orsz
group by foldresz);

/*9. Ism�telj�k meg a 7. feladatot, de �rjuk ki az 
�tlag�r�t�ket is minden rekordban, illetve, hogy mekkora
az elt�r�s.*/

select orszag, terulet
, (select round(avg(terulet),0) from orsz) atalg
, terulet-(select round(avg(terulet),0) from orsz) kulonbseg  
, round(terulet/(select avg(terulet) from orsz),2) ar�ny  
from orsz
where terulet>
(select avg(terulet) from orsz)
order by terulet;

/*10. K�rdezz�k le azokat a szem�lyeket, akik m�g soha nem k�lcs�n�ztek! 
Ez�ttal ne haszn�ljunk k�ls� joint!*/

--8. heti megold�s:
select s.*
from mszemely s left join mkolcsonzes k
ON (s.kid=k.kolcsonzo)
WHERE k.sorszam IS NULL;

--semi join megold�s:
SELECT * FROM mszemely
WHERE kid NOT IN 
(SELECT DISTINCT kolcsonzo FROM mkolcsonzes);

/*11. K�rdezz�k le azokat a filmeket minden adatukkal, amelyeket legal�bb 5-sz�r
kik�lcs�n�ztek m�r. Ezuttal ne haszn�ljunk joint!*/
SELECT * FROM mdvd d
WHERE film IN 
(SELECT film FROM mkolcsonzes k
GROUP BY film
HAVING count(*)>=5);

/*12. K�rdezz�k le azokat a filmeket,
amelyek imdb pontsz�ma magasabb, mint az adott
rendez� filmjeinek pont�tlaga.*/

SELECT film,rendezo,imdb_pontszam FROM mdvd d1
WHERE imdb_pontszam>
(SELECT avg(imdb_pontszam)
FROM mdvd d2
WHERE d2.rendezo=d1.rendezo
)
ORDER BY rendezo
;

/*13. Legyenek VIP �gyfelek, akik legal�bb egyszer kik�lcs�n�zt�k 
valamelyik Keresztapa filmet!*/

UPDATE szemely s
SET vip=1
WHERE kid IN 
(SELECT kolcsonzo
FROM kolcsonzes
WHERE lower(film) LIKE 'keresztapa%');
COMMIT;

/*14. Legyenek vip �gyfelek, akik a sz�let�si
�v�kn�l r�gebbi filmet is k�lcs�n�ztek m�r ki!*/

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

/*15. Hozzunk l�tre k�t n�zetet a t�bl�inkb�l, az egyikben minden 
kapcsol�d� adat szerepeljen, a m�sikban �sszesen minden adat 
szerepeljen a t�bl�inkb�l!*/

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
/*�n�ll� feladatok:*/
/*******************/
/*1.	K�rdezz�k le a VIP f�rfi �gyfeleinket. 
Haszn�ljuk az �ra elej�n l�trehozott n�zetet!*/

/*2.	K�rdezz�k le a 40 �vesn�l fiatalabb f�rfiakat �s a n�luk 
fiatalabb n�ket! Rendezz�k a list�t a f�rfiak neve szerint, 
azon bel�l a n�k neve szerint! 
Haszn�ljuk az �ra elej�n l�trehozott n�zeteket!*/

/*3.	K�rdezz�k le, hogy az egyes filmeket h�ny alkalommal k�lcs�n�zt�k 
ki 3 napn�l r�videbb id�re! Csak azokat list�zzuk ki, 
amelyekn�l egy�ltal�n volt ilyen k�lcs�nz�s!*/

/*4.	Ism�telj�k meg az el�z� feladatot, k�rdezz�k le, hogy az 
egyes filmeket h�ny alkalommal k�lcs�n�zt�k ki 3 napn�l r�videbb id�re! 
Azok is jelenjenek meg a lek�rdez�sben, amelyekn�l ez a sz�m 0!*/

/*5.	List�zzuk ki az �tlaghosszn�lh hosszabb filmeket!*/

/*6.	List�zzuk ki azokt a filmeket, amelyek hosszabbak a 
leghosszabb korhat�r n�lk�li filmn�l!*/

/*7.	List�zzuk ki azokat a filmeket amelyek hosszabak a saj�t 
m�fajuk �tlaghossz�n�l (csak a m�faj1 oszlopot vegy�k figyelembe!)*/

/*8.	(Neh�z) List�zzuk ki azokat a filmeket amelyek hosszabak a saj�t 
m�fajuk �tlaghossz�n�l! Vegy�k azonos m�faj�nak minden olyan filmet, 
amelynek a m�faj1 vagy m�faj 2 besorol�sa megegyezik az adott film 
m�faj1 vagy m�faj2 besorol�s�val!*/

/*9.	List�zzuk ki, hogy melyik filmet h�nyszor k�lcs�n�zt�k ki �sszesen, 
�s h�nyszor k�lcs�n�zt�k ki 4 napn�l hosszabb id�re! Ha egyszer sem, 
az is jelenjen meg az eredm�nyben!*/

/*10.	List�zzuk ki, hogy melyik �gyfel�nk h�ny saj�t mag�n�l 
�regebb filmet k�lcs�nz�tt m�r ki!*/


