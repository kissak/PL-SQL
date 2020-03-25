/*Számolások az egész táblára*/
/*1. Számoljuk ki az orsz szinonímából 
az ott szereplõ országok teljes népességét!*/

select sum(nepesseg) from orsz;

/*2. Számoljuk ki, hogy összesen 
a népesség mekkora aránya lakik fõvárosokban!*/

select sum(fovaros_nepessege)/sum(nepesseg) from orsz;

/*egy szebb megoldás:*/
select to_char(sum(fovaros_nepessege)/sum(nepesseg)*100,'99')||'%' as Fõváros_lakosarány
from orsz;

/*3. Mekkora a táblában szereplõ országok területének átlaga?*/

select avg(terulet) from orsz;

--az átlagot illik kerekíteni:

select round(avg(terulet),2) from orsz;
desc orsz

/*Darabszámok a táblában*/
/*4. Hány rekord szerepel az orszagadatok táblában? 
Ez hány ország adata? Hány országnak van megadva 
az autójele és ez hány különbözõ autójelet jelent?*/

select 
 count(*) sorok_száma
,count(orszag) országok_száma
,count(autojel) autojelek_száma
,count(distinct autojel) unique_autojelek_száma 
from orsz;

/*5. Hány különbözõ földrajzi hely és földrész 
szerepel az orszagadatok táblában?*/

select count(distinct foldrajzi_hely),count(distinct foldresz) from orsz;

/*Számítások részcsoportra. 
Korlátozzuk a számításban résztvevõ rekordok számát.*/

/*6. Hány európai rekord szerepel az orszagadatok táblában? 
Ez hány ország adata? Hány országnak van megadva 
az autójele és ez hány különbözõ autójelet jelent?*/

select 
 count(*) sorok_száma
,count(orszag) országok_száma
,count(autojel) autojelek_száma
,count(distinct autojel) unique_autojelek_száma 
,count(distinct foldrajzi_hely) földrajzi_helyek_száma
from orsz
where foldresz='Európa';

/*7. Hány országban használnak dollárt?*/

select count(*) dollárt_használók
from orsz
where penznem='dollár';

/*8.	Földrészenként hány ország van a táblában?*/

select foldresz, count(*) országok_száma
from orsz
group by foldresz;

/*9.	Földrajzi helyenként hány ország van a táblában?*/

select foldrajzi_hely, count(*) országok_száma
from orsz
group by foldrajzi_hely;

/*10.	Földrészenként és földrajzi helyenként 
hány ország van a táblában?*/

select foldresz,foldrajzi_hely, count(*) országok_száma
from orsz
group by foldresz,foldrajzi_hely
order by 1,2;

/*11.	Földrészenként hány országban használnak dollárt?*/

select foldresz, count(*) dollárt_használók
from orsz
where penznem='dollár'
group by foldresz;

/*12. Listázzuk ki azokat a földrajzi helyeket (a földrészeket is megadva), amelyek több mint 4 országból állnak!*/

select foldresz,foldrajzi_hely, count(*) országok_száma
from orsz
group by foldresz,foldrajzi_hely
having count(*)>4
order by 1,2;

/*13.	Mekkora a legkisebb átlagországméret kontinensenként?*/

select foldresz, round(avg(terulet),2) átlagterület
from orsz
group by foldresz
order by átlagterület desc;

select min(round(avg(terulet),2)) legkisebb_átlagterület
from orsz
group by foldresz;

/*Csoportfüggvények összekapcsolt táblákból*/

/*14. Kérdezzük le a dvd kölcsönzõ azon ügyfeleit, akik több mint 5-ször 
kölcsönöztek már ki filmet.
Mindegyik különbözõ film volt?*/

select kid,nev, count(*) kölcsönzés_szám, count(distinct film) film_szám, count(*)-count(distinct film) különbség
from mszemely s join mkolcsonzes k
on s.kid=k.kolcsonzo
group by kid,nev
having count(*)>5;

/*15. Listázzuk ki csak azokat, akiknél volt filmismétlõdés*/

select kid,nev, count(*) kölcsönzés_szám, count(distinct film) film_szám, count(*)-count(distinct film) különbség
from mszemely s join mkolcsonzes k
on s.kid=k.kolcsonzo
group by kid,nev
having count(*)-count(distinct film)>0;

/*16. Átlagosan hány évesek az egyes ügyfeleink által kikölcsönzött filmek. Számoljunk elõször a hiányzó évszámok kihagyásával,
aztán úgy, hogy feltétellezük, hogy azok 1960-ban készültek. Csak azokat írassuk ki, ahol az eredmény eltér.*/

select kid,nev,count(*) db
,round(avg(extract(year from sysdate)-ev),2) átlagkor
,round(avg(extract(year from sysdate)-nvl(ev,1960)),2) átlagkor2
from mszemely s join mkolcsonzes k on s.kid=k.kolcsonzo
join mdvd using(film)
group by kid, nev
having avg(extract(year from sysdate)-ev)<>avg(extract(year from sysdate)-nvl(ev,1960));

/*17. Listázzuk ki, hogy hány filmet kölcsönöztek ki a nõi 
ügyfeleink. Akik még nem kölcsönöztek, azoknál 0 szerepeljen! Csak azokat írjuk ki, akik 5-nél kevesebb filmet vettek eddig ki!*/

select kid,nev, count(film) kolcsonzesek
from mszemely s left join mkolcsonzes k
on kid=kolcsonzo
where nem='N'
group by kid,nev
having count(film)<5
order by kolcsonzesek desc;

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

/*2.	Listázzuk ki, hogy szálláshelyenként hány szoba 
és hány férõhely szerepel az adatbázisunkban! Írjuk ki a 
szállás nevét és címét is!*/

/*3.	Listázzuk ki azokat az ügyfelelinket, akik foglaltak 
már le klímás szobát! Hány alkalommal történt ez meg?*/

/*4.	Ügyfeleink összesen hányszor foglaltak nálunk 
szállást? Csak azokat listázzuk ki, akik maximum 2-szer!*/

/*5.	Ügyfeleink összesen hány éjszakára foglaltak nálunk 
szállást? Csak azokat írjuk ki, akiknél legalább 40 napot 
számolunk!*/

/*6.	Mennyi a legtöbb nap, amit valaki a szállásainkon 
foglalt?*/

/**************************/

/*7.	Listázzuk ki, hogy összesen hány hallgató szerepel 
az adatbázisunkban!*/

/*8.	Listázzuk ki az egyetemi adatbázisunkból a hallgatókat 
és hogy hány tárgyat vettek fel a 2015/16-os tanév második félévében! Jelenítsük meg a hallgatók nevét és szakját is!*/

/*9.	Listázzuk ki, hogy hány pénzügy szakos hallgató 
vette fel az adatbázisban szereplõ választható tárgyakat!*/

/*10.	Szakonként és félévenként számoljuk ki az eredmények 
átlagát!*/

/*11.	Mennyi ezeknek az átlagoknak a maximuma illetve 
minimuma?*/

/*12.	Listázzuk ki azokat a kötelezõ tárgyainkat, 
amit 20-nál kevesebben vettek fel! Azok is jelenjenek 
meg, amelyeket egy hallgató sem vett fel!*/

/********************/

/*13. Listázzuk ki, hogy átlagosan mekkora a készletünk 
a termékeinkbõl!*/

/*14. Listázzuk ki, hogy havonta mekkora volt a rendelések 
összértéke a webshopunkban!*/

/*15.	Listázzuk ki azokat az ügyfeleinket, akik rendeltek 
már nálunk kabátot! Fejenként összesen hány darabot?*/

/*16.	Listázzuk ki, hogy a termékeinkbõl összesen mekkora 
összegben rendeltek! Csak azokat jelenítsük meg, ahol az összeg 
1000 Ft-nál kevesebb. Amibõl még nem rendeltek, azok is jelenjenek meg!*/

/*17.	Számoljuk ki, hogy termékkategóriánként mekkora volt a bevételünk! 
Mennyi ezeknek a bevételeknek az átlaga?*/

