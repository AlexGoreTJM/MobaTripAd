--------------------------------------------------------
--  File creato - giovedì-marzo-17-2016   
--------------------------------------------------------
DROP TABLE "MOBA"."VALUTAZIONE" cascade constraints;
DROP TABLE "MOBA"."SHOP" cascade constraints;
DROP TABLE "MOBA"."UTENTE" cascade constraints;
DROP TABLE "MOBA"."RECENSIONE" cascade constraints;
DROP TABLE "MOBA"."PIATTAFORMA" cascade constraints;
DROP TABLE "MOBA"."GRADO" cascade constraints;
DROP TABLE "MOBA"."GIOCOPIATTA" cascade constraints;
DROP TABLE "MOBA"."GIOCO" cascade constraints;
DROP TABLE "MOBA"."CATEGORIA" cascade constraints;
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
--------------------------------------------------------
--  DDL for Table SHOP
--------------------------------------------------------

  CREATE TABLE "MOBA"."SHOP" 
   (	"IDGIOCO" NUMBER, 
	"LINK" VARCHAR2(400 BYTE), 
	"IDPIATTAFORMA" NUMBER
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
REM INSERTING into MOBA.SHOP
SET DEFINE OFF;
Insert into MOBA.SHOP (IDGIOCO,LINK,IDPIATTAFORMA) values ('1','http://www.amazon.it/gp/product/B005NH6JIW?redirect=true&ref_=s9_simh_gw_p63_d0_i1','1');
REM INSERTING into MOBA.UTENTE
SET DEFINE OFF;
Insert into MOBA.UTENTE (IDUTENTE,ADMIN,NICKNAME,EMAIL,PASSWORD,NOME,COGNOME,GRADO,AVATAR,DATAREG,INFO) values ('1','1','admin','admin@moba.it','admin','Alessandro','Galiano','Admin','MOBAavatar.png',to_timestamp('09-MAR-16 12:13:13,708000000','DD-MON-RR HH24:MI:SSXFF'),null);
Insert into MOBA.UTENTE (IDUTENTE,ADMIN,NICKNAME,EMAIL,PASSWORD,NOME,COGNOME,GRADO,AVATAR,DATAREG,INFO) values ('2','0','nitro','nitrotodabeat@gmail.com','Password1','Guglielmo','Faiola','Recluta','MOBAavatar.png',to_timestamp('09-MAR-16 12:16:17,604000000','DD-MON-RR HH24:MI:SSXFF'),'Sono esplosivo!');
Insert into MOBA.UTENTE (IDUTENTE,ADMIN,NICKNAME,EMAIL,PASSWORD,NOME,COGNOME,GRADO,AVATAR,DATAREG,INFO) values ('3','0','ftrombetta','ftrombetta91@gmail.com','Password1','Filippo','Trombetta','Scudiero','U00003.jpg',to_timestamp('11-MAR-16 15:47:07,673000000','DD-MON-RR HH24:MI:SSXFF'),'Spero di essere assunto in ATS Yeahhh!');
Insert into MOBA.UTENTE (IDUTENTE,ADMIN,NICKNAME,EMAIL,PASSWORD,NOME,COGNOME,GRADO,AVATAR,DATAREG,INFO) values ('4','0','crascioni','c.rascioni@gmail.com','Password1','Christian',null,'Fante','MOBAavatar.png',to_timestamp('11-MAR-16 16:49:41,568000000','DD-MON-RR HH24:MI:SSXFF'),null);
Insert into MOBA.UTENTE (IDUTENTE,ADMIN,NICKNAME,EMAIL,PASSWORD,NOME,COGNOME,GRADO,AVATAR,DATAREG,INFO) values ('5','0','skyzzo','skyzzo.matteo@gmail.com','Password1','Matteo','Di Girolamo','Capitano','MOBAavatar.png',to_timestamp('11-MAR-16 16:53:42,563000000','DD-MON-RR HH24:MI:SSXFF'),'Il mio nick mi precede! ;)');
Insert into MOBA.UTENTE (IDUTENTE,ADMIN,NICKNAME,EMAIL,PASSWORD,NOME,COGNOME,GRADO,AVATAR,DATAREG,INFO) values ('41','1','emarchionne','emanuelemarchionne@gmail.com','Password2','Emanuele','Marchionne','Peone','U000041.jpg',to_timestamp('14-MAR-16 09:37:06,645000000','DD-MON-RR HH24:MI:SSXFF'),null);
REM INSERTING into MOBA.RECENSIONE
SET DEFINE OFF;
Insert into MOBA.RECENSIONE (IDUTENTE,IDGIOCO,CTRLIKE,CTRDISLIKE,SEGNALATA,INFO,DATAREC) values ('2','2','5','2','0','bellooo! Se possibile prendete la versione x PC',to_timestamp('11-MAR-16 16:28:42,722000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.RECENSIONE (IDUTENTE,IDGIOCO,CTRLIKE,CTRDISLIKE,SEGNALATA,INFO,DATAREC) values ('2','3','4','5','0','WoW lo consiglio a tutti!!!',to_timestamp('07-MAR-16 16:29:33,661000000','DD-MON-RR HH24:MI:SSXFF'));
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
REM INSERTING into MOBA.GIOCOPIATTA
SET DEFINE OFF;
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('1','1');
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
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('5','1');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('5','5');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('6','1');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('7','1');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('7','3');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('7','6');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('7','7');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('7','10');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('8','3');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('9','1');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('9','3');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('9','6');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('9','7');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('9','9');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('10','3');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('11','1');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('11','2');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('11','4');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('11','7');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('11','11');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('11','12');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('12','3');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('12','6');
Insert into MOBA.GIOCOPIATTA (IDGIOCO,IDPIATTAFORMA) values ('13','1');
REM INSERTING into MOBA.GIOCO
SET DEFINE OFF;
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('1','Warcraft III','Blizzard','1','1',to_date('03-LUG-02','DD-MON-RR'),'12','59,99','1','9','1) Tecnicamente ancora attuale
;
2) Coinvolgente ed immediato;
6) Appassionante, longevo e divertente;
3) Innovativo;
4) Ancora supportato dalla casa madre
;
5) Realizzazione tecnica ottima;
7) Ottima caratterizzazione delle razze
;
8) Tante novità;
9) Gameplay profondo.','1) Non eccessivamente profondo, a tratti ripetitivo.','G00001_1.jpg','G00001_2.jpg','https://www.youtube.com/embed/TFVP8pVGYsQ','http://us.blizzard.com/en-us/','entium 2 o sup','Un surrogato di azione e strategia in un ambientazione fantastica. Warcraft III è un vero gioco di strategia: non vi basterà costruire truppe e mandarle alla garibaldina contro il nemico, bensì dovrete adottare una strategia oculata e darvi da fare in battaglia. Preparate il cartellino fuori dalla vostra camera con la scritta: "Do not disturb". Warcraft III è un vero e proprio capolavoro, consigliato a tutti quelli che amano questa tipologia di giochi: gli altri, lo provino, non rimarranno delusi. ',to_timestamp('08-MAR-16 10:30:26,846000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('2','Clash of Clans','SUPERCELL','1','1',to_date('07-OTT-13','DD-MON-RR'),'7','49,99','4','8','1) Molto semplice e immediato
;
2) Interessanti risvolti social
;
3) Controlli touch precisi, interfaccia funzionale;','1) Dinamiche freemium parecchio stringenti
;
2) Fase action semplicistica, contano solo i numeri
;
3) Nessuna novità rispetto al genere di appartenenza.','G00002_1.jpg','G00002_2.jpg','https://www.youtube.com/embed/Q6NkGf9nEvM','http://supercell.com/en/',null,'Prendendo tutto ciò che di buono è stato fatto dagli sviluppatori con il precedente Hey Day, Clash of Clans è sicuramente un titolo profondo sotto alcuni aspetti e piuttosto sempliciotto sotto altri. Benchè la sua struttura ed i suoi controlli immediati si sposino alla perfezione con il dictat del mercato mobile che richiede sessioni fulminee e non troppo impegnative da vivere nei momenti più disparati della giornata, la sua componente strategica solo accennata potrebbe far storcere il naso a quei giocatori che, date le potenzialità del gioco firmato Supercell, avevano riposto in esso le speranze di un titolo godibile anche per i palati più fini.
 ',to_timestamp('09-MAR-16 12:37:45,846000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('3','Fifa 16','EA','8','1',to_date('24-SET-15','DD-MON-RR'),'6','69,99','9','7','1) Realistico
;
2) Gameplay solido;
3) Sistema di crescita dei calciatori nella carriera
;
4) FUT Draft;
5) Nazionali femminili;
6) Tantissime licenze.','1) Giocabilità
;
2) Posizionamento dei portieri sui tiri da lontano
;
3) Nessuna novità per Carriera Giocatore e Pro Club.','G00003_1.jpg','G00003_2.jpg','https://www.youtube.com/embed/bwz98athxQ8','http://www.ea.com/',null,'Fifa 16 rappresenta il vero esordio della serie sulle console di nuova generazione, dopo due anni caratterizzati da troppi alti e bassi. Gli sviluppatori si sono impegnati a correggere tutte le debolezze del gameplay, fornendo armi importanti ai difensori per contrastare gli attaccanti, restituendo importanza al centrocampo, ora reparto fondamentale per costruire gioco, e riducendo sensibilmente l’efficacia dei giocatori capaci di affidarsi unicamente alla velocità. L’offerta delle modalità rimane ampia, con qualche update alla carriera allenatore, FUT Draft su Ultimate Team che permetterà di provare a tutti i migliori campioni e l’introduzione delle nazionali femminili, per un’esperienza di gameplay completamente diversa dal solito. Peccato solo non aver innovato la carriera giocatore, incapace di evolversi con una storia in grado di legare le diverse partite, e Pro Club, che paga il fatto di essere una delle modalità meno giocate all’interno del titolo. Fifa 16 rappresenta quindi un capitolo che gli appassionati non possono assolutamente farsi scappare, e riporta la serie ad un alto livello qualitativo dopo qualche anno di buio.',to_timestamp('09-MAR-16 12:41:13,838000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('4','Tomb Raider','Eidos Interactive','1','1',to_date('05-MAR-13','DD-MON-RR'),'12','49,99','5','8','1) Gameplay solidissimo che presenta sistemi automatizzati con criterio
2) Campagna piuttosto longeva e molto ben strutturata
3) Tecnicamente notevole e ricco di scene spettacolari
4) Il multiplayer è pur sempre un''aggiunta gradita','1) Manca di caratteristiche davvero distintive e di scelte di game design coraggiose;
2) La narrativa non colpisce nel segno per via della struttura del gioco
;
3) Abuso di scene cinematografiche;
4) Difficoltà bassa e I.A non brillante.','G00004_1.jpg','G00004_2.jpg','https://www.youtube.com/embed/NFhLS7DmLlc','https://eidosmontreal.com/',null,'I crediti conclusivi di Tomb Raider: a Survivor is Born recitano "grazie per aver giocato al nostro titolo, è il migliore che siamo in grado di sviluppare", e non c''è dubbio che i Crystal Dynamics abbiano messo l''anima nel loro ultimo lavoro. Il reboot delle avventure di Lara Croft è un action-adventure incredibilmente curato, che offre una campagna longeva e appassionante e un gameplay ben calcolato e solidissimo. Siamo dubbiosi però sul fatto che sia il massimo che questi sviluppatori sono in grado di creare. Quello che hanno sfornato è un gioco di altissimo livello, ma che propone principalmente elementi già visti in alcuni dei migliori esponenti del genere e non riesce a mettere in campo caratteristiche distintive davvero uniche. Con un pò più di coraggio e un''enfasi maggiore sull''elemento survival sarebbe stato un videogame davvero indimenticabile, così come lo erano i primi capitoli.',to_timestamp('11-MAR-16 16:41:42,937000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('5','Gears of War: Ultimate Edition','Epic Games','1','1',to_date('28-AGO-15','DD-MON-RR'),'13','39,99','3','7','1) Supporto per il 4K
;
2) Multiplayer e matchmaking pressoché perfetti
;
3) Personalizzazione completa dei comandi;
4) Qualche contenuto inedito.','1) Mancano alcuni settaggi e ci sono troppe limitazioni imposte da Microsoft
;
2) Mantiene diversi difetti tipici dell''''Unreal Engine
;
3) Lo streaming delle texture non è sempre ottimale.','G00005_1.jpg','G00005_2.jpg','https://www.youtube.com/embed/9bMKMWZYvvU','https://epicgames.com/','OS: 64 bit Windows 10 – version 1511
Processor: Intel Core i5 @ 2.7Ghz or AMD FX 6-core
Memory: 8 GB RAM (2 GB VRAM)
Graphics: Geforce GTX 650 Ti or Radeon R7 260x
Hard Drive: 60 GB available space
DirectX 12','Gears of War: Ultimate Edition per Windows 10 rappresenta un ottimo lavoro di conversione, con pochissimi punti deboli. Il supporto per il 4K, i contenuti esclusivi, la solidita del multiplayer e del comparto tecnico sono tutti valori di grande importanza, che sul piatto della bilancia pesano molto di più delle poche mancanze di questa versione.',to_timestamp('15-MAR-16 09:26:35,695000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('6','Dota 2','Valve Software','1','1',to_date('20-DIC-12','DD-MON-RR'),'15','44,99','2','8','1) Gameplay tattico, bilanciato ed estremamente skill based
;
2) Una miriade di eroi tra cui scegliere;
3) Davvero free to play;
4) Continuamente aggiornato;
5) Vanta il miglior spectator mode di sempre
.

','1) Mancano alcune delle funzionalità promesse
;
2) Community elitaria e caustica, spesso non facile da digerire
;
3) Il tutorial mode insegna solo le basi.','G00006_1.jpg','G00006_2.jpg','https://www.youtube.com/embed/5MuZmHEGqXQ','http://www.valvesoftware.com/','Processore Pentium 4 3.0 GHz
1 GB RAM
supporto DirectX 9, DirectX 11, OpenGL 2.1
Windows XP/Vista/7
Linux
Mac OS X 10.7','DOTA 2 è ufficialmente uscito, e ha dimostrato chiaramente da subito di essere uno dei dominatori incontrastati del genere che il suo diretto predecessore ha creato. Siamo davanti a un free to play vero, estremamente affinato e divertente, che offre un gameplay bilanciato, tattico e profondissimo ancora oggi ineguagliato dalla concorrenza dei dota-like. 
L''uscita in realtà ci ha parzialmente deluso, lasciando fuori alcuni elementi molto interessanti annunciati durante la beta. Tuttavia questo resta uno dei titoli più curati e gustosi in circolazione, un''opera in costante evoluzione che nessun amante della strategia dovrebbe ignorare. Un solo avvertimento: se vi scaldate facilmente, occhio alla community. E'' persino peggiorata rispetto all''acida palude ricca di troll e gente arrabbiata vista in passato.',to_timestamp('15-MAR-16 09:37:32,590000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('7','Need for Speed: The Run','Blackbox Studios','8','1',to_date('11-NOV-11','DD-MON-RR'),'13','34,99','6','8','1) Spettacolare;
2) Giocabilità arcade molto godibile
;
3) Modalità Sfide ricca ed assortita.','1) Online risicato
;
2) Diversi problemi tecnici
;
3) Reset insopportabili;
4) IA palesemente fasulla.','G00007_1.jpg','G00007_2.jpg','https://www.youtube.com/embed/vQwafjHzvQA','http://www.blackboxgames.com/','OS: Windows Vista (SP2) o Windows 7 (SP1)
CPU: 2.4 GHz Intel Core 2 Duo o AMD equivalente
RAM: 3 GB
HDD: 18 GB
GPU: ATI Radeon 4870 con 512 MB di RAM o NVIDIA GeForce 9800 GT con 512 MB di RAM
Audio: Scheda compatibile DirectX
Internet: 512Kbps o più veloce','Il lavoro di EA Black Box, sebbene lontano dal rovinoso Undercover, non riesce a brillare di luce propria nell’invidiabile genealogia della serie a causa di diversi problemi strutturali capaci di rovinare un''esperienza a tratti divertente. L''elevato livello di spettacolarità raggiunto da Need for Speed: The Run garantisce infatti momenti di intrattenimento altamente adrenalinico, tenuti insieme dalla modalità Corsa, inframmezzata da sequenze cinematografiche mai invadenti e discretamente dirette.
Purtroppo il tutto cade vittima di una realizzazione finale mal rifinita sotto il profilo del gameplay, piagato da un''IA artificiosa e da un insopportabile sistema di reset, e sotto quello grafico, buono nell''insieme ma approssimativo in diversi dettagli, ulteriormente rovinato dal frame rate poco stabile su console. Non gioca a vantaggio del prodotto la pochezza dell''online, che lascia solo alla modalità Sfide in Serie il difficile compito di prolungare una longevità altrimenti risicata. 
In definitiva, se siete fan della serie e pensate di poter tollerare qualche momento di frustrazione, tenete in considerazione il titolo per godere di alcuni momenti esagerati, nel senso più positivo del termine. Per tutti coloro invece in cerca semplicemente di un''esperienza arcade, il mercato propone titoli sicuramente più profondi e rifiniti.',to_timestamp('15-MAR-16 09:42:37,792000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('8','Ace Combat Infinity','Project Aces','1','1',to_date('28-MAG-14','DD-MON-RR'),'12','39,99','7','7','1) Il gameplay è quello di sempre
;
2) Alcune buone idee nel single player
;
3) Le sfide consentono di ottenere carburante extra.','1) Ill modello free to play appare controverso e limitante
;
2) Campagna troppo breve, online interessante ma ripetitivo
;
3) Tecnicamente datato.','G00008_1.jpg','G00008_2.jpg','https://www.youtube.com/embed/DzWnQL5DbuM','http://www.ign.com/companies/project-aces',null,'"Il team di Project Aces ha ascoltato con molta attenzione le richieste dei fan e con Ace Combat Infinity, combinerà tutte le migliori caratteristiche della serie con una vasta gamma di nuove sorprese". Così citava l''ultimo comunicato stampa e, di fatto, potrebbe aver davvero centrato il punto. Quanto di più spettacolare si è visto negli ultimi anni è stato preso e portato sotto lo stesso cielo, promettendo di regalare agli appassionati la più completa esperienza Ace Combat che possano desiderare. Il tutto free-to-play. 
Ace Combat Infinity non sembra aver approcciato al meglio un modello delicato e controverso come il free to play, che generalmente parte dai numeri per costruire un rapporto con gli utenti che porti poi alla tanto agognata monetizzazione. Sono infatti proprio i numeri che mancano, visto che le cinque missioni della campagna si completano in un nulla e l''unica modalità online disponibile esaurisce rapidamente il proprio appeal, anch''essa a causa di una dotazione limitata. Il gameplay è quello di Ace Combat, ci sono alcune buone idee e un interessante elemento di progressione rappresentato dallo sblocco degli aerei e delle armi, ma a fronte anche di una grafica datata ciò che Bandai Namco ha messo sul tavolo è un po'' poco per definire questo nuovo esperimento un successo.',to_timestamp('15-MAR-16 10:29:42,991000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('9','Prince of Persia: Le Sabbie Dimenticate','Ubisoft','1','0',to_date('20-MAG-10','DD-MON-RR'),'11','49,99','8','8','1) Ottimo "platforming"
;
2) Sistema di combattimento intrigante
;
3) Graficamente buono.','1) Non sfrutta le proprie potenzialità
;
2) Qualche baco qua e là;
3) Finisce troppo presto.','G00009_1.jpg','G00009_2.jpg','https://www.youtube.com/embed/7_ijyOIDlNY','https://www.ubisoft.com/it-IT/','SO: Windows XP/Windows Vista/Windows 7
CPU: Intel Pentium D 1.6 GHz dual-core/AMD Athlon 64 X2 3800+
RAM: 1 GB Windows XP/2 GB Windows Vista/2 GB Windows 7
VGA: Scheda Video 256 MB DirectX 9.0 con Shader Model 3.0 o superiore
AUDIO: DirectX 9.0
HARD-DISK: 8 GB
DVD-ROM: DVD-ROM dual-layer drive','Prince of Persia: Le Sabbie Dimenticate è un platform divertente e capace di presentare qualche idea interessante. Il suo più grande difetto è quello di stuzzicare il giocatore dotandolo di abilità intriganti e ben implementate a livello di gameplay, per poi metterlo prematuramente davanti ad un risicatissimo filmato finale. Inoltre il comparto estetico, sebbene si difenda molto bene, non può che impallidire di fronte alla maestosità della scorsa iterazione. In definitiva, un capitolo che piacerà agli appassionati della serie se sapranno tollerarne i punti deboli, ma troppo limitato per lasciare il segno. La speranza è che le buone idee abbozzate in questa incarnazione vengano sviscerate a fondo nel prossimo episodio della nuova saga iniziata due anni fa.',to_timestamp('15-MAR-16 10:56:37,714000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('10','Crash Bandicoot: Warped','Naughty Dog Software','1','1',to_date('23-OTT-08','DD-MON-RR'),'10','39,99','10','8','1) Ottima grafica.','1) Schema di gioco ormai sfruttato.','G00010_1.jpg','G00010_2.jpg','https://www.youtube.com/embed/jug-9SSL5GE','http://www.naughtydog.com/',null,'Crash Bandicot 3 è un ottimo platform che forse inizia a sentire il peso degli anni. Le novità inserite in questo cd non mancano anche se alla fine lo schema base di gioco non ha subito mutamenti e soffre di una certa ripetitività dell''azione. Sicuramente è il miglior episodio che sia stato pubblicato e quindi un acquisto consigliatissimo a chi si avvicina per la prima volta al mondo di Crash. Per gli altri il consiglio di comprarlo vale solo se siete dei veri fan della serie e siete curiosi di vedere le nuove ambientazioni che i Naughty Dog hanno preparato per voi.',to_timestamp('15-MAR-16 11:52:34,671000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('11','Resident Evil 4','Capcom','1','0',to_date('21-SET-11','DD-MON-RR'),'15','49,99','11','9','1) Azione veloce ed immediata
;
2) Gameplay rinnovato rispetto ai vecchi episodi
;
3) Presenza di extra esclusivi per la versione Ps2;
4) Sonoro coinvolgente;
5) Grafica favolosa.','1) Inferiore alla versione GameCube
;
2) Qualche calo di frame rate.','G00011_1.jpg','G00011_2.jpg','https://www.youtube.com/embed/7-DpUeN4tE8','http://www.capcom.com/',null,'Sei anni dopo Raccoon City, Leon Kennedy, ora agente dei servizi segreti statunitensi, viene mandato in missione in Europa. Il suo obiettivo: portare in salvo Ashley Graham, la figlia del presidente. Leon trova un uomo in un''abitazione tra le montagne e lo interroga su Ashley, ma non riceve risposta. All''improvviso, l''uomo si volta, cercando di colpirlo! 
Di colpo, gli orrori di Raccoon city riecheggiano nella memoria di Leon, che realizza subito una sola cosa: l''incubo non è ancora terminato.',to_timestamp('15-MAR-16 12:21:02,092000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('12','Tekken 6','Namco Bandai','2','0',to_date('30-OTT-09','DD-MON-RR'),'12','34,99','12','7','1) Gameplay collaudato e perfezionato
;
2) Tantissimi personaggi;
3) Un sacco di oggetti per personalizzare i combattenti
;
4) Molto longevo;','1) Tecnicamente deludente;
2) Modalità campagna poco più che un extra
;
3) Sonoro sotto tono;
4) Nessuna novità di rilievo.','G00012_1.jpg','G00012_2.jpg','https://www.youtube.com/embed/UXSeYmB8BWU','https://www.bandainamcoent.it/',null,'Senza dubbio, Tekken 6 ci ha convinti. Il gameplay è solido, fedele alla serie e ottimizzato al millimetro. Qualche piccola novità c''è e i più smaliziati non tarderanno a percepirne la presenza, anche se forse questa amatissima saga avrebbe meritato un esordio nella corrente generazione più incisivo. Ad abbassare il livello ci pensa infatti un comparto tecnico tutt''altro che esaltante, essendo questo a nostro parere, un elemento troppo importante per un genere come i picchia duro che vanta storicamente esemplari di assoluto valore. Inoltre la modalità campagna è risultata poco più che un extra, facendoci domandare se valeva la pena spendere tante risorse nell''implementarla, tralasciando così altri aspetti forse più importanti. In definitiva, il titolo merita di certo l''acquisto da parte degli affezionati, che crediamo non pretendano particolari rivoluzioni dalla propria serie preferita e che qui troveranno invece un elenco sterminato di personaggi da padroneggiare e di mosse da imparare. Per tutti gli altri, Tekken 6 è comunque ancora un ottimo picchia duro capace di intrattenere soprattutto se giocato in compagnia e non deluderà gli amanti del genere.',to_timestamp('15-MAR-16 14:27:12,664000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into MOBA.GIOCO (IDGIOCO,TITOLO,SH,PLAYERS,WEB,DATAUSCITA,ETAMIN,COSTOLANCIO,IDCATEGORIA,VALUTAZIONESITO,PRO,CONTRO,IMG1,IMG2,URLVIDEO,URLSH,REQUISITI,INFO,DATAREG) values ('13','World of Warcraft','Blizzard Entertainment','1','1',to_date('23-NOV-04','DD-MON-RR'),'11','49,99','13','9','1) Immediatezza di gioco
;
2) Atmosfera evocativa.','1) Imperfetto bilanciamento delle classi
;
2) Assenza di un solido sistema di PvP.','G00013_1.jpg','G00013_2.jpg','https://www.youtube.com/embed/GnY2hzzn7oU','http://eu.blizzard.com/it-it/','Pentium 3 o Athlon 800 MHz,
256 MB di RAM (poi 512 MB),
scheda video 3D con 32 MB,
DirectX 9.0c,
9 GB di spazio libero su hard disk (17 con The Burning Crusade e Wrath of the Lich King),
connessione a internet a banda larga','Le parole concessemi davvero non bastano per costruire un quadro esaustivo di questa meravigliosa produzione targata Blizzard. Ogni aspetto del gioco, dalla crescita del personaggio allo sviluppo delle "professions" alla immediatezza e varietà delle quest proposte contribuiscono a fare di World of Warcraft un punto di riferimento per quanto riguarda l''universo dei MMORPG. Inoltre, cosa a tratti ancora più allettante, si nota che WoW è tutt''altro che definitivo. Nuovi elementi si aggiungeranno in futuro e ulteriori aggiustamenti saranno apportati al sistema di gioco, che dunque diverrà ancora più solido e bilanciato. Nel momento in cui scrivo una corposissima patch ricca di contenuti è oramai ai lavori terminali e altre idee bollono nel pentolone della Blizzard. Correte a giocarci!',to_timestamp('15-MAR-16 14:49:33,078000000','DD-MON-RR HH24:MI:SSXFF'));
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
--------------------------------------------------------
--  DDL for Index VALUTAZIONE_UX
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."VALUTAZIONE_UX" ON "MOBA"."VALUTAZIONE" ("IDUTENTE", "IDGIOCO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SHOP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."SHOP_PK" ON "MOBA"."SHOP" ("IDGIOCO", "IDPIATTAFORMA") 
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
--  DDL for Index GRADO_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOBA"."GRADO_UK" ON "MOBA"."GRADO" ("NOME") 
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
--  Constraints for Table VALUTAZIONE
--------------------------------------------------------

  ALTER TABLE "MOBA"."VALUTAZIONE" MODIFY ("IDUTENTE" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."VALUTAZIONE" MODIFY ("IDGIOCO" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."VALUTAZIONE" MODIFY ("VOTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SHOP
--------------------------------------------------------

  ALTER TABLE "MOBA"."SHOP" ADD CONSTRAINT "SHOP_PK" PRIMARY KEY ("IDGIOCO", "IDPIATTAFORMA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "MOBA"."SHOP" MODIFY ("IDGIOCO" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."SHOP" MODIFY ("LINK" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."SHOP" MODIFY ("IDPIATTAFORMA" NOT NULL ENABLE);
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
--  Constraints for Table GRADO
--------------------------------------------------------

  ALTER TABLE "MOBA"."GRADO" ADD CONSTRAINT "GRADO_UK" UNIQUE ("NOME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "MOBA"."GRADO" MODIFY ("NOME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GIOCOPIATTA
--------------------------------------------------------

  ALTER TABLE "MOBA"."GIOCOPIATTA" MODIFY ("IDGIOCO" NOT NULL ENABLE);
 
  ALTER TABLE "MOBA"."GIOCOPIATTA" MODIFY ("IDPIATTAFORMA" NOT NULL ENABLE);
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
--  Ref Constraints for Table VALUTAZIONE
--------------------------------------------------------

  ALTER TABLE "MOBA"."VALUTAZIONE" ADD CONSTRAINT "VALUTAZIONE_FK_IDGIOCO" FOREIGN KEY ("IDGIOCO")
	  REFERENCES "MOBA"."GIOCO" ("IDGIOCO") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MOBA"."VALUTAZIONE" ADD CONSTRAINT "VALUTAZIONE_FK_IDUTENTE" FOREIGN KEY ("IDUTENTE")
	  REFERENCES "MOBA"."UTENTE" ("IDUTENTE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table UTENTE
--------------------------------------------------------

  ALTER TABLE "MOBA"."UTENTE" ADD CONSTRAINT "UTENTE_FK_GRADO" FOREIGN KEY ("GRADO")
	  REFERENCES "MOBA"."GRADO" ("NOME") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RECENSIONE
--------------------------------------------------------

  ALTER TABLE "MOBA"."RECENSIONE" ADD CONSTRAINT "RECENSIONE_FK_IDGIOCO" FOREIGN KEY ("IDGIOCO")
	  REFERENCES "MOBA"."GIOCO" ("IDGIOCO") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MOBA"."RECENSIONE" ADD CONSTRAINT "RECENSIONE_FK_IDUTENTE" FOREIGN KEY ("IDUTENTE")
	  REFERENCES "MOBA"."UTENTE" ("IDUTENTE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table GIOCOPIATTA
--------------------------------------------------------

  ALTER TABLE "MOBA"."GIOCOPIATTA" ADD CONSTRAINT "GIOCOPIATTA_FK_IDGIOCO" FOREIGN KEY ("IDGIOCO")
	  REFERENCES "MOBA"."GIOCO" ("IDGIOCO") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MOBA"."GIOCOPIATTA" ADD CONSTRAINT "GIOCOPIATTA_FK_IDPIATTAFORMA" FOREIGN KEY ("IDPIATTAFORMA")
	  REFERENCES "MOBA"."PIATTAFORMA" ("IDPIATTAFORMA") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table GIOCO
--------------------------------------------------------

  ALTER TABLE "MOBA"."GIOCO" ADD CONSTRAINT "GIOCO_FK_IDCATEGORIA" FOREIGN KEY ("IDCATEGORIA")
	  REFERENCES "MOBA"."CATEGORIA" ("IDCATEGORIA") ENABLE;
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
