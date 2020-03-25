--1.-----------------------------------------------------------------------------------------
--Hozzunk létre egy egyszerű táblát 2 oszloppal: alkalmazott(nev,szulev)

/*
Ahhoz, hogy egy táblát létrehozzunk, meg kell adnunk a tábla nevét, az oszlop(ok)
nevét és az adattípus(oka)t
*/

create table alkalmazott(
nev VARCHAR2(40),
szulev NUMBER(4)
);

/*
A Connections ablakban, ha a Tables-re ráfrissítünk, 
akkor látni fogjuk az ALKALMAZOTT táblánkat. Ajánlott
az apply filter használata, így rákereshetünk a saját 
táblánkra és megnézhetjük a füleken az egyes tulajdonságait.

Columns: oszlop(ok) neve és az adattípus, illetve, 
			hogy meg lehet-e adni NULL-t értékként (NULLABLE)
Data: táblában szereplő adatok, illetve itt lehet új adatot bevinni
Constraints: táblára definiált kényszerek listája (primary key, unique, check)
Indexes: táblára definiált indexek listája
SQL: tábla újbóli legenerálásához alkalmas SQL (olyan 
			dolgokat is tartalmaz, amit nem mi, hanem a rendszer 
			automatikusan adott hozzá)

A táblánkba be tudjuk magunkat vinni kétszer, illetve NULL-t is.
Az alábbi adatok mind beilleszthetőek a Data fül alatt a zöld plusz gombbal:
andras 1992
andras 1992
andras NULL
NULL   1992
NULL	NULL
andor  1993		

Submittálni kell (zöld pipa)
*/


select rowid from alkalmazott;

/*
Az adatbázis minden sora egyértelműan azonsítható ennek ellenére,
mert a rendszer hozzátesz egy rowid nevű azonosítót automatikusan,
mely alapján minden sor megkereshető.
*/

--ROWID segítségével a sort törölhetjük is
delete from alkalmazott where rowid = 'AAAYfnAACAAABW0AAA';

--tábla törlése, a purge azért kell, hogy teljesen törlésre kerüljön
--a tábla, ne csak a lomtárba kerüljön
drop table arfolyam purge;

--1.-----------------------------------------------------------------------------------------

--2.-----------------------------------------------------------------------------------------
/*
Hozzuk létre az alkalmazott táblát újra, de most állítsuk be, 
hogy a név legyen elsődleges kulcs.
*/

create table alkalmazott(
nev VARCHAR2(40) /*constraint pk elhagyható*/ primary key, --oszlopkényszer
szulev NUMBER(4)
);

/*Ha oszlopkényszernek szeretnénk nevet adni, akkor 
ugyanúgy ki kell írni elé a CONSTRAINT kulcsszót és a 
kényszer nevét.
*/

/*
Mi más, mint korábban volt?
- columns fülön a NULLABLE tulajdonság a NEV-nél No, a többinél maradt Yes
- constraints fülön lett egy Primary Key típusú kényszerünk, a nevet a rendszer automatikusan adta
- indexes fülön lett egy ugyanolyan nevű UNIQUE indexünk

A korábbi példák közül (ha minden egyes sor hozzáadása után submittálunk:
 
andras 1992 továbbra is felvehető
andras 1992 nem vehető fel (andras nevu már létezik)
andras NULL nem vehető fel (andras nevu már létezik)
NULL   1992 nem vehető fel (nev nem lehet NULL)
NULL   NULL nem vehető fel (nev nem lehet NULL)
andor  1993 továbbra is felvehető
*/


drop table arfolyam purge;

--2.-----------------------------------------------------------------------------------------

--3.-----------------------------------------------------------------------------------------
/*
Hozzuk létre az alkalmazott táblát újra de most állítsuk be, 
hogy a név és a születési év együtt legyen elsődleges kulcs.
*/

CREATE TABLE alkalmazott(
nev VARCHAR2(40) PRIMARY KEY --NEM JÓ!!!!
,szulev NUMBER(4) PRIMARY KEY --NEM JÓ!!!!
);

/*
Nem jó, ha mindkettő mellé odaírjuk, hogy Primary Key, 
mert az azt jelentené, hogy két elsődleges kulcsot akarunk 
létrehozni. Ez hibaüzenet mellett nem is fog létrejönni.
*/

CREATE TABLE alkalmazott(
nev VARCHAR2(40)
,szulev NUMBER(4)
,CONSTRAINT pk_nev_szulev PRIMARY KEY (nev,szulev) --táblakényszer
);

/*
Két oszlopból álló elsődleges kulcs – nem oszlopkényszer, 
hanem táblázat kényszer, csak az oszlopok megadása után 
tudjuk megadni. Itt kötelező neki nevet adni. 
Ha oszlopkényszernek szeretnénk nevet adni, akkor 
ugyanúgy ki kell írni elé a CONSTRAINT kulcsszót és a 
kényszer nevét.
*/

drop table arfolyam purge;

--3.-----------------------------------------------------------------------------------------

--4.-----------------------------------------------------------------------------------------
/*	
Hozzuk létre az alkalmazott táblát újra, de most legyen egy azonosítónk is, 
és az azonosító és a név+születési év is kulcs legyen.
az azonosító neve AID legyen, 3 jegyű szám.
*/

CREATE TABLE alkalmazott(
aid NUMBER(3) PRIMARY KEY
,nev VARCHAR2(40)
,szulev NUMBER(4)
,CONSTRAINT key_nev_szulev PRIMARY KEY (nev,szulev) --nem jó!
);

/*
Akkor mi a megoldás? A kulcs azt jelenti, hogy unique és not null, úgyhogy ezt a kettőt adjuk meg együtt
*/


CREATE TABLE alkalmazott(
aid NUMBER(3) PRIMARY KEY
,nev VARCHAR2(40) NOT NULL
,szulev NUMBER(4) NOT NULL
,CONSTRAINT key_nev_szulev UNIQUE (nev,szulev)
);

--4.-----------------------------------------------------------------------------------------

--5.-----------------------------------------------------------------------------------------
/*	
Önállóan: Dobjuk el újra a táblát, és hozzuk létre újra úgy, 
hogy a SZULEV oszlopra adunk CHECK feltételt, 
hogy 1900 és 2000 közötti számokat fogadunk csak el. 
*/


drop table arfolyam purge;
/*
check: lehet szűkíteni az adattípuson belül az értéktartományt. Lehet 
oszlop és tábla kényszer is. Tábla kényszer is vonatkozhat egyetlen oszlopra, 
de lehet több oszlopra együttesen vonatkozó feltétel is: pl. egyik oszlop nagyobb,
mint a másik
*/

create table alkalmazott(
aid NUMBER(3)  primary key,
nev VARCHAR2(40) NOT NULL,
szulev NUMBER(4)  NOT NULL CHECK(szulev between 1900 and 2000), --több kényszer megadható egymásután adott oszlopra
CONSTRAINT key_nev_szulev UNIQUE(nev, szulev)
);

--5.-----------------------------------------------------------------------------------------

--6.-----------------------------------------------------------------------------------------
/*
Importáljunk adatokat az utoljára létrehozott táblánkba. (alkalmazott.csv)

Gyakhoz tartozó ppt-ben részletesen le van írva és illusztrálva
*/
--6.-----------------------------------------------------------------------------------------

--7.-----------------------------------------------------------------------------------------
/*
Önállóan: Hozzunk létre egy táblát ÁRFOLYAM néven. 
A táblának 3 oszlopa legyen. 
Egy dátum, ez legyen kulcs, egy JPY oszlop a japán jen árfolyamának tárolására, 
egy jegyû számot lehessen benne tárolni 4 tizedesjeggyel, feltételnek állítsuk be, 
hogy 0 és 5 között legyen és egy másik USD oszlop az amerikai dollár árfolyamának 
tárolására. 3 jegyû számot lehessen tárolni 2 tizedesjeggyel és állítsuk be, 
hogy 100 és 400 közötti számokat fogadjon csak el.
*/

create table arfolyam(
datum date primary key,
JPY NUMBER(5,4) CHECK (JPY between 0 AND 5),  --NUMBER(5 (1 számjegy + 4 tizedesjegy), 4 (4 tizedesjegy))
USD NUMBER(5,2) CHECK (USD between 100 AND 400) --NUMBER(5 (3 számjegy + 2 tizedesjegy), 2 (2 tizedesjegy))
);

--7.-----------------------------------------------------------------------------------------

--8.-----------------------------------------------------------------------------------------
/* 
Ha kész a tábla, importáljuk az arfolyam.csv fájl adatai közül csak a szükségeseket. 
A táblázatban minden hónap elsõ napján rögzítettük az árfolyamokat. A dátumokat így értelmezzük!
Az importáláshoz a scriptet hozzuk létre, majd azt futtassuk!

Gyakhoz tartozó ppt-ben részletesen le van írva és illusztrálva

--8.-----------------------------------------------------------------------------------------

--9.-----------------------------------------------------------------------------------------
/*
Önállóan: Hozzunk létre egy táblát RENDELÉS néven. A tábla oszlopai: 
sorszám (max. 6 jegyû egész szám), dátum (idõbélyeg), alapértelmezetten a 
rendszer órájából vegye az értéket, vevõ (40 karakteres szöveg), 
fizetendõ összeg (max 6 jegyû egész szám). 
A táblában a sorszám és a dátum is legyen kulcs. 
Vigyünk be kézileg 2-3 adatot a táblázatba.
*/


create table rendeles(
sorszam NUMBER(6),
datum timestamp default sysdate, --default, ha nem adsz meg külön értéket, akkor a rendszeridőt fogja betenni, így sosem lesz NULL
vevo VARCHAR(40),
fizetendo_osszeg NUMBER(6),
CONSTRAINT kulcs primary key(sorszam,datum)
);

-- kézi adatbevitel a táblát megkeresve a Tables rész alatt lehetséges a Connections ablak alatt. Beilleszteni a Data fül alatt a zöld plusz gombbal lehet, majd submittálni kell.

--9.-----------------------------------------------------------------------------------------