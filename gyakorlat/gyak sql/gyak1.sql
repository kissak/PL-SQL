SELECT * FROM USER_ROLE_PRIVS; --milyen szerepeink vannak

SELECT * FROM ALL_OBJECTS
WHERE OBJECT_TYPE='TABLE'
; --az adatbázis összes tábla típusú objektuma, nem fogjuk látni az összeset

SELECT COUNT(*) FROM ALL_OBJECTS
WHERE OBJECT_TYPE='TABLE'
; -- hány tábla is van már az adatbázisban?
-- futtassuk le a fenti utasítást úgy is, hogy a WHERE-rel kezdõdõ sor elé is írunk megjegyzés jelet: --
-- így az összes objektum számát fogjuk megkapni.

SELECT * FROM ALL_TABLES
WHERE OWNER='SCOTT'; -- a MINTA sémában lesznek az órai és a gyakorló táblázatok, onnan bármikor importálhatóak, illetve lekérdezhetõek.