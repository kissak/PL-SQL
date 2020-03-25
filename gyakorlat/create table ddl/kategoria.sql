--------------------------------------------------------
--  File created - p�ntek-m�jus-12-2017   
--------------------------------------------------------
-- Unable to render TABLE DDL for object KATEGORIA with DBMS_METADATA attempting internal generator.


CREATE TABLE KATEGORIA 
(
  ALKATEGORIA VARCHAR2(32 BYTE) NOT NULL 
, FOKATEGORIA VARCHAR2(32 BYTE) 
) ;

ALTER TABLE KATEGORIA
ADD CONSTRAINT PK_KATEGORIA PRIMARY KEY 
(
  ALKATEGORIA 
);

CREATE UNIQUE INDEX PK_KATEGORIA ON KATEGORIA (ALKATEGORIA ASC);

REM INSERTING into KATEGORIA
SET DEFINE OFF;
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('aj�nd�k t�rgy','pap�r �r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('aj�nd�k tasak','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('�larc','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('alkalmi','ruha');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('aluf�lia','h�ztart�si pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('�raz�szalag','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('�t�r�t�mb','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('be�r�','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('be�r�k�nyv','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('b�lyegz�','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('b�lyegz�fest�k','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('bor�t�k','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('cd tok','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('celof�n','h�ztart�si pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ceruza','�r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('c�mke','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('color copy','pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('csomagol�','h�ztart�si pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('csomagol� anyag','pap�r �r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('csomagol� pap�r','csomagol� anyag');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('dekor','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('dipa','pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('d�szdoboz','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('d�szk�t�z�','csomagol� anyag');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('dvd','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ecset','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('el�lap','pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('eml�kk�nyv','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('eml�klap','pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('fax pap�r','pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('feh�rnem�','ruha');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('f�nym�sol� pap�r','pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('f�rfi ing','ing');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('f�rfi kab�t','kab�t');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('f�rfi nadr�g','nadr�g');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('fest�kpatron','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('filctoll','�r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('floppy','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('f�lia','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('fot�pap�r','pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('f�zet','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('f�zetbor�t�','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('f�zettart�','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gemkapocs','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('g�mkapocs','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('genoterm','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('genotherm','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('goly�stoll','�r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gumigy�r�','h�ztart�si pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gyermek cip�','cip�');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gyermek kab�t','kab�t');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gyermek nadr�g','nadr�g');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gyermek p�l�','p�l�');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gyorsf�z�','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gyurma','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gy�r�sk�nyv','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('hajgumi','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('hat�rid� napl�','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('h�ztart�si pap�r','pap�r �r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('hegyez�','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('hegyz�','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('hibajav�t�','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('h�t�m�gnes','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('indig�','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ing','ruha');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('iratgy�jt�','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('iratrendez�','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('irats�n','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('irattart�','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('irodaszer','pap�r �r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('�r�lap','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ironb�l','�r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('�r�szer','pap�r �r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('iskolaszer','pap�r �r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('j�t�kaut�','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('jelz�kr�ta','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('kab�t','ruha');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('kapocskiszed�','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('karton','pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('k�rtya','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('k�peslap','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('k�pkirak�','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('kieg�sz�t�','ruha');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('koszt�m','alkalmi');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('k�rz�','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('kreat�v','pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('kulcstart�','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('labda','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('lev�lpap�r','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('lufi','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('lyukaszt�','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('mappa','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('matrica','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('megh�v�','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('milim�terpap�r','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('munkaf�zet','k�nyv');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('m�nyom�','pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('nadr�g','ruha');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('napt�r','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('napt�rh�t','irodaszer');
commit;
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('n�vjegytart�','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('notesz','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('n�i kab�t','kab�t');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('n�i nadr�g','nadr�g');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ofszet','pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('oklev�l','pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('oll�','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('�ntapad�','pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('pap�r','pap�r �r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('pap�zsebkend�','h�ztart�si pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('pausz','pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('p�nzt�rbizonylat','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('p�nzt�rg�pszalag','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('pixiron','�r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('pl�ss','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('p�l�','ruha');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('post-it','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('rad�r','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('rad�rtoll','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ragaszt�','h�ztart�si pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ragaszt�szalag','csomagol� anyag');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('r�g�gumi','h�ztart�si pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('rajzlap','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('rajzszeg','h�ztart�si pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('regiszteres f�zet','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('s�l','kieg�sz�t�');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('spir�l','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('strandlabda','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('szalv�ta','aj�nd�k t�rgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('sz�mol�g�p','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('szemetes','h�ztart�si pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('sz�nes','�r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('sz�gm�r�','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('sz�vegkiemel�','�r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('t�blafilc','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('tap�tav�g�','h�ztart�si pap�r');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('tempera','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('t�rk�pt�','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('tintapatron','�r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('toll','�r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('tollbet�t','�r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('tolltart�','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('toner','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('t�lt�toll','�r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('t�z�g�p','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('t�z�kapocs','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('v�zfest�k','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('vonalz�','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('z�szl�','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('zsel�stoll','�r�szer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('�r�svet�t� f�lia','irodaszer');
commit;
-- Unable to render INDEX DDL for object PK_KATEGORIA with DBMS_METADATA attempting internal generator.
CREATE UNIQUE INDEX PK_KATEGORIA ON KATEGORIA (ALKATEGORIA ASC);
