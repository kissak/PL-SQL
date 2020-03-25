/*1. Kérdezzük le az Oracle-ben tárolható legkisebb és legnagyobb dátumot!*/
SELECT 
to_char(to_date(1,'J'),'BC YYYY.MM.DD') elsõ_nap
,to_char(to_date(5373484,'J'),'BC YYYY.MM.DD') utolsó_nap
FROM dual;

/*2. Kérdezzük le, hogy milyen nap van ma, mi volt tegnap és mi lesz holnap!*/
SELECT
to_char(sysdate,'day') ma
,to_char(SYSDATE -1,'day') tegnap
,to_char(sysdate +1,'day') holnap
FROM DUAL;

/*3. Kérdezzük le, hogy az aktuális hónap utolsó napja milyen napra esik.*/
select to_char(last_day(sysdate),'day') UTOLSÓ from dual;

/*4. Kérdezzük le kétféleképpen, hogy mi volt a dátum 4 évvel ezelõtt 
(a közbeesõ szökõév figyelembe vételével és anélkül).*/

SELECT TO_CHAR(ADD_MONTHS(SYSDATE, -4*12 ),'YYYY.MM.DD') AS lássuk,
	TO_CHAR(SYSDATE -4*365,'YYYY.MM.DD') AS más_e FROM DUAL;

/*5. Kérdezzük le a MINTA.IRODALOM táblából az írók nevét, 
születési és halálozási dátumát (teljesen kiírva) és kétféleképpen azt, 
hogy hány évet éltek. Az évek számát 3 tizedesre kerekítve írjuk ki. */

SELECT * FROM minta.irodalom;
SELECT név, to_char(születési_idõ,'yyyy.mm.dd') születés
, to_char(halál_ideje,'yyyy.mm.dd') halál
,round((halál_ideje-születési_idõ)/365.25,3) kor1
,round(months_between(halál_ideje,születési_idõ)/12,3) kor2 
from minta.irodalom;

/*6. Nézzük meg a mintapéldákat és fejtsük meg õket!*/

SELECT 'Jeanne d''Arc' AS Orleans_i_szuz 
FROM DUAL; -- Mi történne, ha csak egy aposztróf lenne a d után?


SELECT to_char(SYSDATE,'YYYY.MM.DD') Ma
, 'Ez az év ' || TO_CHAR(SYSDATE,'DDD') || '. napja.' Nap
,	'Ez az év ' || TO_CHAR(SYSDATE,'IW') || '. hete.'  Hét
,	'Ez az év ' || TO_CHAR(SYSDATE,'Q') || '. negyedéve.' Negyedév
FROM DUAL;

SELECT CONCAT( 'Ez is', ' egy megoldás') összefûz2
FROM DUAL;

SELECT CONCAT( 'És',' vajon',' ez is?') összefûz3
FROM DUAL;

select 
 'kis NAGY' eredeti
,lower('kis NAGY') kicsi 
,upper('kis NAGY') nagy
,initcap('kis NAGY') szókezdõ
from dual;

select 
 'tökösmákosrétes' eredeti
,substr('tökösmákosrétes',1,5) eleje
,substr('tökösmákosrétes',6,5) közepe
,substr('tökösmákosrétes',-5,5) vége
from dual;

SELECT 
 '    levágva        ' eredeti
,trim('    levágva        ') AS megmi
FROM dual;


SELECT 
 '----levágva-------' eredeti
,trim('----levágva-------') AS megmi
,trim(both '-' from '----levágva-------') AS megmi2
FROM dual;


/*7. Fejtsük meg az alábbi lekérdezéseket. Mi történik, 
ha a WHERE feltétel konstans kifejezést tartalmaz?*/

SELECT 'Lefutott' AS megmi FROM DUAL 
WHERE 'Okostojás' LIKE '%kos%';

SELECT 'Lefutott' AS megmi FROM DUAL 
WHERE 'Okostojás' NOT LIKE '%kos%';

SELECT 'Lefutott' AS megmi FROM DUAL
WHERE 'Okostojás' LIKE 'okos%';

SELECT 'Lefutott' AS megmi FROM DUAL
WHERE 'Okostojás' LIKE '_kos%';

SELECT 'Lefutott' AS megmi FROM DUAL
WHERE lower('Okostojás') LIKE 'okos%';

/*8. Kérdezzük le a minta séma dolgozo táblájából azokat, akiknek 
a nevébõl kiderül, hogy feleségek! Rendezzük névsorba!*/

SELECT id, vnev, knev FROM minta.dolgozo
WHERE vnev LIKE '%né'
or knev like '%né'
order by 2,3;

/*vajon így is jó?*/
SELECT id, vnev, knev FROM minta.dolgozo
WHERE vnev LIKE '%NÉ'
or knev like '%NÉ'
order by 2,3;

/*ha biztosra szeretnénk menni:*/

SELECT id, vnev, knev FROM minta.dolgozo
WHERE lower(vnev) LIKE '%né'
or lower(knev) like '%né'
order by 2,3;

/*9. Kérdezzük le ugyanazt, mint az elõbb, 
de egységes írásmóddal irassuk ki a neveket! Rendezzük névsorba!*/

SELECT id
,initcap(vnev) vnev
,initcap(knev) knev FROM minta.dolgozo
WHERE lower(vnev) LIKE '%né'
or lower(knev) like '%né'
order by 2,3;

/*10. Kérdezzük le a minta séma dolgozo 
táblájából az A és Á kezdõbetûs keresztnevû dolgozókat! */

select id, vnev, knev
from minta.dolgozo
where upper(knev) like 'A%'
or upper(knev) like 'Á%';

/*11. Kérdezzük le a minta séma dolgozo táblájából a Tiborokat!*/
select id, vnev, knev
from minta.dolgozo
where upper(knev) like 'TIBOR%'
;

--AJJAJ!

select id, vnev, knev
from minta.dolgozo
where upper(knev) = 'TIBOR';

/*12. Kérdezzük le a minta séma dolgozo táblájából a dolgozók nevét 
összefûzve és kiegészítve 20 karakterre _ karakterekkel!*/

select id, rpad(vnev||' '||knev,20,'_') név 
from minta.dolgozo
order by 1;

/******************/
/*ÖNÁLLÓ FELADATOK*/
/******************/

/*1.	Hozzuk létre az ORSZAGADATOK táblát a MINTA séma táblájának másolásával. 
A további feladatok egy része erre fog vonatkozni.*/

create table orszagadatok as 
select * from orszagadatok;
desc orszagadatok

/*2.	Írjuk ki az országok neveinek hosszát!*/

select orszag, length(orszag) from orszagadatok;

/*3.	Írjunk lekérdezést, amely az országok neveinek csak 
a kezdõbetûjét hagyja meg nagybetûnek, a többi kisbetûs legyen!*/

select initcap(orszag) from orszagadatok;

/*4.	Listázzuk ki a váltópénzek neveit – az ott lévõ számok nélkül!*/

select orszag, valtopenz from orszagadatok;
select orszag ország
, substr(valtopenz,instr(valtopenz,' ')+1,length(valtopenz)) váltópénz 
from orszagadatok;
/*a substr 3. paramétere lehet nagyobb szám, akkor a végéig írja ki. 
Ezért nem számolgattam, hogy pontosan hány karatert is kellene kiírni.*/

/*5.	Listázzuk ki az európai országokat! 
(LIKE operátor használatával!)*/

select orszag európai_országok, foldrajzi_hely
from orszagadatok
where lower(foldrajzi_hely) like '%európa%'
order by 2,1;

/*6.	Kérdezzük le az ALL_TABLES katalógustáblából 
azokat a kurzusrésztvevõket, akiknek van ÁRFOLYAM táblájuk 
(találjuk meg azokat is, akik az elsõ betût máshogy írták)! */

select DISTINCT OWNER from all_tables
where upper(owner) like 'GI17_%'
and upper(table_name) like '_RFOLYAM'
ORDER BY 1;

/*7.	Kérdezzük le a MINTA séma CÉGEK táblájából azokat a cégeket, 
ahol a cégnévben szerepel a a buda szórészlet!*/

desc minta.cegek
select * from
minta.cegek
where upper(szekhely) like '%BUDA%';

/*8.	Kérdezzük le a MINTA séma CÉGEK táblájából azokat 
a nem budapesti cégeket, akiknek a nevében szerepel a buda szórészlet!*/

select * from
minta.cegek
where upper(szekhely) like '%BUDA%'
and upper(szekhely)<>'BUDAPEST'; --rossz adatbevitel miatt nem a legjobb eredmény

select * from
minta.cegek
where upper(szekhely) like '%BUDA%'
and upper(szekhely) not like '%BUDAPEST%';

/*9.	Kérdezzük le a MINTA séma CÉGEK táblájából 
a részvénytársaságokat! 
Vigyázat, a Zrt-k és Nyrt-k kellenek, de azok a cégek ne 
kerüljenek bele a lekérdezésbe, amelyeknek a nevében 
véletlenül van benne az rt betûpáros!*/

select * from minta.cegek
where lower(cegnev) like '% rt%'
or lower(cegnev) like '% zrt%'
or lower(cegnev) like '% nyrt%';

/*10.	Kérdezzük le a MINTA séma CÉGEK táblájából azokat 
a cégeket, amelyeknek a nevében szerepel a magyar, vagy Hungary 
megjelölés és ebben az évezredben alapították õket!*/

select * from minta.cegek
where (lower(cegnev) like '%hungary%'
or lower(cegnev) like '%magyar%')
and alapitas>=to_date('2000','YYYY');
/*kell a feltételben a zárójelezés!*/

/*11.	Kérdezzük le a MINTA séma CÉGEK2 táblájából a cégek adatait 
és azt, hogy idén mikor lesz az üzleti év vége!*/

select cegnev, szekhely, cid, alapitas
,to_date(to_char(sysdate,'YYYY')||to_char(uzletiev_vege,'MMDD'),'YYYYMMDD') üzleti_év_vége
from minta.cegek2;

/*12.	Listázzuk ki a MINTA séma ALKALMAZOTT táblájából 
a neveket kötõjelek között úgy, 
hogy a keletkezõ szöveg hossza 32 karakter legyen, 
és pont középen van a név! 
Például: „Gipsz Jakab”-ból legyen: 
„----------Gipsz Jakab----------” (az idézõjelek nélkül)!*/

select rpad(lpad(nev,(32-length(nev))/2+length(nev),'-'),32,'-') Név
from minta.alkalmazott;

/*13. Kérdezzük le a MINTA séma IRODALOM táblájából
a neveket szétbontva vezeték és keresztnévre!*/

select név
,substr(név,1,instr(név,' ')-1) vezeték_név
,substr(név,instr(név,' ')+1,length(név)) kereszt_név
from minta.irodalom;

/*14.	Számoljuk ki helyesen az SQL segítségével, 
évtõl függetlenül azt az idõpontot, amikor az óraátállítást 
el kell végezni, óra pontossággal. (Március és október utolsó 
szombatján, 2h-kor, illetve 3h-kor kell átállítani az órát.*/

/*írok néhány lehetséges megoldsát, az évszámot tesztelés céljából
át lehet írni bármi másra.*/

select to_char(
last_day(to_date( '2017-03', 'YYYY-MM' ))
- to_char( to_date( '03.31', 'MM.DD' ), 'D' )
+ 1/12,
'YYYY. MON DD. HH24:MI:SS' ) as tavaszi_óraátállítás from dual;


SELECT to_char(NEXT_DAY(last_day(to_date( '2017-03', 'YYYY-MM' ))-7,'VASÁRNAP') + 2/24,
'YYYY. MON DD. HH24:MI:SS' ) as tavaszi_óraátállítás from dual;

SELECT to_char(next_day(add_months(trunc(sysdate,'yyyy'),3)-8,'VASÁRNAP') + 2/24, --ez az aktuális évre mûködik, de a sysdate helyére bármilyen dátum beírható
'YYYY. MON DD. HH24:MI:SS' ) as tavaszi_óraátállítás from dual;

/*a dolgozók születési évében az óraátállítás idõpontja:*/
SELECT id, vnev, knev, szuldat, to_char(next_day(add_months(trunc(szuldat,'yyyy'),3)-8,'VASÁRNAP') + 2/24,
'YYYY. MON DD. HH24:MI:SS' ) as tavaszi_óraátállítás from minta.dolgozo;


