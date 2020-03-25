/*Sz�mol�sok az eg�sz t�bl�ra*/
/*1. Sz�moljuk ki az orsz szinon�m�b�l 
az ott szerepl� orsz�gok teljes n�pess�g�t!*/

SELECT sum(nepesseg) FROM orsz;

/*2. Sz�moljuk ki, hogy �sszesen 
a n�pess�g mekkora ar�nya lakik f�v�rosokban!*/

SELECT sum(fovaros_nepessege)/sum(nepesseg) FROM orsz;

/*egy szebb megold�s:*/
SELECT to_char(sum(fovaros_nepessege)/sum(nepesseg)*100,'99')||'%' AS f�v�ros_lakosar�ny
FROM orsz;

/*3. Mekkora a t�bl�ban szerepl� orsz�gok ter�let�nek �tlaga?*/

SELECT avg(terulet) FROM orsz;

--az �tlagot illik kerek�teni:

SELECT round(avg(terulet),2) FROM orsz;
DESC orsz

/*Darabsz�mok a t�bl�ban*/
/*4. H�ny rekord szerepel az orszagadatok t�bl�ban? 
Ez h�ny orsz�g adata? H�ny orsz�gnak van megadva 
az aut�jele �s ez h�ny k�l�nb�z� aut�jelet jelent?*/

SELECT 
 count(*) sorok_sz�ma
,count(orszag) orsz�gok_sz�ma
,count(autojel) autojelek_sz�ma
,count(DISTINCT autojel) unique_autojelek_sz�ma 
FROM orsz;

/*5. H�ny k�l�nb�z� f�ldrajzi hely �s f�ldr�sz 
szerepel az orszagadatok t�bl�ban?*/

SELECT count(DISTINCT foldrajzi_hely),count(DISTINCT foldresz) FROM orsz;

/*Sz�m�t�sok r�szcsoportra. 
Korl�tozzuk a sz�m�t�sban r�sztvev� rekordok sz�m�t.*/

/*6. H�ny eur�pai rekord szerepel az orszagadatok t�bl�ban? 
Ez h�ny orsz�g adata? H�ny orsz�gnak van megadva 
az aut�jele �s ez h�ny k�l�nb�z� aut�jelet jelent?*/

SELECT 
 count(*) sorok_sz�ma
,count(orszag) orsz�gok_sz�ma
,count(autojel) autojelek_sz�ma
,count(DISTINCT autojel) unique_autojelek_sz�ma 
,count(DISTINCT foldrajzi_hely) f�ldrajzi_helyek_sz�ma
FROM orsz
WHERE foldresz='Eur�pa';

/*7. H�ny orsz�gban haszn�lnak doll�rt?*/

SELECT count(*) doll�rt_haszn�l�k
FROM orsz
WHERE penznem='doll�r';

/*8.	F�ldr�szenk�nt h�ny orsz�g van a t�bl�ban?*/

SELECT foldresz, count(*) orsz�gok_sz�ma
FROM orsz
GROUP BY foldresz;

/*9.	F�ldrajzi helyenk�nt h�ny orsz�g van a t�bl�ban?*/

SELECT foldrajzi_hely, count(*) orsz�gok_sz�ma
FROM orsz
GROUP BY foldrajzi_hely;

/*10.	F�ldr�szenk�nt �s f�ldrajzi helyenk�nt 
h�ny orsz�g van a t�bl�ban?*/

SELECT foldresz,foldrajzi_hely, count(*) orsz�gok_sz�ma
FROM orsz
GROUP BY foldresz,foldrajzi_hely
ORDER BY 1,2;

/*11.	F�ldr�szenk�nt h�ny orsz�gban haszn�lnak doll�rt?*/

SELECT foldresz, count(*) doll�rt_haszn�l�k
FROM orsz
WHERE penznem='doll�r'
GROUP BY foldresz;

/*12. List�zzuk ki azokat a f�ldrajzi helyeket (a f�ldr�szeket is megadva), amelyek t�bb mint 4 orsz�gb�l �llnak!*/

SELECT foldresz,foldrajzi_hely, count(*) orsz�gok_sz�ma
FROM orsz
GROUP BY foldresz,foldrajzi_hely
HAVING count(*)>4
ORDER BY 1,2;

/*13.	Mekkora a legkisebb �tlagorsz�gm�ret kontinensenk�nt?*/

SELECT foldresz, round(avg(terulet),2) �tlagter�let
FROM orsz
GROUP BY foldresz
ORDER BY �tlagter�let DESC;

SELECT MIN(round(avg(terulet),2)) legkisebb_�tlagter�let
FROM orsz
GROUP BY foldresz;

/*Csoportf�ggv�nyek �sszekapcsolt t�bl�kb�l*/

/*14. K�rdezz�k le a dvd k�lcs�nz� azon �gyfeleit, akik t�bb mint 5-sz�r 
k�lcs�n�ztek m�r ki filmet.
Mindegyik k�l�nb�z� film volt?*/

SELECT kid,nev, count(*) k�lcs�nz�s_sz�m, count(DISTINCT film) film_sz�m, count(*)-count(DISTINCT film) k�l�nbs�g
FROM mszemely s JOIN mkolcsonzes k
ON s.kid=k.kolcsonzo
GROUP BY kid,nev
HAVING count(*)>5;

/*15. List�zzuk ki csak azokat, akikn�l volt filmism�tl�d�s*/

SELECT kid,nev, count(*) k�lcs�nz�s_sz�m, count(DISTINCT film) film_sz�m, count(*)-count(DISTINCT film) k�l�nbs�g
FROM mszemely s JOIN mkolcsonzes k
ON s.kid=k.kolcsonzo
GROUP BY kid,nev
HAVING count(*)-count(DISTINCT film)>0;

/*16. �tlagosan h�ny �vesek az egyes �gyfeleink �ltal kik�lcs�nz�tt filmek. Sz�moljunk el�sz�r a hi�nyz� �vsz�mok kihagy�s�val,
azt�n �gy, hogy felt�tellez�k, hogy azok 1960-ban k�sz�ltek. Csak azokat �rassuk ki, ahol az eredm�ny elt�r.*/

SELECT kid,nev,count(*) db
,round(avg(EXTRACT(YEAR FROM SYSDATE)-ev),2) �tlagkor
,round(avg(EXTRACT(YEAR FROM SYSDATE)-nvl(ev,1960)),2) �tlagkor2
FROM mszemely s JOIN mkolcsonzes k ON s.kid=k.kolcsonzo
JOIN mdvd USING(film)
GROUP BY kid, nev
HAVING avg(EXTRACT(YEAR FROM SYSDATE)-ev)<>avg(EXTRACT(YEAR FROM SYSDATE)-nvl(ev,1960));

/*17. List�zzuk ki, hogy h�ny filmet k�lcs�n�ztek ki a n�i 
�gyfeleink. Akik m�g nem k�lcs�n�ztek, azokn�l 0 szerepeljen! Csak azokat �rjuk ki, akik 5-n�l kevesebb filmet vettek eddig ki!*/

SELECT kid,nev, count(film) kolcsonzesek
FROM mszemely s LEFT JOIN mkolcsonzes k
ON kid=kolcsonzo
WHERE nem='N'
GROUP BY kid,nev
HAVING count(film)<5
ORDER BY kolcsonzesek DESC;

/*******************/
/*�n�ll� feladatok:*/
/*******************/
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

/*1.	List�zzuk ki, hogy �sszesen h�ny szoba szerepel 
az adatb�zisunkban!*/

SELECT count(*) �ssz_szobasz�m FROM g02_szallashely.szoba;

/*2.	List�zzuk ki, hogy sz�ll�shelyenk�nt h�ny szoba 
�s h�ny f�r�hely szerepel az adatb�zisunkban! �rjuk ki a 
sz�ll�s nev�t �s c�m�t is!*/

SELECT A.ID, A.nev,A.cim, count(b.ID) szobasz�m, sum(b.agyszam) f�r�hely
FROM g02_szallashely.szallashely A LEFT JOIN g02_szallashely.szoba b ON(A.ID=b.szallashely)
GROUP BY A.ID,A.nev,A.cim
ORDER BY A.ID;

/*3.	List�zzuk ki azokat az �gyfelelinket, akik foglaltak 
m�r le kl�m�s/t�v�s szob�t! H�ny alkalommal t�rt�nt ez meg?*/

SELECT b.nev, b.login, count(A.ID) foglal�s_darabsz�m
FROM g02_szallashely.foglalas A JOIN g02_szallashely.ugyfel b ON(A.ugyfel_id=b.login)
JOIN g02_szallashely.szoba c ON(A.szoba_id=c.ID)
WHERE c.tv='I' 
GROUP BY b.nev, b.login
ORDER BY b.nev;

/*4.	�gyfeleink �sszesen h�nyszor foglaltak n�lunk 
sz�ll�st? Csak azokat list�zzuk ki, akik maximum 2-szer!*/

SELECT b.nev, b.login, count(A.ID) foglal�s_darabsz�m
FROM g02_szallashely.foglalas A RIGHT JOIN g02_szallashely.ugyfel b ON(A.ugyfel_id=b.login)
GROUP BY b.nev, b.login
HAVING count(A.ID)<=2
ORDER BY b.nev;

/*5.	�gyfeleink �sszesen h�ny �jszak�ra foglaltak n�lunk 
sz�ll�st? Csak azokat �rjuk ki, akikn�l legal�bb 40 napot 
sz�molunk!*/

SELECT b.login, b.nev, sum(A.meddig-A.mettol) foglalt_�jszak�k_sz�ma
FROM g02_szallashely.foglalas A JOIN g02_szallashely.ugyfel b ON(A.ugyfel_id=b.login)
GROUP BY b.login, b.nev
HAVING sum(A.meddig-A.mettol)>=40
ORDER BY b.nev;

/*6.	Mennyi a legt�bb nap, amit valaki a sz�ll�sainkon 
foglalt?*/

SELECT MAX(sum(A.meddig-A.mettol)) max_foglalt_�jsz_sz�ma
FROM g02_szallashely.foglalas A JOIN g02_szallashely.ugyfel b ON(A.ugyfel_id=b.login)
GROUP BY b.login, b.nev;

/**************************/

/*7.	List�zzuk ki, hogy �sszesen h�ny hallgat� szerepel 
az adatb�zisunkban!*/

SELECT count(*) hallgat�k_sz�ma FROM g04_egyetem.hallgato;

/*8.	List�zzuk ki az egyetemi adatb�zisunkb�l a hallgat�kat 
�s hogy h�ny t�rgyat vettek fel a 2015/16-os tan�v m�sodik f�l�v�ben! Jelen�ts�k meg a hallgat�k nev�t �s szakj�t is!*/

SELECT h.neptun, h.nev, s.szaknev, count(f.tantargy)
FROM (g04_egyetem.hallgato h JOIN g04_egyetem.szak s ON (h.szak = s.szakkod))
JOIN g04_egyetem.felev f ON (f.hallgato = h.neptun)
WHERE kezdet = '2015/2016 2'
GROUP BY neptun, nev, szaknev;

/*9.	List�zzuk ki, hogy h�ny p�nz�gy szakos hallgat� 
vette fel az adatb�zisban szerepl� v�laszthat� t�rgyakat!*/

SELECT count(DISTINCT neptun) valaszto_psz_esek
FROM ((g04_egyetem.hallgato h JOIN g04_egyetem.szak s ON (h.szak = s.szakkod))
JOIN g04_egyetem.felev f ON (f.hallgato = h.neptun))
JOIN g04_egyetem.tantargy t ON (t.tantargykod = f.tantargy)
WHERE szaknev = 'p�nz�gy �s sz�mvitel'
AND besorolas = 'v�l';

/*10.	Szakonk�nt �s f�l�venk�nt sz�moljuk ki az eredm�nyek 
�tlag�t!*/

SELECT szak, kezdet, round(avg(jegy),2) jegy_atlag
FROM ((g04_egyetem.hallgato h JOIN g04_egyetem.szak s ON (h.szak = s.szakkod))
JOIN g04_egyetem.felev f ON (f.hallgato = h.neptun))
JOIN g04_egyetem.eredmeny e ON (e.targyfelvetel = f.ID)
GROUP BY szak, kezdet
ORDER BY szak, kezdet;

/*11.	Mennyi ezeknek az �tlagoknak a maximuma illetve 
minimuma?*/

SELECT MAX(round(avg(jegy),3)) max_jegy_atlag, MIN(round(avg(jegy),3)) min_jegy_atlag
FROM ((g04_egyetem.hallgato h JOIN g04_egyetem.szak s ON (h.szak = s.szakkod))
JOIN g04_egyetem.felev f ON (f.hallgato = h.neptun))
JOIN g04_egyetem.eredmeny e ON (e.targyfelvetel = f.ID)
GROUP BY szak, kezdet
ORDER BY szak, kezdet;

/*12.	List�zzuk ki azokat a k�telez� t�rgyainkat, 
amit 20-n�l kevesebben vettek fel! Azok is jelenjenek 
meg, amelyeket egy hallgat� sem vett fel!*/

SELECT tantargykod, tantargynev, count(neptun) felvett
FROM (g04_egyetem.hallgato h JOIN g04_egyetem.felev f ON (f.hallgato = h.neptun))
RIGHT JOIN g04_egyetem.tantargy t ON (t.tantargykod = f.tantargy)
WHERE besorolas = 'k�t'
GROUP BY tantargykod,tantargynev
HAVING count(neptun) < 20
ORDER BY 3 DESC;

/********************/

/*13. List�zzuk ki, hogy �tlagosan mekkora a k�szlet�nk 
a term�keinkb�l!*/

SELECT round(avg(keszlet),2) �tlag_k�szlet FROM g14_webshop.termek;

/*14. List�zzuk ki, hogy havonta mekkora volt a rendel�sek 
�ssz�rt�ke a webshopunkban!*/

SELECT to_char(rend_ido,'yyyy.mm.'), sum(egysegar*mennyiseg)
FROM g14_webshop.rendeles JOIN g14_webshop.rendelesi_tetel USING(rend_ido)
GROUP BY to_char(rend_ido,'yyyy.mm.')
ORDER BY 1;

SELECT to_char(rend_ido,'yyyy.month') h�nap, sum(egysegar*mennyiseg) �rt�k
FROM g14_webshop.rendeles JOIN g14_webshop.rendelesi_tetel USING(rend_ido)
GROUP BY to_char(rend_ido,'yyyy.month'),to_char(rend_ido,'yyyy.mm.')
ORDER BY to_char(rend_ido,'yyyy.mm.');

/*15.	List�zzuk ki azokat az �gyfeleinket, akik rendeltek 
m�r n�lunk kab�tot! Fejenk�nt �sszesen h�ny darabot?*/

SELECT login, nev,sum(mennyiseg) kab�tok_sz�ma
FROM g14_webshop.ugyfel JOIN g14_webshop.rendeles USING(login)
JOIN g14_webshop.rendelesi_tetel USING(rend_ido)
JOIN g14_webshop.termek USING (termekkod)
WHERE kategoria='kab�t'
GROUP BY login,nev
ORDER BY 3 DESC;

/*16.	List�zzuk ki, hogy a term�keinkb�l �sszesen mekkora 
�sszegben rendeltek! Csak azokat jelen�ts�k meg, ahol az �sszeg 
1000 Ft-n�l kevesebb. Amib�l m�g nem rendeltek, azok is jelenjenek meg!*/

SELECT termekkod, megnevezes, sum(nvl(mennyiseg,0)*nvl(egysegar,0))�sszeg
FROM g14_webshop.termek 
LEFT JOIN g14_webshop.rendelesi_tetel 
USING (termekkod)
GROUP BY termekkod, megnevezes
HAVING sum(nvl(mennyiseg,0)*nvl(egysegar,0))<1000
ORDER BY 3;

/*17.	Sz�moljuk ki, hogy term�kkateg�ri�nk�nt mekkora volt a bev�tel�nk! 
Mennyi ezeknek a bev�teleknek az �tlaga?*/
SELECT kategoria, sum(nvl(mennyiseg,0)*nvl(egysegar,0))bev�tel
FROM g14_webshop.termek 
LEFT JOIN g14_webshop.rendelesi_tetel 
USING (termekkod)
GROUP BY kategoria;

SELECT round(avg(sum(nvl(mennyiseg,0)*nvl(egysegar,0))),2) �tlag_bev�tel
FROM g14_webshop.termek 
LEFT JOIN g14_webshop.rendelesi_tetel 
USING (termekkod)
GROUP BY kategoria;
