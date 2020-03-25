--1.	Hozzunk l�tre egy egyszer� t�bl�t 2 oszloppal: alkalmazott(nev,szulev)

CREATE TABLE alkalmazott(
nev VARCHAR2(40)
,szulev NUMBER(4)
);

DROP TABLE alkalmazott PURGE; 

/*2.	Hozzuk l�tre az alkalmazott t�bl�t �jra, de most �ll�tsuk be, 
hogy a n�v legyen els�dleges kulcs.*/

CREATE TABLE alkalmazott(
nev VARCHAR2(40) PRIMARY KEY
,szulev NUMBER(4)
);

DROP TABLE alkalmazott PURGE; 

/* 3.	Hozzuk l�tre az alkalmazott t�bl�t �jra de most �ll�tsuk be, 
hogy a n�v �s a sz�let�si �v egy�tt legyen els�dleges kulcs.*/

CREATE TABLE alkalmazott(
nev VARCHAR2(40) PRIMARY KEY --NEM J�!!!!
,szulev NUMBER(4) PRIMARY KEY --NEM J�!!!!
);

CREATE TABLE alkalmazott(
nev VARCHAR2(40)
,szulev NUMBER(4)
,CONSTRAINT pk_nev_szulev PRIMARY KEY (nev,szulev)
);

DROP TABLE alkalmazott PURGE;

/*4.	Hozzuk l�tre az alkalmazott t�bl�t �jra, de most legyen egy azonos�t�nk is, 
�s az azonos�t� �s a n�v+sz�let�si �v is kulcs legyen.
az azonos�t� neve AID legyen, 3 jegy� sz�m.
*/

CREATE TABLE alkalmazott(
aid NUMBER(3) PRIMARY KEY
,nev VARCHAR2(40) NOT NULL
,szulev NUMBER(4) NOT NULL
,CONSTRAINT key_nev_szulev UNIQUE (nev,szulev)
);


/*5.	�n�ll�an: Dobjuk el �jra a t�bl�t, �s hozzuk l�tre �jra �gy, 
hogy a SZULEV oszlopra adunk CHECK felt�telt, 
hogy 1900 �s 2000 k�z�tti sz�mokat fogadunk csak el. */

DROP TABLE alkalmazott PURGE;

CREATE TABLE alkalmazott(
aid NUMBER(3) PRIMARY KEY
,nev VARCHAR2(40) NOT NULL
,szulev NUMBER(4) NOT NULL
,CONSTRAINT check_szulev CHECK (szulev BETWEEN 1900 AND 2000)
,CONSTRAINT key_nev_szulev UNIQUE (nev,szulev)
);

/*6.	Import�ljunk adatokat az utolj�ra l�trehozott t�bl�nkba. (alkalmazott.csv)*/

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (1.0, 'Bana �rp�dn�', 1967/* m�jus 2.*/);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (2.0, 'Szab� Lajosn�', 1958.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (3.0, 'Pord�n Gy�ngyi', 1954.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (4.0, 'Szerdahelyi Ad�l', 1960.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (5.0, 'Rezes Andr�sn�', 1973.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (6.0, 'Babos Krisztina', 1967.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (7.0, 'M�ri�s K�roly', 1951.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (8.0, 'Mik� Annam�ria', 1972.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (9.0, 'Solymosi Andr�sn�', 1967.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (10.0, 'V�rhegyi Krisztina', 1964.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (11.0, 'Kov�csn� Brigitta', 1978.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (12.0, 'Papp K�zm�r', 1972.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (13.0, 'Teleki Annam�ria', 1968.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (14.0, 'Kov�cs Ad�l', 1986.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (15.0, 'Papp Korn�lia', 1966.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (16.0, 'Vojevogyina Al�z', 1952.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (17.0, 'T�th Ferenc', 1954.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (18.0, 'Szo� �gota', 1979.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (19.0, 'Karajos Alexa', 1965.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (20.0, 'V�rkonyi Mikl�sn�', 1977.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (21.0, 'Fodor Em�lia', 1978.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (22.0, 'Papcs�k Adonisz', 1974.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (23.0, 'Mester Tiborn�', 1953.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (24.0, 'Vid�k �ron', 1991.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (25.0, 'Szendi Tam�s', 1947.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (26.0, 'Mizi Krisztina', 1970.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (27.0, 'Szerdahelyi Kriszta', 1986.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (28.0, 'Krausz Attil�n�', 1991.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (29.0, 'Lipcsei Rita', 1987.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (30.0, 'Sz�nt� K�roly', 1962.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (31.0, 'Bukovics Erika', 1981.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (32.0, '�rdi L�szl�', 1989.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (33.0, 'Kiss Gergely', 1976.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (34.0, 'Egressy Istv�n', 1964.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (35.0, 'Pettendi Csaba', 1979.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (36.0, 'Fekete Liza', 1968.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (37.0, 'Jo� M�ria', 1956.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (38.0, 'Ko�s Alajos', 1990.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (39.0, 'Kerekes Zsombor', 1971.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (40.0, 'Komondi Aletta', 1971.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (41.0, 'Mizi Marietta', 1948.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (42.0, '�lmosdi Tibor', 1989.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (43.0, 'Kerezsi Anita', 1957.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (44.0, 'Kassai J�nosn�', 1960.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (45.0, 'Pongr�cz Zolt�nn�', 1954.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (46.0, 'Keresztes Tibor', 1954.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (47.0, 'Kiss Hedvig', 1949.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (48.0, 'R�thn� �va', 1954.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (49.0, 'P�szti Annam�ria', 1978.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (50.0, 'Moln�rn� J�lia', 1947.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (51.0, 'Er�s Andrea', 1978.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (52.0, 'Asztalos �d�m', 1948.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (53.0, 'Eszes Krisztina', 1961.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (54.0, 'Kov�cs Marianna', 1960.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (55.0, 'Kov�cs G�z�n�', 1955.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (56.0, 'Szab� �kosn�', 1979.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (57.0, 'Nagy-Sz�nt� Anna', 1991.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (58.0, 'Kerek G�bor', 1961.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (59.0, 'Kocsis Kriszti�n', 1974.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (60.0, 'Veres Adri�n', 1977.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (61.0, 'Kiss Laura', 1978.0);

INSERT INTO alkalmazott (aid, nev, szulev) 
VALUES (62.0, 'Good Henrik', 1949.0);


/*7.	�n�ll�an: Hozzunk l�tre egy t�bl�t �RFOLYAM n�ven. 
A t�bl�nak 3 oszlopa legyen. 
Egy d�tum, ez legyen kulcs, egy JPY oszlop a jap�n jen �rfolyam�nak t�rol�s�ra, 
egy jegy� sz�mot lehessen benne t�rolni 4 tizedesjeggyel, felt�telnek �ll�tsuk be, 
hogy 0 �s 5 k�z�tt legyen �s egy m�sik USD oszlop az amerikai doll�r �rfolyam�nak 
t�rol�s�ra. 3 jegy� sz�mot lehessen t�rolni 2 tizedesjeggyel �s �ll�tsuk be, 
hogy 100 �s 400 k�z�tti sz�mokat fogadjon csak el.*/

CREATE TABLE arfolyam( 
datum DATE PRIMARY KEY 
, jpy NUMBER(5,4) CHECK (jpy BETWEEN 0 AND 5) 
, usd NUMBER(5,2) CHECK (usd BETWEEN 100 AND 400) 
);

/*8. Ha k�sz a t�bla, import�ljuk az arfolyam.csv f�jl adatai k�z�l csak a sz�ks�geseket. 
A t�bl�zatban minden h�nap els� napj�n r�gz�tett�k az �rfolyamokat. A d�tumokat �gy �rtelmezz�k!
Az import�l�shoz a scriptet hozzuk l�tre, majd azt futtassuk!*/

INSERT INTO arfolyam (datum, usd, jpy) VALUES (to_date('01.01.07', 'MM-DD-RR'), 195.22, 1.6214);

/*9.	�n�ll�an: Hozzunk l�tre egy t�bl�t RENDEL�S n�ven. A t�bla oszlopai: 
sorsz�m (max. 6 jegy� eg�sz sz�m), d�tum (id�b�lyeg), alap�rtelmezetten a 
rendszer �r�j�b�l vegye az �rt�ket, vev� (40 karakteres sz�veg), 
fizetend� �sszeg (max 6 jegy� eg�sz sz�m). 
A t�bl�ban a sorsz�m �s a d�tum is legyen kulcs. 
Vigy�nk be k�zileg 2-3 adatot a t�bl�zatba.*/

CREATE TABLE rendeles( 
sorszam NUMBER(6) PRIMARY KEY, 
datum TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL, 
vevo VARCHAR2(40), 
fizetendo_osszeg NUMBER(6), 
CONSTRAINT uni_datum UNIQUE (datum));