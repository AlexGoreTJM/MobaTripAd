--------------------------------------------------------
--  File creato - luned�-marzo-14-2016   
--------------------------------------------------------
DROP TABLE "MOBA"."CATEGORIA" cascade constraints;
DROP TABLE "MOBA"."GIOCO" cascade constraints;
DROP TABLE "MOBA"."GIOCOPIATTA" cascade constraints;
DROP TABLE "MOBA"."GRADO" cascade constraints;
DROP TABLE "MOBA"."RECENSIONE" cascade constraints;
DROP TABLE "MOBA"."PIATTAFORMA" cascade constraints;
DROP TABLE "MOBA"."UTENTE" cascade constraints;
DROP TABLE "MOBA"."VALUTAZIONE" cascade constraints;
DROP SEQUENCE "MOBA"."GIOCO_SEQ";
DROP SEQUENCE "MOBA"."UTENTE_SEQ";
--------------------------------------------------------
--  DDL for Sequence GIOCO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MOBA"."GIOCO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence UTENTE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MOBA"."UTENTE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CATEGORIA
--------------------------------------------------------

  CREATE TABLE "MOBA"."CATEGORIA" 
   (	"IDCATEGORIA" NUMBER, 
	"NOME" VARCHAR2(50 BYTE), 
	"IMG" VARCHAR2(50 BYTE), 
	"INFO" VARCHAR2(1000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GIOCO
--------------------------------------------------------

  CREATE TABLE "MOBA"."GIOCO" 
   (	"IDGIOCO" NUMBER, 
	"TITOLO" VARCHAR2(100 BYTE), 
	"SH" VARCHAR2(50 BYTE), 
	"PLAYERS" NUMBER(*,0), 
	"WEB" NUMBER(*,0), 
	"DATAUSCITA" DATE, 
	"ETAMIN" NUMBER(*,0), 
	"COSTOLANCIO" NUMBER(7,2), 
	"IDCATEGORIA" NUMBER, 
	"VALUTAZIONESITO" NUMBER(5,2), 
	"PRO" VARCHAR2(500 BYTE), 
	"CONTRO" VARCHAR2(500 BYTE), 
	"IMG1" VARCHAR2(20 BYTE), 
	"IMG2" VARCHAR2(20 BYTE), 
	"URLVIDEO" VARCHAR2(200 BYTE), 
	"URLSH" VARCHAR2(200 BYTE), 
	"REQUISITI" VARCHAR2(500 BYTE), 
	"INFO" VARCHAR2(2000 BYTE), 
	"DATAREG" TIMESTAMP (6) DEFAULT systimestamp
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GIOCOPIATTA
--------------------------------------------------------

  CREATE TABLE "MOBA"."GIOCOPIATTA" 
   (	"IDGIOCO" NUMBER, 
	"IDPIATTAFORMA" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GRADO
--------------------------------------------------------

  CREATE TABLE "MOBA"."GRADO" 
   (	"NOME" VARCHAR2(20 BYTE), 
	"PESO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RECENSIONE
--------------------------------------------------------

  CREATE TABLE "MOBA"."RECENSIONE" 
   (	"IDUTENTE" NUMBER, 
	"IDGIOCO" NUMBER, 
	"CTRLIKE" NUMBER DEFAULT 0, 
	"CTRDISLIKE" NUMBER DEFAULT 0, 
	"SEGNALATA" NUMBER DEFAULT 0, 
	"INFO" VARCHAR2(1000 BYTE), 
	"DATAREC" TIMESTAMP (6) DEFAULT systimestamp
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PIATTAFORMA
--------------------------------------------------------

  CREATE TABLE "MOBA"."PIATTAFORMA" 
   (	"IDPIATTAFORMA" NUMBER, 
	"NOME" VARCHAR2(50 BYTE), 
	"BRAND" VARCHAR2(20 BYTE), 
	"LOGO" VARCHAR2(20 BYTE), 
	"INFO" VARCHAR2(2000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table UTENTE
--------------------------------------------------------

  CREATE TABLE "MOBA"."UTENTE" 
   (	"IDUTENTE" NUMBER, 
	"ADMIN" NUMBER(*,0) DEFAULT 0, 
	"NICKNAME" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(30 BYTE), 
	"PASSWORD" VARCHAR2(30 BYTE), 
	"NOME" VARCHAR2(20 BYTE), 
	"COGNOME" VARCHAR2(20 BYTE), 
	"GRADO" VARCHAR2(20 BYTE), 
	"AVATAR" VARCHAR2(20 BYTE), 
	"DATAREG" TIMESTAMP (6) DEFAULT systimestamp, 
	"INFO" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table VALUTAZIONE
--------------------------------------------------------

  CREATE TABLE "MOBA"."VALUTAZIONE" 
   (	"IDUTENTE" NUMBER, 
	"IDGIOCO" NUMBER, 
	"VOTO" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into MOBA.CATEGORIA
SET DEFINE OFF;
Insert into MOBA.CATEGORIA (IDCATEGORIA,NOME,IMG,INFO) values ('1','RPG','rpg.png','Role Play Game (Gioco di ruolo)');
Insert into MOBA.CATEGORIA (IDCATEGORIA,NOME,IMG,INFO) values ('2','MOBA','moba.png','Multiplayer Online Battle Arena');
Insert into MOBA.CATEGORIA (IDCATEGORIA,NOME,IMG,INFO) values ('3','FPS','fps.png','Fragment Per Second (Sparatutto)');
Insert into MOBA.CATEGORIA (IDCATEGORIA,NOME,IMG,INFO) values ('4','Strategy Game','strategy_game.png',null);
Insert into MOBA.CATEGORIA (IDCATEGORIA,NOME,IMG,INFO) values ('5','Graphic Adventure','graphic_adventure.png','Avventura grafica: punta e clicca!');
Insert into MOBA.CATEGORIA (IDCATEGORIA,NOME,IMG,INFO) values ('6','Drive Simulator','drive_simulator.png',null);
Insert into MOBA.CATEGORIA (IDCATEGORIA,NOME,IMG,INFO) values ('7','Fly Simulator','fly_simulator.png',null);
Insert into MOBA.CATEGORIA (IDCATEGORIA,NOME,IMG,INFO) values ('8','Action Adventure','action_adventure.png','Azione avventurosa');
Insert into MOBA.CATEGORIA (IDCATEGORIA,NOME,IMG,INFO) values ('9','Sport','sport.png',null);
Insert into MOBA.CATEGORIA (IDCATEGORIA,NOME,IMG,INFO) values ('10','Platform','platform.png','Arcade');
Insert into MOBA.CATEGORIA (IDCATEGORIA,NOME,IMG,INFO) values ('11','Survivor Horror','survivor_horror.png',null);
Insert into MOBA.CATEGORIA (IDCATEGORIA,NOME,IMG,INFO) values ('12','Fight','fight.png','Picchiaduro!');
Insert into MOBA.CATEGORIA (IDCATEGORIA,NOME,IMG,INFO) values ('13','MMORPG','mmorpg.png','Massive Multiplayer Online RPG');
REM INSERTING into MOBA.GIOCO
SET DEFINE OFF;
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('1','WARCRAFT III','Blizzard','1','1',to_date('03-LUG-02','DD-MON-RR'),'12','59,9','1','9','Tecnicamente ancora attuale
Coinvolgente ed immediato
Innovativo
Ancora supportato dalla casa madre','Non eccessivamente profondo, a tratti ripetitivo','G00001_1.jpg','G00001_2.jpg','https://www.youtube.com/watch?v=TFVP8pVGYsQ','http://us.blizzard.com/en-us/','entium 2 o sup','Un surrogato di azione e strategia in un ambientazione fantastica.',to_timestamp('08-MAR-16 10:30:26,846000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('2','Clash Of Clans','SUPERCELL','1','1',to_date('07-OTT-13','DD-MON-RR'),'7','0','4','8','Molto semplice e immediato
Interessanti risvolti social
Controlli touch precisi, interfaccia funzionale','Dinamiche freemium parecchio stringenti
Fase action semplicistica, contano solo i numeri
Nessuna novit� rispetto al genere di appartenenza','G00002_1.jpg','G00002_2.jpg','https://www.youtube.com/watch?v=Q6NkGf9nEvM',null,null,'Prendendo tutto ci� che di buono � stato fatto dagli sviluppatori con il precedente Hey Day, Clash of Clans � sicuramente un titolo profondo sotto alcuni aspetti e piuttosto sempliciotto sotto altri. Bench� la sua struttura ed i suoi controlli immediati si sposino alla perfezione con il dictat del mercato mobile che richiede sessioni fulminee e non troppo impegnative da vivere nei momenti pi� disparati della giornata, la sua componente strategica solo accennata potrebbe far storcere il naso a quei giocatori che, date le potenzialit� del gioco firmato Supercell, avevano riposto in esso le speranze di un titolo godibile anche per i palati pi� fini.
 ',to_timestamp('09-MAR-16 12:37:45,846000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('3','FIFA16','EA','8','1',to_date('24-SET-15','DD-MON-RR'),'6','69,99','9','7','Realistico','Difficile giocabilit�','G00003_1.jpg','G00003_3.jpg','https://www.youtube.com/watch?v=bwz98athxQ8',null,null,'Fifa 16 rappresenta il vero esordio della serie sulle console di nuova generazione, dopo due anni caratterizzati da troppi alti e bassi. Gli sviluppatori si sono impegnati a correggere tutte le debolezze del gameplay, fornendo armi importanti ai difensori per contrastare gli attaccanti, restituendo importanza al centrocampo, ora reparto fondamentale per costruire gioco, e riducendo sensibilmente l�efficacia dei giocatori capaci di affidarsi unicamente alla velocit�. L�offerta delle modalit� rimane ampia, con qualche update alla carriera allenatore, FUT Draft su Ultimate Team che permetter� di provare a tutti i migliori campioni e l�introduzione delle nazionali femminili, per un�esperienza di gameplay completamente diversa dal solito. Peccato solo non aver innovato la carriera giocatore, incapace di evolversi con una storia in grado di legare le diverse partite, e Pro Club, che paga il fatto di essere una delle modalit� meno giocate all�interno del titolo. Fifa 16 rappresenta quindi un capitolo che gli appassionati non possono assolutamente farsi scappare, e riporta la serie ad un alto livello qualitativo dopo qualche anno di buio.',to_timestamp('09-MAR-16 12:41:13,838000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('4','Tomb Raider','Eidos Interactive','1','1',to_date('01-GEN-96','DD-MON-RR'),'12','49','5','8','Bel fondo schiena','Maggiordomo nel freezer','G00004_1.jpg','G00004_2.jpg','https://www.youtube.com/watch?v=NFhLS7DmLlc','https://eidosmontreal.com/',null,'I crediti conclusivi di Tomb Raider: a Survivor is Born recitano �grazie per aver giocato al nostro titolo, � il migliore che siamo in grado di sviluppare�, e non c�� dubbio che i Crystal Dynamics abbiano messo l�anima nel loro ultimo lavoro. Il reboot delle avventure di Lara Croft � un action-adventure incredibilmente curato, che offre una campagna longeva e appassionante e un gameplay ben calcolato e solidissimo. Siamo dubbiosi per� sul fatto che sia il massimo che questi sviluppatori sono in grado di creare. Quello che hanno sfornato � un gioco di altissimo livello, ma che propone principalmente elementi gi� visti in alcuni dei migliori esponenti del genere e non riesce a mettere in campo caratteristiche distintive davvero uniche. Con un po� pi� di coraggio e un�enfasi maggiore sull�elemento survival sarebbe stato un videogame davvero indimenticabile, cos� come lo erano i primi capitoli.',to_timestamp('11-MAR-16 16:41:42,937000000','DD-MON-RR HH24:MI:SSXFF'));
REM INSERTING into MOBA.GIOCOPIATTA
SET DEFINE OFF;
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('1','1');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('1','4');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('2','11');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('2','12');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('3','1');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('3','3');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('3','4');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('3','5');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('3','6');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('4','1');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('4','2');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('4','3');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('4','4');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('4','5');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('4','6');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('4','7');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('4','8');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('4','9');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('4','10');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('4','11');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('4','12');
REM INSERTING into MOBA.GRADO
SET DEFINE OFF;
Insert into MOBA.GRADO (NOME,PESO) values ('Peone','1');
Insert into MOBA.GRADO (NOME,PESO) values ('Recluta','2');
Insert into MOBA.GRADO (NOME,PESO) values ('Scudiero','3');
Insert into MOBA.GRADO (NOME,PESO) values ('Fante','4');
Insert into MOBA.GRADO (NOME,PESO) values ('Cavaliere','5');
Insert into MOBA.GRADO (NOME,PESO) values ('Capitano','6');
Insert into MOBA.GRADO (NOME,PESO) values ('Generale','7');
Insert into MOBA.GRADO (NOME,PESO) values ('Admin','0');
REM INSERTING into MOBA.RECENSIONE
SET DEFINE OFF;
Insert into MOBA.RECENSIONE (IDUTENTE,IDGIOCO,CTRLIKE,CTRDISLIKE,SEGNALATA,INFO,DATAREC) values ('2','2','5','2','0','bellooo! Se possibile prendete la versione x PC',to_timestamp('11-MAR-16 16:28:42,722000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.RECENSIONE (IDUTENTE,IDGIOCO,CTRLIKE,CTRDISLIKE,SEGNALATA,INFO,DATAREC) values ('2','3','2','5','0','WoW lo consiglio a tutti!!!',to_timestamp('07-MAR-16 16:29:33,661000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.RECENSIONE (IDUTENTE,IDGIOCO,CTRLIKE,CTRDISLIKE,SEGNALATA,INFO,DATAREC) values ('2','1','45','32','0','Yeaahhhhh',to_timestamp('15-MAR-16 16:29:54,343000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.RECENSIONE (IDUTENTE,IDGIOCO,CTRLIKE,CTRDISLIKE,SEGNALATA,INFO,DATAREC) values ('3','4','12','3','1','Molto bello chiudere il maggiordomo dentro il freezer!!',to_timestamp('11-MAR-16 16:45:54,640000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.RECENSIONE (IDUTENTE,IDGIOCO,CTRLIKE,CTRDISLIKE,SEGNALATA,INFO,DATAREC) values ('4','1','122','33','0','Ci giocherei anche dormendo!',to_timestamp('11-MAR-16 16:50:26,003000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.RECENSIONE (IDUTENTE,IDGIOCO,CTRLIKE,CTRDISLIKE,SEGNALATA,INFO,DATAREC) values ('4','4','3','11','1','Bel chiuloooo!',to_timestamp('11-MAR-16 16:50:52,887000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.RECENSIONE (IDUTENTE,IDGIOCO,CTRLIKE,CTRDISLIKE,SEGNALATA,INFO,DATAREC) values ('3','1','359','67','0','Piace moooolto a Matteo (nick skyzzo)',to_timestamp('11-MAR-16 16:51:48,036000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.RECENSIONE (IDUTENTE,IDGIOCO,CTRLIKE,CTRDISLIKE,SEGNALATA,INFO,DATAREC) values ('5','1','751','42','1','Beh ragazzi... assolutamente da avere in casa! Parola di skyzzo!!!',to_timestamp('11-MAR-16 16:55:06,004000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.RECENSIONE (IDUTENTE,IDGIOCO,CTRLIKE,CTRDISLIKE,SEGNALATA,INFO,DATAREC) values ('5','4','1','0','0','Woooowwww',to_timestamp('11-MAR-16 16:55:29,471000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.RECENSIONE (IDUTENTE,IDGIOCO,CTRLIKE,CTRDISLIKE,SEGNALATA,INFO,DATAREC) values ('5','2','1','1','0','Mahhhh',to_timestamp('11-MAR-16 16:55:50,158000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.RECENSIONE (IDUTENTE,IDGIOCO,CTRLIKE,CTRDISLIKE,SEGNALATA,INFO,DATAREC) values ('3','2','3','1','0','Doppio Woooooooooowwww',to_timestamp('11-MAR-16 16:56:19,559000000','DD-MON-RR HH24:MI:SSXFF'));
REM INSERTING into MOBA.PIATTAFORMA
SET DEFINE OFF;
Insert into MOBA.PIATTAFORMA (IDPIATTAFORMA,NOME,BRAND,LOGO,INFO) values ('1','PC','VARIO','PC.png',null);
Insert into MOBA.PIATTAFORMA (IDPIATTAFORMA,NOME,BRAND,LOGO,INFO) values ('2','PS2','SONY','PS2.png',null);
Insert into MOBA.PIATTAFORMA (IDPIATTAFORMA,NOME,BRAND,LOGO,INFO) values ('3','PS3','SONY','PS3.png',null);
Insert into MOBA.PIATTAFORMA (IDPIATTAFORMA,NOME,BRAND,LOGO,INFO) values ('4','PS4','SONY','PS4.png',null);
Insert into MOBA.PIATTAFORMA (IDPIATTAFORMA,NOME,BRAND,LOGO,INFO) values ('5','XBOX ONE','Microsoft','XBOXONE.png',null);
Insert into MOBA.PIATTAFORMA (IDPIATTAFORMA,NOME,BRAND,LOGO,INFO) values ('6','XBOX 360','Microsoft','XBOX360.png',null);
Insert into MOBA.PIATTAFORMA (IDPIATTAFORMA,NOME,BRAND,LOGO,INFO) values ('7','Wii','Nintendo','Wii.png',null);
Insert into MOBA.PIATTAFORMA (IDPIATTAFORMA,NOME,BRAND,LOGO,INFO) values ('8','WiiU','Nintendo','WiiU.png',null);
Insert into MOBA.PIATTAFORMA (IDPIATTAFORMA,NOME,BRAND,LOGO,INFO) values ('9','DSi','Nintendo','DSi.png',null);
Insert into MOBA.PIATTAFORMA (IDPIATTAFORMA,NOME,BRAND,LOGO,INFO) values ('10','3DS','Nintendo','3DS.png',null);
Insert into MOBA.PIATTAFORMA (IDPIATTAFORMA,NOME,BRAND,LOGO,INFO) values ('11','Android','Google Play','Android.png',null);
Insert into MOBA.PIATTAFORMA (IDPIATTAFORMA,NOME,BRAND,LOGO,INFO) values ('12','iOS','App Store','iOS.png',null);
REM INSERTING into MOBA.UTENTE
SET DEFINE OFF;
Insert into MOBA.UTENTE (IDUTENTE,ADMIN,NICKNAME,EMAIL,PASSWORD,NOME,COGNOME,GRADO,AVATAR,DATAREG,INFO) values ('1','1','admin','admin@moba.it','admin','Alessandro','Galiano','Admin','MOBAavatar.png',to_timestamp('09-MAR-16 12:13:13,708000000','DD-MON-RR HH24:MI:SSXFF'),null);
Insert into MOBA.UTENTE (IDUTENTE,ADMIN,NICKNAME,EMAIL,PASSWORD,NOME,COGNOME,GRADO,AVATAR,DATAREG,INFO) values ('2','0','nitro','nitrotodabeat@gmail.com','Password1','Guglielmo','Faiola','Scudiero','MOBAavatar.png',to_timestamp('09-MAR-16 12:16:17,604000000','DD-MON-RR HH24:MI:SSXFF'),'Sono esplosivo!');
Insert into MOBA.UTENTE (IDUTENTE,ADMIN,NICKNAME,EMAIL,PASSWORD,NOME,COGNOME,GRADO,AVATAR,DATAREG,INFO) values ('3','0','ftrombetta','ftrombetta91@gmail.com','Password1','Filippo','Trombetta','Scudiero','U00003.jpg',to_timestamp('11-MAR-16 15:47:07,673000000','DD-MON-RR HH24:MI:SSXFF'),'Spero di essere assunto in ATS Yeahhh!');
Insert into MOBA.UTENTE (IDUTENTE,ADMIN,NICKNAME,EMAIL,PASSWORD,NOME,COGNOME,GRADO,AVATAR,DATAREG,INFO) values ('4','0','crascioni','c.rascioni@gmail.com','Password1','Christian',null,'Fante','MOBAavatar.png',to_timestamp('11-MAR-16 16:49:41,568000000','DD-MON-RR HH24:MI:SSXFF'),null);
Insert into MOBA.UTENTE (IDUTENTE,ADMIN,NICKNAME,EMAIL,PASSWORD,NOME,COGNOME,GRADO,AVATAR,DATAREG,INFO) values ('5','0','skyzzo','skyzzo.matteo@gmail.com','Password1','Matteo','Di Girolamo','Capitano','MOBAavatar.png',to_timestamp('11-MAR-16 16:53:42,563000000','DD-MON-RR HH24:MI:SSXFF'),'Il mio nick mi precede! ;)');
Insert into MOBA.UTENTE (IDUTENTE,ADMIN,NICKNAME,EMAIL,PASSWORD,NOME,COGNOME,GRADO,AVATAR,DATAREG,INFO) values ('41','0','emarchionne','emanuelemarchionne@gmail.com','Password2','Emanuele','Marchionne','Peone','MOBAavatar.png',to_timestamp('14-MAR-16 09:37:06,645000000','DD-MON-RR HH24:MI:SSXFF'),null);
REM INSERTING into MOBA.VALUTAZIONE
SET DEFINE OFF;
Insert into MOBA.VALUTAZIONE (IDUTENTE,IDGIOCO,VOTO) values ('5','1','10');
Insert into MOBA.VALUTAZIONE (IDUTENTE,IDGIOCO,VOTO) values ('2','1','7');
Insert into MOBA.VALUTAZIONE (IDUTENTE,IDGIOCO,VOTO) values ('2','2','5');
Insert into MOBA.VALUTAZIONE (IDUTENTE,IDGIOCO,VOTO) values ('2','3','9');
Insert into MOBA.VALUTAZIONE (IDUTENTE,IDGIOCO,VOTO) values ('3','1','8');
Insert into MOBA.VALUTAZIONE (IDUTENTE,IDGIOCO,VOTO) values ('3','4','7');
Insert into MOBA.VALUTAZIONE (IDUTENTE,IDGIOCO,VOTO) values ('3','3','10');
Insert into MOBA.VALUTAZIONE (IDUTENTE,IDGIOCO,VOTO) values ('3','2','6');
Insert into MOBA.VALUTAZIONE (IDUTENTE,IDGIOCO,VOTO) values ('2','4','10');
Insert into MOBA.VALUTAZIONE (IDUTENTE,IDGIOCO,VOTO) values ('5','2','8');
Insert into MOBA.VALUTAZIONE (IDUTENTE,IDGIOCO,VOTO) values ('5','3','4');
Insert into MOBA.VALUTAZIONE (IDUTENTE,IDGIOCO,VOTO) values ('5','4','9');
--------------------------------------------------------
--  DDL for Index CATEGORIA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."CATEGORIA_PK" ON "MOBA"."CATEGORIA" ("IDCATEGORIA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CATEGORIA_UX_NOME
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."CATEGORIA_UX_NOME" ON "MOBA"."CATEGORIA" ("NOME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GIOCO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."GIOCO_PK" ON "MOBA"."GIOCO" ("IDGIOCO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GIOCO_UX_TITOLO
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."GIOCO_UX_TITOLO" ON "MOBA"."GIOCO" ("TITOLO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GIOCOPIATTA_UX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."GIOCOPIATTA_UX" ON "MOBA"."GIOCOPIATTA" ("IDGIOCO", "IDPIATTAFORMA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GRADO_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."GRADO_UK" ON "MOBA"."GRADO" ("NOME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RECENSIONE_UX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."RECENSIONE_UX" ON "MOBA"."RECENSIONE" ("IDUTENTE", "IDGIOCO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PIATTAFORMA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."PIATTAFORMA_PK" ON "MOBA"."PIATTAFORMA" ("IDPIATTAFORMA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PIATTAFORMA_UX_NOME
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."PIATTAFORMA_UX_NOME" ON "MOBA"."PIATTAFORMA" ("NOME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index UTENTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."UTENTE_PK" ON "MOBA"."UTENTE" ("IDUTENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index UTENTE_UX_EMAIL
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."UTENTE_UX_EMAIL" ON "MOBA"."UTENTE" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index UTENTE_UX_NICKNAME
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."UTENTE_UX_NICKNAME" ON "MOBA"."UTENTE" ("NICKNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index VALUTAZIONE_UX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."VALUTAZIONE_UX" ON "MOBA"."VALUTAZIONE" ("IDUTENTE", "IDGIOCO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table CATEGORIA
--------------------------------------------------------

  ALTER TABLE "MOBA"."CATEGORIA" ADD CONSTRAINT "CATEGORIA_PK" PRIMARY KEY ("IDCATEGORIA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "MOBA"."CATEGORIA" MODIFY ("IDCATEGORIA" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."CATEGORIA" MODIFY ("NOME" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."CATEGORIA" MODIFY ("IMG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GIOCO
--------------------------------------------------------

  ALTER TABLE "MOBA"."GIOCO" ADD CONSTRAINT "GIOCO_PK" PRIMARY KEY ("IDGIOCO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "MOBA"."GIOCO" MODIFY ("IDGIOCO" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."GIOCO" MODIFY ("TITOLO" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."GIOCO" MODIFY ("SH" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."GIOCO" MODIFY ("PLAYERS" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."GIOCO" MODIFY ("WEB" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."GIOCO" MODIFY ("ETAMIN" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."GIOCO" MODIFY ("COSTOLANCIO" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."GIOCO" MODIFY ("IDCATEGORIA" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."GIOCO" MODIFY ("CONTRO" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."GIOCO" MODIFY ("IMG1" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."GIOCO" MODIFY ("VALUTAZIONESITO" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."GIOCO" MODIFY ("PRO" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."GIOCO" MODIFY ("DATAREG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GIOCOPIATTA
--------------------------------------------------------

  ALTER TABLE "MOBA"."GIOCOPIATTA" MODIFY ("IDGIOCO" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."GIOCOPIATTA" MODIFY ("IDPIATTAFORMA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GRADO
--------------------------------------------------------

  ALTER TABLE "MOBA"."GRADO" ADD CONSTRAINT "GRADO_UK" UNIQUE ("NOME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "MOBA"."GRADO" MODIFY ("NOME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RECENSIONE
--------------------------------------------------------

  ALTER TABLE "MOBA"."RECENSIONE" MODIFY ("IDUTENTE" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."RECENSIONE" MODIFY ("IDGIOCO" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."RECENSIONE" MODIFY ("CTRLIKE" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."RECENSIONE" MODIFY ("CTRDISLIKE" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."RECENSIONE" MODIFY ("SEGNALATA" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."RECENSIONE" MODIFY ("INFO" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."RECENSIONE" MODIFY ("DATAREC" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PIATTAFORMA
--------------------------------------------------------

  ALTER TABLE "MOBA"."PIATTAFORMA" ADD CONSTRAINT "PIATTAFORMA_PK" PRIMARY KEY ("IDPIATTAFORMA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "MOBA"."PIATTAFORMA" MODIFY ("IDPIATTAFORMA" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."PIATTAFORMA" MODIFY ("NOME" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."PIATTAFORMA" MODIFY ("BRAND" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."PIATTAFORMA" MODIFY ("LOGO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UTENTE
--------------------------------------------------------

  ALTER TABLE "MOBA"."UTENTE" MODIFY ("IDUTENTE" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."UTENTE" MODIFY ("ADMIN" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."UTENTE" MODIFY ("NICKNAME" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."UTENTE" MODIFY ("EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."UTENTE" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."UTENTE" MODIFY ("GRADO" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."UTENTE" MODIFY ("AVATAR" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."UTENTE" MODIFY ("DATAREG" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."UTENTE" ADD CONSTRAINT "UTENTE_PK" PRIMARY KEY ("IDUTENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table VALUTAZIONE
--------------------------------------------------------

  ALTER TABLE "MOBA"."VALUTAZIONE" MODIFY ("IDUTENTE" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."VALUTAZIONE" MODIFY ("IDGIOCO" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."VALUTAZIONE" MODIFY ("VOTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table GIOCO
--------------------------------------------------------

  ALTER TABLE "MOBA"."GIOCO" ADD CONSTRAINT "GIOCO_FK_IDCATEGORIA" FOREIGN KEY ("IDCATEGORIA")
	  REFERENCES "MOBA"."CATEGORIA" ("IDCATEGORIA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table GIOCOPIATTA
--------------------------------------------------------

  ALTER TABLE "MOBA"."GIOCOPIATTA" ADD CONSTRAINT "GIOCOPIATTA_FK_IDGIOCO" FOREIGN KEY ("IDGIOCO")
	  REFERENCES "MOBA"."GIOCO" ("IDGIOCO") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MOBA"."GIOCOPIATTA" ADD CONSTRAINT "GIOCOPIATTA_FK_IDPIATTAFORMA" FOREIGN KEY ("IDPIATTAFORMA")
	  REFERENCES "MOBA"."PIATTAFORMA" ("IDPIATTAFORMA") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RECENSIONE
--------------------------------------------------------

  ALTER TABLE "MOBA"."RECENSIONE" ADD CONSTRAINT "RECENSIONE_FK_IDGIOCO" FOREIGN KEY ("IDGIOCO")
	  REFERENCES "MOBA"."GIOCO" ("IDGIOCO") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MOBA"."RECENSIONE" ADD CONSTRAINT "RECENSIONE_FK_IDUTENTE" FOREIGN KEY ("IDUTENTE")
	  REFERENCES "MOBA"."UTENTE" ("IDUTENTE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table UTENTE
--------------------------------------------------------

  ALTER TABLE "MOBA"."UTENTE" ADD CONSTRAINT "UTENTE_FK_GRADO" FOREIGN KEY ("GRADO")
	  REFERENCES "MOBA"."GRADO" ("NOME") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VALUTAZIONE
--------------------------------------------------------

  ALTER TABLE "MOBA"."VALUTAZIONE" ADD CONSTRAINT "VALUTAZIONE_FK_IDGIOCO" FOREIGN KEY ("IDGIOCO")
	  REFERENCES "MOBA"."GIOCO" ("IDGIOCO") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MOBA"."VALUTAZIONE" ADD CONSTRAINT "VALUTAZIONE_FK_IDUTENTE" FOREIGN KEY ("IDUTENTE")
	  REFERENCES "MOBA"."UTENTE" ("IDUTENTE") ENABLE;
--------------------------------------------------------
--  DDL for Trigger UTENTE_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MOBA"."UTENTE_TRIG" 
   before insert on "MOBA"."UTENTE" 
   for each row 
begin  
   if inserting then 
      if :NEW."IDUTENTE" is null then 
         select UTENTE_SEQ.nextval into :NEW."IDUTENTE" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "MOBA"."UTENTE_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger GIOCO_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MOBA"."GIOCO_TRIG" 
   before insert on "MOBA"."GIOCO" 
   for each row 
begin  
   if inserting then 
      if :NEW."IDGIOCO" is null then 
         select GIOCO_SEQ.nextval into :NEW."IDGIOCO" from dual; 
      end if; 
   end if; 
end;
/
ALTER TRIGGER "MOBA"."GIOCO_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Synonymn DUAL
--------------------------------------------------------

  CREATE OR REPLACE PUBLIC SYNONYM "DUAL" FOR "SYS"."DUAL";