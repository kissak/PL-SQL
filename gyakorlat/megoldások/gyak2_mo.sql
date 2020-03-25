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

DROP TABLE alkalmazott PURGE;

CREATE TABLE alkalmazott(
aid NUMBER(3) PRIMARY KEY
,nev VARCHAR2(40) NOT NULL
,szulev NUMBER(4) NOT NULL
,CONSTRAINT check_szulev CHECK (szulev BETWEEN 1900 AND 2000)
,CONSTRAINT key_nev_szulev UNIQUE (nev,szulev)
);

/*6.	Importáljunk adatokat az utoljára létrehozott táblánkba. (alkalmazott.csv)*/

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (1.0, 'Bana Árpádné', 1967/* május 2.*/);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (2.0, 'Szabó Lajosné', 1958.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (3.0, 'Pordán Gyöngyi', 1954.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (4.0, 'Szerdahelyi Adél', 1960.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (5.0, 'Rezes Andrásné', 1973.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (6.0, 'Babos Krisztina', 1967.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (7.0, 'Máriás Károly', 1951.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (8.0, 'Mikó Annamária', 1972.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (9.0, 'Solymosi Andrásné', 1967.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (10.0, 'Várhegyi Krisztina', 1964.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (11.0, 'Kovácsné Brigitta', 1978.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (12.0, 'Papp Kázmér', 1972.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (13.0, 'Teleki Annamária', 1968.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (14.0, 'Kovács Adél', 1986.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (15.0, 'Papp Kornélia', 1966.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (16.0, 'Vojevogyina Alíz', 1952.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (17.0, 'Tóth Ferenc', 1954.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (18.0, 'Szoó Ágota', 1979.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (19.0, 'Karajos Alexa', 1965.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (20.0, 'Várkonyi Miklósné', 1977.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (21.0, 'Fodor Emília', 1978.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (22.0, 'Papcsák Adonisz', 1974.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (23.0, 'Mester Tiborné', 1953.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (24.0, 'Vidák Áron', 1991.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (25.0, 'Szendi Tamás', 1947.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (26.0, 'Mizi Krisztina', 1970.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (27.0, 'Szerdahelyi Kriszta', 1986.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (28.0, 'Krausz Attiláné', 1991.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (29.0, 'Lipcsei Rita', 1987.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (30.0, 'Szántó Károly', 1962.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (31.0, 'Bukovics Erika', 1981.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (32.0, 'Érdi László', 1989.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (33.0, 'Kiss Gergely', 1976.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (34.0, 'Egressy István', 1964.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (35.0, 'Pettendi Csaba', 1979.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (36.0, 'Fekete Liza', 1968.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (37.0, 'Joó Mária', 1956.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (38.0, 'Koós Alajos', 1990.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (39.0, 'Kerekes Zsombor', 1971.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (40.0, 'Komondi Aletta', 1971.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (41.0, 'Mizi Marietta', 1948.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (42.0, 'Álmosdi Tibor', 1989.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (43.0, 'Kerezsi Anita', 1957.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (44.0, 'Kassai Jánosné', 1960.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (45.0, 'Pongrácz Zoltánné', 1954.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (46.0, 'Keresztes Tibor', 1954.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (47.0, 'Kiss Hedvig', 1949.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (48.0, 'Rõthné Éva', 1954.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (49.0, 'Pászti Annamária', 1978.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (50.0, 'Molnárné Júlia', 1947.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (51.0, 'Erõs Andrea', 1978.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (52.0, 'Asztalos Ádám', 1948.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (53.0, 'Eszes Krisztina', 1961.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (54.0, 'Kovács Marianna', 1960.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (55.0, 'Kovács Gézáné', 1955.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (56.0, 'Szabó Ákosné', 1979.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (57.0, 'Nagy-Szántó Anna', 1991.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (58.0, 'Kerek Gábor', 1961.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (59.0, 'Kocsis Krisztián', 1974.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (60.0, 'Veres Adrián', 1977.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (61.0, 'Kiss Laura', 1978.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (62.0, 'Good Henrik', 1949.0);


/*7.	Önállóan: Hozzunk létre egy táblát ÁRFOLYAM néven. 
A táblának 3 oszlopa legyen. 
Egy dátum, ez legyen kulcs, egy JPY oszlop a japán jen árfolyamának tárolására, 
egy jegyû számot lehessen benne tárolni 4 tizedesjeggyel, feltételnek állítsuk be, 
hogy 0 és 5 között legyen és egy másik USD oszlop az amerikai dollár árfolyamának 
tárolására. 3 jegyû számot lehessen tárolni 2 tizedesjeggyel és állítsuk be, 
hogy 100 és 400 közötti számokat fogadjon csak el.*/

CREATE TABLE arfolyam( 
datum DATE PRIMARY KEY 
, jpy NUMBER(5,4) CHECK (jpy BETWEEN 0 AND 5) 
, usd NUMBER(5,2) CHECK (usd BETWEEN 100 AND 400) 
);

/*8. Ha kész a tábla, importáljuk az arfolyam.csv fájl adatai közül csak a szükségeseket. 
A táblázatban minden hónap elsõ napján rögzítettük az árfolyamokat. A dátumokat így értelmezzük!
Az importáláshoz a scriptet hozzuk létre, majd azt futtassuk!*/

INSERT INTO arfolyam (datum, usd, jpy) VALUES (to_date('01.01.07', 'MM-DD-RR'), 195.22, 1.6214);

/*9.	Önállóan: Hozzunk létre egy táblát RENDELÉS néven. A tábla oszlopai: 
sorszám (max. 6 jegyû egész szám), dátum (idõbélyeg), alapértelmezetten a 
rendszer órájából vegye az értéket, vevõ (40 karakteres szöveg), 
fizetendõ összeg (max 6 jegyû egész szám). 
A táblában a sorszám és a dátum is legyen kulcs. 
Vigyünk be kézileg 2-3 adatot a táblázatba.*/

CREATE TABLE rendeles( 
sorszam NUMBER(6) PRIMARY KEY, 
datum TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, 
vevo VARCHAR2(40), 
fizetendo_osszeg NUMBER(6), 
CONSTRAINT uni_datum UNIQUE (datum));