/*1. Kérdezzük le a dolgozók számát az mdolgozo táblából!*/
--csoportfüggvény - 1 rekord
SELECT count(*) AS fõ FROM mdolgozo;

--analitikus függvény - összes rekord, mivel nincs mûveleti tér,
--az egész tábla egyetlen partíció, az eredmény ugyanaz

SELECT count(*) OVER () AS fõ
FROM mdolgozo;

--ismétlõdés eltávolítása
SELECT DISTINCT count(*) over() AS fõ
FROM dolgozo;

/*2. Kérdezzük le, hogy az egyes keresztnevek 
hányszor fordulnak elõ az mdolgozo táblában!*/

-- csoportfüggvény mûködése, az eredmény 51 rekord
SELECT knev, count(*) AS knev_elofordulas
FROM mdolgozo
GROUP BY knev
ORDER BY 1;

-- analitikus függvény mûködése, az eredmény 62 rekord
SELECT knev, COUNT(*) OVER (PARTITION BY knev) AS knev_elofordulas
FROM mdolgozo
ORDER BY 1;

-- az ismétlõdõ sorok szûrésével, 51 rekord
SELECT DISTINCT knev AS keresztnev, 
count(*) OVER (PARTITION BY knev) AS knev_elofordulas
FROM mdolgozo 
ORDER BY 1;

/*3. Kérdezzük le az mdolgozo tábla adatait, írjuk ki azt is, 
hogy hány dolgozónak azonos a keresztneve!*/

-- analitikus függvénnyel
SELECT mdolgozo.*, 
COUNT(*) OVER (PARTITION BY knev) AS knev_elofordulas
FROM mdolgozo
ORDER BY 1;

-- aggregáló függvénnyel lényegesen bonyolultabb
SELECT id,vnev,knev,szuldat,nem,felv_nap,knev_elofordulas FROM
mdolgozo JOIN
(SELECT knev, count(*) AS knev_elofordulas
FROM mdolgozo
GROUP BY knev) 
USING(knev)
ORDER BY 1;

--egy eddig ismeretlen aggregáló függvény a csoportban szereplõ egyedek
--kiírására: LISTAGG, de így is csak 51 rekord
SELECT 
listagg(vnev,';') WITHIN GROUP (ORDER BY ID) AS vnev
, knev
, count(*) AS knev_elofordulas
FROM mdolgozo
GROUP BY knev
ORDER BY 1;

-- több adatot összefûzéssel tudnánk kiírni, de így is csak 51 rekord
SELECT 
listagg('ID:'||to_char(ID,'00')||' Név: '||vnev||' '||knev
||' Szüldat: '||to_char(szuldat,'yyyy.mm.dd')
||' Nem: '||nem
||' Felvnap: '||to_char(felv_nap,'yyyy.mm.dd'),';') 
WITHIN GROUP (ORDER BY ID) AS dolgozo_adatok
, count(*) AS knev_elofordulas
FROM mdolgozo
GROUP BY knev
ORDER BY 1;

/*4. Kérdezzük le a dolgozók adatait és mindenki mellé 
írjuk ki az életkorát a felvételkor,
és az elõtte felvett 5 dolgozó életkorának átlagát!*/

--átlagok nélkül
SELECT mdolgozo.*, 
round(months_between(felv_nap,szuldat)/12,1) AS kor
FROM mdolgozo
ORDER BY felv_nap;

--elõzõ 5 átlagával
SELECT mdolgozo.*
,round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING),1) as elozo_5
FROM mdolgozo
ORDER BY felv_nap;

--bármilyen sorrendben kiírhatom, eltérhet a két sorbarendezés:
SELECT mdolgozo.*, round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING),1) as elozo_5
FROM mdolgozo
ORDER BY ID;

/*5. Az elõzõ megoldás módosításával kérdezzük le 
a dolgozók adatait és mindenki mellé írjuk ki 
az életkorát a felvételkor,
és a legutóbb felvett 5 dolgozó életkorának átlagát 
(beleszámítva az éppen most felvettet is)!*/

SELECT mdolgozo.*, round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 4 PRECEDING AND 0 PRECEDING),1) as utolso_5
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 4 PRECEDING AND CURRENT ROW),1) AS utolso_5_ugyanaz
FROM mdolgozo
ORDER BY felv_nap;

/*6. Az elõzõ feladatot kiegészítve kérdezzük le 
az utóbbi egy évben 
felvett dolgozók életkorának átlagát*/

SELECT mdolgozo.*, round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap ROWS BETWEEN 4 PRECEDING AND CURRENT ROW),1) AS utolso_5
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap RANGE BETWEEN 365 PRECEDING AND CURRENT ROW),1) AS egy_even_belul
FROM mdolgozo
ORDER BY felv_nap;

/*7. Kérdezzük le a cég dolgozóinak átlagéletkorát azokon a napokon, amikor 
új dolgozó került a céghez (tételezzük fel, hogy senki nem távozott menet
közben a cégtõl)!*/

SELECT mdolgozo.*
,round(months_between(felv_nap,szuldat)/12,1) AS kor
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap rows BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW),1) AS ez_nem_jo
,round(avg(months_between(felv_nap,szuldat)/12) 
OVER (ORDER BY felv_nap RANGE BETWEEN unbounded PRECEDING AND CURRENT ROW),1) AS halmozott_atlagkor
FROM mdolgozo
ORDER BY felv_nap;
--eltérés a 19. sorban van, az egy napon felvett két dolgozó miatt

/*8. Kérdezzük le a dolgozók életkor szerinti ragnsorát!*/
SELECT mdolgozo.*, rank() OVER (ORDER BY szuldat) AS rangsor,
DENSE_RANK() OVER (ORDER BY szuldat) AS suru_rangsor
FROM mdolgozo
ORDER BY szuldat;
--eltérés a 7. sorban van, az egyenlõség utáni sorszám kiosztásában

/*9. Kérdezzük le a nemenkénti rangsort is!*/
SELECT mdolgozo.*, rank() OVER (PARTITION BY nem ORDER BY szuldat) AS rangsor,
DENSE_RANK() OVER (PARTITION BY nem ORDER BY szuldat) AS suru_rangsor
FROM mdolgozo
order by rangsor;
--ORDER BY nem,szuldat
;

/*10. Írjuk ki a 10 legidõsebb dolgozó adatait!*/

SELECT mdolgozo.*, rank() OVER (ORDER BY szuldat) AS rangsor
FROM mdolgozo;

select * from
(SELECT mdolgozo.*, rank() OVER (ORDER BY szuldat) AS rangsor
FROM mdolgozo)
where rangsor<=10;

/*11. Kérdezzük le, hogy az egyes dolgozók felvétele 
elõtt utoljára férfit vagy nõt vettünk-e fel!*/

select mdolgozo.*
, lag(nem,1) over (order by felv_nap) AS ELOZO_nem
from mdolgozo
order by felv_nap;

select mdolgozo.*
, lag(decode(nem,0,'Férfi','Nõ'),1) over (order by felv_nap) AS ELOZO_nem
from mdolgozo
order by felv_nap;

/*12. Kérdezzük le azokat a dolgozókat, akik felvételekor 
az elõzõ két felvett dolgozó is férfi volt!*/

select * from
(select mdolgozo.*
, lag(nem,1) over (order by felv_nap) AS nem_elozo1
, lag(nem,2) over (order by felv_nap) AS nem_elozo2
from mdolgozo)
where nem_elozo1=0 and nem_elozo2=0
order by felv_nap;

select * from
(select mdolgozo.*
, lag(nem,1) over (order by felv_nap) AS nem_elozo1
, lag(nem,2) over (order by felv_nap) AS nem_elozo2
, rank() over (order by felv_nap) as sorrend
from mdolgozo)
where nem_elozo1=0 and nem_elozo2=0
order by felv_nap;

/*13. Kor alapján osszuk a dolgozókat 4 azonos tagszámú csoportba, 
kérdezzük le, hogy ki hányadik csoportba került!*/

select mdolgozo.*, ntile(4) over (order by szuldat) as csoport
from mdolgozo;

/*14. Az elõzõ feladatban hányan kerültek az egyes csoportokba?*/
select csoport,count(*)
from
(select ntile(4) over (order by szuldat) as csoport
from mdolgozo)
group by csoport;

/*15. Kérdezzük le a dolgozók közül a legfiatalabb egy negyedet!*/
select * from
(select mdolgozo.*, ntile(4) over (order by szuldat) as csoport
from mdolgozo)
where csoport=4
;

/*16. Kérdezzük le a dolgozók koreloszlását, osszuk õket a koruk alapján 4
csoportra! A 20 év alattiak és a 60 év felettiek legyenek a maradék!*/

select mdolgozo.*
,width_bucket(round(months_between(sysdate,szuldat)/12,1),20,60,4)
as csoport
from mdolgozo
order by csoport;

/*17. Az elõzõ lekérdezésbõl kiindulva számítsuk ki, hogy hány dolgozó került
az egyes csoportokba!*/

select 
width_bucket(round(months_between(sysdate,szuldat)/12,1),20,60,4)
as csoport
,count(*)
from mdolgozo
group by width_bucket(round(months_between(sysdate,szuldat)/12,1),20,60,4)
order by csoport;

/*******************/
/*Önálló feladatok:*/
/*******************/

/*1. Kérdezzük le az mkolcsonzes táblából az összes kölcsönzést 
és azt is, hogy az adott fimet hányszor kölcsönözték ki, illetve 
összesen hány napra*/

/*2. Kérdezzük le az mkolcsonzes táblából az összes kölcsönzést
és azt, hogy az adott kölcsönzõ átlagosan hány napra szokott
kölcsönözni. Egy külön oszlopba írjuk ki, hogy "átlagosnál hosszabb",
ha az adott kölcsönzõ átlagánál hosszabb idõre kölcsönözte ki 
az adott filmet!*/

/*3. Listázzuk ki az mkolcsonzes tábla teljes tartalmát sorszám szerinti
sorrendben és számítsunk a napok számából mozgó átlagot. A mozgóátlagot
a megelõzõ 4 kölcsönzésbõl és az aktuális kölcsönzésbõl számítsuk!*/

/*4. Az mkolcsonzes táblából számítsuk ki a halmozott napszámot 
kölcsönzõnként sorszám szerinti sorrendben!*/

/*5. Írjuk ki az mdvd táblából a 10 legmagasabb pontszámú filmet! 
(Vigyázzanak a null értékekkel!)*/

/*6. Írjuk ki a kölcsönzõk nevét és hogy hány alkalommal kölcsönöztek
ki filmet. Számoljuk ki, hogy mennyi a kölcsönzések átlag száma nemenként
és írjuk a kölcsönzõk mellé, hogy õk a nemük átlagához képest mennyivel 
többször vagy kevesebbszer kölcsönöztek ki filmet.*/

/*7. Volt-e olyan eset, amikor kétszre egymás után ugyanazt a filmet vitték
ki! Listázzuk ki a két egymás utáni kölcsönzés sorszámát és a film címét!*/

/*8. Volt-e olyan eset, amikor egy kölcsönzõ kétszer egymás után
ugyanazt a filmet vitte ki? Ki és melyik filmet vitte ki egymás után kétszer?*/

/*9. Osszuk a filmeket a keletkezés éve alapján 10 egyenlõ csoportra!*/

/*10. Írassuk ki a legrégebbi 10%-ba tartozó filmek adatait!*/

/*11. Készítsünk hisztogramot a filmekrõl a keletkezés éve alapján! 
1930 és 2000 között tizes osztályközzel! Azt írjuk ki, hogy az egyes
csoportokba hány film került!*/

