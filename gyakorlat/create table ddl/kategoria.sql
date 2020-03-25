--------------------------------------------------------
--  File created - péntek-május-12-2017   
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
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ajándék tárgy','papír írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ajándék tasak','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('álarc','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('alkalmi','ruha');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('alufólia','háztartási papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('árazószalag','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('átírótömb','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('beíró','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('beírókönyv','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('bélyegzõ','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('bélyegzõfesték','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('boríték','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('cd tok','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('celofán','háztartási papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ceruza','írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('címke','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('color copy','papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('csomagoló','háztartási papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('csomagoló anyag','papír írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('csomagoló papír','csomagoló anyag');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('dekor','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('dipa','papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('díszdoboz','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('díszkötözõ','csomagoló anyag');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('dvd','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ecset','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('elõlap','papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('emlékkönyv','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('emléklap','papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('fax papír','papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('fehérnemû','ruha');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('fénymásoló papír','papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('férfi ing','ing');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('férfi kabát','kabát');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('férfi nadrág','nadrág');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('festékpatron','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('filctoll','írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('floppy','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('fólia','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('fotópapír','papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('füzet','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('füzetborító','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('füzettartó','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gemkapocs','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gémkapocs','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('genoterm','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('genotherm','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('golyóstoll','írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gumigyûrû','háztartási papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gyermek cipõ','cipõ');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gyermek kabát','kabát');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gyermek nadrág','nadrág');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gyermek póló','póló');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gyorsfûzõ','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gyurma','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('gyûrûskönyv','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('hajgumi','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('határidõ napló','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('háztartási papír','papír írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('hegyezõ','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('hegyzõ','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('hibajavító','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('hûtõmágnes','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('indigó','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ing','ruha');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('iratgyûjtõ','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('iratrendezõ','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('iratsín','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('irattartó','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('irodaszer','papír írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('írólap','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ironbél','írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('írószer','papír írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('iskolaszer','papír írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('játékautó','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('jelzõkréta','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('kabát','ruha');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('kapocskiszedõ','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('karton','papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('kártya','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('képeslap','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('képkirakó','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('kiegészítõ','ruha');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('kosztüm','alkalmi');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('körzõ','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('kreatív','papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('kulcstartó','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('labda','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('levélpapír','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('lufi','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('lyukasztó','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('mappa','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('matrica','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('meghívó','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('miliméterpapír','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('munkafüzet','könyv');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('mûnyomó','papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('nadrág','ruha');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('naptár','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('naptárhát','irodaszer');
commit;
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('névjegytartó','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('notesz','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('nõi kabát','kabát');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('nõi nadrág','nadrág');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ofszet','papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('oklevél','papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('olló','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('öntapadó','papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('papír','papír írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('papízsebkendõ','háztartási papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('pausz','papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('pénztárbizonylat','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('pénztárgépszalag','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('pixiron','írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('plüss','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('póló','ruha');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('post-it','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('radír','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('radírtoll','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ragasztó','háztartási papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('ragasztószalag','csomagoló anyag');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('rágógumi','háztartási papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('rajzlap','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('rajzszeg','háztartási papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('regiszteres füzet','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('sál','kiegészítõ');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('spirál','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('strandlabda','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('szalvéta','ajándék tárgy');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('számológép','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('szemetes','háztartási papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('színes','írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('szögmérõ','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('szövegkiemelõ','írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('táblafilc','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('tapétavágó','háztartási papír');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('tempera','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('térképtû','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('tintapatron','írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('toll','írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('tollbetét','írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('tolltartó','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('toner','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('töltõtoll','írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('tûzõgép','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('tûzõkapocs','irodaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('vízfesték','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('vonalzó','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('zászló','iskolaszer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('zseléstoll','írószer');
Insert into KATEGORIA (ALKATEGORIA,FOKATEGORIA) values ('írásvetítõ fólia','irodaszer');
commit;
-- Unable to render INDEX DDL for object PK_KATEGORIA with DBMS_METADATA attempting internal generator.
CREATE UNIQUE INDEX PK_KATEGORIA ON KATEGORIA (ALKATEGORIA ASC);
