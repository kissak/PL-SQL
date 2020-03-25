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



/*6.	Import�ljunk adatokat az utolj�ra l�trehozott t�bl�nkba. (alkalmazott.csv)*/


/*7.	�n�ll�an: Hozzunk l�tre egy t�bl�t �RFOLYAM n�ven. 
A t�bl�nak 3 oszlopa legyen. 
Egy d�tum, ez legyen kulcs, egy JPY oszlop a jap�n jen �rfolyam�nak t�rol�s�ra, 
egy jegy� sz�mot lehessen benne t�rolni 4 tizedesjeggyel, felt�telnek �ll�tsuk be, 
hogy 0 �s 5 k�z�tt legyen �s egy m�sik USD oszlop az amerikai doll�r �rfolyam�nak 
t�rol�s�ra. 3 jegy� sz�mot lehessen t�rolni 2 tizedesjeggyel �s �ll�tsuk be, 
hogy 100 �s 400 k�z�tti sz�mokat fogadjon csak el.*/

/*8. Ha k�sz a t�bla, import�ljuk az arfolyam.csv f�jl adatai k�z�l csak a sz�ks�geseket. 
A t�bl�zatban minden h�nap els� napj�n r�gz�tett�k az �rfolyamokat. A d�tumokat �gy �rtelmezz�k!
Az import�l�shoz a scriptet hozzuk l�tre, majd azt futtassuk!*/

/*9.	�n�ll�an: Hozzunk l�tre egy t�bl�t RENDEL�S n�ven. A t�bla oszlopai: 
sorsz�m (max. 6 jegy� eg�sz sz�m), d�tum (id�b�lyeg), alap�rtelmezetten a 
rendszer �r�j�b�l vegye az �rt�ket, vev� (40 karakteres sz�veg), 
fizetend� �sszeg (max 6 jegy� eg�sz sz�m). 
A t�bl�ban a sorsz�m �s a d�tum is legyen kulcs. 
Vigy�nk be k�zileg 2-3 adatot a t�bl�zatba.*/
