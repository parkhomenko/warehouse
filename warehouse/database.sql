--------------------------------------------------------
--  File created - понедельник-Май-20-2013   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CUSTOMERS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST"."CUSTOMERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence GOODS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST"."GOODS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence INFLOWS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST"."INFLOWS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence OUTFLOWS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST"."OUTFLOWS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST"."PRODUCTS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SHIPPERS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST"."SHIPPERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SPECIFICATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST"."SPECIFICATIONS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence WAREHOUSES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST"."WAREHOUSES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "TEST"."CUSTOMERS" 
   (	"ID" NUMBER(9,0), 
	"NAME" VARCHAR2(45 BYTE), 
	"REPRESENTATIVE" VARCHAR2(45 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table GOODS
--------------------------------------------------------

  CREATE TABLE "TEST"."GOODS" 
   (	"ID" NUMBER(9,0), 
	"NAME" VARCHAR2(45 BYTE), 
	"UNITS" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table INFLOWS
--------------------------------------------------------

  CREATE TABLE "TEST"."INFLOWS" 
   (	"ID" NUMBER(9,0), 
	"PRODUCT" NUMBER(9,0), 
	"AMOUNT" NUMBER(9,0), 
	"PRICE" NUMBER(9,2), 
	"SHIPPER" NUMBER(9,0), 
	"WAREHOUSE" NUMBER(9,0), 
	"INFLOWDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table OUTFLOWS
--------------------------------------------------------

  CREATE TABLE "TEST"."OUTFLOWS" 
   (	"ID" NUMBER(9,0), 
	"CUSTOMER" NUMBER(9,0), 
	"OUTFLOWDATE" DATE, 
	"INFLOW" NUMBER(9,0), 
	"AMOUNT" NUMBER(9,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PRODUCTS
--------------------------------------------------------

  CREATE TABLE "TEST"."PRODUCTS" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(45 BYTE), 
	"PRICE" NUMBER(15,2) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SHIPPERS
--------------------------------------------------------

  CREATE TABLE "TEST"."SHIPPERS" 
   (	"ID" NUMBER(9,0), 
	"NAME" VARCHAR2(45 BYTE), 
	"REPRESENTATIVE" VARCHAR2(45 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SPECIFICATIONS
--------------------------------------------------------

  CREATE TABLE "TEST"."SPECIFICATIONS" 
   (	"ID" NUMBER, 
	"PRODUCT" NUMBER, 
	"COMPONENT" NUMBER, 
	"PART" NUMBER(5,2) DEFAULT 0, 
	"BOUGHT" CHAR(1 BYTE) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table WAREHOUSES
--------------------------------------------------------

  CREATE TABLE "TEST"."WAREHOUSES" 
   (	"ID" NUMBER(9,0), 
	"NAME" VARCHAR2(45 BYTE), 
	"ADDRESS" VARCHAR2(128 BYTE), 
	"EMPLOYEES" NUMBER(5,0) DEFAULT NULL
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into TEST.CUSTOMERS
SET DEFINE OFF;
Insert into TEST.CUSTOMERS (ID,NAME,REPRESENTATIVE) values (1,'Customer 1','Petrov K.O.');
Insert into TEST.CUSTOMERS (ID,NAME,REPRESENTATIVE) values (21,'Customer 2','Morozyuk K.P.');
Insert into TEST.CUSTOMERS (ID,NAME,REPRESENTATIVE) values (22,'Customer 3','Antonov U.M.');
REM INSERTING into TEST.GOODS
SET DEFINE OFF;
Insert into TEST.GOODS (ID,NAME,UNITS) values (1,'Pencil','pcs');
Insert into TEST.GOODS (ID,NAME,UNITS) values (2,'Notepad','pcs');
Insert into TEST.GOODS (ID,NAME,UNITS) values (3,'Apple','kg');
REM INSERTING into TEST.INFLOWS
SET DEFINE OFF;
Insert into TEST.INFLOWS (ID,PRODUCT,AMOUNT,PRICE,SHIPPER,WAREHOUSE,INFLOWDATE) values (1,1,50,45.95,1,1,to_date('19-МАЙ-13','DD-MON-RR'));
Insert into TEST.INFLOWS (ID,PRODUCT,AMOUNT,PRICE,SHIPPER,WAREHOUSE,INFLOWDATE) values (2,3,25,25.25,1,2,to_date('25-СЕН-12','DD-MON-RR'));
Insert into TEST.INFLOWS (ID,PRODUCT,AMOUNT,PRICE,SHIPPER,WAREHOUSE,INFLOWDATE) values (21,2,17,5,22,3,to_date('25-СЕН-12','DD-MON-RR'));
Insert into TEST.INFLOWS (ID,PRODUCT,AMOUNT,PRICE,SHIPPER,WAREHOUSE,INFLOWDATE) values (22,3,65,1.05,21,2,to_date('05-СЕН-12','DD-MON-RR'));
Insert into TEST.INFLOWS (ID,PRODUCT,AMOUNT,PRICE,SHIPPER,WAREHOUSE,INFLOWDATE) values (23,3,56,1.03,21,3,to_date('05-СЕН-12','DD-MON-RR'));
REM INSERTING into TEST.OUTFLOWS
SET DEFINE OFF;
Insert into TEST.OUTFLOWS (ID,CUSTOMER,OUTFLOWDATE,INFLOW,AMOUNT) values (1,1,to_date('19-МАЙ-13','DD-MON-RR'),2,17);
Insert into TEST.OUTFLOWS (ID,CUSTOMER,OUTFLOWDATE,INFLOW,AMOUNT) values (2,1,to_date('19-МАЙ-13','DD-MON-RR'),2,5);
Insert into TEST.OUTFLOWS (ID,CUSTOMER,OUTFLOWDATE,INFLOW,AMOUNT) values (21,21,to_date('18-МАЙ-13','DD-MON-RR'),1,23);
REM INSERTING into TEST.PRODUCTS
SET DEFINE OFF;
Insert into TEST.PRODUCTS (ID,NAME,PRICE) values (1,'A',5);
Insert into TEST.PRODUCTS (ID,NAME,PRICE) values (2,'B',2);
Insert into TEST.PRODUCTS (ID,NAME,PRICE) values (3,'C',3);
Insert into TEST.PRODUCTS (ID,NAME,PRICE) values (4,'D',8);
Insert into TEST.PRODUCTS (ID,NAME,PRICE) values (5,'E',9);
Insert into TEST.PRODUCTS (ID,NAME,PRICE) values (6,'F',5);
Insert into TEST.PRODUCTS (ID,NAME,PRICE) values (7,'G',38);
Insert into TEST.PRODUCTS (ID,NAME,PRICE) values (8,'H',56);
Insert into TEST.PRODUCTS (ID,NAME,PRICE) values (9,'I',6);
Insert into TEST.PRODUCTS (ID,NAME,PRICE) values (21,'J',35);
Insert into TEST.PRODUCTS (ID,NAME,PRICE) values (22,'K',95);
REM INSERTING into TEST.SHIPPERS
SET DEFINE OFF;
Insert into TEST.SHIPPERS (ID,NAME,REPRESENTATIVE) values (1,'Shipper 1','Ivanov A.A.');
Insert into TEST.SHIPPERS (ID,NAME,REPRESENTATIVE) values (21,'Shipper 2','John Wayne');
Insert into TEST.SHIPPERS (ID,NAME,REPRESENTATIVE) values (22,'Shipper 3','Jack Sheppard');
REM INSERTING into TEST.SPECIFICATIONS
SET DEFINE OFF;
Insert into TEST.SPECIFICATIONS (ID,PRODUCT,COMPONENT,PART,BOUGHT) values (1,1,2,0.18,'0');
Insert into TEST.SPECIFICATIONS (ID,PRODUCT,COMPONENT,PART,BOUGHT) values (2,1,3,0.05,'0');
Insert into TEST.SPECIFICATIONS (ID,PRODUCT,COMPONENT,PART,BOUGHT) values (3,1,4,0.23,'0');
Insert into TEST.SPECIFICATIONS (ID,PRODUCT,COMPONENT,PART,BOUGHT) values (4,2,5,0.19,'1');
Insert into TEST.SPECIFICATIONS (ID,PRODUCT,COMPONENT,PART,BOUGHT) values (5,2,6,0.17,'0');
Insert into TEST.SPECIFICATIONS (ID,PRODUCT,COMPONENT,PART,BOUGHT) values (6,6,7,0.31,'1');
Insert into TEST.SPECIFICATIONS (ID,PRODUCT,COMPONENT,PART,BOUGHT) values (7,6,8,0.29,'1');
Insert into TEST.SPECIFICATIONS (ID,PRODUCT,COMPONENT,PART,BOUGHT) values (8,1,9,0.25,'1');
Insert into TEST.SPECIFICATIONS (ID,PRODUCT,COMPONENT,PART,BOUGHT) values (9,9,3,0.19,'0');
Insert into TEST.SPECIFICATIONS (ID,PRODUCT,COMPONENT,PART,BOUGHT) values (21,1,8,0.18,'1');
Insert into TEST.SPECIFICATIONS (ID,PRODUCT,COMPONENT,PART,BOUGHT) values (24,1,1,0.58,'1');
Insert into TEST.SPECIFICATIONS (ID,PRODUCT,COMPONENT,PART,BOUGHT) values (25,2,1,0.89,'1');
REM INSERTING into TEST.WAREHOUSES
SET DEFINE OFF;
Insert into TEST.WAREHOUSES (ID,NAME,ADDRESS,EMPLOYEES) values (1,'Warehouse 1','Donetsk, Artema, 25a',15);
Insert into TEST.WAREHOUSES (ID,NAME,ADDRESS,EMPLOYEES) values (2,'Warehouse 2','Donetsk, Universitetskaya, 15',10);
Insert into TEST.WAREHOUSES (ID,NAME,ADDRESS,EMPLOYEES) values (3,'Warehouse 3','Donetsk, Petrovskogo, 78b',13);
--------------------------------------------------------
--  DDL for Index SHIPPERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."SHIPPERS_PK" ON "TEST"."SHIPPERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index CUSTOMERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."CUSTOMERS_PK" ON "TEST"."CUSTOMERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SPECIFICATIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."SPECIFICATIONS_PK" ON "TEST"."SPECIFICATIONS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index GOODS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."GOODS_PK" ON "TEST"."GOODS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index INFLOWS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."INFLOWS_PK" ON "TEST"."INFLOWS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index OUTFLOWS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."OUTFLOWS_PK" ON "TEST"."OUTFLOWS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index WAREHOUSES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."WAREHOUSES_PK" ON "TEST"."WAREHOUSES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PRODUCTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST"."PRODUCTS_PK" ON "TEST"."PRODUCTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "TEST"."CUSTOMERS" MODIFY ("REPRESENTATIVE" NOT NULL ENABLE);
  ALTER TABLE "TEST"."CUSTOMERS" ADD CONSTRAINT "CUSTOMERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST"."CUSTOMERS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "TEST"."CUSTOMERS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table INFLOWS
--------------------------------------------------------

  ALTER TABLE "TEST"."INFLOWS" ADD CONSTRAINT "INFLOWS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST"."INFLOWS" MODIFY ("INFLOWDATE" NOT NULL ENABLE);
  ALTER TABLE "TEST"."INFLOWS" MODIFY ("WAREHOUSE" NOT NULL ENABLE);
  ALTER TABLE "TEST"."INFLOWS" MODIFY ("SHIPPER" NOT NULL ENABLE);
  ALTER TABLE "TEST"."INFLOWS" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "TEST"."INFLOWS" MODIFY ("AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "TEST"."INFLOWS" MODIFY ("PRODUCT" NOT NULL ENABLE);
  ALTER TABLE "TEST"."INFLOWS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SPECIFICATIONS
--------------------------------------------------------

  ALTER TABLE "TEST"."SPECIFICATIONS" ADD CONSTRAINT "SPECIFICATIONS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST"."SPECIFICATIONS" MODIFY ("BOUGHT" NOT NULL ENABLE);
  ALTER TABLE "TEST"."SPECIFICATIONS" MODIFY ("PART" NOT NULL ENABLE);
  ALTER TABLE "TEST"."SPECIFICATIONS" MODIFY ("COMPONENT" NOT NULL ENABLE);
  ALTER TABLE "TEST"."SPECIFICATIONS" MODIFY ("PRODUCT" NOT NULL ENABLE);
  ALTER TABLE "TEST"."SPECIFICATIONS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SHIPPERS
--------------------------------------------------------

  ALTER TABLE "TEST"."SHIPPERS" MODIFY ("REPRESENTATIVE" NOT NULL ENABLE);
  ALTER TABLE "TEST"."SHIPPERS" ADD CONSTRAINT "SHIPPERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST"."SHIPPERS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "TEST"."SHIPPERS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCTS
--------------------------------------------------------

  ALTER TABLE "TEST"."PRODUCTS" ADD CONSTRAINT "PRODUCTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST"."PRODUCTS" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "TEST"."PRODUCTS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "TEST"."PRODUCTS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WAREHOUSES
--------------------------------------------------------

  ALTER TABLE "TEST"."WAREHOUSES" MODIFY ("EMPLOYEES" NOT NULL ENABLE);
  ALTER TABLE "TEST"."WAREHOUSES" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "TEST"."WAREHOUSES" ADD CONSTRAINT "WAREHOUSES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST"."WAREHOUSES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "TEST"."WAREHOUSES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OUTFLOWS
--------------------------------------------------------

  ALTER TABLE "TEST"."OUTFLOWS" ADD CONSTRAINT "OUTFLOWS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST"."OUTFLOWS" MODIFY ("AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "TEST"."OUTFLOWS" MODIFY ("INFLOW" NOT NULL ENABLE);
  ALTER TABLE "TEST"."OUTFLOWS" MODIFY ("OUTFLOWDATE" NOT NULL ENABLE);
  ALTER TABLE "TEST"."OUTFLOWS" MODIFY ("CUSTOMER" NOT NULL ENABLE);
  ALTER TABLE "TEST"."OUTFLOWS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GOODS
--------------------------------------------------------

  ALTER TABLE "TEST"."GOODS" MODIFY ("UNITS" NOT NULL ENABLE);
  ALTER TABLE "TEST"."GOODS" ADD CONSTRAINT "GOODS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TEST"."GOODS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "TEST"."GOODS" MODIFY ("ID" NOT NULL ENABLE);


--------------------------------------------------------
--  Ref Constraints for Table INFLOWS
--------------------------------------------------------

  ALTER TABLE "TEST"."INFLOWS" ADD CONSTRAINT "INFLOWS_GOODS_FK1" FOREIGN KEY ("PRODUCT")
	  REFERENCES "TEST"."GOODS" ("ID") ENABLE;
  ALTER TABLE "TEST"."INFLOWS" ADD CONSTRAINT "INFLOWS_SHIPPERS_FK1" FOREIGN KEY ("SHIPPER")
	  REFERENCES "TEST"."SHIPPERS" ("ID") ENABLE;
  ALTER TABLE "TEST"."INFLOWS" ADD CONSTRAINT "INFLOWS_WAREHOUSES_FK1" FOREIGN KEY ("WAREHOUSE")
	  REFERENCES "TEST"."WAREHOUSES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OUTFLOWS
--------------------------------------------------------

  ALTER TABLE "TEST"."OUTFLOWS" ADD CONSTRAINT "OUTFLOWS_CUSTOMERS_FK1" FOREIGN KEY ("CUSTOMER")
	  REFERENCES "TEST"."CUSTOMERS" ("ID") ENABLE;
  ALTER TABLE "TEST"."OUTFLOWS" ADD CONSTRAINT "OUTFLOWS_INFLOWS_FK1" FOREIGN KEY ("INFLOW")
	  REFERENCES "TEST"."INFLOWS" ("ID") ENABLE;


--------------------------------------------------------
--  Ref Constraints for Table SPECIFICATIONS
--------------------------------------------------------

  ALTER TABLE "TEST"."SPECIFICATIONS" ADD CONSTRAINT "SPECIFICATIONS_PRODUCTS_FK1" FOREIGN KEY ("PRODUCT")
	  REFERENCES "TEST"."PRODUCTS" ("ID") ENABLE;
  ALTER TABLE "TEST"."SPECIFICATIONS" ADD CONSTRAINT "SPECIFICATIONS_PRODUCTS_FK2" FOREIGN KEY ("COMPONENT")
	  REFERENCES "TEST"."PRODUCTS" ("ID") ENABLE;

--------------------------------------------------------
--  DDL for Trigger CUSTOMERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST"."CUSTOMERS_TRG" BEFORE INSERT ON CUSTOMERS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.ID IS NULL THEN
      SELECT CUSTOMERS_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "TEST"."CUSTOMERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger GOODS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST"."GOODS_TRG" BEFORE INSERT ON GOODS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.ID IS NULL THEN
      SELECT GOODS_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "TEST"."GOODS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INFLOWS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST"."INFLOWS_TRG" BEFORE INSERT ON INFLOWS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.ID IS NULL THEN
      SELECT INFLOWS_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "TEST"."INFLOWS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger OUTFLOWS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST"."OUTFLOWS_TRG" BEFORE INSERT ON OUTFLOWS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.ID IS NULL THEN
      SELECT OUTFLOWS_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "TEST"."OUTFLOWS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRODUCTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST"."PRODUCTS_TRG" BEFORE INSERT ON PRODUCTS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.ID IS NULL THEN
      SELECT PRODUCTS_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "TEST"."PRODUCTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SHIPPERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST"."SHIPPERS_TRG" BEFORE INSERT ON SHIPPERS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.ID IS NULL THEN
      SELECT SHIPPERS_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "TEST"."SHIPPERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SPECIFICATIONS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST"."SPECIFICATIONS_TRG" BEFORE INSERT ON SPECIFICATIONS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.ID IS NULL THEN
      SELECT SPECIFICATIONS_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "TEST"."SPECIFICATIONS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger WAREHOUSES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TEST"."WAREHOUSES_TRG" BEFORE INSERT ON WAREHOUSES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.ID IS NULL THEN
      SELECT WAREHOUSES_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "TEST"."WAREHOUSES_TRG" ENABLE;
