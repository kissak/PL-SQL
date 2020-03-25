--1.	Hozzunk létre egy egyszerû táblát 2 oszloppal: alkalmazott(nev,szulev)

CREATE TABLE alkalmazott(
nev VARCHAR2(40)
,szulev NUMBER(4)
);

DROP TABLE alkalmazott PURGE; 

/*2.	Hozzuk létre az alkalmazott táblát újra, de most állítsuk be, 
hogy a név legyen elsõdleges kulcs.*/

CREATE TABLE alkalmazott(
nev VARCHAR2(40) PRIMARY KEY
,szulev NUMBER(4)
);

DROP TABLE alkalmazott PURGE; 

/* 3.	Hozzuk létre az alkalmazott táblát újra de most állítsuk be, 
hogy a név és a születési év együtt legyen elsõdleges kulcs.*/

CREATE TABLE alkalmazott(
nev VARCHAR2(40) PRIMARY KEY --NEM JÓ!!!!
,szulev NUMBER(4) PRIMARY KEY --NEM JÓ!!!!
);

CREATE TABLE alkalmazott(
nev VARCHAR2(40)
,szulev NUMBER(4)
,CONSTRAINT pk_nev_szulev PRIMARY KEY (nev,szulev)
);

DROP TABLE alkalmazott PURGE;

/*4.	Hozzuk létre az alkalmazott táblát újra, de most legyen egy azonosítónk is, 
és az azonosító és a név+születési év is kulcs legyen.
az azonosító neve AID legyen, 3 jegyû szám.
*/

CREATE TABLE alkalmazott(
aid NUMBER(3) PRIMARY KEY
,nev VARCHAR2(40) NOT NULL
,szulev NUMBER(4) NOT NULL
,CONSTRAINT key_nev_szulev UNIQUE (nev,szulev)
);


/*5.	Önállóan: Dobjuk el újra a táblát, és hozzuk létre újra úgy, 
hogy a SZULEV oszlopra adunk CHECK feltételt, 
hogy 1900 és 2000 közötti számokat fogadunk csak el. */



/*6.	Importáljunk adatokat az utoljára létrehozott táblánkba. (alkalmazott.csv)*/


/*7.	Önállóan: Hozzunk létre egy táblát ÁRFOLYAM néven. 
A táblának 3 oszlopa legyen. 
Egy dátum, ez legyen kulcs, egy JPY oszlop a japán jen árfolyamának tárolására, 
egy jegyû számot lehessen benne tárolni 4 tizedesjeggyel, feltételnek állítsuk be, 
hogy 0 és 5 között legyen és egy másik USD oszlop az amerikai dollár árfolyamának 
tárolására. 3 jegyû számot lehessen tárolni 2 tizedesjeggyel és állítsuk be, 
hogy 100 és 400 közötti számokat fogadjon csak el.*/

/*8. Ha kész a tábla, importáljuk az arfolyam.csv fájl adatai közül csak a szükségeseket. 
A táblázatban minden hónap elsõ napján rögzítettük az árfolyamokat. A dátumokat így értelmezzük!
Az importáláshoz a scriptet hozzuk létre, majd azt futtassuk!*/

/*9.	Önállóan: Hozzunk létre egy táblát RENDELÉS néven. A tábla oszlopai: 
sorszám (max. 6 jegyû egész szám), dátum (idõbélyeg), alapértelmezetten a 
rendszer órájából vegye az értéket, vevõ (40 karakteres szöveg), 
fizetendõ összeg (max 6 jegyû egész szám). 
A táblában a sorszám és a dátum is legyen kulcs. 
Vigyünk be kézileg 2-3 adatot a táblázatba.*/
