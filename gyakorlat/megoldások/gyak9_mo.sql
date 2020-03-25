/*Számolások az egész táblára*/
/*1. Számoljuk ki az orsz szinonímából 
az ott szereplõ országok teljes népességét!*/

SELECT sum(nepesseg) FROM orsz;

/*2. Számoljuk ki, hogy összesen 
a népesség mekkora aránya lakik fõvárosokban!*/

SELECT sum(fovaros_nepessege)/sum(nepesseg) FROM orsz;

/*egy szebb megoldás:*/
SELECT to_char(sum(fovaros_nepessege)/sum(nepesseg)*100,'99')||'%' AS fõváros_lakosarány
FROM orsz;

/*3. Mekkora a táblában szereplõ országok területének átlaga?*/

SELECT avg(terulet) FROM orsz;

--az átlagot illik kerekíteni:

SELECT round(avg(terulet),2) FROM orsz;
DESC orsz

/*Darabszámok a táblában*/
/*4. Hány rekord szerepel az orszagadatok táblában? 
Ez hány ország adata? Hány országnak van megadva 
az autójele és ez hány különbözõ autójelet jelent?*/

SELECT 
 count(*) sorok_száma
,count(orszag) országok_száma
,count(autojel) autojelek_száma
,count(DISTINCT autojel) unique_autojelek_száma 
FROM orsz;

/*5. Hány különbözõ földrajzi hely és földrész 
szerepel az orszagadatok táblában?*/

SELECT count(DISTINCT foldrajzi_hely),count(DISTINCT foldresz) FROM orsz;

/*Számítások részcsoportra. 
Korlátozzuk a számításban résztvevõ rekordok számát.*/

/*6. Hány európai rekord szerepel az orszagadatok táblában? 
Ez hány ország adata? Hány országnak van megadva 
az autójele és ez hány különbözõ autójelet jelent?*/

SELECT 
 count(*) sorok_száma
,count(orszag) országok_száma
,count(autojel) autojelek_száma
,count(DISTINCT autojel) unique_autojelek_száma 
,count(DISTINCT foldrajzi_hely) földrajzi_helyek_száma
FROM orsz
WHERE foldresz='Európa';

/*7. Hány országban használnak dollárt?*/

SELECT count(*) dollárt_használók
FROM orsz
WHERE penznem='dollár';

/*8.	Földrészenként hány ország van a táblában?*/

SELECT foldresz, count(*) országok_száma
FROM orsz
GROUP BY foldresz;

/*9.	Földrajzi helyenként hány ország van a táblában?*/

SELECT foldrajzi_hely, count(*) országok_száma
FROM orsz
GROUP BY foldrajzi_hely;

/*10.	Földrészenként és földrajzi helyenként 
hány ország van a táblában?*/

SELECT foldresz,foldrajzi_hely, count(*) országok_száma
FROM orsz
GROUP BY foldresz,foldrajzi_hely
ORDER BY 1,2;

/*11.	Földrészenként hány országban használnak dollárt?*/

SELECT foldresz, count(*) dollárt_használók
FROM orsz
WHERE penznem='dollár'
GROUP BY foldresz;

/*12. Listázzuk ki azokat a földrajzi helyeket (a földrészeket is megadva), amelyek több mint 4 országból állnak!*/

SELECT foldresz,foldrajzi_hely, count(*) országok_száma
FROM orsz
GROUP BY foldresz,foldrajzi_hely
HAVING count(*)>4
ORDER BY 1,2;

/*13.	Mekkora a legkisebb átlagországméret kontinensenként?*/

SELECT foldresz, round(avg(terulet),2) átlagterület
FROM orsz
GROUP BY foldresz
ORDER BY átlagterület DESC;

SELECT MIN(round(avg(terulet),2)) legkisebb_átlagterület
FROM orsz
GROUP BY foldresz;

/*Csoportfüggvények összekapcsolt táblákból*/

/*14. Kérdezzük le a dvd kölcsönzõ azon ügyfeleit, akik több mint 5-ször 
kölcsönöztek már ki filmet.
Mindegyik különbözõ film volt?*/

SELECT kid,nev, count(*) kölcsönzés_szám, count(DISTINCT film) film_szám, count(*)-count(DISTINCT film) különbség
FROM mszemely s JOIN mkolcsonzes k
ON s.kid=k.kolcsonzo
GROUP BY kid,nev
HAVING count(*)>5;

/*15. Listázzuk ki csak azokat, akiknél volt filmismétlõdés*/

SELECT kid,nev, count(*) kölcsönzés_szám, count(DISTINCT film) film_szám, count(*)-count(DISTINCT film) különbség
FROM mszemely s JOIN mkolcsonzes k
ON s.kid=k.kolcsonzo
GROUP BY kid,nev
HAVING count(*)-count(DISTINCT film)>0;

/*16. Átlagosan hány évesek az egyes ügyfeleink által kikölcsönzött filmek. Számoljunk elõször a hiányzó évszámok kihagyásával,
aztán úgy, hogy feltétellezük, hogy azok 1960-ban készültek. Csak azokat írassuk ki, ahol az eredmény eltér.*/

SELECT kid,nev,count(*) db
,round(avg(EXTRACT(YEAR FROM SYSDATE)-ev),2) átlagkor
,round(avg(EXTRACT(YEAR FROM SYSDATE)-nvl(ev,1960)),2) átlagkor2
FROM mszemely s JOIN mkolcsonzes k ON s.kid=k.kolcsonzo
JOIN mdvd USING(film)
GROUP BY kid, nev
HAVING avg(EXTRACT(YEAR FROM SYSDATE)-ev)<>avg(EXTRACT(YEAR FROM SYSDATE)-nvl(ev,1960));

/*17. Listázzuk ki, hogy hány filmet kölcsönöztek ki a nõi 
ügyfeleink. Akik még nem kölcsönöztek, azoknál 0 szerepeljen! Csak azokat írjuk ki, akik 5-nél kevesebb filmet vettek eddig ki!*/

SELECT kid,nev, count(film) kolcsonzesek
FROM mszemely s LEFT JOIN mkolcsonzes k
ON kid=kolcsonzo
WHERE nem='N'
GROUP BY kid,nev
HAVING count(film)<5
ORDER BY kolcsonzesek DESC;

/*******************/
/*Önálló feladatok:*/
/*******************/
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

/*1.	Listázzuk ki, hogy összesen hány szoba szerepel 
az adatbázisunkban!*/

SELECT count(*) össz_szobaszám FROM g02_szallashely.szoba;

/*2.	Listázzuk ki, hogy szálláshelyenként hány szoba 
és hány férõhely szerepel az adatbázisunkban! Írjuk ki a 
szállás nevét és címét is!*/

SELECT A.ID, A.nev,A.cim, count(b.ID) szobaszám, sum(b.agyszam) férõhely
FROM g02_szallashely.szallashely A LEFT JOIN g02_szallashely.szoba b ON(A.ID=b.szallashely)
GROUP BY A.ID,A.nev,A.cim
ORDER BY A.ID;

/*3.	Listázzuk ki azokat az ügyfelelinket, akik foglaltak 
már le klímás/tévés szobát! Hány alkalommal történt ez meg?*/

SELECT b.nev, b.login, count(A.ID) foglalás_darabszám
FROM g02_szallashely.foglalas A JOIN g02_szallashely.ugyfel b ON(A.ugyfel_id=b.login)
JOIN g02_szallashely.szoba c ON(A.szoba_id=c.ID)
WHERE c.tv='I' 
GROUP BY b.nev, b.login
ORDER BY b.nev;

/*4.	Ügyfeleink összesen hányszor foglaltak nálunk 
szállást? Csak azokat listázzuk ki, akik maximum 2-szer!*/

SELECT b.nev, b.login, count(A.ID) foglalás_darabszám
FROM g02_szallashely.foglalas A RIGHT JOIN g02_szallashely.ugyfel b ON(A.ugyfel_id=b.login)
GROUP BY b.nev, b.login
HAVING count(A.ID)<=2
ORDER BY b.nev;

/*5.	Ügyfeleink összesen hány éjszakára foglaltak nálunk 
szállást? Csak azokat írjuk ki, akiknél legalább 40 napot 
számolunk!*/

SELECT b.login, b.nev, sum(A.meddig-A.mettol) foglalt_éjszakák_száma
FROM g02_szallashely.foglalas A JOIN g02_szallashely.ugyfel b ON(A.ugyfel_id=b.login)
GROUP BY b.login, b.nev
HAVING sum(A.meddig-A.mettol)>=40
ORDER BY b.nev;

/*6.	Mennyi a legtöbb nap, amit valaki a szállásainkon 
foglalt?*/

SELECT MAX(sum(A.meddig-A.mettol)) max_foglalt_éjsz_száma
FROM g02_szallashely.foglalas A JOIN g02_szallashely.ugyfel b ON(A.ugyfel_id=b.login)
GROUP BY b.login, b.nev;

/**************************/

/*7.	Listázzuk ki, hogy összesen hány hallgató szerepel 
az adatbázisunkban!*/

SELECT count(*) hallgatók_száma FROM g04_egyetem.hallgato;

/*8.	Listázzuk ki az egyetemi adatbázisunkból a hallgatókat 
és hogy hány tárgyat vettek fel a 2015/16-os tanév második félévében! Jelenítsük meg a hallgatók nevét és szakját is!*/

SELECT h.neptun, h.nev, s.szaknev, count(f.tantargy)
FROM (g04_egyetem.hallgato h JOIN g04_egyetem.szak s ON (h.szak = s.szakkod))
JOIN g04_egyetem.felev f ON (f.hallgato = h.neptun)
WHERE kezdet = '2015/2016 2'
GROUP BY neptun, nev, szaknev;

/*9.	Listázzuk ki, hogy hány pénzügy szakos hallgató 
vette fel az adatbázisban szereplõ választható tárgyakat!*/

SELECT count(DISTINCT neptun) valaszto_psz_esek
FROM ((g04_egyetem.hallgato h JOIN g04_egyetem.szak s ON (h.szak = s.szakkod))
JOIN g04_egyetem.felev f ON (f.hallgato = h.neptun))
JOIN g04_egyetem.tantargy t ON (t.tantargykod = f.tantargy)
WHERE szaknev = 'pénzügy és számvitel'
AND besorolas = 'vál';

/*10.	Szakonként és félévenként számoljuk ki az eredmények 
átlagát!*/

SELECT szak, kezdet, round(avg(jegy),2) jegy_atlag
FROM ((g04_egyetem.hallgato h JOIN g04_egyetem.szak s ON (h.szak = s.szakkod))
JOIN g04_egyetem.felev f ON (f.hallgato = h.neptun))
JOIN g04_egyetem.eredmeny e ON (e.targyfelvetel = f.ID)
GROUP BY szak, kezdet
ORDER BY szak, kezdet;

/*11.	Mennyi ezeknek az átlagoknak a maximuma illetve 
minimuma?*/

SELECT MAX(round(avg(jegy),3)) max_jegy_atlag, MIN(round(avg(jegy),3)) min_jegy_atlag
FROM ((g04_egyetem.hallgato h JOIN g04_egyetem.szak s ON (h.szak = s.szakkod))
JOIN g04_egyetem.felev f ON (f.hallgato = h.neptun))
JOIN g04_egyetem.eredmeny e ON (e.targyfelvetel = f.ID)
GROUP BY szak, kezdet
ORDER BY szak, kezdet;

/*12.	Listázzuk ki azokat a kötelezõ tárgyainkat, 
amit 20-nál kevesebben vettek fel! Azok is jelenjenek 
meg, amelyeket egy hallgató sem vett fel!*/

SELECT tantargykod, tantargynev, count(neptun) felvett
FROM (g04_egyetem.hallgato h JOIN g04_egyetem.felev f ON (f.hallgato = h.neptun))
RIGHT JOIN g04_egyetem.tantargy t ON (t.tantargykod = f.tantargy)
WHERE besorolas = 'köt'
GROUP BY tantargykod,tantargynev
HAVING count(neptun) < 20
ORDER BY 3 DESC;

/********************/

/*13. Listázzuk ki, hogy átlagosan mekkora a készletünk 
a termékeinkbõl!*/

SELECT round(avg(keszlet),2) átlag_készlet FROM g14_webshop.termek;

/*14. Listázzuk ki, hogy havonta mekkora volt a rendelések 
összértéke a webshopunkban!*/

SELECT to_char(rend_ido,'yyyy.mm.'), sum(egysegar*mennyiseg)
FROM g14_webshop.rendeles JOIN g14_webshop.rendelesi_tetel USING(rend_ido)
GROUP BY to_char(rend_ido,'yyyy.mm.')
ORDER BY 1;

SELECT to_char(rend_ido,'yyyy.month') hónap, sum(egysegar*mennyiseg) érték
FROM g14_webshop.rendeles JOIN g14_webshop.rendelesi_tetel USING(rend_ido)
GROUP BY to_char(rend_ido,'yyyy.month'),to_char(rend_ido,'yyyy.mm.')
ORDER BY to_char(rend_ido,'yyyy.mm.');

/*15.	Listázzuk ki azokat az ügyfeleinket, akik rendeltek 
már nálunk kabátot! Fejenként összesen hány darabot?*/

SELECT login, nev,sum(mennyiseg) kabátok_száma
FROM g14_webshop.ugyfel JOIN g14_webshop.rendeles USING(login)
JOIN g14_webshop.rendelesi_tetel USING(rend_ido)
JOIN g14_webshop.termek USING (termekkod)
WHERE kategoria='kabát'
GROUP BY login,nev
ORDER BY 3 DESC;

/*16.	Listázzuk ki, hogy a termékeinkbõl összesen mekkora 
összegben rendeltek! Csak azokat jelenítsük meg, ahol az összeg 
1000 Ft-nál kevesebb. Amibõl még nem rendeltek, azok is jelenjenek meg!*/

SELECT termekkod, megnevezes, sum(nvl(mennyiseg,0)*nvl(egysegar,0))összeg
FROM g14_webshop.termek 
LEFT JOIN g14_webshop.rendelesi_tetel 
USING (termekkod)
GROUP BY termekkod, megnevezes
HAVING sum(nvl(mennyiseg,0)*nvl(egysegar,0))<1000
ORDER BY 3;

/*17.	Számoljuk ki, hogy termékkategóriánként mekkora volt a bevételünk! 
Mennyi ezeknek a bevételeknek az átlaga?*/
SELECT kategoria, sum(nvl(mennyiseg,0)*nvl(egysegar,0))bevétel
FROM g14_webshop.termek 
LEFT JOIN g14_webshop.rendelesi_tetel 
USING (termekkod)
GROUP BY kategoria;

SELECT round(avg(sum(nvl(mennyiseg,0)*nvl(egysegar,0))),2) átlag_bevétel
FROM g14_webshop.termek 
LEFT JOIN g14_webshop.rendelesi_tetel 
USING (termekkod)
GROUP BY kategoria;
