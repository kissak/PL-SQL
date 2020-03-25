--------------------------------------------------------
--  File created - péntek-május-12-2017   
--------------------------------------------------------
-- Unable to render TABLE DDL for object UGYFEL with DBMS_METADATA attempting internal generator.

CREATE TABLE UGYFEL 
(
  LOGIN VARCHAR2(20 BYTE) NOT NULL 
, EMAIL VARCHAR2(50 BYTE) NOT NULL 
, VNEV VARCHAR2(50 BYTE) NOT NULL 
, KNEV VARCHAR2(50 BYTE) NOT NULL 
, SZULEV NUMBER(4, 0) 
, CIM VARCHAR2(100 BYTE) 
);

ALTER TABLE UGYFEL
ADD CONSTRAINT CON_UGYFEL_EMAIL CHECK 
(email LIKE '%@%.__' OR  email LIKE '%@%.___');

ALTER TABLE UGYFEL
ADD CONSTRAINT NN_UGYFEL_EMAIL CHECK 
("EMAIL" IS NOT NULL);

ALTER TABLE UGYFEL
ADD CONSTRAINT NN_UGYFEL_KNEV CHECK 
("KNEV" IS NOT NULL);

ALTER TABLE UGYFEL
ADD CONSTRAINT NN_UGYFEL_VNEV CHECK 
("VNEV" IS NOT NULL);

ALTER TABLE UGYFEL
ADD CONSTRAINT U_UGYFEL_EMAIL UNIQUE 
(
  EMAIL 
);

ALTER TABLE UGYFEL
ADD CONSTRAINT PK_UGYFEL_LOGIN PRIMARY KEY 
(
  LOGIN 
);


CREATE UNIQUE INDEX PK_UGYFEL_LOGIN ON UGYFEL (LOGIN ASC);
CREATE UNIQUE INDEX U_UGYFEL_EMAIL ON UGYFEL (EMAIL ASC);
REM INSERTING into UGYFEL
SET DEFINE OFF;
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('peter4','péter.bíró@mail.hu','Bíró','Péter','1985','Rákóczi utca 67.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('tibor','tibor.gombos@mail.hu','Gombos','Tibor','1993','Kossuth utca 77.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('agnes','agnes@gmail.com','Lengyel','Ágnes','1979','Deák Ferenc út 5.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('nikoletta4','nikoletta4@gmail.com','Kõ','Nikoletta','1972','Fõ út 18.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('balazs1','balázs.bozsik@mail.hu','Bozsik','Balázs','1992','Bécsi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('jozsef','jozsef@gmail.com','Gergely','József','1985','Fõ út 18.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('KRISZTIANM','KRISZTIANM@gmail.com','Mogyródi','Krisztián','1968','Jászai tér 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('dora3','dóra.sarodi@mail.hu','Sarodi','Dóra','1995','Fõ út 18.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('aniko','aniko@gmail.com','Tóth','Anikó','1973','Deák Ferenc út 5.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ZSUZSAV','zsuzsa.vajda@mail.hu','Vajda','Zsuzsa','1976','Kossuth utca 77.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('roland1','roland.ferencz@mail.hu','Ferencz','Roland','1985','Fõ út 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('balint1','balint1@gmail.com','Molnár','Bálint','1989','Fõ út 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ARONK','áron.kelemen@mail.hu','Kelemen','Áron','1989','Petõfi utca 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('emese','emese.kuruc@mail.hu','Kuruc','Emese','1989','Rákóczi utca 67.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ferenc1','ferenc.orosz@mail.hu','Orosz','Ferenc','1983','Arany János utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('SZILARDS','szilárd.szalai@mail.hu','Szalai','Szilárd','1967','Fõ út 18.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('szilvia1','szilvia.tari@mail.hu','Tari','Szilvia','1971','Bécsi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('NANDORF','nándor.fõ@mail.hu','Fõ','Nándor','1968','Bécsi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ZOLTANT','zoltán.tóth@mail.hu','Tóth','Zoltán','1985','Posta köz 2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('eszter4','eszter.fülöp@mail.hu','Fülöp','Eszter','1993','Kossuth Lajos utca 47/b.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('agnes3','agnes3@gmail.com','Hartyánszky','Ágnes','1967','Posta köz 2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('tamas','tamás.antal@mail.hu','Antal','Tamás','1984','Posta köz 2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('bertalan','bertalan@gmail.com','Csiger','Bertalan','1977','Fõ út 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andras41','andras41@gmail.com','Komjáti','András','1997','Kossuth út 24.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('BEATRIXK','beatrix.kerényi@mail.hu','Kerényi','Beatrix','1972','Kossuth Lajos utca 47/b.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('pal','pál.barabás@mail.hu','Barabás','Pál','1968','Szolnoki út 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andrea3','andrea3@gmail.com','Szomor','Andrea','1996','Bécsi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('LASZLON','lászló.nagy@mail.hu','Nagy','László','1969','Jászai tér 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('matyas2','matyas2@gmail.com','Botka','Mátyás','1972','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('JUDITH','JUDITH@gmail.com','Hídasi','Judit','1997','Fõ út 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ANIKOS','ANIKOS@gmail.com','Simon','Anikó','1988','Bécsi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('RENATAK','renáta.kardos@mail.hu','Kardos','Renáta','1988','Bécsi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('david','david@gmail.com','Ambrus','Dávid','1974','Fõ út 18.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('attila4','attila.baróti@mail.hu','Baróti','Attila','1975','Arany János utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('krisztina','krisztina@gmail.com','Szedlár','Krisztina','1979','Arany János utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('aladar','aladár.dunai@mail.hu','Dunai','Aladár','1980','Árpád utca 23.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('BEATRIXS','beatrix.szekendi@mail.hu','Szekendi','Beatrix','1981','Jászai tér 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('TAMASF','TAMASF@gmail.com','Fényes','Tamás','1997','Arany János utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('szabolcs','szabolcs.bodor@mail.hu','Bodor','Szabolcs','1990','Ady Endre út 27.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('adam1','ádám.kiss@mail.hu','Kiss','Ádám','1991','Szolnoki út 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ANDRASE','ANDRASE@gmail.com','Erdei','András','1997','Szolnoki út 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('julia','julia@gmail.com','Tóth','Júlia','1993','Árpád utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('peter1','peter1@gmail.com','Kozma','Péter','1976','Központi telep 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('MARKH','márk.horváth@mail.hu','Horváth','Márk','1997','Badacsonyi utca 12.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('brigitta3','brigitta.pataki@mail.hu','Pataki','Brigitta','1991','Rendeki utca 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('IBOLYAA','ibolya.andor@mail.hu','Andor','Ibolya','1983','Posta köz 2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('balu','bálint.endresz@mail.hu','Endresz','Bálint','1976','Fõ út 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('eva2','eva2@gmail.com','Perlinger','Éva','1971','Bécsi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('laszlo1','lászló.farkas@mail.hu','Farkas','László','1967','Rendeki utca 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('MONIKAM','mónika.mohos@mail.hu','Mohos','Mónika','1974','Baracsi László utca 14.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('akos','ákos.bíró@mail.hu','Bíró','Ákos','1982','Kossuth Lajos utca 47/b.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('aron2','aron2@gmail.com','Jakab','Áron','1971','Bajcsy-Zsilinszky utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('zoltan4','zoltan4@gmail.com','Barna','Zoltán','1986','Jászai tér 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('LASZLOA','lászló.antal@mail.hu','Antal','László','1969','Bécsi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('eszter2','eszter.balogh@mail.hu','Balogh','Eszter','1998','Kossuth utca 11.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('roland','roland@gmail.com','Tóth','Roland','1968','Fõ út 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('brigitta','brigitta.székely@mail.hu','Székely','Brigitta','1978','Fõ utca 47.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('eva','eva@gmail.com','Enyedi','Éva','1967','Petõfi utca 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andras21','andrás.molnár@mail.hu','Molnár','András','1977','Rákóczi utca 67.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('SZABOLCSM','szabolcs.miklós@mail.hu','Miklós','Szabolcs','1980','Fõ út 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('daniel1','dániel.keszler@mail.hu','Keszler','Dániel','1969','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('sebestyen','sebestyen@gmail.com','Rab','Sebestyén','1992','Központi telep 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('roza2','roza2@gmail.com','Bucskó','Róza','1988','Arany János utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('maria1','mária.baráth@mail.hu','Baráth','Mária','1995','Posta köz 2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('KRISZTINAG','KRISZTINAG@gmail.com','Gyárfás','Krisztina','1987','Arany János utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ANNAMARIAR','ANNAMARIAR@gmail.com','Regõs','Annamária','1977','Petõfi Sándor tér 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ZSOLTJ','ZSOLTJ@gmail.com','Józsa','Zsolt','1983','Bajcsy-Zsilinszky utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ZOLTANP','zoltán.pintér@mail.hu','Pintér','Zoltán','1977','Fõ út 18.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ANDREAT','ANDREAT@gmail.com','Tornyos','Andrea','1986','Bécsi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('gabor1','gabor1@gmail.com','Köves','Gábor','1973','Árpád utca 23.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('janos3','janos3@gmail.com','Harangozó','János','1967','Petõfi Sándor tér 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ESZTERE','eszter.érsek@mail.hu','Érsek','Eszter','1978','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ROBERTP','ROBERTP@gmail.com','Pásztor','Róbert','1972','Ady Endre út 27.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('zsuzsa3','zsuzsa.varsányi@mail.hu','Varsányi','Zsuzsa','1979','Árpád utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('norbert5','norbert5@gmail.com','Béres','Norbert','1975','Bajcsy-Zsilinszky utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ilona3','ilona3@gmail.com','Bosnyák','Ilona','1990','Posta köz 2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('zsuzsa','zsuzsanna@gmail.com','Pusztai','Zsuzsanna','1980','Badacsonyi utca 12.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('marton','marton@gmail.com','Kalacsi','Márton','1989','Fõ út 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('annamaria1','annamária.szûcs@mail.hu','Szûcs','Annamária','1990','Rendeki utca 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('kriszti','kriszti@gmail.com','Horváth','Krisztina','1978','Árpád utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('RENATAS','RENATAS@gmail.com','Szirmai','Renáta','1991','Kossuth utca 27.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('julia4','julia4@gmail.com','Nagy','Júlia','1985','Jászai tér 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('PETERB','péter.berendi@mail.hu','Berendi','Péter','1969','Vasút utca 4/10.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('bernadett2','bernadett.kovács@mail.hu','Kovács','Bernadett','1996','Fõ út 122.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('MIKLOSB','miklós.balla@mail.hu','Balla','Miklós','1979','Szent István utca 2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andras3','andrás.vígh@mail.hu','Vígh','András','1971','Arany János utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('georgij','georgij.nyíri@mail.hu','Nyíri','Georgij','1983','Grassalkovich út 10.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('zsuzsanna','zsuzsanna.barta@mail.hu','Barta','Zsuzsanna','1994','Dózsa György utca 37.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('JANOSG','JANOSG@gmail.com','Giliga','János','1975','Deák Ferenc út 5.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('jozsef2','józsef.vajda@mail.hu','Vajda','József','1978','Baracsi László utca 14.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('kornel4','kornél.lukács@mail.hu','Lukács','Kornél','1975','Bécsi utca 82.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('bence','bence@gmail.com','Gyõrffy','Bence','1987','Árpád utca 23.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('balazs3','balazs3@gmail.com','Bakódy','Balázs','1986','Arany János utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('AGNESH','AGNESH@gmail.com','Horváth','Ágnes','1981','Rákóczi utca 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ARPADM','árpád.móricz@mail.hu','Móricz','Árpád','1986','Rákóczi utca 67.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('rajmond4','rajmond.rácz@mail.hu','Rácz','Rajmond','1993','Petõfi utca 1/2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('norbert2','norbert.hegedûs@mail.hu','Hegedûs','Norbert','1991','Rendeki utca 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('GABORS','GABORS@gmail.com','Szöllõsi','Gábor','1990','Kossuth utca 27.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('kata','katalin.gondos@mail.hu','Gondos','Katalin','1968','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('sandor4','sandor4@gmail.com','Nagy','Sándor','1997','Fõ utca 47.');
commit;
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('norbert4','norbert4@gmail.com','Mile','Norbert','1983','Bajcsy-Zsilinszky utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('balint','balint@gmail.com','Horváth','Bálint','1996','Endrõdi Sándor utca 47.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('JANOSP','JANOSP@gmail.com','Pálinkás','János','1984','Padragi út 158.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('miklos2','miklos2@gmail.com','Gondos','Miklós','1995','Árpád utca 23.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('istvan','istvan@gmail.com','Soós','István','1986','Kossuth utca 27.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ARPADH','árpád.horváth@mail.hu','Horváth','Árpád','1990','Dózsa György u. 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('klaudia2','klaudia.bakó@mail.hu','Bakó','Klaudia','1982','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('veronika4','veronika4@gmail.com','Tankó','Veronika','1983','Rendeki utca 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('VIKTORIAU','viktoria.urbán@mail.hu','Urbán','Viktoria','1996','Népboltsor  2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('denes','denes@gmail.com','Tömböly','Dénes','1975','Kossuth út 39.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('edit','edit.bittmann@mail.hu','Bittmann','Edit','1984','Fõ utca 60.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('zsolt1','zsolt.pulai@mail.hu','Pulai','Zsolt','1988','Fõ utca 60.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andras4','andras4@gmail.com','Back','András','1984','Fõ út 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('BERNADETTO','bernadett.orbán@mail.hu','Orbán','Bernadett','1987','Arany János utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('sandor3','sándor.farkas@mail.hu','Farkas','Sándor','1989','Tanácsköztársaság tér 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('krisztian4','krisztián.czérna@mail.hu','Czérna','Krisztián','1970','Dózsa György utca 37.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('AGNESK','AGNESK@gmail.com','Kovács','Ágnes','1988','Endrõdi Sándor utca 47.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ATTILAO','ATTILAO@gmail.com','Opra','Attila','1995','Rákóczi út 200.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('EVAV','EVAV@gmail.com','Viktor','Éva','1980','Arany János utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('gabriella10','gabriella10@gmail.com','Vida','Gabriella','1969','Arany János utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andi','andrea.maródi@mail.hu','Maródi','Andrea','1968','Árpád utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('peter3','peter3@gmail.com','Szalai','Péter','1983','Arany János utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('GYONGYIK','gyöngyi.kornseé@mail.hu','Kornseé','Gyöngyi','1974','Fõ út 60.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('katka','katalin.kovács@mail.hu','Kovács','Katalin','1975','Petõfi utca 22.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('BELAF','BELAF@gmail.com','Farkas','Béla','1995','Petõfi Sándor utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ANDRASN','andrás.nagy@mail.hu','Nagy','András','1980','Fõ út 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('tibor2','tibor2@gmail.com','Dániel','Tibor','1985','Árpád utca 23.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('gusztav','gusztav@gmail.com','Bárci','Gusztáv','1967','Endrõdi Sándor utca 47.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('bernadett1','bernadett1@gmail.com','Simon','Bernadett','1984','Fõ utca 108.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('julianna4','julianna4@gmail.com','Szabó','Julianna','1990','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ROBERTI','róbert.iván@mail.hu','Iván','Róbert','1967','Petõfi Sándor utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('balazs2','balázs.szûcs@mail.hu','Szûcs','Balázs','1984','Szabadság utca 95.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('peter2','peter2@gmail.com','Bozsó','Péter','1976','Zombori út 2/A');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('GYORGYO','GYORGYO@gmail.com','Oroszi','György','1980','Dózsa György u. 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('zoltan','zoltán.fodor@mail.hu','Fodor','Zoltán','1979','Fõ utca 23.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andrea','andrea.kiss@mail.hu','Kiss','Andrea','1993','Petõfi Sándor utca 87.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('alexandra','alexandra.bagóczki@mail.hu','Bagóczki','Alexandra','1992','Petõfi utca 1/2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('lala','lajos.nagymihály@mail.hu','Nagymihály','Lajos','1997','Rákóczi út 200.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('dani','daniel@gmail.com','Vörös','Dániel','1986','Dózsa György u. 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('imre1','imre.papp@mail.hu','Papp','Imre','1976','Szolnoki út 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('aniko4','aniko4@gmail.com','Böröcz','Anikó','1978','Petõfi Sándor tér 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('imre','imre.búza@mail.hu','Búza','Imre','1988','Petõfi Sándor tér 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('david1','david1@gmail.com','Sobják','Dávid','1970','Arany János utca 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('adam4','ádám.bieniek@mail.hu','Bieniek','Ádám','1976','Juhászföldi út 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('mark','márk.kispál@mail.hu','Kispál','Márk','1996','Juhászföldi út 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('arpad2','árpád.ötvös@mail.hu','Ötvös','Árpád','1990','Padragi út 158.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('daniel','dániel.rácz@mail.hu','Rácz','Dániel','1978','Szabadság tér 9.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('VIKTORK','viktor.keresztúri@mail.hu','Keresztúri','Viktor','1989','Nagy Lajos tér 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('nikolett3','nikolett3@gmail.com','Horváth','Nikolett','1981','Arany János utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('valentin','valentin.feró@mail.hu','Feró','Valentin','1986','Búvár utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('reka4','réka.szikszai@mail.hu','Szikszai','Réka','1969','Templom utca 73.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('polla','polla@gmail.com','Palágyi','Polla','1994','Fõ út 18.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('MATEK','máté.koza@mail.hu','Koza','Máté','1997','Központi telep 3.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('csongor3','csongor.nagymihály@mail.hu','Nagymihály','Csongor','1984','Deák Ferenc út 5.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('kati','katalin.zatykó@mail.hu','Zatykó','Katalin','1995','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('laszlo2','lászló.móra@mail.hu','Móra','László','1975','Petõfi utca 1/2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('norbert','norbert@gmail.com','Szûcs','Norbert','1969','Gyõri utca 12.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('MATYASS','mátyás.szilágyi@mail.hu','Szilágyi','Mátyás','1975','Kossuth Lajos utca 6.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('vivien3','vivien3@gmail.com','Boros','Vivien','1991','Fõ út 122.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('henrik3','henrik.nádudvari@mail.hu','Nádudvari','Henrik','1986','Tanácsköztársaság tér 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('adam3','adam3@gmail.com','Barkóci','Ádám','1970','Dózsa György utca 37.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('debora','debóra.barna@mail.hu','Barna','Debóra','1976','Fõ út 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('BENCEB','bence.bajusz@mail.hu','Bajusz','Bence','1973','Fõ utca 56.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('timea2','tímea.dusha@mail.hu','Dusha','Tímea','1975','Kossuth utca 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('gabor4','gábor.telek@mail.hu','Telek','Gábor','1987','Fõ út 169.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('tunde','tunde@gmail.com','Turcsik','Tünde','1974','Fõ út 122.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('ISTVANV','ISTVANV@gmail.com','Varga','István','1989','Hõsök tere 11.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('kristof4','kristof4@gmail.com','Poprádi','Kristóf','1984','Mészáros utca 7.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('NIKOLETTAT','nikoletta.tatár@mail.hu','Tatár','Nikoletta','1997','Gyõri utca 12.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('sandor','sandor@gmail.com','Karasz','Sándor','1970','Kossuth Lajos utca 1/a.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('david4','david4@gmail.com','Berta','Dávid','1990','Balatoni út 12.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('JOZSEFG','józsef.gyuris@mail.hu','Gyuris','József','1975','Petõfi utca 1/2.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('tamara2','tamara.miklós@mail.hu','Miklós','Tamara','1980','Kossuth út 39.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('sara','sára.farkas@mail.hu','Farkas','Sára','1973','Felszabadulás utca 32.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('attila1','attila.gulyás@mail.hu','Gulyás','Attila','1982','Szolnoki út 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('SEBASTIANF','SEBASTIANF@gmail.com','Foltényi','Sebastián','1992','Grassalkovich út 10.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('anett3','anett.pivarcsi@mail.hu','Pivarcsi','Anett','1967','Fõ út 60.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('zsofi1','zsofi1@gmail.com','Molnár','Zsófi','1983','Árpád utca 23.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('MIHALYJ','mihály.juhász@mail.hu','Juhász','Mihály','1979','Rákóczi utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('fruzsina4','fruzsina4@gmail.com','Frank','Fruzsina','1996','Szabadság utca 95.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('tihamer','tihamér.kazy@mail.hu','Kazy','Tihamér','1991','Fõ utca 60.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('katalin4','katalin4@gmail.com','Kertész','Katalin','1986','Búvár utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andras2','andrás.tóth@mail.hu','Tóth','András','1997','Petõfi utca 30.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('istvan1','istván.vizi@mail.hu','Vizi','István','1997','Rákóczi utca 1.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('anita','anita.hamvay-kovács@mail.hu','Hamvay-Kovács','Anita','1971','Táncsics utca 19.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('robert2','robert2@gmail.com','Patay','Róbert','1977','Rákóczi utca 21.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('timea','timea@gmail.com','Papós','Tímea','1996',' Kossuth út 77.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('beata4','beáta.bagi@mail.hu','Bagi','Beáta','1994','Felszabadulás utca 32.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('eszter','eszter.molnár@mail.hu','Molnár','Eszter','1987','Fõ út 77.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('attila','attila@gmail.com','Csóti','Attila','1979','Bajcsy-Zsilinszky utca 4.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('balint2','balint2@gmail.com','Vukasinovity','Bálint','1997','Béke utca 7.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('krisztina1','krisztina.bori@mail.hu','Bori','Krisztina','1969','Fõ utca 47.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('katalin','katalin.horváth@mail.hu','Horváth','Katalin','1968','Rákóczi út 200.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('andrea4','andrea4@gmail.com','Neizer','Andrea','1981','Kiss u. 8.');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('lajos','lajos.kiss@mail.hu','Kiss','Lajos','1978','Dob utca 1');
Insert into UGYFEL (LOGIN,EMAIL,VNEV,KNEV,SZULEV,CIM) values ('gabriella1','gabriella1@gmail.com','Nagy','Gabriella','1982','Dob utca 1');
commit;
-- Unable to render INDEX DDL for object U_UGYFEL_EMAIL with DBMS_METADATA attempting internal generator.
CREATE UNIQUE INDEX U_UGYFEL_EMAIL ON UGYFEL (EMAIL ASC);
-- Unable to render INDEX DDL for object PK_UGYFEL_LOGIN with DBMS_METADATA attempting internal generator.
CREATE UNIQUE INDEX PK_UGYFEL_LOGIN ON UGYFEL (LOGIN ASC);
