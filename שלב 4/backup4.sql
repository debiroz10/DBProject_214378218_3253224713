prompt PL/SQL Developer import file
prompt Created on יום שלישי 23 יולי 2024 by IMOE001
set feedback off
set define off
prompt Creating CLIENT...
create table CLIENT
(
  clientid   VARCHAR2(9) not null,
  clientname VARCHAR2(40) not null,
  phone      VARCHAR2(20) not null,
  address    VARCHAR2(30),
  birthdate  DATE
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLIENT
  add primary key (CLIENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EQUIPMENT...
create table EQUIPMENT
(
  equipmentid   NUMBER(5) not null,
  equipmentname VARCHAR2(50) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EQUIPMENT
  add primary key (EQUIPMENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PAKCAGE...
create table PAKCAGE
(
  packageid   NUMBER(5) not null,
  packagename VARCHAR2(50) not null,
  price       NUMBER(5) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PAKCAGE
  add primary key (PACKAGEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PAKCAGE
  add constraint CHK_PRICE
  check (Price > 0);

prompt Creating CONTAINING...
create table CONTAINING
(
  amountc     NUMBER(5) not null,
  equipmentid NUMBER(5) not null,
  packageid   NUMBER(5) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CONTAINING
  add primary key (EQUIPMENTID, PACKAGEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CONTAINING
  add foreign key (EQUIPMENTID)
  references EQUIPMENT (EQUIPMENTID);
alter table CONTAINING
  add foreign key (PACKAGEID)
  references PAKCAGE (PACKAGEID);

prompt Creating DESIGNER...
create table DESIGNER
(
  designername VARCHAR2(15) not null,
  designerid   NUMBER(5) not null,
  payment      NUMBER(5) default 0 not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DESIGNER
  add primary key (DESIGNERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating MEAL...
create table MEAL
(
  mealid    INTEGER not null,
  mealname  VARCHAR2(20) not null,
  mealprice INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEAL
  add primary key (MEALID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEAL
  add unique (MEALNAME)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SUPPLIER_...
create table SUPPLIER_
(
  supplierid      NUMBER(10) not null,
  suppliername    VARCHAR2(20) not null,
  area            VARCHAR2(30),
  provphonenumber VARCHAR2(20)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SUPPLIER_
  add primary key (SUPPLIERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PRODUCT...
create table PRODUCT
(
  prodid     INTEGER not null,
  prodname   VARCHAR2(20) not null,
  prodprice  INTEGER not null,
  prodamount INTEGER not null,
  provid     INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add primary key (PRODID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add unique (PRODNAME)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add constraint FK_PRODUCT_SUPPLIER foreign key (PROVID)
  references SUPPLIER_ (SUPPLIERID);

prompt Creating INGREDIENTS...
create table INGREDIENTS
(
  ingredamount INTEGER not null,
  prodid       INTEGER not null,
  mealid       INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INGREDIENTS
  add primary key (PRODID, MEALID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INGREDIENTS
  add foreign key (PRODID)
  references PRODUCT (PRODID);
alter table INGREDIENTS
  add foreign key (MEALID)
  references MEAL (MEALID);

prompt Creating INSTOCK...
create table INSTOCK
(
  amount      NUMBER(5) not null,
  supplierid  NUMBER(5) not null,
  equipmentid NUMBER(5) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INSTOCK
  add primary key (SUPPLIERID, EQUIPMENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INSTOCK
  add foreign key (SUPPLIERID)
  references SUPPLIER_ (SUPPLIERID);
alter table INSTOCK
  add foreign key (EQUIPMENTID)
  references EQUIPMENT (EQUIPMENTID);

prompt Creating INVITATION...
create table INVITATION
(
  finalprice   NUMBER(7),
  invitationid NUMBER(5) not null,
  datte        DATE not null,
  clientid     VARCHAR2(10) not null,
  designerid   NUMBER(5) not null,
  packageid    NUMBER,
  orderstatus  VARCHAR2(20)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INVITATION
  add primary key (INVITATIONID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INVITATION
  add foreign key (CLIENTID)
  references CLIENT (CLIENTID);
alter table INVITATION
  add foreign key (DESIGNERID)
  references DESIGNER (DESIGNERID);
alter table INVITATION
  add foreign key (PACKAGEID)
  references PAKCAGE (PACKAGEID);

prompt Creating MEALORDER...
create table MEALORDER
(
  mealamount INTEGER not null,
  mealid     INTEGER not null,
  orderid    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEALORDER
  add primary key (MEALID, ORDERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEALORDER
  add constraint FK_MEALORDER_INVITATION foreign key (ORDERID)
  references INVITATION (INVITATIONID);
alter table MEALORDER
  add foreign key (MEALID)
  references MEAL (MEALID);

prompt Creating WORKERS...
create table WORKERS
(
  workerid        INTEGER not null,
  workname        VARCHAR2(20) not null,
  workerjobtitle  VARCHAR2(20) not null,
  workersalary    INTEGER not null,
  workerbirthdate DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKERS
  add primary key (WORKERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating WORKERORDER...
create table WORKERORDER
(
  workerid INTEGER not null,
  orderid  INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKERORDER
  add primary key (WORKERID, ORDERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKERORDER
  add constraint FK_WORKERORDER_INVITATION foreign key (ORDERID)
  references INVITATION (INVITATIONID);
alter table WORKERORDER
  add foreign key (WORKERID)
  references WORKERS (WORKERID);

prompt Disabling triggers for CLIENT...
alter table CLIENT disable all triggers;
prompt Disabling triggers for EQUIPMENT...
alter table EQUIPMENT disable all triggers;
prompt Disabling triggers for PAKCAGE...
alter table PAKCAGE disable all triggers;
prompt Disabling triggers for CONTAINING...
alter table CONTAINING disable all triggers;
prompt Disabling triggers for DESIGNER...
alter table DESIGNER disable all triggers;
prompt Disabling triggers for MEAL...
alter table MEAL disable all triggers;
prompt Disabling triggers for SUPPLIER_...
alter table SUPPLIER_ disable all triggers;
prompt Disabling triggers for PRODUCT...
alter table PRODUCT disable all triggers;
prompt Disabling triggers for INGREDIENTS...
alter table INGREDIENTS disable all triggers;
prompt Disabling triggers for INSTOCK...
alter table INSTOCK disable all triggers;
prompt Disabling triggers for INVITATION...
alter table INVITATION disable all triggers;
prompt Disabling triggers for MEALORDER...
alter table MEALORDER disable all triggers;
prompt Disabling triggers for WORKERS...
alter table WORKERS disable all triggers;
prompt Disabling triggers for WORKERORDER...
alter table WORKERORDER disable all triggers;
prompt Disabling foreign key constraints for CONTAINING...
alter table CONTAINING disable constraint SYS_C007376;
alter table CONTAINING disable constraint SYS_C007377;
prompt Disabling foreign key constraints for PRODUCT...
alter table PRODUCT disable constraint FK_PRODUCT_SUPPLIER;
prompt Disabling foreign key constraints for INGREDIENTS...
alter table INGREDIENTS disable constraint SYS_C007333;
alter table INGREDIENTS disable constraint SYS_C007334;
prompt Disabling foreign key constraints for INSTOCK...
alter table INSTOCK disable constraint SYS_C007389;
alter table INSTOCK disable constraint SYS_C007390;
prompt Disabling foreign key constraints for INVITATION...
alter table INVITATION disable constraint SYS_C007397;
alter table INVITATION disable constraint SYS_C007398;
alter table INVITATION disable constraint SYS_C007399;
prompt Disabling foreign key constraints for MEALORDER...
alter table MEALORDER disable constraint FK_MEALORDER_INVITATION;
alter table MEALORDER disable constraint SYS_C007346;
prompt Disabling foreign key constraints for WORKERORDER...
alter table WORKERORDER disable constraint FK_WORKERORDER_INVITATION;
alter table WORKERORDER disable constraint SYS_C007357;
prompt Deleting WORKERORDER...
delete from WORKERORDER;
commit;
prompt Deleting WORKERS...
delete from WORKERS;
commit;
prompt Deleting MEALORDER...
delete from MEALORDER;
commit;
prompt Deleting INVITATION...
delete from INVITATION;
commit;
prompt Deleting INSTOCK...
delete from INSTOCK;
commit;
prompt Deleting INGREDIENTS...
delete from INGREDIENTS;
commit;
prompt Deleting PRODUCT...
delete from PRODUCT;
commit;
prompt Deleting SUPPLIER_...
delete from SUPPLIER_;
commit;
prompt Deleting MEAL...
delete from MEAL;
commit;
prompt Deleting DESIGNER...
delete from DESIGNER;
commit;
prompt Deleting CONTAINING...
delete from CONTAINING;
commit;
prompt Deleting PAKCAGE...
delete from PAKCAGE;
commit;
prompt Deleting EQUIPMENT...
delete from EQUIPMENT;
commit;
prompt Deleting CLIENT...
delete from CLIENT;
commit;
prompt Loading CLIENT...
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('214378218', 'debi', '547683445', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('214378214', 'dani', '548983445', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('278378218', 'yair', '523478945', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('214820218', 'dadi', '537829887', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('345678218', 'mali', '533456778', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('28920218', 'noa', '537862116', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('21437821', 'debi', '547683445', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('56787821', 'tali', '547683445', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('27837821', 'yair', '523478945', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('214389221', 'chana', '39090555', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('21482021', 'dadi', '537829887', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('2892028', 'noa', '537862116', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('28208921', 'moshe', '54098765', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('345678291', 'orit', '543283445', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('21837821', 'dani', '548983445', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('20', 'Irene', '4541224787', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('22', 'Wang', '7461644214', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('23', 'Crispin', '8197196194', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('24', 'Juliana', '1365284321', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('25', 'Rosie', '1689743385', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('27', 'Jeroen', '7919314538', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('28', 'Oliver', '5765684594', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('29', 'Rolando', '3343352918', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('30', 'Minnie', '6455388273', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('31', 'Mint', '7514718542', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('33', 'Gran', '8792991651', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('34', 'Alessandro', '5689547885', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('40', 'Thomas', '7926966328', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('42', 'Bob', '1286586982', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('43', 'David', '1614514774', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('44', 'Sharon', '8446627179', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('45', 'April', '5678853123', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('47', 'Kurt', '2263662325', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('48', 'Fionnula', '7875815785', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('49', 'Leelee', '5584789691', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('50', 'Vondie', '7832558366', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('52', 'Leelee', '8118978176', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('58', 'Cameron', '6767179553', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('60', 'Powers', '1247498366', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('62', 'Mary Beth', '1428326468', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('64', 'Lynn', '4498614726', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('69', 'Raul', '3983469596', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('71', 'Armin', '4855194256', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('74', 'Kris', '7599531452', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('76', 'CeCe', '5491732544', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('81', 'Miriam', '5512363831', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('83', 'Uma', '3726542561', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('85', 'Sara', '2466427131', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('87', 'Samantha', '6572344585', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('92', 'Scarlett', '9837416384', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('94', 'Vendetta', '8488334961', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('97', 'Kristin', '8116276795', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('99', 'Raymond', '6412511395', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('103', 'Naomi', '8778732436', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('106', 'Jann', '4356496864', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('108', 'Wang', '1723133426', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('110', 'Orlando', '5416379923', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('115', 'Bo', '7659565241', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('117', 'Kelly', '6123432269', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('119', 'Richie', '6643419298', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('122', 'Kiefer', '7374263474', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('124', 'Burton', '5797596264', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('128', 'Curt', '2788527799', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('131', 'Rodney', '5823627515', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('133', 'Robert', '9169719845', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('135', 'Danny', '2841482183', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('139', 'Temuera', '3888726129', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('142', 'Fionnula', '1114983989', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('144', 'Taylor', '8686268645', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('146', 'Kitty', '1198414329', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('148', 'Benjamin', '8934412652', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('153', 'Trey', '1193858873', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('155', 'Jon', '5325181743', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('158', 'Courtney', '5455294972', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('160', 'Adam', '5164396684', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('164', 'Gina', '1666238597', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('166', 'Rob', '6666544215', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('169', 'Katrin', '5733931428', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('171', 'Eddie', '8841346551', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('173', 'Lili', '6737866787', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('177', 'Kelly', '7956354931', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('180', 'Debbie', '3898682549', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('182', 'Nils', '2184917772', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('184', 'Jeff', '5986739252', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('189', 'Alan', '6846888694', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('191', 'Bonnie', '6145359967', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('193', 'Desmond', '7333318475', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('195', 'Crystal', '9618113187', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('199', 'Ozzy', '4793475811', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('202', 'Manu', '1455377279', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('204', 'Mickey', '9441943663', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('206', 'Anita', '4816264849', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('208', 'Joaquin', '9157786757', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('213', 'Pat', '5272384725', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('215', 'Connie', '3416565562', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('217', 'Harris', '8573822188', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('219', 'Randy', '1515877945', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('115550235', 'First-Reinhold', '079-6721717', 'High Wycombe,12nd St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('124736224', 'Kathy-Molina', '050-4934460', 'Barnegat,50 Curfman ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('126094230', 'Angelina-Fiennes', '026-9616486', 'Dallas,48 Owen Road', to_date('01-01-2007', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('127191299', 'Nils-McGriff', '091-1976795', 'Delafield,76 Terrenc', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('129121934', 'Mos-Torino', '017-1234280', 'Dorval,64 Joli Road', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('129466992', 'Oded-Sepulveda', '052-4174061', 'Zaandam,82nd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('131927725', 'Bob-Parsons', '036-7485040', 'Bautzen,526 Alan Roa', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('138000652', 'Viggo-Moreno', '046-9426120', 'Huntsville,37 Ontive', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('141067913', 'Dustin-Duncan', '091-2026131', 'Rockville,77 Carolin', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('141286470', 'Suzy-Albright', '079-2802575', 'Suwon-city,516 Matar', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('144207533', 'Cary-Kane', '097-5760855', 'Orleans,72nd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('150516159', 'Karen-Franks', '090-8565589', 'West Launceston,89 F', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('151517503', 'Aida-Bening', '038-6108239', 'Slidel,82 Brad Stree', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('152909198', 'Ramsey-LaBelle', '023-9065231', 'Bad Camberg,25 Dean ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('153843514', 'Vickie-Darren', '019-6672849', 'Exeter,93rd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('156416457', 'Angelina-Cocker', '040-6555298', 'Budapest,55 Lewin St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('157141811', 'Brothers-Thorton', '045-7619585', 'Trento,69 Longueuil ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('162188042', 'Anne-Depp', '015-1644758', 'Houston,90 Elizabeth', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('163717059', 'Renee-Sanders', '085-2841173', 'Kaiserslautern,542 P', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('164502431', 'Vickie-Warden', '088-9947248', 'Toulouse,72 Lou Driv', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('166381326', 'Franz-Mars', '016-3799987', 'Neustadt,61 Chaka', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('167375351', 'Nina-El-Saher', '088-3302509', 'Kagoshima,31 Farrow ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('171880121', 'Ethan-Springfield', '059-7644421', 'Hong Kong,102 Bristo', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('173415876', 'Al-Marie', '011-2967354', 'Pacific Grove,62 Bir', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('175161719', 'Rueben-Woodward', '037-2250778', 'Irati,10 Neustadt Ro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('177644588', 'Pamela-Affleck', '059-8436528', 'Campinas,65 Leigh St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('179794254', 'Winona-Rossellini', '096-2948945', 'Birmensdorf,86 Domin', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('181724644', 'Ralph-Bonneville', '070-7717018', 'Monroe,93rd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('185636514', 'Deborah-Sayer', '060-6304918', 'Lexington,742 Hunt V', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('190012393', 'Cameron-Cleese', '033-1326052', 'Varzea grande,11 San', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('190711252', 'Laurie-Berry', '061-5389186', 'Ashland,63rd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('192646604', 'Kristin-Hewett', '080-8249575', 'Munich,77 Bloch Driv', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('193177293', 'Juliet-Cruz', '069-2963103', 'Park Ridge,9 Gosdin ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('197619991', 'Dennis-Del Toro', '035-4693995', 'Granada Hills,56 Lin', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('199640888', 'Dwight-Brickell', '080-5649752', 'Kobe,82 Brooks Road', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('200082966', 'Gavin-Farina', '013-2416207', 'Boston,86 Latin Road', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('201884188', 'Edward-Guest', '011-2106546', 'Courbevoie,17 Rutger', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('202423128', 'Bonnie-Hayek', '050-2737025', 'Warrenton,100 Harnes', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('202890933', 'Famke-Coughlan', '031-4761505', 'Barcelona,61 Solomon', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('202938205', 'Thin-Horizon', '014-3788654', 'Nanaimo,45 Tate Stre', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('202988966', 'Sam-Reid', '082-9958465', 'Saitama,634 Jackie B', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('203093493', 'Trey-Camp', '071-7357177', 'Waldbronn,22nd Stree', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('203881975', 'Chubby-Tippe', '093-3144144', 'Cesena,40 LeVar Driv', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('205272172', 'Garland-Detmer', '031-1962278', 'Bartlett,74 Rundgren', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('205591518', 'Parker-Gere', '088-3928523', 'Borger,12 Armatradin', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('211084650', 'Heather-Walker', '047-3155398', 'Granada Hills,714 Ca', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('214300616', 'Harris-Lerner', '052-9299986', 'Zaandam,90 Eldard', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('214486980', 'Larenz-Reed', '092-5251711', 'Oslo,26 Vienna Road', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('216541625', 'Miki-Tsettos', '051-8296868', 'Seatle,36 Gellar', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('218429826', 'Etta-Sylvian', '095-9665937', 'Espoo,64 Spector Dri', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('218763605', 'Delbert-Curtis', '018-1668589', 'Oldham,91 Pastore St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('221244365', 'Dermot-Wilkinson', '061-7385493', 'Amsterdam,491 Machin', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('221770313', 'Etta-Condition', '036-5154258', 'Kumamoto,72nd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('224495473', 'Daniel-Shaw', '031-3359375', 'Foster City,326 Redg', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('224940419', 'Maxine-Ali', '041-2535931', 'Sao roque,99 Moffat ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('225885687', 'Tilda-Postlethwaite', '062-1458189', 'Englewood Cliffs,11s', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('235167090', 'Udo-Durning', '095-5558258', 'West Sussex,292 Bett', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('235381758', 'Pablo-Theron', '015-5196196', 'Alexandria,39 Burns ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('236762547', 'Hex-Chaplin', '077-9307812', 'Pecs,69 Clark Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('237093998', 'Molly-Lewis', '014-7292908', 'Hamburg,13rd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('242192420', 'Lizzy-Emmerich', '016-9037187', 'Oak park,66 Jane Ave', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('251002805', 'Tilda-Lizzy', '093-6560682', 'Morioka,49 Craddock ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('251021859', 'Remy-Magnuson', '085-7992672', 'Obfelden,96 Stiles B', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('251066882', 'Jimmy-Pearce', '030-2568721', 'Eiksmarka,17 Lou', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('252721669', 'Yaphet-Union', '011-5478891', 'Bristol,80 Bonnie Bl', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('255733886', 'Alan-Hedaya', '019-4625160', 'Cherepovets,472 Tzi', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('257662071', 'Ceili-Greene', '021-9360617', 'Wetzlar,22nd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('262224825', 'Derrick-Holiday', '075-6087423', 'Tucson,572 Wiest', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('263919983', 'Frank-Robbins', '066-6068174', 'Stafford,12nd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('268150110', 'Sheena-Robinson', '074-8043918', 'Lakeville,28 Hilton ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('272031711', 'Mint-Butler', '019-8929169', 'El Dorado Hills,93 T', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('272724345', 'Buddy-MacDonald', '060-2558353', 'Hermitage,97 Machine', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('273156212', 'Kenny-Adler', '090-7466221', 'Santa Clarat,977 Agl', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('273481859', 'Roberta-Pigott-Smith', '072-1617259', 'Londrina,62 Bellevue', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('273626310', 'Rueben-Perlman', '054-6693080', 'Knoxville,73 Athens ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('275420456', 'Elias-Wainwright', '066-6570024', 'Brisbane,28 Ball Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('276171371', 'Seann-Craddock', '099-6027514', 'Cleveland,60 Diggs S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('277941686', 'Jena-Tolkan', '081-4823555', 'Pacific Grove,10 Bas', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('278642153', 'Dar-Renfro', '070-2108122', 'Ribeirao preto,78 Pi', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('282036733', 'Brent-LaSalle', '040-7084106', 'Koblenz,23 Sheena Ro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('295158882', 'Stanley-Watley', '050-2373517', 'Giessen,57 Birch Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('296255366', 'Ceili-Mantegna', '029-8464688', 'Charleston,71 Marie ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('297189264', 'Thin-Durning', '031-3680647', 'New hartford,780 Bur', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('304261315', 'Lynn-Englund', '095-9291576', 'Biel,36 Marshall Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('307016500', 'Lily-Morrison', '035-8422902', 'Market Harborough,58', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('311909697', 'Carlos-Gaynor', '078-1184416', 'Glen Cove,701 Lawren', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('312294196', 'Cameron-Wahlberg', '044-1955068', 'Alessandria,1 Duvall', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('316377523', 'Ali-Rush', '050-7843564', 'Kevelaer,29 Hanks', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('317073810', 'William-Beckinsale', '064-4761425', 'Kaohsiung,5 LaBelle ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('318322784', 'Emily-Newman', '041-2415021', 'Duluth,65 Branagh St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('320214197', 'Dwight-Lynch', '027-6093694', 'Kaysville,91 Northbr', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('320984084', 'Elle-Breslin', '091-4662747', 'Solikamsk,3 Martin S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('322102919', 'Christopher-Brandt', '096-1134292', 'Hiroshima,24 Beatty ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('323148897', 'Doug-Carr', '042-2062626', 'New Hyde Park,63rd S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('324402203', 'Latin-Reid', '035-6398075', 'Bielefeld,1 Denzel A', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('324451997', 'Ronny-Stone', '079-9918900', 'Cambridge,817 Ricci ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('324999550', 'Thora-Davis', '055-3559415', 'Singapore,143 Cronin', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('326506497', 'Kid-McClinton', '028-1987717', 'Mclean,238 Morales D', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('328879351', 'Jena-Dench', '018-2667880', 'Royston,80 Lummen Av', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('336195988', 'Gavin-Reno', '028-8498091', 'Issaquah,674 Ray Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('341627864', 'Ernie-Flack', '042-2457156', 'Coppell,8 Geggy', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('342984634', 'Jerry-Akins', '046-8006517', 'Mogi Guacu,72nd Stre', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('347549032', 'Sophie-Pressly', '076-2830666', 'Walnut Creek,16 Jake', to_date('01-01-2007', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('349840942', 'Tom-Nugent', '024-9901759', 'Roma,29 Wiest Drive', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('351022726', 'Ice-Hayek', '053-8214561', 'Sugar Hill,92 Theron', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('352004805', 'LeVar-Wahlberg', '069-8815006', 'Dardilly,95 Friedric', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('353134007', 'Danni-Gill', '022-6824283', 'Lake worth,92nd Stre', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('353482730', 'Lynn-Glover', '069-3544791', 'Ribeirao preto,636 G', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('355027865', 'Nils-Connelly', '094-6691297', 'Peachtree City,67 Sa', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('355899957', 'Selma-Popper', '057-9197515', 'Herzlia,13 Jackson R', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('360252279', 'Elle-Sandoval', '043-3114830', 'Goiania,27 Palmieri ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('360260555', 'Jon-Child', '023-7498613', 'Chapel hill,82nd Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('361558168', 'Rene-Puckett', '068-5899621', 'Archbold,53 Mint', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('362394357', 'Jeffery-Weller', '087-3684145', 'Redwood City,200 Byr', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('362427181', 'Bobby-Fehr', '098-5994659', 'Antwerpen,10 Powers ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('366643056', 'Janice-Duschel', '095-6953475', 'Cleveland,80 Ryan Bl', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('369053838', 'Lily-Reilly', '056-8977964', 'Giessen,174 Coe Driv', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('371061470', 'Frederic-Yorn', '020-2181446', 'Middleburg Heights,4', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('376521204', 'Yaphet-Hornsby', '079-7901383', 'Los Angeles,21st Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('378824967', 'Temuera-Evanswood', '072-5100527', 'Holderbank,22 Jean-C', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('388964714', 'Isaiah-Damon', '041-8670226', 'Ankara,74 Jenkins Ro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('390110769', 'Andy-Dourif', '073-9832543', 'Newnan,52 Geldof Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('394500136', 'Garland-Coburn', '098-5798694', 'St Leonards,50 Rockw', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('395931910', 'Kevin-Woodward', '061-8391071', 'Pomona,63 Terrence S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('397341956', 'Natacha-Blackwell', '088-6813553', 'Maarssen,66 Kasey Dr', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('398613717', 'Gran-Flatts', '036-9139126', 'Slmea,90 Colin Young', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('399318419', 'Robert-Willis', '099-9267329', 'Cobham,16 Southend o', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('409349671', 'Chrissie-Harary', '034-9713989', 'Green bay,23 Matsuya', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('409771057', 'Bo-Short', '084-2830712', 'Des Plaines,97 Monro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('410227355', 'Kiefer-Silverman', '078-1613715', 'Cobham,347 Algermiss', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('411251955', 'Irene-Porter', '044-3855447', 'Tulsa,164 Farrell Ro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('416941052', 'Mena-urban', '055-6142289', 'Goslar,666 Boyle Dri', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('419766136', 'Emilio-Soda', '091-6885415', 'Wilmington,71 Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('420529630', 'Dianne-Costner', '027-5161085', 'Burlington,137 Lynch', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('421138666', 'Gran-Willard', '077-3488838', 'Portland,29 Garner R', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('423632765', 'Marc-Magnuson', '069-6016604', 'Cary,73rd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('427332445', 'Charlize-Napolitano', '067-7846134', 'Chaam,283 Redgrave S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('429602143', 'Glen-Snipes', '069-6143635', 'Bellevue,74 Bonham A', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('429821301', 'Andrea-Gary', '058-8672808', 'Zaandam,275 McCready', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('436759233', 'Cathy-Cockburn', '096-5818880', 'Londrina,46 Nivola D', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('438477170', 'Ronny-urban', '094-5957232', 'Mayfield Village,486', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('440265918', 'Jeremy-Spector', '074-5609736', 'Wavre,66 Maryville D', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('442113021', 'Ron-Kidman', '056-3928365', 'Silver Spring,4 Domi', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('445757640', 'Garth-Phillippe', '095-7109459', 'Goiania,33 Clark Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('446436968', 'Sigourney-Forrest', '044-3666267', 'Allen,67 Gates Stree', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('446906795', 'Chloe-Malone', '082-3340977', 'Fort McMurray,30 Pri', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('449616736', 'Marty-Tippe', '093-5566616', 'Juneau,1 Yokohama Ro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('449860234', 'Vonda-Carrere', '028-2907067', 'San Jose,78 Meppel B', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('452224080', 'Suzy-Astin', '089-3223808', 'Bollensen,97 Clive D', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('454954065', 'Glenn-Haggard', '052-9559177', 'Peachtree City,53rd ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('455396724', 'Hilary-Anderson', '026-7580278', 'Orlando,448 Hong Kon', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('457364031', 'Chalee-Connery', '094-9942498', 'Thalwil,51 Yolanda S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('458886237', 'Patrick-Orbit', '048-7843412', 'Ricardson,5 Ledger S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('462977437', 'Adrien-Cattrall', '017-4665761', 'Spring City,5 Helsin', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('463371951', 'Rip-Perez', '094-2891419', 'Bollensen,74 Dennis ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('463878923', 'Jill-Keitel', '078-9336086', 'Canberra,282 Woodwar', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('464221141', 'Curt-Lerner', '093-8777527', 'Lakeville,58 Suzi Dr', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('464276016', 'Kate-Williamson', '078-6534800', 'Limeira,90 Ojeda Blv', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('466227468', 'Balthazar-Gaynor', '050-7741104', 'Koeln,96 Lynne Road', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('469009800', 'Whoopi-Cook', '053-2190204', 'Fremont,14 Batavia D', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('472479875', 'Ozzy-Pigott-Smith', '034-6150500', 'Hackensack,33 Fiona ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('474496095', 'Lari-Kramer', '023-3608257', 'Netanya,50 Valentin ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('476782813', 'Oded-Michaels', '028-2427986', 'Hannover,81st Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('479411599', 'Debbie-Curtis-Hall', '037-7363897', 'Chur,867 Warren Stre', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('479702379', 'Benicio-Downey', '045-6400535', 'Wilmington,78 Neve S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('482258360', 'Jonatha-McKellen', '049-3453126', 'Berlin-Adlershof,671', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('484622079', 'Anita-Lang', '098-4732493', 'Banbury,35 Chuck', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('484733518', 'Tanya-Karyo', '035-9447057', 'Palo Alto,53 Milla D', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('486249177', 'Adam-Lowe', '099-5069499', 'Las Vegas,259 Di Sav', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('487981995', 'Rhys-Ontiveros', '061-6482468', 'Treviso,83rd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('491523991', 'Randall-Dillane', '079-5731972', 'Orleans,632 Burmeste', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('496245735', 'Lucinda-Kinnear', '012-5582955', 'Knutsford,89 Leo Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('497469605', 'Fiona-Tucci', '090-5811378', 'Pusan-city,98 Quatro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('500276225', 'Harriet-McCain', '029-1534493', 'Chapel hill,79 Gosdi', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('501237230', 'Mel-Murray', '045-6049390', 'Forest Park,11 Keene', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('504536643', 'Sean-Leto', '012-8809438', 'Englewood Cliffs,8 H', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('507754009', 'Paul-Pitt', '069-9494423', 'Toyama,722 Cook Stre', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('514205703', 'Clay-Thurman', '079-8051246', 'Glasgow,84 Gellar St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('514904529', 'Garth-Spine', '083-4099753', 'Storrington,90 Wes R', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('516928403', 'Shirley-Aniston', '078-5411539', 'Verwood,310 Roy Driv', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('518994648', 'Eric-Shand', '078-2007478', 'Schenectady,19 Vince', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('523316363', 'Mike-Morrison', '072-7451073', 'Tulsa,787 Gordon Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('529660004', 'Tcheky-Sweet', '071-3891313', 'Alcobendas,1 Mel Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('529665183', 'Campbell-Crimson', '072-4661896', 'Uden,468 Rhames Road', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('529782749', 'Tramaine-Brooks', '037-6201415', 'San Mateo,888 Ramire', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('530559367', 'Wes-Rollins', '099-6606819', 'Albany,59 Nakai Driv', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('533475097', 'Antonio-LaPaglia', '095-1792468', 'London,99 Hope Road', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('535355728', 'Fats-Kinnear', '038-4340258', 'Hjallerup,84 Vendett', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('535781565', 'Andy-Mandrell', '018-8901049', 'Richmond,198 Meniket', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('544629310', 'Chrissie-Alston', '017-1648969', 'Baarn,33 Overstreet ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('548972868', 'Tobey-Wills', '061-6632126', 'Aracruz,38 Kirshner ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('554534966', 'Leelee-Robbins', '089-2357371', 'Duluth,86 Green Driv', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('554790135', 'Pierce-Gayle', '059-1340571', 'Rothenburg,449 Paisl', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('560391764', 'Cathy-Goodman', '035-1582562', 'Rimini,361 Tokyo Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('563480832', 'Hank-Rickles', '069-4765539', 'Silverdale,45 Garber', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('567225446', 'Jane-Overstreet', '056-7615871', 'Kopavogur,61 Gilley ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('570764208', 'Rose-Ontiveros', '098-9130878', 'Ashland,71 Rosco Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('573755457', 'Natacha-Broza', '022-6043469', 'Angers,16 Collective', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('575316296', 'Phoebe-Weaver', '064-2119621', 'Livermore,252 Holbro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('575427604', 'April-Nolte', '078-1302674', 'Borger,74 Coleman Av', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('576090664', 'Ving-Senior', '036-5094971', 'Lodi,86 Moore Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('581815622', 'Rene-Baker', '040-8227749', 'Kobe,99 Tooele Ave', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('586258847', 'Joy-Weir', '084-9608701', 'Cottbus,32nd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('588037827', 'Campbell-DiBiasio', '029-3065148', 'Padova,711 Blaine Bl', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('589291628', 'Joe-Chao', '057-6458417', 'Guamo,93 Tal Road', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('590210023', 'Roger-Carrack', '018-9843011', 'Freiburg,407 Callow ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('594264009', 'Bridget-Singh', '042-7711130', 'Szazhalombatta,10 An', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('594688241', 'Eliza-Hatchet', '015-6359713', 'San Jose,52 Olyphant', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('597771718', 'Cyndi-Randal', '070-4168203', 'Hjallerup,62 Dionne ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('597936180', 'Nick-Kilmer', '045-8323623', 'Oslo,33 Nanci Road', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('599299892', 'Vince-Paxton', '092-2309965', 'Horb,45 Ben Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('603150426', 'Cloris-Alda', '039-8398799', 'Americana,3 Catherin', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('604322566', 'Larenz-Sherman', '099-3532311', 'Helsingborg,43 Keanu', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('605867286', 'Henry-Vicious', '017-9410536', 'Mount Olive,58 Ricky', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('611173011', 'Grant-Luongo', '047-2796483', 'Washington,3 Rush Av', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('618573694', 'Connie-Rollins', '067-8617590', 'Takapuna,39 Salzburg', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('620162965', 'Tyrone-Rhodes', '029-1977236', 'Greenville,25 Readin', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('620322646', 'Demi-Henriksen', '053-9237850', 'Mobile,7 Emily Stree', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('621864883', 'Ewan-Moffat', '083-6032919', 'Taipei,85 Lennie', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('639840454', 'Isaiah-Browne', '052-8389162', 'San Antonio,46 Night', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('640019960', 'King-Cage', '039-9677405', 'Ludbreg,3 Donelly Ro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('640331895', 'Red-Fichtner', '067-9816016', 'Barnegat,57 Nancy Ro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('644923088', 'Solomon-Lightfoot', '084-7474177', 'Tilst,69 Pleasence S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('649748137', 'Brad-Mulroney', '029-9185478', 'Sursee,38 Nielsen St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('651612329', 'LeVar-Hurt', '047-4957502', 'Rheinfelden,125 Delt', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('652286041', 'Millie-Ball', '087-2345157', 'Herzlia,180 Silverma', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('654684525', 'Angela-Davidson', '049-5841158', 'Appenzell,878 Atlas ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('654712365', 'Charlie-Weisz', '074-4583819', 'New hartford,55 Eber', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('654825535', 'Pam-Allan', '024-7586537', 'Melrose park,42 Neuw', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('655844485', 'Lynette-Barkin', '057-7038562', 'Barnegat,686 Denny R', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('656234359', 'Aaron-Nicholson', '045-3638185', 'Yamaguchi,91 Tierney', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('656442110', 'Jill-Tomlin', '047-5680852', 'West Drayton,637 Bac', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('660797697', 'Chaka-Fiorentino', '046-3045462', 'St-laurent,92nd Stre', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('673202124', 'Terri-Maguire', '094-1288151', 'Sulzbach,27 Lloyd Dr', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('678050026', 'Robby-Satriani', '064-4562749', 'Paderborn,76 Trieste', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('679380064', 'Meredith-Hoffman', '098-9919026', 'Thame,2 Dresden Blvd', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('681572378', 'Holly-Renfro', '047-2563046', 'St. Petersburg,760 P', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('682288204', 'Pelvic-Carr', '074-4635845', 'Saga,75 Colombo Driv', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('688095708', 'Sara-Summer', '042-3567257', 'Frederiksberg,61 Fir', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('689426993', 'Kevn-Foxx', '021-8343650', 'Parma,83 Woodard Dri', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('695623822', 'Richard-Ruiz', '050-5792193', 'Meerbusch,83 Jill Ro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('701436220', 'Glenn-Lerner', '093-3672397', 'Cleveland,56 Kim Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('703201506', 'Roberta-Mazzello', '063-1522797', 'Torino,76 Chazz Stre', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('704448570', 'Mitchell-Connery', '061-5155661', 'Carmichael,81st Stre', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('705165132', 'Ed-Moriarty', '098-3999434', 'Maryville,24 Payton ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('706065580', 'Casey-Ali', '051-6672445', 'Hjallerup,80 Dutton ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('709566924', 'Chazz-Folds', '039-6797761', 'Portland,102 Milton ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('711190112', 'Goran-Warden', '069-5717395', 'Leverkusen,76 Orange', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('721140035', 'Jodie-Arjona', '031-8287208', 'Bellevue,91st Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('726203109', 'Pierce-Chaplin', '092-5085153', 'Santa Fe,49 Diaz Blv', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('729570733', 'Jonny Lee-Moreno', '056-6767109', 'Bratislava,496 Odens', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('732741572', 'Heath-MacPherson', '071-3599094', 'Maebashi,75 Murray', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('733139526', 'Corey-Morse', '026-3662113', 'Redding,24 Twilley S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('735716196', 'Miguel-Gunton', '097-5865129', 'Vejle,23rd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('736264193', 'Elvis-Wilkinson', '092-5828737', 'Buffalo Grove,62nd S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('736458114', 'Miranda-Winans', '016-9138553', 'Duluth,15 Batavia St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('738200510', 'Lois-Elizabeth', '022-2276722', 'Syracuse,170 Meyer A', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('738961356', 'Meg-Sossamon', '016-6599897', 'Immenstaad,408 Jody ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('739894646', 'Michael-Hyde', '016-4558986', 'Santa Clarita,87 Rad', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('740888493', 'Gord-Craven', '025-8340705', 'Sendai,11st Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('741314233', 'Amy-Roundtree', '073-7478632', 'Hiroshima,87 Vin Roa', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('746060762', 'Maceo-Penders', '068-6647843', 'Vanderbijlpark,42nd ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('746221819', 'Kathy-Dafoe', '061-1290987', 'Kyoto,59 Miami Drive', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('747630593', 'Halle-Mulroney', '015-4966018', 'Pasadena,62 Rob Road', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('750119869', 'Neve-Nicholson', '034-8121049', 'Bartlesville,23 Mori', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('750919835', 'Mika-Cagle', '015-5239687', 'Wavre,21 Cate Drive', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('750989130', 'Ceili-Colman', '090-3140789', 'Ashdod,100 Cochran S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('756586900', 'Don-Mewes', '055-8638801', 'Seattle,76 Aimee Dri', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('756920718', 'Paula-Palmieri', '061-4590865', 'West Point,771 Broth', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('760945270', 'Kiefer-Francis', '063-5360355', 'Tyne & Wear,25 Buffa', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('761433673', 'Nancy-Braugher', '033-6186961', 'Highlands Ranch,22 T', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('762606075', 'Terence-Norton', '053-2353086', 'Athens,74 Kweller St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('764421102', 'Carlene-Klugh', '088-5134506', 'Rosario,9 Costa Stre', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('765863839', 'Jon-Mortensen', '020-7088989', 'Waco,29 Mulroney Roa', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('767292828', 'Steve-Myers', '078-3399830', 'Knutsford,55 Grant B', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('771701713', 'Goldie-Thornton', '089-8614436', 'Waldorf,41 Spiner Dr', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('772403742', 'Hilton-Paul', '049-3863806', 'Casselberry,47 Bresl', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('772545227', 'Jeff-Raitt', '082-2523246', 'Englewood Cliffs,79 ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('774543862', 'Terri-Rickles', '084-3256637', 'El Dorado Hills,9 Na', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('777678448', 'Mili-Raitt', '030-5713520', 'Oxford,36 Bridget St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('777751819', 'Delbert-Stormare', '082-2638532', 'Swarthmore,12 Lynch ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('777766742', 'Jonathan-Affleck', '069-8754038', 'Hjallerup,38 Piven S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('778481350', 'Millie-Mandrell', '059-9522968', 'Mississauga,63rd Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('779881614', 'Arturo-Statham', '053-1971680', 'Rome,48 Salonga Stre', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('783806626', 'Daniel-Cockburn', '088-5310917', 'Cuenca,69 Drew Stree', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('783831334', 'Cameron-Coe', '037-5666150', 'Oakland,10 Roma Ave', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('785335488', 'Lynette-Geldof', '073-4319496', 'Fort worth,85 Paul R', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('789224520', 'Cherry-Tsettos', '077-2175527', 'Zurich,85 Lawrence B', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('789562188', 'Hector-Leto', '090-2279209', 'Firenze,54 Estevez A', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('790353923', 'Latin-Bachman', '074-6013851', 'Rheinfelden,827 Kris', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('792744882', 'Jessica-Beck', '045-8975257', 'Yucca,92nd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('795381277', 'Victoria-Loggins', '027-1283311', 'Portsmouth,60 Damon ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('795843818', 'Chloe-Rock', '095-2181948', 'San Diego,9 Madonna ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('798816085', 'King-Warden', '085-3994185', 'Solikamsk,76 Laws Ro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('799777319', 'Herbie-Chapman', '089-1517241', 'Billerica,99 Rosemea', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('805401712', 'Lennie-Osment', '027-3932517', 'Hines,65 Hoskins Dri', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('805854680', 'Rip-Houston', '096-1981062', 'Aurora,153 Coquitlam', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('805897636', 'Orlando-Tierney', '051-3938459', 'Essen,49 Cedar Rapid', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('808495905', 'Clay-Squier', '024-4461151', 'Ebersdorf,22 Brody R', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('808796447', 'Cary-Rhames', '012-5652322', 'Granada Hills,9 Marx', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('811637701', 'Nikka-Dysart', '092-1929414', 'Grand Rapids,51st St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('813539248', 'Merillee-Williams', '021-1587422', 'Pandrup,70 Gordon Dr', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('815123821', 'Edgar-Peet', '024-1278402', 'Manchester,50 Terren', to_date('01-01-2007', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('826107453', 'Chrissie-Rhymes', '031-8564677', 'South Weber,42 Jonat', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('832430127', 'Oliver-Coverdale', '042-4695217', 'Charleston,26 Robert', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('833739957', 'Gil-Furtado', '032-4794151', 'Herndon,11st Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('834842795', 'Lloyd-Cobbs', '024-1500889', 'New Hope,221 Channin', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('836439971', 'Lynn-Nelson', '045-1386274', 'Warrenton,2 McDonald', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('838318068', 'Howard-Sandoval', '078-4936561', 'Derwood,86 Perry Dri', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('838802596', 'Carole-Doucette', '080-4200885', 'Groton,86 Blossoms S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('839962152', 'Shawn-Shaw', '021-7003399', 'Kyunnam,5 Philadelph', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('842738339', 'Heather-Brown', '090-3254713', 'Mainz-kastel,47 Byrn', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('843684860', 'Judi-DiFranco', '076-7911880', 'Sihung-si,932 Knight', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('847683496', 'Jeanne-Borgnine', '029-8320803', 'Dunn loring,265 Katt', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('849303235', 'Jet-Berenger', '045-2835268', 'El Paso,122 Marina R', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('849466338', 'Uma-Kane', '013-4233235', 'Caguas,20 Tilst Road', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('850094083', 'Nikki-Dern', '043-6848004', 'Louisville,16 Haynes', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('851890097', 'Ian-Barry', '034-5608975', 'Lexington,76 Holderb', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('853517846', 'Quentin-Summer', '072-7047995', 'Irkutsk,58 Darius Av', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('859555017', 'Terrence-Payne', '045-7603988', 'Springfield,91 Lilla', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('860761954', 'Rupert-Albright', '043-2653096', 'Nancy,37 Summer', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('860797149', 'Frankie-Edmunds', '040-4668735', 'Mechanicsburg,67 Alt', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('861744214', 'Nile-Winstone', '097-8522479', 'Madrid,68 Coyote Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('862513457', 'Helen-Gallant', '046-3602401', 'Mogi Guacu,80 Greenv', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('867830048', 'Maureen-Jessee', '064-2583921', 'Trento,45 San Jose', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('871596785', 'Hugo-Michaels', '023-2112060', 'Pitstone,607 Lange', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('871869784', 'Suzanne-Smith', '023-8516887', 'Blacksburg,84 Syracu', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('872804100', 'Maria-Cruz', '056-3186158', 'Sorocaba,323 Blige D', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('877964589', 'Jean-Costner', '079-7080094', 'Herzogenrath,21st St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('880677173', 'Wade-Boothe', '021-3132716', 'Charleston,65 Schrei', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('881683474', 'Amy-Dempsey', '032-2283927', 'Nicosia,22 Twilley R', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('886181267', 'Clive-Arden', '098-8520574', 'Boulogne,100 Elwes S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('886831669', 'Rosanna-Marley', '089-1724938', 'Sidney,21 Charleston', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('888273898', 'Ceili-Teng', '072-4993628', 'Rtp,86 Regina Road', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('894904744', 'Nicholas-Fierstein', '078-8055438', 'Belmont,596 England ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('895204813', 'Eddie-Pollak', '018-1790221', 'Bountiful,46 Ness Dr', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('895979028', 'Jena-Gary', '064-9019064', 'Toronto,62 Barbengo ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('896151890', 'Sharon-Hurt', '027-7953606', 'Samrand,64 Geoffrey ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('896757685', 'Wes-Cleese', '054-2979770', 'Veenendaal,72 Talvin', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('897322670', 'Jeanne-Gayle', '041-4302744', 'Fort gordon,39 Walte', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('898190326', 'Ritchie-Mollard', '055-7923969', 'Fountain Hills,550 R', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('898674199', 'Kasey-Wiedlin', '036-2782453', 'Warley,157 Carnes St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('899381603', 'Miles-Dafoe', '043-7656492', 'Aracruz,52 Lang', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('900468358', 'Murray-Geldof', '093-1796080', 'Richmond,35 Botti St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('903277991', 'Tyrone-Branagh', '032-7632232', 'Vienna,94 Kadison Ro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('903486694', 'Kris-McNeice', '062-7142077', 'San Francisco,50 Mag', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('906393556', 'Beverley-Kirshner', '093-7359833', 'Kagoshima,71 Quinone', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('907287038', 'Dar-Kidman', '035-6793852', 'Granada Hills,65 Joa', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('907597444', 'Hope-Kurtz', '032-9959348', 'Port Macquarie,65 Tu', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('908589616', 'Mary-Weir', '028-4140182', 'Lexington,35 Kadison', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('909589275', 'Glenn-Bush', '044-1678993', 'Maryville,93 Daniel ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('909762395', 'Wallace-Midler', '015-9754161', 'Vienna,48 Fariq Blvd', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('911729605', 'Ivan-Hedaya', '076-6758242', 'Birkenhead,26 Vissel', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('915869687', 'Terence-Penn', '072-6469562', 'West Chester,923 Ess', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('920832142', 'Johnnie-Field', '056-4779228', 'Juno Beach,829 San F', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('922094598', 'Brooke-Dysart', '035-3220135', 'High Wycombe,31 Slat', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('923324345', 'Mark-Tucker', '074-1966368', 'Scottsdale,93 Zeta-J', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('924245604', 'Kenneth-Uggams', '050-9955850', 'Gifu,15 Zipf Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('927524225', 'Carlene-Stiles', '093-1271647', 'Sorocaba,55 Landau R', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('928020274', 'Lila-Rucker', '035-1113805', 'Bracknell,74 Parish ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('928549846', 'Dustin-Hawthorne', '033-2194026', 'Milano,35 Robbins Dr', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('929328580', 'Mira-Gano', '078-4880145', 'Dallas,94 Collin', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('933507931', 'Bernard-Melvin', '043-6139576', 'Waterloo,93 Webb Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('934959681', 'Omar-Gary', '037-3703602', 'San Francisco,7 Prag', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('934973095', 'Debbie-Rowlands', '076-2296536', 'Pearland,76 Freiburg', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('935291735', 'Mili-Gibson', '037-7021577', 'Battle Creek,28 Vanc', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('936576358', 'Rutger-Firth', '057-8172686', 'Springville,83 Night', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('942708002', 'Delbert-Wariner', '016-7689682', 'Tampa,44 Dennis Stre', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('944370934', 'Rik-Gellar', '051-7961115', 'Bay Shore,54 Herbie ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('944959614', 'Cathy-Romijn-Stamos', '093-3044845', 'Salisbury,96 Roma St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('946312472', 'Praga-Lang', '053-2418600', 'Ferraz  vasconcelos,', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('949372694', 'Sal-Church', '018-4567629', 'Moreno Valley,77 New', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('950932629', 'Pete-Nunn', '069-9481674', 'Herne,78 Coolidge St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('960671680', 'Brian-Downey', '049-8731290', 'Whitehouse Station,6', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('963819761', 'Lauren-Olyphant', '016-7608215', 'Yamagata,32 Furay Ro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('966414435', 'Harris-Schwimmer', '085-2934836', 'Barksdale afb,34 Edm', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('966959461', 'Steve-Leary', '021-1998744', 'Hermitage,98 Colombe', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('967817873', 'Balthazar-Hauer', '084-3098771', 'Archbold,74 Sao caet', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('970287710', 'Jena-Phoenix', '055-5700759', 'Bremen,11st Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('970402642', 'Tcheky-Bosco', '035-9943334', 'Storrington,52 Wakel', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('972945925', 'Michelle-Santana', '034-7389859', 'Oshawa,54 Heatherly ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('974693239', 'Larenz-Elwes', '087-9815553', 'Madison,620 Pottendo', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('975723107', 'Renee-Arkin', '094-1220453', 'Mapo-gu,80 Vaughan S', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('977554198', 'Jann-Payton', '011-5641809', 'West Monroe,12nd Str', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('977753609', 'King-Whitley', '041-7561640', 'Paderborn,41 Streep ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('979954238', 'Rade-Crouch', '065-3621101', 'Leimen,73rd Street', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('980282242', 'Carol-Bates', '015-2118434', 'Hayward,58 Gellar Ro', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('982240416', 'Jena-McNarland', '019-1749052', 'Laredo,84 Guilfoyle ', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('983648738', 'Heath-Webb', '036-1750167', 'Leverkusen,78 Rickle', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('983955606', 'Taye-Spall', '016-3139520', 'Narrows,63 Vassar Bl', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('984030504', 'Christopher-Winslet', '087-1919969', 'Mantova,41 Avalon St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('987656414', 'Danny-Bradford', '016-6968487', 'Sant Cugat Del Valle', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('987938231', 'Bonnie-Ribisi', '070-4983265', 'Pacific Grove,6 Thin', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('989065808', 'Thomas-Carrey', '077-3132284', 'Highlands Ranch,41 C', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('990813819', 'Rod-Womack', '037-3894820', 'Corona,100 Anthony D', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('992538213', 'Whoopi-Houston', '089-6201696', 'Istanbul,782 Baransk', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('993714527', 'Moe-Ford', '014-6595202', 'Coppell,37 Geldof St', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('51', 'Joe', '9177662451', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('53', 'Bob', '5399577665', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('54', 'Hex', '4458431942', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('56', 'Kim', '3829733469', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('57', 'Gilberto', '9848533466', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('59', 'Angelina', '5587612386', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
commit;
prompt 500 records committed...
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('61', 'Jay', '5368559157', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('63', 'Clive', '3233337743', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('65', 'Ethan', '3898657883', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('66', 'Wang', '1926614236', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('68', 'Franz', '7426718615', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('70', 'Emerson', '2651127966', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('72', 'Danni', '4192735233', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('73', 'Loreena', '4155836956', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('75', 'Fred', '2132698791', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('77', 'Michael', '8328111216', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('79', 'Trey', '8697797899', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('80', 'Terri', '8526351448', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('82', 'Christopher', '7169634989', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('84', 'Kathy', '2943293146', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('86', 'Collin', '6976885744', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('88', 'Adina', '3319634273', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('89', 'Billy', '9481535229', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('91', 'Ian', '6581371681', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('93', 'Cary', '9765159424', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('95', 'Martha', '1359693646', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('96', 'Rachael', '2618561256', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('98', 'Kate', '8481293376', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('100', 'Clive', '3323663458', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('102', 'Raymond', '8917283713', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('104', 'Joely', '9316381224', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('105', 'Herbie', '3661343854', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('107', 'Mary', '6856781542', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('109', 'Gil', '1685879772', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('111', 'Judge', '6574517861', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('112', 'Rita', '4732791932', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('114', 'Collin', '7596266918', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('116', 'Queen', '4562377443', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('118', 'Reese', '8694764565', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('120', 'Victor', '6657725754', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('121', 'Rascal', '7659966468', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('123', 'Rosanne', '3241726919', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('125', 'Sophie', '6498519517', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('127', 'Ryan', '3688268624', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('129', 'Leo', '6548161789', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('130', 'Judy', '2342337388', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('132', 'Gloria', '7927973478', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('134', 'Rosco', '5349672656', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('136', 'Alfred', '9244292724', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('138', 'Scarlett', '2878645214', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('140', 'Nicolas', '7553493826', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('141', 'Kirk', '4918787344', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('143', 'Lucinda', '8914999346', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('145', 'Cathy', '9571535586', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('147', 'Earl', '2837947497', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('149', 'Andre', '6794455426', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('150', 'Debi', '8848335771', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('152', 'Maria', '1485324393', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('154', 'Ann', '7697467714', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('156', 'Gordon', '4742699468', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('157', 'Frankie', '8534473994', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('159', 'Robin', '8878854348', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('161', 'Cathy', '6754938366', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('163', 'Micky', '4483963278', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('165', 'Sharon', '7646612749', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('167', 'Laurie', '3175725768', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('168', 'Joshua', '8841131524', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('170', 'Ewan', '1213387182', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('172', 'Charlie', '3784991873', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('174', 'Kurtwood', '5315498227', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('176', 'Viggo', '3523863969', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('178', 'Lionel', '1451874549', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('179', 'Nikka', '2585965716', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('181', 'Ronny', '4864141141', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('183', 'Nickel', '5766563277', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('185', 'Rufus', '1888645453', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('187', 'Salma', '1416862179', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('188', 'Timothy', '9586635353', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('190', 'Lenny', '1322132393', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('192', 'Allison', '1658525953', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('194', 'Julianne', '4392298952', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('196', 'Natacha', '6862385447', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('198', 'Derek', '5172494681', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('200', 'Neil', '5154426729', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('201', 'Richie', '9863551399', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('203', 'Bobbi', '4138514689', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('205', 'Red', '6815781782', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('207', 'Cherry', '9849756568', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('209', 'Goldie', '9742647628', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('210', 'Machine', '7732987579', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('212', 'Willem', '1327728799', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('214', 'Luke', '4992734354', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('216', 'Clarence', '5125468112', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('218', 'Geoff', '6135139693', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('546765043', 'tt', '65342235', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('567878214', 'tali', '547683445', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('282089218', 'moshe', '54098765', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('34567821', 'mali', '533456778', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('21', 'Merillee', '4136921532', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('26', 'Parker', '2222844349', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('32', 'Don', '6854184878', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('41', 'Jude', '4291951679', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('46', 'Emilio', '9297744443', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('55', 'Gina', '4116614918', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('67', 'Joshua', '4267298891', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('78', 'Rueben', '3611436298', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
commit;
prompt 600 records committed...
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('90', 'Olga', '2549755375', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('101', 'Doug', '5246663927', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('113', 'Horace', '3657817457', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('126', 'Gilberto', '4512892276', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('137', 'Freddy', '5133924369', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('151', 'Geraldine', '2552446138', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('162', 'Carlos', '7552358592', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('175', 'Emily', '5673289543', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('186', 'Daryl', '3887268294', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('197', 'Freddie', '5399445349', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
insert into CLIENT (clientid, clientname, phone, address, birthdate)
values ('211', 'Juliet', '9486741337', 'Dodaim 5 Ramat Gan', to_date('01-01-2007', 'dd-mm-yyyy'));
commit;
prompt 611 records loaded
prompt Loading EQUIPMENT...
insert into EQUIPMENT (equipmentid, equipmentname)
values (2, ' Daisy');
insert into EQUIPMENT (equipmentid, equipmentname)
values (3, ' Rose');
insert into EQUIPMENT (equipmentid, equipmentname)
values (4, ' Orchid');
insert into EQUIPMENT (equipmentid, equipmentname)
values (5, ' Lily');
insert into EQUIPMENT (equipmentid, equipmentname)
values (6, ' Plant Mister');
insert into EQUIPMENT (equipmentid, equipmentname)
values (7, ' Hyacinth');
insert into EQUIPMENT (equipmentid, equipmentname)
values (8, ' Bud Vase');
insert into EQUIPMENT (equipmentid, equipmentname)
values (9, ' Iris');
insert into EQUIPMENT (equipmentid, equipmentname)
values (10, ' Sunflower');
insert into EQUIPMENT (equipmentid, equipmentname)
values (11, ' Flower Pot');
insert into EQUIPMENT (equipmentid, equipmentname)
values (12, ' Carnation');
insert into EQUIPMENT (equipmentid, equipmentname)
values (13, ' Azalea');
insert into EQUIPMENT (equipmentid, equipmentname)
values (14, ' Trowel');
insert into EQUIPMENT (equipmentid, equipmentname)
values (15, ' Dahlia');
insert into EQUIPMENT (equipmentid, equipmentname)
values (16, ' Weed Whacker');
insert into EQUIPMENT (equipmentid, equipmentname)
values (17, ' Freesia');
insert into EQUIPMENT (equipmentid, equipmentname)
values (18, ' Terrarium');
insert into EQUIPMENT (equipmentid, equipmentname)
values (19, ' Bougainvillea');
insert into EQUIPMENT (equipmentid, equipmentname)
values (20, ' Pansy');
insert into EQUIPMENT (equipmentid, equipmentname)
values (21, ' Mulch');
insert into EQUIPMENT (equipmentid, equipmentname)
values (22, ' Poppy');
insert into EQUIPMENT (equipmentid, equipmentname)
values (23, ' Cold Frame');
insert into EQUIPMENT (equipmentid, equipmentname)
values (24, ' Hydrangea');
insert into EQUIPMENT (equipmentid, equipmentname)
values (25, ' Gladiolus');
insert into EQUIPMENT (equipmentid, equipmentname)
values (26, ' Lavender');
insert into EQUIPMENT (equipmentid, equipmentname)
values (27, ' Aster');
insert into EQUIPMENT (equipmentid, equipmentname)
values (28, ' Geranium');
insert into EQUIPMENT (equipmentid, equipmentname)
values (29, ' Zinnia');
insert into EQUIPMENT (equipmentid, equipmentname)
values (30, ' Bulb Planter');
insert into EQUIPMENT (equipmentid, equipmentname)
values (31, ' Begonia');
insert into EQUIPMENT (equipmentid, equipmentname)
values (33, ' Daffodil');
insert into EQUIPMENT (equipmentid, equipmentname)
values (34, ' Garden Rake');
insert into EQUIPMENT (equipmentid, equipmentname)
values (35, ' Crocus');
insert into EQUIPMENT (equipmentid, equipmentname)
values (36, ' Violet');
insert into EQUIPMENT (equipmentid, equipmentname)
values (37, ' Garden Marker');
insert into EQUIPMENT (equipmentid, equipmentname)
values (38, ' Marigold');
insert into EQUIPMENT (equipmentid, equipmentname)
values (39, ' Columbine');
insert into EQUIPMENT (equipmentid, equipmentname)
values (40, ' Cosmos');
insert into EQUIPMENT (equipmentid, equipmentname)
values (41, ' Wisteria');
insert into EQUIPMENT (equipmentid, equipmentname)
values (42, ' Trellis');
insert into EQUIPMENT (equipmentid, equipmentname)
values (43, ' Clematis');
insert into EQUIPMENT (equipmentid, equipmentname)
values (44, ' Hand Trowel');
insert into EQUIPMENT (equipmentid, equipmentname)
values (45, ' Foxglove');
insert into EQUIPMENT (equipmentid, equipmentname)
values (46, ' Pruning Hook');
insert into EQUIPMENT (equipmentid, equipmentname)
values (47, ' Phlox');
insert into EQUIPMENT (equipmentid, equipmentname)
values (48, ' Hollyhock');
insert into EQUIPMENT (equipmentid, equipmentname)
values (49, ' Anemone');
insert into EQUIPMENT (equipmentid, equipmentname)
values (51, ' Hyacinth');
insert into EQUIPMENT (equipmentid, equipmentname)
values (52, ' FlowerBasket');
insert into EQUIPMENT (equipmentid, equipmentname)
values (53, ' Iris');
insert into EQUIPMENT (equipmentid, equipmentname)
values (54, ' Sunflower');
insert into EQUIPMENT (equipmentid, equipmentname)
values (55, ' GardenSpade');
insert into EQUIPMENT (equipmentid, equipmentname)
values (56, ' Carnation');
insert into EQUIPMENT (equipmentid, equipmentname)
values (57, ' Azalea');
insert into EQUIPMENT (equipmentid, equipmentname)
values (58, ' Dahlia');
insert into EQUIPMENT (equipmentid, equipmentname)
values (59, ' Freesia');
insert into EQUIPMENT (equipmentid, equipmentname)
values (61, ' Bougainvillea');
insert into EQUIPMENT (equipmentid, equipmentname)
values (62, ' GardenEdging');
insert into EQUIPMENT (equipmentid, equipmentname)
values (63, ' Pansy');
insert into EQUIPMENT (equipmentid, equipmentname)
values (64, ' Poppy');
insert into EQUIPMENT (equipmentid, equipmentname)
values (65, ' Hydrangea');
insert into EQUIPMENT (equipmentid, equipmentname)
values (66, ' Gladiolus');
insert into EQUIPMENT (equipmentid, equipmentname)
values (67, ' Lavender');
insert into EQUIPMENT (equipmentid, equipmentname)
values (68, ' Aster');
insert into EQUIPMENT (equipmentid, equipmentname)
values (69, ' Geranium');
insert into EQUIPMENT (equipmentid, equipmentname)
values (70, ' Sprayer');
insert into EQUIPMENT (equipmentid, equipmentname)
values (71, ' Zinnia');
insert into EQUIPMENT (equipmentid, equipmentname)
values (72, ' Begonia');
insert into EQUIPMENT (equipmentid, equipmentname)
values (73, ' Daffodil');
insert into EQUIPMENT (equipmentid, equipmentname)
values (74, ' Crocus');
insert into EQUIPMENT (equipmentid, equipmentname)
values (75, ' BirdFeeder');
insert into EQUIPMENT (equipmentid, equipmentname)
values (76, ' Violet');
insert into EQUIPMENT (equipmentid, equipmentname)
values (77, ' Marigold');
insert into EQUIPMENT (equipmentid, equipmentname)
values (78, ' GardenKneeler');
insert into EQUIPMENT (equipmentid, equipmentname)
values (79, ' Columbine');
insert into EQUIPMENT (equipmentid, equipmentname)
values (81, ' Cosmos');
insert into EQUIPMENT (equipmentid, equipmentname)
values (82, ' Wisteria');
insert into EQUIPMENT (equipmentid, equipmentname)
values (83, ' Clematis');
insert into EQUIPMENT (equipmentid, equipmentname)
values (84, ' GardenBench');
insert into EQUIPMENT (equipmentid, equipmentname)
values (85, ' Foxglove');
insert into EQUIPMENT (equipmentid, equipmentname)
values (86, ' Phlox');
insert into EQUIPMENT (equipmentid, equipmentname)
values (87, ' Hollyhock');
insert into EQUIPMENT (equipmentid, equipmentname)
values (88, ' Anemone');
insert into EQUIPMENT (equipmentid, equipmentname)
values (90, ' braidchair');
insert into EQUIPMENT (equipmentid, equipmentname)
values (91, ' hoop');
insert into EQUIPMENT (equipmentid, equipmentname)
values (92, ' vase');
insert into EQUIPMENT (equipmentid, equipmentname)
values (93, ' minivase');
insert into EQUIPMENT (equipmentid, equipmentname)
values (94, ' bigvase');
insert into EQUIPMENT (equipmentid, equipmentname)
values (95, ' thinvase');
insert into EQUIPMENT (equipmentid, equipmentname)
values (96, ' ugevase');
insert into EQUIPMENT (equipmentid, equipmentname)
values (97, ' pinkmap');
insert into EQUIPMENT (equipmentid, equipmentname)
values (98, ' purplemap');
insert into EQUIPMENT (equipmentid, equipmentname)
values (99, ' greenmap');
insert into EQUIPMENT (equipmentid, equipmentname)
values (100, ' yellowmap');
insert into EQUIPMENT (equipmentid, equipmentname)
values (101, ' bluemap');
insert into EQUIPMENT (equipmentid, equipmentname)
values (102, ' lightbluemap');
insert into EQUIPMENT (equipmentid, equipmentname)
values (103, ' lightgreenmap');
insert into EQUIPMENT (equipmentid, equipmentname)
values (104, ' begemap');
insert into EQUIPMENT (equipmentid, equipmentname)
values (105, ' whitemap');
insert into EQUIPMENT (equipmentid, equipmentname)
values (106, ' pinkraner');
commit;
prompt 100 records committed...
insert into EQUIPMENT (equipmentid, equipmentname)
values (107, ' purpleraner');
insert into EQUIPMENT (equipmentid, equipmentname)
values (108, ' greenraner');
insert into EQUIPMENT (equipmentid, equipmentname)
values (110, ' blueraner');
insert into EQUIPMENT (equipmentid, equipmentname)
values (111, ' lightblueraner');
insert into EQUIPMENT (equipmentid, equipmentname)
values (112, ' begeraner');
insert into EQUIPMENT (equipmentid, equipmentname)
values (113, ' whiteraner');
insert into EQUIPMENT (equipmentid, equipmentname)
values (114, ' bigsponge');
insert into EQUIPMENT (equipmentid, equipmentname)
values (115, ' tinysponge');
insert into EQUIPMENT (equipmentid, equipmentname)
values (116, ' squresponge');
insert into EQUIPMENT (equipmentid, equipmentname)
values (117, ' sand');
insert into EQUIPMENT (equipmentid, equipmentname)
values (118, ' Tulip');
insert into EQUIPMENT (equipmentid, equipmentname)
values (120, ' bigchandelier');
insert into EQUIPMENT (equipmentid, equipmentname)
values (32, ' Landscape Fabric');
insert into EQUIPMENT (equipmentid, equipmentname)
values (50, ' LilyoftheValley');
insert into EQUIPMENT (equipmentid, equipmentname)
values (60, ' PropagationDome');
insert into EQUIPMENT (equipmentid, equipmentname)
values (80, ' DiatomaceousEarth');
insert into EQUIPMENT (equipmentid, equipmentname)
values (89, ' LilyoftheValley');
insert into EQUIPMENT (equipmentid, equipmentname)
values (109, ' lightgreenraner');
insert into EQUIPMENT (equipmentid, equipmentname)
values (119, ' smallchandelier');
insert into EQUIPMENT (equipmentid, equipmentname)
values (121, ' normalchandelier');
insert into EQUIPMENT (equipmentid, equipmentname)
values (122, ' pomegranates');
insert into EQUIPMENT (equipmentid, equipmentname)
values (123, ' pinktulle');
insert into EQUIPMENT (equipmentid, equipmentname)
values (124, ' purpletulle');
insert into EQUIPMENT (equipmentid, equipmentname)
values (125, ' greentulle');
insert into EQUIPMENT (equipmentid, equipmentname)
values (126, ' lightgreentulle');
insert into EQUIPMENT (equipmentid, equipmentname)
values (127, ' redtulle');
insert into EQUIPMENT (equipmentid, equipmentname)
values (128, ' begetulle');
insert into EQUIPMENT (equipmentid, equipmentname)
values (129, ' bluetulle');
insert into EQUIPMENT (equipmentid, equipmentname)
values (130, ' lightbluetulle');
commit;
prompt 129 records loaded
prompt Loading PAKCAGE...
insert into PAKCAGE (packageid, packagename, price)
values (1, ' bridachair', 5500);
insert into PAKCAGE (packageid, packagename, price)
values (2, ' Tabledecoration', 5000);
insert into PAKCAGE (packageid, packagename, price)
values (3, ' Bridalbouquet', 2000);
insert into PAKCAGE (packageid, packagename, price)
values (4, ' Bridalchair + tabledesign', 7000);
insert into PAKCAGE (packageid, packagename, price)
values (6, ' Bardesign', 6000);
insert into PAKCAGE (packageid, packagename, price)
values (7, ' tablegarlands', 8500);
insert into PAKCAGE (packageid, packagename, price)
values (8, ' Backtoabridalchair+bridachair', 7000);
insert into PAKCAGE (packageid, packagename, price)
values (9, ' tablegarlands+Tabledecoration', 8000);
insert into PAKCAGE (packageid, packagename, price)
values (10, ' Designedchandeliers', 10000);
insert into PAKCAGE (packageid, packagename, price)
values (11, 'Basic Package', 10000);
commit;
prompt 10 records loaded
prompt Loading CONTAINING...
insert into CONTAINING (amountc, equipmentid, packageid)
values (5687, 41, 4);
insert into CONTAINING (amountc, equipmentid, packageid)
values (2572, 120, 1);
insert into CONTAINING (amountc, equipmentid, packageid)
values (2011, 89, 1);
insert into CONTAINING (amountc, equipmentid, packageid)
values (312, 45, 1);
insert into CONTAINING (amountc, equipmentid, packageid)
values (2178, 65, 6);
insert into CONTAINING (amountc, equipmentid, packageid)
values (1685, 112, 3);
insert into CONTAINING (amountc, equipmentid, packageid)
values (319, 50, 1);
insert into CONTAINING (amountc, equipmentid, packageid)
values (6327, 77, 2);
insert into CONTAINING (amountc, equipmentid, packageid)
values (9352, 120, 3);
insert into CONTAINING (amountc, equipmentid, packageid)
values (7736, 45, 7);
insert into CONTAINING (amountc, equipmentid, packageid)
values (9287, 123, 10);
insert into CONTAINING (amountc, equipmentid, packageid)
values (789, 64, 9);
insert into CONTAINING (amountc, equipmentid, packageid)
values (7809, 105, 1);
insert into CONTAINING (amountc, equipmentid, packageid)
values (8017, 44, 7);
insert into CONTAINING (amountc, equipmentid, packageid)
values (3380, 68, 6);
insert into CONTAINING (amountc, equipmentid, packageid)
values (4843, 21, 7);
insert into CONTAINING (amountc, equipmentid, packageid)
values (5629, 100, 1);
insert into CONTAINING (amountc, equipmentid, packageid)
values (3395, 9, 10);
insert into CONTAINING (amountc, equipmentid, packageid)
values (9925, 102, 2);
insert into CONTAINING (amountc, equipmentid, packageid)
values (5518, 112, 10);
insert into CONTAINING (amountc, equipmentid, packageid)
values (2689, 10, 4);
insert into CONTAINING (amountc, equipmentid, packageid)
values (1966, 88, 9);
insert into CONTAINING (amountc, equipmentid, packageid)
values (4904, 46, 6);
insert into CONTAINING (amountc, equipmentid, packageid)
values (8685, 118, 2);
insert into CONTAINING (amountc, equipmentid, packageid)
values (1385, 3, 6);
insert into CONTAINING (amountc, equipmentid, packageid)
values (7572, 38, 1);
insert into CONTAINING (amountc, equipmentid, packageid)
values (5243, 73, 9);
insert into CONTAINING (amountc, equipmentid, packageid)
values (76, 101, 3);
insert into CONTAINING (amountc, equipmentid, packageid)
values (6455, 13, 4);
insert into CONTAINING (amountc, equipmentid, packageid)
values (8089, 77, 3);
insert into CONTAINING (amountc, equipmentid, packageid)
values (1203, 59, 6);
insert into CONTAINING (amountc, equipmentid, packageid)
values (625, 24, 7);
insert into CONTAINING (amountc, equipmentid, packageid)
values (7769, 66, 2);
insert into CONTAINING (amountc, equipmentid, packageid)
values (9528, 58, 10);
insert into CONTAINING (amountc, equipmentid, packageid)
values (9928, 127, 10);
insert into CONTAINING (amountc, equipmentid, packageid)
values (3974, 76, 1);
insert into CONTAINING (amountc, equipmentid, packageid)
values (6369, 38, 3);
insert into CONTAINING (amountc, equipmentid, packageid)
values (7958, 22, 6);
insert into CONTAINING (amountc, equipmentid, packageid)
values (7517, 43, 3);
insert into CONTAINING (amountc, equipmentid, packageid)
values (141, 124, 6);
insert into CONTAINING (amountc, equipmentid, packageid)
values (8518, 37, 7);
insert into CONTAINING (amountc, equipmentid, packageid)
values (9784, 35, 3);
insert into CONTAINING (amountc, equipmentid, packageid)
values (1764, 33, 9);
insert into CONTAINING (amountc, equipmentid, packageid)
values (1510, 69, 6);
insert into CONTAINING (amountc, equipmentid, packageid)
values (3902, 25, 2);
insert into CONTAINING (amountc, equipmentid, packageid)
values (7613, 48, 3);
insert into CONTAINING (amountc, equipmentid, packageid)
values (8288, 115, 3);
insert into CONTAINING (amountc, equipmentid, packageid)
values (930, 126, 10);
insert into CONTAINING (amountc, equipmentid, packageid)
values (9623, 53, 6);
insert into CONTAINING (amountc, equipmentid, packageid)
values (3523, 54, 1);
insert into CONTAINING (amountc, equipmentid, packageid)
values (4521, 130, 9);
insert into CONTAINING (amountc, equipmentid, packageid)
values (8374, 96, 7);
insert into CONTAINING (amountc, equipmentid, packageid)
values (4612, 129, 3);
insert into CONTAINING (amountc, equipmentid, packageid)
values (2651, 5, 2);
insert into CONTAINING (amountc, equipmentid, packageid)
values (8966, 127, 4);
insert into CONTAINING (amountc, equipmentid, packageid)
values (2744, 7, 8);
insert into CONTAINING (amountc, equipmentid, packageid)
values (5014, 33, 2);
insert into CONTAINING (amountc, equipmentid, packageid)
values (4720, 109, 9);
insert into CONTAINING (amountc, equipmentid, packageid)
values (3048, 4, 8);
insert into CONTAINING (amountc, equipmentid, packageid)
values (7493, 100, 6);
insert into CONTAINING (amountc, equipmentid, packageid)
values (3655, 108, 3);
insert into CONTAINING (amountc, equipmentid, packageid)
values (4771, 48, 2);
insert into CONTAINING (amountc, equipmentid, packageid)
values (2194, 26, 1);
insert into CONTAINING (amountc, equipmentid, packageid)
values (5619, 85, 4);
insert into CONTAINING (amountc, equipmentid, packageid)
values (9669, 11, 4);
insert into CONTAINING (amountc, equipmentid, packageid)
values (7826, 90, 6);
insert into CONTAINING (amountc, equipmentid, packageid)
values (8191, 17, 1);
insert into CONTAINING (amountc, equipmentid, packageid)
values (8845, 20, 2);
insert into CONTAINING (amountc, equipmentid, packageid)
values (3928, 32, 6);
insert into CONTAINING (amountc, equipmentid, packageid)
values (1650, 8, 4);
insert into CONTAINING (amountc, equipmentid, packageid)
values (3839, 57, 2);
insert into CONTAINING (amountc, equipmentid, packageid)
values (1082, 49, 3);
insert into CONTAINING (amountc, equipmentid, packageid)
values (5211, 81, 4);
insert into CONTAINING (amountc, equipmentid, packageid)
values (9574, 40, 6);
insert into CONTAINING (amountc, equipmentid, packageid)
values (3952, 7, 3);
insert into CONTAINING (amountc, equipmentid, packageid)
values (4681, 83, 2);
insert into CONTAINING (amountc, equipmentid, packageid)
values (7683, 16, 1);
insert into CONTAINING (amountc, equipmentid, packageid)
values (3083, 37, 9);
insert into CONTAINING (amountc, equipmentid, packageid)
values (2499, 98, 8);
insert into CONTAINING (amountc, equipmentid, packageid)
values (6407, 52, 8);
insert into CONTAINING (amountc, equipmentid, packageid)
values (9282, 114, 7);
commit;
prompt 81 records loaded
prompt Loading DESIGNER...
insert into DESIGNER (designername, designerid, payment)
values (' Debbie', 1, 5000);
insert into DESIGNER (designername, designerid, payment)
values (' Daniel', 2, 10400);
insert into DESIGNER (designername, designerid, payment)
values (' Anna', 3, 4500);
insert into DESIGNER (designername, designerid, payment)
values (' John', 4, 7000);
insert into DESIGNER (designername, designerid, payment)
values (' Linda', 5, 6200);
insert into DESIGNER (designername, designerid, payment)
values (' Michael', 6, 9200);
insert into DESIGNER (designername, designerid, payment)
values (' Emily', 7, 4800);
insert into DESIGNER (designername, designerid, payment)
values (' Robert', 8, 7600);
insert into DESIGNER (designername, designerid, payment)
values (' Laura', 9, 5300);
insert into DESIGNER (designername, designerid, payment)
values (' David', 10, 8400);
insert into DESIGNER (designername, designerid, payment)
values (' Jessica', 11, 4900);
insert into DESIGNER (designername, designerid, payment)
values (' Richard', 12, 7100);
insert into DESIGNER (designername, designerid, payment)
values (' Karen', 13, 6500);
insert into DESIGNER (designername, designerid, payment)
values (' Thomas', 14, 7900);
insert into DESIGNER (designername, designerid, payment)
values (' Susan', 15, 5700);
insert into DESIGNER (designername, designerid, payment)
values (' Charles', 16, 8600);
insert into DESIGNER (designername, designerid, payment)
values (' Sarah', 17, 4700);
insert into DESIGNER (designername, designerid, payment)
values (' Joseph', 18, 7300);
insert into DESIGNER (designername, designerid, payment)
values (' Karen', 19, 6900);
insert into DESIGNER (designername, designerid, payment)
values (' James', 20, 8300);
insert into DESIGNER (designername, designerid, payment)
values (' Patricia', 21, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Christopher', 22, 9100);
insert into DESIGNER (designername, designerid, payment)
values (' Barbara', 23, 5800);
insert into DESIGNER (designername, designerid, payment)
values (' Matthew', 24, 7800);
insert into DESIGNER (designername, designerid, payment)
values (' Elizabeth', 25, 6100);
insert into DESIGNER (designername, designerid, payment)
values (' Anthony', 26, 8500);
insert into DESIGNER (designername, designerid, payment)
values (' Lisa', 27, 4900);
insert into DESIGNER (designername, designerid, payment)
values (' Joshua', 28, 7200);
insert into DESIGNER (designername, designerid, payment)
values (' Nancy', 29, 6300);
insert into DESIGNER (designername, designerid, payment)
values (' Andrew', 30, 8800);
insert into DESIGNER (designername, designerid, payment)
values (' Karen', 31, 5900);
insert into DESIGNER (designername, designerid, payment)
values (' Steven', 32, 7400);
insert into DESIGNER (designername, designerid, payment)
values (' Margaret', 33, 6200);
insert into DESIGNER (designername, designerid, payment)
values (' Kevin', 34, 9000);
insert into DESIGNER (designername, designerid, payment)
values (' Sandra', 35, 5600);
insert into DESIGNER (designername, designerid, payment)
values (' Brian', 36, 7700);
insert into DESIGNER (designername, designerid, payment)
values (' Ashley', 37, 5800);
insert into DESIGNER (designername, designerid, payment)
values (' Edward', 38, 9300);
insert into DESIGNER (designername, designerid, payment)
values (' Donna', 39, 5700);
insert into DESIGNER (designername, designerid, payment)
values (' Ronald', 40, 7600);
insert into DESIGNER (designername, designerid, payment)
values (' Michelle', 41, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Timothy', 42, 8400);
insert into DESIGNER (designername, designerid, payment)
values (' Carol', 43, 6300);
insert into DESIGNER (designername, designerid, payment)
values (' Jason', 44, 8700);
insert into DESIGNER (designername, designerid, payment)
values (' Dorothy', 45, 6100);
insert into DESIGNER (designername, designerid, payment)
values (' Jeffrey', 46, 8900);
insert into DESIGNER (designername, designerid, payment)
values (' Rebecca', 47, 5500);
insert into DESIGNER (designername, designerid, payment)
values (' Ryan', 48, 7400);
insert into DESIGNER (designername, designerid, payment)
values (' Sharon', 49, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Gary', 50, 8100);
insert into DESIGNER (designername, designerid, payment)
values (' Cynthia', 51, 5300);
insert into DESIGNER (designername, designerid, payment)
values (' Jacob', 52, 8000);
insert into DESIGNER (designername, designerid, payment)
values (' Kathleen', 53, 5800);
insert into DESIGNER (designername, designerid, payment)
values (' Nicholas', 54, 8900);
insert into DESIGNER (designername, designerid, payment)
values (' Shirley', 55, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Eric', 56, 7800);
insert into DESIGNER (designername, designerid, payment)
values (' Amy', 57, 5400);
insert into DESIGNER (designername, designerid, payment)
values (' Stephen', 58, 8300);
insert into DESIGNER (designername, designerid, payment)
values (' Angela', 59, 5800);
insert into DESIGNER (designername, designerid, payment)
values (' Jonathan', 60, 9100);
insert into DESIGNER (designername, designerid, payment)
values (' Helen', 61, 5900);
insert into DESIGNER (designername, designerid, payment)
values (' Larry', 62, 7500);
insert into DESIGNER (designername, designerid, payment)
values (' Anna', 63, 6300);
insert into DESIGNER (designername, designerid, payment)
values (' Justin', 64, 9400);
insert into DESIGNER (designername, designerid, payment)
values (' Ruth', 65, 5700);
insert into DESIGNER (designername, designerid, payment)
values (' Scott', 66, 8600);
insert into DESIGNER (designername, designerid, payment)
values (' Brenda', 67, 6200);
insert into DESIGNER (designername, designerid, payment)
values (' Brandon', 68, 9000);
insert into DESIGNER (designername, designerid, payment)
values (' Pamela', 69, 6100);
insert into DESIGNER (designername, designerid, payment)
values (' Frank', 70, 8700);
insert into DESIGNER (designername, designerid, payment)
values (' Nicole', 71, 5900);
insert into DESIGNER (designername, designerid, payment)
values (' Benjamin', 72, 8300);
insert into DESIGNER (designername, designerid, payment)
values (' Katherine', 73, 6200);
insert into DESIGNER (designername, designerid, payment)
values (' Gregory', 74, 9200);
insert into DESIGNER (designername, designerid, payment)
values (' Samantha', 75, 5800);
insert into DESIGNER (designername, designerid, payment)
values (' Raymond', 76, 7600);
insert into DESIGNER (designername, designerid, payment)
values (' Carolyn', 77, 5700);
insert into DESIGNER (designername, designerid, payment)
values (' Patrick', 78, 8100);
insert into DESIGNER (designername, designerid, payment)
values (' Janet', 79, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Jack', 80, 8800);
insert into DESIGNER (designername, designerid, payment)
values (' Christine', 81, 6300);
insert into DESIGNER (designername, designerid, payment)
values (' Dennis', 82, 9100);
insert into DESIGNER (designername, designerid, payment)
values (' Maria', 83, 6100);
insert into DESIGNER (designername, designerid, payment)
values (' Jerry', 84, 8900);
insert into DESIGNER (designername, designerid, payment)
values (' Heather', 85, 5600);
insert into DESIGNER (designername, designerid, payment)
values (' Tyler', 86, 8300);
insert into DESIGNER (designername, designerid, payment)
values (' Diane', 87, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Aaron', 88, 8700);
insert into DESIGNER (designername, designerid, payment)
values (' Julie', 89, 5900);
insert into DESIGNER (designername, designerid, payment)
values (' Henry', 90, 8200);
insert into DESIGNER (designername, designerid, payment)
values (' Teresa', 91, 5700);
insert into DESIGNER (designername, designerid, payment)
values (' Adam', 92, 9000);
insert into DESIGNER (designername, designerid, payment)
values (' Gloria', 93, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Jose', 94, 7500);
insert into DESIGNER (designername, designerid, payment)
values (' Alice', 95, 6400);
insert into DESIGNER (designername, designerid, payment)
values (' Nathan', 96, 9200);
insert into DESIGNER (designername, designerid, payment)
values (' Ann', 97, 5700);
insert into DESIGNER (designername, designerid, payment)
values (' Bryan', 98, 8800);
insert into DESIGNER (designername, designerid, payment)
values (' Jean', 99, 6200);
insert into DESIGNER (designername, designerid, payment)
values (' Samuel', 100, 9300);
commit;
prompt 100 records committed...
insert into DESIGNER (designername, designerid, payment)
values (' Megan', 101, 5900);
insert into DESIGNER (designername, designerid, payment)
values (' Jordan', 102, 8500);
insert into DESIGNER (designername, designerid, payment)
values (' Marie', 103, 6100);
insert into DESIGNER (designername, designerid, payment)
values (' Willie', 104, 8700);
insert into DESIGNER (designername, designerid, payment)
values (' Julia', 105, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Ralph', 106, 8100);
insert into DESIGNER (designername, designerid, payment)
values (' Victoria', 107, 6200);
insert into DESIGNER (designername, designerid, payment)
values (' Carl', 108, 9400);
insert into DESIGNER (designername, designerid, payment)
values (' Judith', 109, 5800);
insert into DESIGNER (designername, designerid, payment)
values (' Billy', 110, 8300);
insert into DESIGNER (designername, designerid, payment)
values (' Megan', 111, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Wayne', 112, 9200);
insert into DESIGNER (designername, designerid, payment)
values (' Amber', 113, 5900);
insert into DESIGNER (designername, designerid, payment)
values (' Louis', 114, 8600);
insert into DESIGNER (designername, designerid, payment)
values (' Brittany', 115, 6100);
insert into DESIGNER (designername, designerid, payment)
values (' Roy', 116, 8900);
insert into DESIGNER (designername, designerid, payment)
values (' Madison', 117, 5700);
insert into DESIGNER (designername, designerid, payment)
values (' Eugene', 118, 7800);
insert into DESIGNER (designername, designerid, payment)
values (' Grace', 119, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Keith', 120, 8700);
insert into DESIGNER (designername, designerid, payment)
values (' Rose', 121, 6300);
insert into DESIGNER (designername, designerid, payment)
values (' Dylan', 122, 9100);
insert into DESIGNER (designername, designerid, payment)
values (' Beverly', 123, 6100);
insert into DESIGNER (designername, designerid, payment)
values (' Elijah', 124, 9000);
insert into DESIGNER (designername, designerid, payment)
values (' Denise', 125, 5600);
insert into DESIGNER (designername, designerid, payment)
values (' Randy', 126, 8200);
insert into DESIGNER (designername, designerid, payment)
values (' Marilyn', 127, 5900);
insert into DESIGNER (designername, designerid, payment)
values (' Vincent', 128, 8700);
insert into DESIGNER (designername, designerid, payment)
values (' Olivia', 129, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Jesse', 130, 9100);
insert into DESIGNER (designername, designerid, payment)
values (' Emma', 131, 5700);
insert into DESIGNER (designername, designerid, payment)
values (' Alexander', 132, 8600);
insert into DESIGNER (designername, designerid, payment)
values (' Madison', 133, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Russell', 134, 9300);
insert into DESIGNER (designername, designerid, payment)
values (' Abigail', 135, 6100);
insert into DESIGNER (designername, designerid, payment)
values (' Bruce', 136, 8800);
insert into DESIGNER (designername, designerid, payment)
values (' Alexis', 137, 6300);
insert into DESIGNER (designername, designerid, payment)
values (' Craig', 138, 9400);
insert into DESIGNER (designername, designerid, payment)
values (' Isabella', 139, 5900);
insert into DESIGNER (designername, designerid, payment)
values (' Jerry', 140, 7800);
insert into DESIGNER (designername, designerid, payment)
values (' Evelyn', 141, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Lawrence', 142, 9000);
insert into DESIGNER (designername, designerid, payment)
values (' Gabriella', 143, 5800);
insert into DESIGNER (designername, designerid, payment)
values (' Alan', 144, 8100);
insert into DESIGNER (designername, designerid, payment)
values (' Marilyn', 145, 6200);
insert into DESIGNER (designername, designerid, payment)
values (' Shaun', 146, 8700);
insert into DESIGNER (designername, designerid, payment)
values (' Charlotte', 147, 6100);
insert into DESIGNER (designername, designerid, payment)
values (' Philip', 148, 9300);
insert into DESIGNER (designername, designerid, payment)
values (' Isabella', 149, 5900);
insert into DESIGNER (designername, designerid, payment)
values (' Wayne', 150, 7500);
insert into DESIGNER (designername, designerid, payment)
values (' Alyssa', 151, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Terry', 152, 8200);
insert into DESIGNER (designername, designerid, payment)
values (' Katherine', 153, 5800);
insert into DESIGNER (designername, designerid, payment)
values (' Dylan', 154, 9400);
insert into DESIGNER (designername, designerid, payment)
values (' Lauren', 155, 5700);
insert into DESIGNER (designername, designerid, payment)
values (' Johnny', 156, 8700);
insert into DESIGNER (designername, designerid, payment)
values (' Anna', 157, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Jeff', 158, 8900);
insert into DESIGNER (designername, designerid, payment)
values (' Jill', 159, 6300);
insert into DESIGNER (designername, designerid, payment)
values (' Steve', 160, 9100);
insert into DESIGNER (designername, designerid, payment)
values (' Janet', 161, 6100);
insert into DESIGNER (designername, designerid, payment)
values (' Bradley', 162, 9300);
insert into DESIGNER (designername, designerid, payment)
values (' Rachel', 163, 5800);
insert into DESIGNER (designername, designerid, payment)
values (' Jeremy', 164, 7800);
insert into DESIGNER (designername, designerid, payment)
values (' Lauren', 165, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Harold', 166, 8000);
insert into DESIGNER (designername, designerid, payment)
values (' Stephanie', 167, 5900);
insert into DESIGNER (designername, designerid, payment)
values (' Walter', 168, 8900);
insert into DESIGNER (designername, designerid, payment)
values (' Susan', 169, 6200);
insert into DESIGNER (designername, designerid, payment)
values (' Ethan', 170, 9300);
insert into DESIGNER (designername, designerid, payment)
values (' Ann', 171, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Arthur', 172, 8600);
insert into DESIGNER (designername, designerid, payment)
values (' Shannon', 173, 5700);
insert into DESIGNER (designername, designerid, payment)
values (' Peter', 174, 9400);
insert into DESIGNER (designername, designerid, payment)
values (' Diane', 175, 5900);
insert into DESIGNER (designername, designerid, payment)
values (' Jesse', 176, 8300);
insert into DESIGNER (designername, designerid, payment)
values (' Christina', 177, 6100);
insert into DESIGNER (designername, designerid, payment)
values (' Dylan', 178, 8700);
insert into DESIGNER (designername, designerid, payment)
values (' Megan', 179, 6200);
insert into DESIGNER (designername, designerid, payment)
values (' Howard', 180, 8800);
insert into DESIGNER (designername, designerid, payment)
values (' Gloria', 181, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Jonathan', 182, 9000);
insert into DESIGNER (designername, designerid, payment)
values (' Jessica', 183, 5900);
insert into DESIGNER (designername, designerid, payment)
values (' Shawn', 184, 8600);
insert into DESIGNER (designername, designerid, payment)
values (' Andrea', 185, 6100);
insert into DESIGNER (designername, designerid, payment)
values (' Bryan', 186, 9100);
insert into DESIGNER (designername, designerid, payment)
values (' Brenda', 187, 5700);
insert into DESIGNER (designername, designerid, payment)
values (' George', 188, 8300);
insert into DESIGNER (designername, designerid, payment)
values (' Victoria', 189, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Harold', 190, 9400);
insert into DESIGNER (designername, designerid, payment)
values (' Lisa', 191, 5800);
insert into DESIGNER (designername, designerid, payment)
values (' Mark', 192, 8200);
insert into DESIGNER (designername, designerid, payment)
values (' Tiffany', 193, 6100);
insert into DESIGNER (designername, designerid, payment)
values (' Rodney', 194, 8700);
insert into DESIGNER (designername, designerid, payment)
values (' Rachel', 195, 6000);
insert into DESIGNER (designername, designerid, payment)
values (' Joe', 196, 9100);
insert into DESIGNER (designername, designerid, payment)
values (' Amber', 197, 5900);
insert into DESIGNER (designername, designerid, payment)
values (' Henry', 198, 8600);
insert into DESIGNER (designername, designerid, payment)
values (' Stephanie', 199, 6200);
insert into DESIGNER (designername, designerid, payment)
values (' Ethan', 200, 9400);
commit;
prompt 200 records committed...
insert into DESIGNER (designername, designerid, payment)
values ('Jane Smith', 1001, 0);
insert into DESIGNER (designername, designerid, payment)
values ('Jane Smith', 1002, 0);
insert into DESIGNER (designername, designerid, payment)
values ('Jane Smith', 1003, 0);
commit;
prompt 203 records loaded
prompt Loading MEAL...
insert into MEAL (mealid, mealname, mealprice)
values (774, 'steak', 52);
insert into MEAL (mealid, mealname, mealprice)
values (519, 'kebab-skewer', 86);
insert into MEAL (mealid, mealname, mealprice)
values (487, 'salad', 112);
insert into MEAL (mealid, mealname, mealprice)
values (446, 'Meatballs', 32);
insert into MEAL (mealid, mealname, mealprice)
values (173, 'Dumplings', 37);
insert into MEAL (mealid, mealname, mealprice)
values (970, 'water', 34);
insert into MEAL (mealid, mealname, mealprice)
values (643, 'beer', 88);
insert into MEAL (mealid, mealname, mealprice)
values (636, 'entrecote-skewer', 20);
insert into MEAL (mealid, mealname, mealprice)
values (364, 'chicken-skewer', 132);
insert into MEAL (mealid, mealname, mealprice)
values (243, 'PatatasBravas', 18);
insert into MEAL (mealid, mealname, mealprice)
values (997, 'Shakshuka', 128);
insert into MEAL (mealid, mealname, mealprice)
values (908, 'Poutine', 144);
insert into MEAL (mealid, mealname, mealprice)
values (369, 'BakedBeans', 120);
insert into MEAL (mealid, mealname, mealprice)
values (816, 'FishCurry', 75);
insert into MEAL (mealid, mealname, mealprice)
values (982, 'PolloAsado', 112);
insert into MEAL (mealid, mealname, mealprice)
values (381, 'Sukiyaki', 21);
insert into MEAL (mealid, mealname, mealprice)
values (412, 'TunaMelt', 39);
insert into MEAL (mealid, mealname, mealprice)
values (357, 'Kebab', 16);
insert into MEAL (mealid, mealname, mealprice)
values (232, 'Cornbread', 95);
insert into MEAL (mealid, mealname, mealprice)
values (397, 'Mole', 142);
insert into MEAL (mealid, mealname, mealprice)
values (780, 'ChowMein', 37);
insert into MEAL (mealid, mealname, mealprice)
values (116, 'Paella', 36);
insert into MEAL (mealid, mealname, mealprice)
values (450, 'EggRoll', 124);
insert into MEAL (mealid, mealname, mealprice)
values (262, 'Vichyssoise', 86);
insert into MEAL (mealid, mealname, mealprice)
values (375, 'Goulash', 114);
insert into MEAL (mealid, mealname, mealprice)
values (893, 'PekingDuck', 91);
insert into MEAL (mealid, mealname, mealprice)
values (463, 'Quesadilla', 107);
insert into MEAL (mealid, mealname, mealprice)
values (254, 'StuffedPeppers', 144);
insert into MEAL (mealid, mealname, mealprice)
values (699, 'LambChops', 91);
insert into MEAL (mealid, mealname, mealprice)
values (926, 'TarteTatin', 134);
insert into MEAL (mealid, mealname, mealprice)
values (691, 'Pasta', 92);
insert into MEAL (mealid, mealname, mealprice)
values (246, 'HushPuppies', 67);
insert into MEAL (mealid, mealname, mealprice)
values (740, 'Steak', 105);
insert into MEAL (mealid, mealname, mealprice)
values (471, 'Enchiladas', 94);
insert into MEAL (mealid, mealname, mealprice)
values (239, 'PulledPork', 99);
insert into MEAL (mealid, mealname, mealprice)
values (999, 'Ratatouille', 118);
insert into MEAL (mealid, mealname, mealprice)
values (761, 'Moussaka', 106);
insert into MEAL (mealid, mealname, mealprice)
values (520, 'Macaroni', 44);
insert into MEAL (mealid, mealname, mealprice)
values (600, 'CrabCakes', 69);
insert into MEAL (mealid, mealname, mealprice)
values (121, 'VeggieBurger', 33);
insert into MEAL (mealid, mealname, mealprice)
values (581, 'Tiramisu', 62);
insert into MEAL (mealid, mealname, mealprice)
values (284, 'Laksa', 25);
insert into MEAL (mealid, mealname, mealprice)
values (832, 'Spanakopita', 108);
insert into MEAL (mealid, mealname, mealprice)
values (741, 'Ceviche', 35);
insert into MEAL (mealid, mealname, mealprice)
values (347, 'BabaGanoush', 62);
insert into MEAL (mealid, mealname, mealprice)
values (183, 'RedBeans', 135);
insert into MEAL (mealid, mealname, mealprice)
values (155, 'MakiRoll', 54);
insert into MEAL (mealid, mealname, mealprice)
values (145, 'FishandChips', 48);
insert into MEAL (mealid, mealname, mealprice)
values (585, 'Empanadas', 36);
insert into MEAL (mealid, mealname, mealprice)
values (620, 'Bruschetta', 99);
insert into MEAL (mealid, mealname, mealprice)
values (442, 'PotRoast', 29);
insert into MEAL (mealid, mealname, mealprice)
values (967, 'ZucchiniBread', 72);
insert into MEAL (mealid, mealname, mealprice)
values (537, 'Pancakes', 101);
insert into MEAL (mealid, mealname, mealprice)
values (123, 'Lobster', 20);
insert into MEAL (mealid, mealname, mealprice)
values (885, 'GrilledCheese', 91);
insert into MEAL (mealid, mealname, mealprice)
values (263, 'NasiGoreng', 90);
insert into MEAL (mealid, mealname, mealprice)
values (853, 'TurkeySandwich', 56);
insert into MEAL (mealid, mealname, mealprice)
values (489, 'FriedRice', 57);
insert into MEAL (mealid, mealname, mealprice)
values (327, 'EggsBenedict', 117);
insert into MEAL (mealid, mealname, mealprice)
values (215, 'Tapas', 84);
insert into MEAL (mealid, mealname, mealprice)
values (795, 'Fajitas', 57);
insert into MEAL (mealid, mealname, mealprice)
values (542, 'ShepherdsPie', 105);
insert into MEAL (mealid, mealname, mealprice)
values (941, 'Gazpacho', 125);
insert into MEAL (mealid, mealname, mealprice)
values (478, 'Kimchi', 99);
insert into MEAL (mealid, mealname, mealprice)
values (653, 'HotDog', 103);
insert into MEAL (mealid, mealname, mealprice)
values (513, 'MashedPotatoes', 64);
insert into MEAL (mealid, mealname, mealprice)
values (843, 'Shawarma', 122);
insert into MEAL (mealid, mealname, mealprice)
values (287, 'Pizza', 76);
insert into MEAL (mealid, mealname, mealprice)
values (532, 'Ravioli', 68);
insert into MEAL (mealid, mealname, mealprice)
values (673, 'SloppyJoes', 143);
insert into MEAL (mealid, mealname, mealprice)
values (801, 'Quiche', 103);
insert into MEAL (mealid, mealname, mealprice)
values (481, 'BeefStew', 55);
insert into MEAL (mealid, mealname, mealprice)
values (409, 'Spaghetti', 76);
insert into MEAL (mealid, mealname, mealprice)
values (165, 'FishTacos', 17);
insert into MEAL (mealid, mealname, mealprice)
values (365, 'Carbonara', 38);
insert into MEAL (mealid, mealname, mealprice)
values (841, 'Roti', 131);
insert into MEAL (mealid, mealname, mealprice)
values (135, 'Tempura', 52);
insert into MEAL (mealid, mealname, mealprice)
values (339, 'ChickenWings', 97);
insert into MEAL (mealid, mealname, mealprice)
values (233, 'Nachos', 50);
insert into MEAL (mealid, mealname, mealprice)
values (230, 'TortillaSoup', 135);
insert into MEAL (mealid, mealname, mealprice)
values (370, 'SurfandTurf', 149);
insert into MEAL (mealid, mealname, mealprice)
values (659, 'ScotchEgg', 142);
insert into MEAL (mealid, mealname, mealprice)
values (719, 'Gumbo', 136);
insert into MEAL (mealid, mealname, mealprice)
values (823, 'Oysters', 31);
insert into MEAL (mealid, mealname, mealprice)
values (839, 'PadThai', 88);
insert into MEAL (mealid, mealname, mealprice)
values (448, 'Falafel', 63);
insert into MEAL (mealid, mealname, mealprice)
values (783, 'Gnocchi', 75);
insert into MEAL (mealid, mealname, mealprice)
values (639, 'CoqauVin', 98);
insert into MEAL (mealid, mealname, mealprice)
values (578, 'Bibimbap', 140);
insert into MEAL (mealid, mealname, mealprice)
values (289, 'TunaSalad', 15);
insert into MEAL (mealid, mealname, mealprice)
values (281, 'Jambalaya', 136);
insert into MEAL (mealid, mealname, mealprice)
values (577, 'Ramen', 73);
insert into MEAL (mealid, mealname, mealprice)
values (477, 'ChickenParm', 126);
insert into MEAL (mealid, mealname, mealprice)
values (698, 'JalapenoPoppers', 88);
insert into MEAL (mealid, mealname, mealprice)
values (616, 'Bangers', 73);
insert into MEAL (mealid, mealname, mealprice)
values (170, 'Biryani', 69);
insert into MEAL (mealid, mealname, mealprice)
values (680, 'Pho', 50);
insert into MEAL (mealid, mealname, mealprice)
values (633, 'Sushi', 128);
insert into MEAL (mealid, mealname, mealprice)
values (886, 'Pastrami', 22);
insert into MEAL (mealid, mealname, mealprice)
values (686, 'Lasagna', 112);
commit;
prompt 100 records committed...
insert into MEAL (mealid, mealname, mealprice)
values (502, 'Chili', 120);
insert into MEAL (mealid, mealname, mealprice)
values (879, 'StuffedCabbage', 118);
insert into MEAL (mealid, mealname, mealprice)
values (922, 'Frittata', 102);
insert into MEAL (mealid, mealname, mealprice)
values (443, 'Souvlaki', 54);
insert into MEAL (mealid, mealname, mealprice)
values (541, 'TeriyakiChicken', 106);
insert into MEAL (mealid, mealname, mealprice)
values (249, 'Pierogi', 93);
insert into MEAL (mealid, mealname, mealprice)
values (181, 'Chowder', 148);
insert into MEAL (mealid, mealname, mealprice)
values (786, 'Tagine', 98);
insert into MEAL (mealid, mealname, mealprice)
values (964, 'DimSum', 17);
insert into MEAL (mealid, mealname, mealprice)
values (645, 'ShrimpCocktail', 92);
insert into MEAL (mealid, mealname, mealprice)
values (584, 'TomYum', 129);
insert into MEAL (mealid, mealname, mealprice)
values (352, 'Chimichanga', 138);
insert into MEAL (mealid, mealname, mealprice)
values (905, 'Tacos', 55);
insert into MEAL (mealid, mealname, mealprice)
values (423, 'Onigiri', 29);
insert into MEAL (mealid, mealname, mealprice)
values (296, 'ChiliDog', 64);
insert into MEAL (mealid, mealname, mealprice)
values (777, 'Curry', 144);
insert into MEAL (mealid, mealname, mealprice)
values (603, 'HuevosRancheros', 49);
insert into MEAL (mealid, mealname, mealprice)
values (946, 'FrenchToast', 119);
insert into MEAL (mealid, mealname, mealprice)
values (415, 'Polenta', 21);
insert into MEAL (mealid, mealname, mealprice)
values (383, 'Omelette', 77);
insert into MEAL (mealid, mealname, mealprice)
values (571, 'Sandwich', 37);
insert into MEAL (mealid, mealname, mealprice)
values (379, 'WaldorfSalad', 46);
insert into MEAL (mealid, mealname, mealprice)
values (583, 'Gravlax', 50);
insert into MEAL (mealid, mealname, mealprice)
values (119, 'Calzone', 85);
insert into MEAL (mealid, mealname, mealprice)
values (661, 'WontonSoup', 23);
insert into MEAL (mealid, mealname, mealprice)
values (914, 'Vindaloo', 17);
insert into MEAL (mealid, mealname, mealprice)
values (587, 'Crepes', 67);
insert into MEAL (mealid, mealname, mealprice)
values (591, 'Satay', 137);
insert into MEAL (mealid, mealname, mealprice)
values (694, 'Arancini', 53);
insert into MEAL (mealid, mealname, mealprice)
values (193, 'Porchetta', 25);
insert into MEAL (mealid, mealname, mealprice)
values (146, 'Burrito', 28);
insert into MEAL (mealid, mealname, mealprice)
values (815, 'Cassoulet', 16);
insert into MEAL (mealid, mealname, mealprice)
values (247, 'Salmon', 31);
insert into MEAL (mealid, mealname, mealprice)
values (610, 'TandooriChicken', 113);
commit;
prompt 134 records loaded
prompt Loading SUPPLIER_...
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (12345, 'debi', 'north', '0126526629');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (12365, 'chani', 'south', '0604181995');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (89065, 'meir', 'gushdDan', '0831218926');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (87655, 'dasi', 'gushdDan', '0199836468');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (23565, 'eti', 'south', '0752380241');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (15365, 'noa', 'gushdDan', '0528902346');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (113901579, 'Jeanne-Graham', 'gushDan', '068-3598580');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (113986994, 'Meryl-Bright', 'gushDan', '047-4546417');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (114547847, 'First-Emmerich', 'gushDan', '095-8702853');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (118715610, 'Elias-Kadison', 'North', '083-3905874');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (119983778, 'Lin-Dunaway', 'North', '070-7828864');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (122445708, 'Chet-Bragg', 'North', '011-6980596');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (122826376, 'Marina-Bloch', 'South', '053-6010163');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (127022688, 'Glenn-Berry', 'North', '031-4501840');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (127024366, 'Roger-Neil', 'gushDan', '066-1410238');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (127124513, 'Juice-Coyote', 'North', '065-4475250');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (130486255, 'Moe-Francis', 'North', '063-1672539');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (131532793, 'Jerry-Guzman', 'North', '062-4813812');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (132870992, 'Jay-Burrows', 'North', '049-3188392');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (133539453, 'Rick-Whitford', 'gushDan', '062-7526843');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (134758474, 'Elias-Spiner', 'North', '061-3644768');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (135101377, 'Miko-Busey', 'North', '069-3797788');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (135377693, 'Maureen-Flemyng', 'South', '068-1275979');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (135449490, 'Carla-MacIsaac', 'South', '025-8373711');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (140038339, 'Seann-McIntosh', 'North', '061-4074390');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (140131722, 'Frances-Imbruglia', 'gushDan', '024-7850970');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (145623975, 'Leelee-Beckham', 'gushDan', '068-7961069');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (145856680, 'Sissy-May', 'North', '016-3160595');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (146174525, 'Cloris-DeVito', 'North', '060-6029791');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (147792820, 'Vienna-Carrack', 'gushDan', '036-4907989');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (149936885, 'Casey-Keener', 'North', '014-7052210');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (151881338, 'Lenny-Pitney', 'gushDan', '070-1496709');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (154596497, 'Collin-Bassett', 'South', '073-1288032');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (156784545, 'Kathleen-Morrison', 'North', '050-1921347');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (161303711, 'Hilary-Studi', 'gushDan', '084-7615204');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (162909237, 'Davey-Berkeley', 'South', '067-3050527');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (166152543, 'Andy-Minogue', 'North', '079-6017716');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (167113660, 'Hilton-D''Onofrio', 'South', '081-8926374');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (167542053, 'Dave-Baldwin', 'South', '096-3730125');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (168327050, 'Jim-Reubens', 'North', '065-6817889');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (168441240, 'Roddy-Driver', 'South', '065-6739471');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (171757581, 'Breckin-Rippy', 'gushDan', '099-6649829');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (172646903, 'Kenneth-Rickles', 'South', '084-8976989');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (173223372, 'Elisabeth-Hauser', 'South', '071-5710648');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (173285917, 'Maria-Peniston', 'South', '081-9622145');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (176325932, 'Derek-Guzman', 'North', '040-8940026');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (178689441, 'Laurie-Garza', 'South', '094-3558308');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (179633941, 'Nina-James', 'North', '017-5894619');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (187512313, 'Rutger-Adler', 'South', '012-8123599');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (187517400, 'Miguel-Sainte-Marie', 'South', '075-4301468');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (192796929, 'Liam-Chappelle', 'North', '045-5886756');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (194731713, 'Norm-Reubens', 'South', '091-3969652');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (196848740, 'Rupert-Neill', 'South', '057-8785978');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (202244433, 'Viggo-Chilton', 'South', '016-6193339');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (202532294, 'Colm-Herndon', 'North', '036-1576184');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (203679161, 'Luis-Moriarty', 'South', '031-7017263');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (205452549, 'Colm-Plowright', 'North', '086-3767507');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (212809504, 'Ethan-Willard', 'South', '035-2884952');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (213135275, 'Quentin-Davies', 'gushDan', '067-9245297');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (215597231, 'Kurt-D''Onofrio', 'South', '089-5335559');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (216731006, 'Grant-O''Hara', 'North', '071-1170888');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (218621516, 'Freddy-Ripley', 'South', '025-7774185');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (219007204, 'Embeth-Clooney', 'gushDan', '080-4018771');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (220466058, 'Brothers-Davis', 'gushDan', '024-5498573');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (221306179, 'Marty-Clinton', 'North', '076-1799450');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (222099840, 'Lonnie-Fiorentino', 'South', '021-8545322');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (226491211, 'Jeroen-Shue', 'South', '042-4260062');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (228747958, 'Chad-Aiken', 'North', '098-3880544');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (229621528, 'Candice-Berenger', 'South', '084-2471738');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (231669908, 'Donald-McGoohan', 'South', '031-3521321');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (238407991, 'Brad-Witherspoon', 'gushDan', '025-3764806');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (245813707, 'Mekhi-Eckhart', 'gushDan', '099-3188936');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (251377600, 'Wayne-Jolie', 'North', '093-7786433');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (253884620, 'Collin-Laws', 'South', '041-2833938');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (257778631, 'Fats-Peet', 'North', '071-5704991');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (258661124, 'Ronnie-Paquin', 'North', '048-2549413');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (259135362, 'Ralph-Leguizamo', 'North', '035-7390572');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (263467600, 'Chubby-Prinze', 'South', '028-3636159');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (263826538, 'Jody-Askew', 'gushDan', '012-1431452');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (264903771, 'Alana-Davis', 'South', '055-3397821');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (266857680, 'Jamie-Depp', 'North', '086-1432544');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (269612325, 'Gary-Francis', 'North', '040-8236091');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (270032207, 'Jack-Suchet', 'South', '076-2192644');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (271020929, 'Dustin-Warwick', 'South', '087-4303570');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (273686744, 'Hookah-Hershey', 'South', '017-2716143');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (273936185, 'Robbie-Atlas', 'South', '071-9620352');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (275809793, 'Morgan-Curfman', 'South', '063-2824432');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (276997485, 'Parker-Taylor', 'South', '093-4653485');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (280715224, 'Hector-Bale', 'gushDan', '081-6550165');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (283021573, 'Jodie-Drive', 'South', '017-4831243');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (283070253, 'Fred-Sizemore', 'North', '091-4090084');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (283778196, 'Powers-Reno', 'North', '036-7267092');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (284443469, 'Walter-LaSalle', 'South', '022-1190857');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (287732448, 'Meryl-Buffalo', 'South', '084-9186058');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (290217673, 'Chris-Fierstein', 'North', '021-3521791');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (292229624, 'Talvin-Botti', 'South', '057-8504200');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (297070338, 'Vonda-McGill', 'South', '059-2924489');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (298854686, 'Brendan-Webb', 'South', '036-2395415');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (299880849, 'Miko-Brickell', 'North', '024-9310273');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (304705770, 'Angela-Cook', 'North', '025-1485716');
commit;
prompt 100 records committed...
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (306209431, 'Hex-England', 'South', '012-3297553');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (311266395, 'Isaiah-Rhys-Davies', 'gushDan', '065-4987029');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (313566754, 'Lea-Senior', 'North', '091-6371530');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (315218529, 'Denny-Guinness', 'South', '072-6450076');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (315672029, 'Burt-Peet', 'gushDan', '026-1504178');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (322929987, 'Yolanda-Huston', 'North', '023-8048577');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (324172239, 'Larnelle-Hynde', 'South', '039-2873802');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (325791928, 'Peter-Gryner', 'North', '057-5783384');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (326401907, 'Amanda-Clark', 'North', '038-1798708');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (327319121, 'Ralph-Gellar', 'gushDan', '032-4579392');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (333241506, 'Natalie-Johansen', 'North', '034-8169972');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (333562068, 'Rosco-Bonham', 'gushDan', '064-6906043');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (333695863, 'Edwin-Schiff', 'gushDan', '070-7492488');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (334758265, 'Natalie-Rea', 'North', '019-4609999');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (335073464, 'Nile-Gary', 'South', '042-2314420');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (338212494, 'Cesar-McCracken', 'North', '096-9837455');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (341805163, 'Mae-Perrineau', 'South', '069-6624274');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (342254815, 'Hank-Ledger', 'North', '060-9922352');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (342835109, 'Laurence-Hawkins', 'South', '076-5303014');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (343274904, 'Geena-O''Neal', 'gushDan', '012-7203683');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (343288510, 'Samantha-Reid', 'South', '093-1655518');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (343749083, 'Nikka-Hector', 'North', '086-9994115');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (355330642, 'Debi-Lewis', 'South', '024-4206515');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (357050380, 'Fred-Dooley', 'South', '023-2075976');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (363134381, 'Al-Woodward', 'South', '016-4742882');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (366150958, 'Jena-Magnuson', 'South', '043-1634609');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (367937146, 'Leelee-Crewson', 'North', '018-6111208');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (368380614, 'Michael-Damon', 'gushDan', '041-7363409');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (371749369, 'Delroy-Reed', 'gushDan', '089-5562215');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (372076739, 'Kay-Kidman', 'South', '042-5096390');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (372661128, 'Clarence-Gilliam', 'gushDan', '027-3349696');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (379644754, 'Juliana-Ball', 'North', '067-4713872');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (384252594, 'Pierce-Douglas', 'South', '029-7299481');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (386648168, 'Lennie-Francis', 'gushDan', '072-1432973');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (394454089, 'Garry-Imperioli', 'gushDan', '055-1588685');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (396658773, 'Trace-Gugino', 'North', '030-5821550');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (397197584, 'Gina-Downie', 'gushDan', '055-7867200');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (397307967, 'Ned-McKean', 'South', '075-7824826');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (399941308, 'Fionnula-Myles', 'gushDan', '027-7458149');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (401349942, 'Pamela-Keaton', 'South', '029-5122385');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (401993318, 'Trini-Shepherd', 'South', '029-2834152');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (407080369, 'Colm-Everett', 'North', '072-8338923');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (415629125, 'Swoosie-Lauper', 'gushDan', '030-4839525');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (415893063, 'Jodie-Randal', 'North', '020-4314636');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (421317475, 'Shirley-O''Connor', 'North', '047-2989171');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (431865787, 'Jeremy-Warden', 'gushDan', '012-5099331');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (434490977, 'Famke-Numan', 'South', '042-5041771');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (435589604, 'Greg-Withers', 'South', '011-1852554');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (436216694, 'Mili-Rauhofer', 'gushDan', '042-6925774');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (436641380, 'Edie-Cagle', 'South', '095-9870701');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (439358607, 'Clea-Davidtz', 'North', '081-6322699');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (439618464, 'Emmylou-Torn', 'South', '036-3152152');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (445450999, 'Carole-Conners', 'North', '099-8622649');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (445555791, 'Giancarlo-Isaacs', 'North', '092-1317216');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (446169409, 'Sandra-Gore', 'South', '011-5005497');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (451449216, 'Peter-Pepper', 'South', '064-6899832');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (456577944, 'Bobby-Flatts', 'North', '056-2200601');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (459616941, 'Domingo-Nash', 'North', '080-5072561');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (460017316, 'Bridgette-Hanley', 'South', '012-9156108');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (463916564, 'Eric-Worrell', 'South', '067-5328422');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (468052081, 'Shelby-Bruce', 'North', '040-4468162');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (469589278, 'Benjamin-Pierce', 'North', '034-9217005');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (472534609, 'Lydia-Linney', 'South', '083-8718561');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (472722577, 'Hex-Ferry', 'North', '013-5549695');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (473818580, 'Corey-Thurman', 'North', '099-5081708');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (476944253, 'Cledus-Esposito', 'South', '038-6947017');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (480591079, 'Debby-Hughes', 'North', '054-2952910');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (480636906, 'Quentin-Holly', 'North', '061-6247100');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (482062339, 'Dustin-Torn', 'gushDan', '092-8577281');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (482441073, 'Christine-Harry', 'gushDan', '032-4013070');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (493605634, 'Jeffery-Makowicz', 'gushDan', '030-3173687');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (494125272, 'Leonardo-Jane', 'South', '035-8503149');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (495413012, 'Merrill-Berkeley', 'North', '065-3120003');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (496176647, 'Machine-Hershey', 'North', '099-9758740');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (499435819, 'Miki-Dutton', 'gushDan', '078-5672874');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (499929219, 'Jeremy-Bloch', 'South', '077-5973945');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (503336147, 'Liv-Belles', 'South', '030-4685992');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (503440727, 'Eileen-Soul', 'South', '098-2751172');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (506792244, 'Blair-Blanchett', 'South', '064-6484204');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (508882403, 'Mary Beth-Evett', 'North', '022-1718901');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (508960643, 'Phil-Weaving', 'North', '070-3285551');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (524140607, 'Udo-Bates', 'South', '027-9618695');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (524362018, 'Teena-Rosas', 'South', '094-5425282');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (524438806, 'Brittany-Weston', 'South', '069-3596544');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (524903629, 'Denise-Armatrading', 'South', '036-8215160');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (533740870, 'Delbert-Day', 'South', '075-6710431');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (535617265, 'Teri-Numan', 'North', '077-6633918');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (539240805, 'Pierce-Taha', 'South', '069-3024569');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (540007528, 'Daryle-Potter', 'North', '042-9800781');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (542166846, 'Teri-Condition', 'gushDan', '065-4395204');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (543005915, 'Steven-Chan', 'South', '033-3682697');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (544758706, 'Geoff-Newman', 'gushDan', '043-9664223');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (549618935, 'Jonny Lee-Rea', 'gushDan', '066-3788616');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (553240475, 'Dan-Keith', 'gushDan', '017-4653519');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (553438019, 'Kid-Owen', 'gushDan', '025-8975756');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (553505400, 'Nelly-Atkins', 'South', '089-6523322');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (557478597, 'Melba-MacLachlan', 'South', '057-7301310');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (558442646, 'Victor-Stone', 'North', '060-9909189');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (560472573, 'Gaby-Blanchett', 'gushDan', '028-5180174');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (569127554, 'Steven-D''Onofrio', 'North', '038-4461133');
commit;
prompt 200 records committed...
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (570455296, 'Bernard-Matheson', 'North', '053-3340624');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (571723304, 'Harriet-Jay', 'South', '031-4339211');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (575212290, 'Terri-Frost', 'South', '015-6666859');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (578875597, 'Meg-Logue', 'gushDan', '043-1803960');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (583665791, 'Noah-Beatty', 'South', '042-3020702');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (586904556, 'Carrie-Anne-Jolie', 'South', '029-3798389');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (589630570, 'Forest-Ness', 'North', '095-7809374');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (593043285, 'Jimmie-Kennedy', 'South', '062-7872811');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (595660924, 'Beth-Jordan', 'South', '048-1677316');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (603218413, 'Gordie-Satriani', 'South', '035-3866152');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (605822521, 'Michelle-Palmieri', 'gushDan', '070-4467241');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (606774327, 'Ethan-England', 'North', '034-2138937');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (609671163, 'Clint-Kirkwood', 'South', '085-3587947');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (610592110, 'Micky-Guinness', 'South', '059-9942971');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (611050344, 'Charlie-Perlman', 'gushDan', '053-7163000');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (614037050, 'Claire-Trevino', 'North', '080-7072572');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (614581755, 'Carrie-Parker', 'North', '096-6597979');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (616809625, 'Frank-Tinsley', 'South', '096-9057765');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (618702745, 'Queen-Preston', 'North', '051-7025327');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (622297427, 'Elvis-Foster', 'gushDan', '043-4423682');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (622618564, 'Nina-Lightfoot', 'South', '061-7319696');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (625415687, 'Harold-Kinnear', 'South', '087-2420911');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (628288531, 'Samantha-Winter', 'South', '062-7856553');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (631183546, 'Scott-Quaid', 'South', '034-7327093');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (633227189, 'Rosario-Nugent', 'South', '090-8583403');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (633759339, 'Talvin-Russo', 'North', '068-5811556');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (636429487, 'Jonny Lee-Lillard', 'North', '041-9411588');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (638305947, 'Sal-Doucette', 'South', '016-6640493');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (639690177, 'Bill-Lennix', 'South', '093-3339803');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (640085474, 'Robbie-Brooke', 'North', '039-5470879');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (641268611, 'Joy-Sirtis', 'North', '080-7570170');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (641664970, 'Heather-Hampton', 'North', '033-7142191');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (642245770, 'Miles-Rifkin', 'North', '022-4204507');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (645349663, 'Percy-Carlyle', 'South', '084-3727023');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (645747180, 'Treat-Judd', 'gushDan', '090-5844330');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (645924449, 'Neneh-Griffith', 'gushDan', '088-6439586');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (646170863, 'Queen-Arden', 'South', '042-5338865');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (650556669, 'Nicholas-Lattimore', 'gushDan', '016-9850218');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (655648964, 'Coley-Diffie', 'South', '026-6597665');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (660843959, 'Sandra-McCoy', 'North', '050-3583258');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (668996395, 'Chantֳ©-Gosdin', 'North', '035-9767614');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (676515368, 'Harry-Van Der Beek', 'South', '066-4111138');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (677928089, 'Liquid-Fariq', 'South', '065-9079258');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (681817899, 'Gena-Goodman', 'South', '034-7061206');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (687080625, 'Rueben-Deejay', 'South', '026-6867850');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (687655564, 'Roscoe-Franks', 'South', '088-6189158');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (687834239, 'Davis-Pacino', 'South', '069-1325178');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (688434927, 'Sean-Hutton', 'North', '033-2676269');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (689826723, 'Carole-Dolenz', 'South', '023-3882492');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (694391748, 'Buddy-Geldof', 'South', '080-8265131');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (698565984, 'Jared-Van Damme', 'South', '016-8937361');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (704382357, 'Nancy-Kadison', 'South', '043-7377765');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (705280627, 'Dorry-Coburn', 'North', '084-5925977');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (707316445, 'Lloyd-Sedaka', 'South', '028-8594900');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (707557173, 'Chazz-Vincent', 'gushDan', '022-2157663');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (708356913, 'Candice-Loeb', 'North', '013-9447596');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (710464487, 'Thelma-Macy', 'North', '068-4785603');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (712840954, 'Vienna-Rucker', 'North', '044-1680401');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (717223607, 'Nelly-Nicks', 'gushDan', '030-7405499');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (718188339, 'Nik-Jones', 'South', '068-3584876');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (718433434, 'Kurtwood-Bandy', 'South', '023-8590080');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (719116382, 'Mary-Louise-Frakes', 'North', '038-5586518');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (719731836, 'Tal-Zane', 'North', '041-4763445');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (721539684, 'Jay-Nielsen', 'South', '029-1479794');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (721914358, 'Malcolm-Oldman', 'South', '033-6500086');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (726747272, 'Jean-Luc-Tankard', 'North', '086-8675055');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (727760877, 'Mary-Isaacs', 'South', '067-9463149');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (728128634, 'Kathy-Berkley', 'gushDan', '079-8354012');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (730589955, 'Nicky-Patrick', 'North', '061-2778336');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (735700829, 'Vince-Lucien', 'gushDan', '047-2802517');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (736438189, 'Trace-Matheson', 'gushDan', '075-6218055');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (736550347, 'Sylvester-Clayton', 'North', '071-9531780');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (736675025, 'Mykelti-McCain', 'South', '032-7029767');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (736934395, 'Rowan-Hong', 'North', '098-6548131');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (739380973, 'Bonnie-Hanley', 'South', '065-5144528');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (742002836, 'Ronny-Head', 'gushDan', '019-8522773');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (742372731, 'Zooey-Tate', 'South', '025-7381316');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (743232436, 'Lauren-Sutherland', 'North', '047-4006578');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (745561170, 'Katrin-Speaks', 'North', '077-9558434');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (752890719, 'Harriet-Bratt', 'South', '029-2018004');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (754590797, 'Greg-Bruce', 'gushDan', '049-3688109');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (754612075, 'Kathy-Hutton', 'North', '081-1461947');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (757947028, 'Nikki-Garber', 'North', '033-7903228');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (761166200, 'Jeanne-Strathairn', 'South', '049-6585605');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (770579834, 'Charlize-Statham', 'North', '053-7282926');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (770991223, 'Neve-Leachman', 'South', '077-7449570');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (771233246, 'Roger-Irons', 'South', '048-1797387');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (778439197, 'Judd-Ferry', 'South', '095-1771852');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (781585360, 'Drew-Costello', 'gushDan', '019-6337686');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (783357690, 'Anthony-Wells', 'North', '090-4103044');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (785361286, 'Kurt-Osbourne', 'South', '024-5989786');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (789539508, 'Chazz-Carrington', 'gushDan', '053-2859974');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (796350028, 'Hugo-Woods', 'gushDan', '082-8979828');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (797775342, 'Yolanda-Tippe', 'South', '086-9066562');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (798682119, 'Whoopi-Smurfit', 'South', '054-3803747');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (799572536, 'Yolanda-Lee', 'South', '044-1138524');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (810755875, 'Gran-Spector', 'South', '091-7695882');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (813546770, 'Lauren-Vicious', 'North', '028-4614997');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (813744527, 'Hilary-Mifune', 'gushDan', '050-3566621');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (813800320, 'Jet-Conlee', 'South', '089-4386585');
commit;
prompt 300 records committed...
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (814040859, 'Davy-Torres', 'South', '080-6661233');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (814722057, 'Davis-Diaz', 'North', '048-3128197');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (816473662, 'Fionnula-Beals', 'gushDan', '046-6110467');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (818148283, 'Juliet-Stiers', 'South', '087-7115538');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (819717459, 'Jodie-Brock', 'South', '061-4844806');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (821803441, 'Brittany-Shorter', 'North', '092-4219188');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (822176520, 'Woody-Chandler', 'South', '040-3460743');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (824429022, 'Mary-Louise-McDowell', 'South', '050-6085983');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (825526695, 'Campbell-Nugent', 'South', '049-4270909');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (826764568, 'Betty-Kinski', 'North', '041-9548641');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (831596578, 'Amanda-Walken', 'gushDan', '045-3974022');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (832615684, 'Hank-Rippy', 'North', '055-3518888');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (834240009, 'Debbie-Yankovic', 'North', '088-1317982');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (837201582, 'Saul-Gellar', 'South', '074-6210749');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (837819198, 'Ving-Anderson', 'South', '075-9525345');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (839747699, 'Jody-Fender', 'South', '053-5831475');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (840750679, 'Alan-Rankin', 'South', '047-3257868');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (842120773, 'Bobby-Epps', 'South', '067-8542591');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (842289906, 'Aidan-Adkins', 'South', '043-4300499');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (844982984, 'Viggo-Meyer', 'North', '015-4300875');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (846482955, 'Ivan-Tomlin', 'South', '040-8906848');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (847410135, 'Lonnie-Costner', 'South', '019-5183220');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (847547918, 'Vondie-Stoltz', 'South', '017-3625055');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (847799007, 'Crystal-Rea', 'North', '043-8012984');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (850689407, 'Kimberly-Tarantino', 'South', '077-8904405');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (854081615, 'Gord-Seagal', 'North', '066-2210822');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (856873083, 'Burton-Torres', 'South', '045-6491252');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (857850215, 'Bryan-Mraz', 'South', '084-6187059');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (860224001, 'Dylan-Hauser', 'South', '024-9954525');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (861214139, 'Corey-Van Shelton', 'North', '026-7862495');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (865462832, 'Dorry-Mortensen', 'gushDan', '081-9448604');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (866539503, 'Marty-Colon', 'South', '029-2623213');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (867073011, 'Donald-Leachman', 'gushDan', '071-3829933');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (868376185, 'Miko-Tinsley', 'North', '049-8738278');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (870364714, 'Roscoe-Johansson', 'North', '015-1603337');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (871296842, 'Ryan-Visnjic', 'North', '096-7908069');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (872949575, 'Luis-Pierce', 'South', '016-1553092');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (877021786, 'Jean-Emmett', 'North', '037-5677433');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (882572038, 'Jack-Griggs', 'North', '047-8224751');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (885458349, 'Gena-Thomson', 'gushDan', '095-9043744');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (887102065, 'Angelina-Chappelle', 'gushDan', '072-8534157');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (891729855, 'Mae-Kennedy', 'South', '036-7026440');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (893858286, 'Burt-Cassidy', 'gushDan', '097-2304692');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (895307993, 'Joy-Hughes', 'South', '092-3443436');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (896188069, 'Wally-Zevon', 'North', '045-3212500');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (899893908, 'Mel-Logue', 'gushDan', '035-8019714');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (900976859, 'Andrea-Gagnon', 'North', '062-1313657');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (901270818, 'Kimberly-Winwood', 'gushDan', '068-6984576');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (904149271, 'Jane-Gooding', 'South', '084-4103986');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (904453488, 'Hugo-Guilfoyle', 'gushDan', '078-5149988');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (907325234, 'Pablo-Mellencamp', 'North', '019-9061780');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (912561522, 'Rene-Camp', 'North', '014-9123563');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (913421542, 'Billy-Mortensen', 'South', '064-9626130');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (914644930, 'Vertical-Cage', 'gushDan', '042-6125529');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (921475866, 'Linda-Tate', 'South', '036-2950590');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (927249356, 'Kitty-Costner', 'North', '059-8769907');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (928408174, 'Meryl-Goldblum', 'gushDan', '049-3520083');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (936600715, 'Bobby-Tsettos', 'North', '027-6265932');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (938646482, 'Heath-Tucker', 'gushDan', '025-9949661');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (939506375, 'Spencer-Hudson', 'North', '070-4579849');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (941643229, 'Bill-Spine', 'South', '050-7290066');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (941956584, 'Martha-Davis', 'South', '016-5048193');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (943508991, 'Gloria-Birch', 'North', '030-5596367');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (949005940, 'Mili-von Sydow', 'South', '072-4818783');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (949089568, 'Derek-Winwood', 'gushDan', '050-2183535');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (949503212, 'Cate-Curtis', 'gushDan', '025-2389228');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (949949984, 'Madeline-Ali', 'South', '039-4409880');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (951635491, 'Salma-Stevenson', 'South', '097-2342480');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (952309108, 'Buddy-Englund', 'North', '066-8852531');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (954026843, 'Gavin-Cage', 'South', '091-4165364');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (954152262, 'Leelee-Blossoms', 'South', '096-5345751');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (957487341, 'Leon-Whitman', 'North', '053-8770523');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (960102555, 'Garland-Rodgers', 'North', '098-4557462');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (960451214, 'Debra-Paige', 'gushDan', '077-4465115');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (962895138, 'Jimmie-Eldard', 'North', '064-9873504');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (964460672, 'Olga-Dourif', 'South', '029-6332555');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (966260205, 'Bradley-Coolidge', 'North', '075-9523084');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (966562504, 'Timothy-Rodgers', 'South', '014-5658354');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (970362406, 'Clive-Austin', 'gushDan', '062-1297413');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (974320825, 'Donald-Heald', 'South', '064-3507933');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (977490975, 'Fisher-Walken', 'North', '019-7489082');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (978933148, 'Campbell-Bean', 'South', '070-4374307');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (979401531, 'Temuera-Milsap', 'South', '088-8072511');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (980071145, 'Glen-Reynolds', 'South', '060-5439220');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (980493310, 'Mitchell-Skarsgard', 'gushDan', '089-9606398');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (980847791, 'Lena-Tippe', 'South', '019-6059456');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (984797511, 'Samuel-Bassett', 'South', '061-5387767');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (985830155, 'Josh-Beck', 'South', '059-4451705');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (988738574, 'Bruce-Heald', 'North', '023-4172255');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (993644869, 'Karen-Clayton', 'North', '059-2047645');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (996134015, 'Malcolm-Bruce', 'South', '041-2821445');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (996980140, 'Al-Colon', 'gushDan', '070-9993576');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (997754790, 'Jake-Saxon', 'North', '039-1968513');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (998333899, 'Chaka-Lerner', 'gushDan', '084-8097611');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (999495522, 'Ming-Na-Witherspoon', 'South', '049-7421524');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (460319375, 'Marianne-Baldwin', 'South', '033-4520502');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (476936417, 'Cameron-Senior', 'North', '083-8446715');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (486166007, 'Cornell-Harrison', 'South', '053-7489424');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (500889229, 'Chaka-Rispoli', 'South', '064-3415751');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (510436386, 'Joseph-Graham', 'North', '023-2331884');
commit;
prompt 400 records committed...
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (871903488, 'Temuera-Olin', 'gushDan', '017-4558980');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (890886467, 'Denzel-Osmond', 'South', '049-2778473');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (900846538, 'Martin-Bugnon', 'South', '056-6190990');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (909571259, 'Pam-Kirshner', 'North', '014-2902946');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (928307527, 'Rik-Luongo', 'South', '042-3745712');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (941275791, 'Fairuza-Mars', 'South', '014-9389207');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (14565, 'yael', 'south', '0712022374');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (12395, 'chavi', 'jerusalem', '0748008638');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (89365, 'riki', 'north', '0422795221');
insert into SUPPLIER_ (supplierid, suppliername, area, provphonenumber)
values (19475, 'talia', 'jerusalem', '0614724136');
commit;
prompt 410 records loaded
prompt Loading PRODUCT...
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (372, 'chicken soup', 43, 25, 618702745);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (250, 'ketchup', 15, 76, 796350028);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (484, 'salt', 24, 41, 676515368);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (67, 'pickles', 146, 37, 957487341);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (723, 'hummus', 21, 68, 251377600);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (291, 'tomato', 24, 51, 367937146);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (740, 'chicken-breast', 7, 35, 847547918);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (880, 'cucumber', 72, 86, 524362018);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (53, 'steak', 20, 11, 837201582);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (310, 'Sugar', 31, 100, 984797511);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (952, 'tahini', 8, 26, 524140607);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (548, 'shawarma', 5, 53, 797775342);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (149, 'eggplant', 76, 15, 221306179);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (244, 'eggs', 48, 83, 270032207);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (153, 'potatoes', 72, 63, 912561522);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (563, 'turmeric', 67, 54, 439618464);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (873, 'paprika', 78, 90, 871903488);
insert into PRODUCT (prodid, prodname, prodprice, prodamount, provid)
values (199, 'black-pepper', 30, 95, 372661128);
commit;
prompt 18 records loaded
prompt Loading INGREDIENTS...
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (16, 952, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (152, 67, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (34, 563, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (2, 952, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (188, 723, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (62, 153, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (131, 563, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (27, 880, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (26, 53, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (159, 548, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (153, 548, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (58, 740, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (77, 372, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (6, 67, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (47, 53, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (120, 310, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (146, 563, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (138, 291, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (179, 153, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (14, 548, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (62, 244, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (166, 199, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (110, 723, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (124, 880, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (166, 149, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (53, 53, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (151, 53, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (93, 149, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (85, 548, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (95, 952, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (79, 53, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (41, 880, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (74, 484, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (69, 291, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (34, 723, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (173, 740, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (129, 563, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (107, 250, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (190, 873, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (173, 740, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (40, 67, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (32, 873, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (133, 199, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (151, 250, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (169, 372, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (162, 53, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (8, 484, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (169, 250, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (105, 149, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (137, 548, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (105, 873, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (75, 952, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (63, 372, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (145, 149, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (29, 153, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (173, 244, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (23, 372, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (68, 291, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (109, 310, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (185, 880, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (94, 740, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (150, 880, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (172, 952, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (136, 67, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (82, 199, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (162, 723, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (188, 723, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (131, 880, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (166, 740, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (135, 873, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (195, 880, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (35, 484, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (101, 484, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (74, 199, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (63, 291, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (122, 310, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (97, 372, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (179, 291, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (132, 153, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (117, 149, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (31, 484, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (103, 548, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (194, 53, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (153, 199, 487);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (103, 484, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (41, 153, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (34, 484, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (21, 740, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (79, 563, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (34, 723, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (123, 310, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (192, 67, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (121, 952, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (160, 880, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (127, 740, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (90, 740, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (177, 250, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (69, 153, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (92, 563, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (181, 291, 487);
commit;
prompt 100 records committed...
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (16, 952, 970);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (99, 291, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (21, 199, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (161, 372, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (18, 244, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (115, 952, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (24, 53, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (166, 244, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (180, 372, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (9, 372, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (14, 153, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (136, 563, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (126, 149, 446);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (65, 723, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (91, 563, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (40, 53, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (38, 873, 774);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (134, 952, 364);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (51, 873, 643);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (87, 250, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (87, 67, 636);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (142, 67, 519);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (64, 149, 173);
insert into INGREDIENTS (ingredamount, prodid, mealid)
values (14, 873, 446);
commit;
prompt 124 records loaded
prompt Loading INSTOCK...
insert into INSTOCK (amount, supplierid, equipmentid)
values (85558, 14565, 43);
insert into INSTOCK (amount, supplierid, equipmentid)
values (67739, 89365, 83);
insert into INSTOCK (amount, supplierid, equipmentid)
values (24854, 12365, 114);
insert into INSTOCK (amount, supplierid, equipmentid)
values (40983, 12365, 43);
insert into INSTOCK (amount, supplierid, equipmentid)
values (22616, 14565, 52);
insert into INSTOCK (amount, supplierid, equipmentid)
values (16226, 89365, 77);
insert into INSTOCK (amount, supplierid, equipmentid)
values (10494, 19475, 125);
insert into INSTOCK (amount, supplierid, equipmentid)
values (20391, 15365, 117);
insert into INSTOCK (amount, supplierid, equipmentid)
values (33008, 15365, 94);
insert into INSTOCK (amount, supplierid, equipmentid)
values (52634, 89065, 46);
insert into INSTOCK (amount, supplierid, equipmentid)
values (24814, 89365, 59);
insert into INSTOCK (amount, supplierid, equipmentid)
values (52953, 14565, 60);
insert into INSTOCK (amount, supplierid, equipmentid)
values (84691, 12365, 76);
insert into INSTOCK (amount, supplierid, equipmentid)
values (15527, 87655, 84);
insert into INSTOCK (amount, supplierid, equipmentid)
values (75540, 12345, 50);
insert into INSTOCK (amount, supplierid, equipmentid)
values (3922, 87655, 42);
insert into INSTOCK (amount, supplierid, equipmentid)
values (83480, 19475, 24);
insert into INSTOCK (amount, supplierid, equipmentid)
values (77002, 87655, 101);
insert into INSTOCK (amount, supplierid, equipmentid)
values (51192, 89065, 28);
insert into INSTOCK (amount, supplierid, equipmentid)
values (48609, 14565, 97);
insert into INSTOCK (amount, supplierid, equipmentid)
values (9952, 19475, 8);
insert into INSTOCK (amount, supplierid, equipmentid)
values (73742, 15365, 65);
insert into INSTOCK (amount, supplierid, equipmentid)
values (9403, 12365, 115);
insert into INSTOCK (amount, supplierid, equipmentid)
values (89877, 89065, 9);
insert into INSTOCK (amount, supplierid, equipmentid)
values (34026, 19475, 54);
insert into INSTOCK (amount, supplierid, equipmentid)
values (58825, 12365, 69);
insert into INSTOCK (amount, supplierid, equipmentid)
values (41189, 14565, 115);
insert into INSTOCK (amount, supplierid, equipmentid)
values (95788, 15365, 51);
insert into INSTOCK (amount, supplierid, equipmentid)
values (92920, 19475, 71);
insert into INSTOCK (amount, supplierid, equipmentid)
values (37000, 19475, 101);
insert into INSTOCK (amount, supplierid, equipmentid)
values (386, 19475, 20);
insert into INSTOCK (amount, supplierid, equipmentid)
values (49942, 12365, 5);
insert into INSTOCK (amount, supplierid, equipmentid)
values (41356, 19475, 16);
insert into INSTOCK (amount, supplierid, equipmentid)
values (96646, 12365, 45);
insert into INSTOCK (amount, supplierid, equipmentid)
values (78952, 14565, 102);
insert into INSTOCK (amount, supplierid, equipmentid)
values (12011, 14565, 17);
insert into INSTOCK (amount, supplierid, equipmentid)
values (13378, 14565, 65);
insert into INSTOCK (amount, supplierid, equipmentid)
values (88159, 89365, 52);
insert into INSTOCK (amount, supplierid, equipmentid)
values (49360, 89065, 125);
insert into INSTOCK (amount, supplierid, equipmentid)
values (45252, 87655, 38);
insert into INSTOCK (amount, supplierid, equipmentid)
values (20725, 14565, 44);
insert into INSTOCK (amount, supplierid, equipmentid)
values (13531, 15365, 29);
insert into INSTOCK (amount, supplierid, equipmentid)
values (79962, 14565, 33);
insert into INSTOCK (amount, supplierid, equipmentid)
values (46930, 87655, 122);
insert into INSTOCK (amount, supplierid, equipmentid)
values (38393, 89365, 48);
insert into INSTOCK (amount, supplierid, equipmentid)
values (76023, 23565, 94);
insert into INSTOCK (amount, supplierid, equipmentid)
values (40592, 12365, 84);
insert into INSTOCK (amount, supplierid, equipmentid)
values (25219, 12345, 16);
insert into INSTOCK (amount, supplierid, equipmentid)
values (69005, 87655, 77);
insert into INSTOCK (amount, supplierid, equipmentid)
values (96099, 12345, 9);
insert into INSTOCK (amount, supplierid, equipmentid)
values (5675, 12345, 55);
insert into INSTOCK (amount, supplierid, equipmentid)
values (37405, 12365, 83);
insert into INSTOCK (amount, supplierid, equipmentid)
values (85274, 23565, 129);
insert into INSTOCK (amount, supplierid, equipmentid)
values (12896, 89065, 82);
insert into INSTOCK (amount, supplierid, equipmentid)
values (62961, 14565, 67);
insert into INSTOCK (amount, supplierid, equipmentid)
values (23888, 19475, 31);
insert into INSTOCK (amount, supplierid, equipmentid)
values (47566, 87655, 13);
insert into INSTOCK (amount, supplierid, equipmentid)
values (72933, 14565, 113);
insert into INSTOCK (amount, supplierid, equipmentid)
values (23163, 12395, 127);
insert into INSTOCK (amount, supplierid, equipmentid)
values (52015, 15365, 17);
insert into INSTOCK (amount, supplierid, equipmentid)
values (54353, 15365, 85);
insert into INSTOCK (amount, supplierid, equipmentid)
values (32685, 12365, 68);
insert into INSTOCK (amount, supplierid, equipmentid)
values (50678, 89065, 111);
insert into INSTOCK (amount, supplierid, equipmentid)
values (8887, 12345, 113);
insert into INSTOCK (amount, supplierid, equipmentid)
values (8438, 23565, 48);
insert into INSTOCK (amount, supplierid, equipmentid)
values (26325, 87655, 27);
insert into INSTOCK (amount, supplierid, equipmentid)
values (60951, 19475, 76);
insert into INSTOCK (amount, supplierid, equipmentid)
values (7090, 19475, 51);
insert into INSTOCK (amount, supplierid, equipmentid)
values (6646, 12365, 54);
insert into INSTOCK (amount, supplierid, equipmentid)
values (75497, 87655, 61);
insert into INSTOCK (amount, supplierid, equipmentid)
values (54550, 87655, 92);
insert into INSTOCK (amount, supplierid, equipmentid)
values (92538, 23565, 75);
insert into INSTOCK (amount, supplierid, equipmentid)
values (85923, 15365, 15);
insert into INSTOCK (amount, supplierid, equipmentid)
values (42500, 12345, 95);
insert into INSTOCK (amount, supplierid, equipmentid)
values (83411, 23565, 64);
insert into INSTOCK (amount, supplierid, equipmentid)
values (68426, 89065, 116);
insert into INSTOCK (amount, supplierid, equipmentid)
values (83587, 12345, 11);
insert into INSTOCK (amount, supplierid, equipmentid)
values (53446, 87655, 89);
insert into INSTOCK (amount, supplierid, equipmentid)
values (69538, 15365, 102);
insert into INSTOCK (amount, supplierid, equipmentid)
values (74282, 15365, 101);
insert into INSTOCK (amount, supplierid, equipmentid)
values (94490, 23565, 90);
insert into INSTOCK (amount, supplierid, equipmentid)
values (21423, 12395, 64);
commit;
prompt 82 records loaded
prompt Loading INVITATION...
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (925483, 1, to_date('19-06-2018', 'dd-mm-yyyy'), '34567821', 164, 3, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7729242, 2, to_date('22-07-2020', 'dd-mm-yyyy'), '28208921', 148, 8, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3088278, 3, to_date('20-07-2023', 'dd-mm-yyyy'), '21437821', 78, 10, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4058395, 4, to_date('04-01-2005', 'dd-mm-yyyy'), '21837821', 7, 2, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7510631, 25, to_date('14-09-2004', 'dd-mm-yyyy'), '28920218', 26, 8, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (808891, 26, to_date('04-06-2003', 'dd-mm-yyyy'), '2892028', 52, 6, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3789223, 28, to_date('15-09-2022', 'dd-mm-yyyy'), '21437821', 30, 2, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1403364, 29, to_date('21-05-2021', 'dd-mm-yyyy'), '34567821', 14, 10, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (733614, 30, to_date('14-04-2023', 'dd-mm-yyyy'), '21482021', 35, 1, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3092483, 31, to_date('02-12-2010', 'dd-mm-yyyy'), '34567821', 110, 3, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9011314, 32, to_date('06-05-2018', 'dd-mm-yyyy'), '2892028', 30, 10, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (440513, 33, to_date('31-10-2010', 'dd-mm-yyyy'), '34567821', 97, 7, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4045956, 34, to_date('26-05-2010', 'dd-mm-yyyy'), '21482021', 122, 9, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (752614, 35, to_date('26-12-2023', 'dd-mm-yyyy'), '21437821', 93, 2, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5897997, 36, to_date('27-09-2007', 'dd-mm-yyyy'), '21837821', 199, 10, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (58712, 37, to_date('05-11-2021', 'dd-mm-yyyy'), '21837821', 104, 2, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (651911, 39, to_date('29-09-2002', 'dd-mm-yyyy'), '21437821', 93, 6, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7949636, 40, to_date('19-07-2004', 'dd-mm-yyyy'), '56787821', 71, 4, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7288155, 41, to_date('15-08-2015', 'dd-mm-yyyy'), '21482021', 174, 2, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9750932, 43, to_date('08-11-2006', 'dd-mm-yyyy'), '21437821', 98, 6, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1916000, 45, to_date('23-08-2001', 'dd-mm-yyyy'), '21837821', 93, 8, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1180297, 46, to_date('29-06-2007', 'dd-mm-yyyy'), '28208921', 167, 9, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7930466, 47, to_date('15-11-2003', 'dd-mm-yyyy'), '21437821', 134, 1, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4599656, 48, to_date('14-04-2019', 'dd-mm-yyyy'), '21837821', 42, 1, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (271743, 49, to_date('11-05-2026', 'dd-mm-yyyy'), '2892028', 65, 8, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (6126702, 50, to_date('27-01-2011', 'dd-mm-yyyy'), '21837821', 68, 10, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2895159, 51, to_date('11-07-2021', 'dd-mm-yyyy'), '56787821', 131, 8, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5633516, 52, to_date('27-11-2008', 'dd-mm-yyyy'), '21437821', 140, 7, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9363453, 54, to_date('14-06-2007', 'dd-mm-yyyy'), '28920218', 4, 6, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8290798, 55, to_date('10-05-2019', 'dd-mm-yyyy'), '21482021', 29, 1, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4829218, 56, to_date('28-08-2001', 'dd-mm-yyyy'), '28920218', 174, 3, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (6171004, 57, to_date('20-06-2025', 'dd-mm-yyyy'), '28208921', 104, 7, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5360663, 58, to_date('18-09-2005', 'dd-mm-yyyy'), '21482021', 117, 1, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5776229, 59, to_date('24-10-2006', 'dd-mm-yyyy'), '56787821', 119, 1, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3197057, 61, to_date('17-07-2010', 'dd-mm-yyyy'), '2892028', 46, 1, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (792236, 62, to_date('29-01-2020', 'dd-mm-yyyy'), '28208921', 64, 10, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2020865, 63, to_date('09-12-2016', 'dd-mm-yyyy'), '21482021', 142, 1, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (6998151, 64, to_date('13-02-2005', 'dd-mm-yyyy'), '56787821', 120, 1, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8499867, 65, to_date('22-01-2015', 'dd-mm-yyyy'), '21482021', 155, 1, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9627741, 66, to_date('25-03-2022', 'dd-mm-yyyy'), '34567821', 96, 9, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4728437, 67, to_date('01-02-2001', 'dd-mm-yyyy'), '21437821', 152, 7, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4197290, 68, to_date('19-03-2018', 'dd-mm-yyyy'), '21482021', 47, 1, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2835193, 69, to_date('01-11-2021', 'dd-mm-yyyy'), '28208921', 102, 8, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1237383, 70, to_date('26-11-2019', 'dd-mm-yyyy'), '34567821', 154, 9, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9445155, 71, to_date('11-10-2000', 'dd-mm-yyyy'), '21437821', 124, 9, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2299977, 72, to_date('27-12-2006', 'dd-mm-yyyy'), '21437821', 57, 10, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9198265, 73, to_date('30-05-2007', 'dd-mm-yyyy'), '21437821', 131, 4, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9712235, 74, to_date('06-12-2002', 'dd-mm-yyyy'), '21482021', 185, 2, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5613672, 75, to_date('09-06-2025', 'dd-mm-yyyy'), '56787821', 131, 4, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9436867, 76, to_date('06-06-2007', 'dd-mm-yyyy'), '56787821', 137, 10, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5334866, 77, to_date('28-11-2026', 'dd-mm-yyyy'), '56787821', 184, 1, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (6836748, 78, to_date('25-10-2020', 'dd-mm-yyyy'), '34567821', 16, 4, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5080018, 79, to_date('16-10-2015', 'dd-mm-yyyy'), '28920218', 61, 9, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9567299, 80, to_date('19-07-2011', 'dd-mm-yyyy'), '21437821', 101, 2, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5085120, 81, to_date('27-09-2007', 'dd-mm-yyyy'), '21437821', 184, 10, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8351730, 82, to_date('02-02-2009', 'dd-mm-yyyy'), '21437821', 179, 9, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9087950, 83, to_date('07-05-2024', 'dd-mm-yyyy'), '21837821', 118, 1, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8161815, 84, to_date('28-05-2015', 'dd-mm-yyyy'), '34567821', 58, 6, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4582153, 85, to_date('02-11-2013', 'dd-mm-yyyy'), '34567821', 35, 7, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7455373, 86, to_date('25-05-2010', 'dd-mm-yyyy'), '27837821', 22, 9, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8798359, 87, to_date('26-06-2011', 'dd-mm-yyyy'), '21482021', 134, 9, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4731126, 88, to_date('25-07-2024', 'dd-mm-yyyy'), '21482021', 199, 3, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1272285, 89, to_date('04-01-2008', 'dd-mm-yyyy'), '27837821', 91, 6, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7883371, 90, to_date('17-11-2011', 'dd-mm-yyyy'), '2892028', 175, 7, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2173722, 91, to_date('14-01-2006', 'dd-mm-yyyy'), '21437821', 72, 4, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3055608, 92, to_date('15-04-2005', 'dd-mm-yyyy'), '27837821', 27, 4, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5598241, 93, to_date('08-05-2019', 'dd-mm-yyyy'), '21437821', 59, 3, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4891860, 94, to_date('23-03-2011', 'dd-mm-yyyy'), '21482021', 196, 8, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4091619, 95, to_date('18-08-2026', 'dd-mm-yyyy'), '27837821', 78, 7, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3040476, 96, to_date('12-05-2015', 'dd-mm-yyyy'), '21837821', 152, 6, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4674559, 97, to_date('03-11-2005', 'dd-mm-yyyy'), '56787821', 200, 7, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3861676, 98, to_date('17-07-2018', 'dd-mm-yyyy'), '21837821', 190, 3, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1417384, 99, to_date('11-05-2021', 'dd-mm-yyyy'), '28920218', 90, 10, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2759729, 100, to_date('01-09-2005', 'dd-mm-yyyy'), '2892028', 85, 3, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3793004, 101, to_date('14-02-2023', 'dd-mm-yyyy'), '28920218', 181, 7, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3417580, 102, to_date('29-05-2025', 'dd-mm-yyyy'), '21437821', 187, 8, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2529439, 103, to_date('05-08-2025', 'dd-mm-yyyy'), '21482021', 23, 9, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7493978, 104, to_date('17-06-2001', 'dd-mm-yyyy'), '21437821', 97, 8, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8707616, 105, to_date('21-07-2003', 'dd-mm-yyyy'), '27837821', 105, 2, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (108751, 106, to_date('25-06-2005', 'dd-mm-yyyy'), '21437821', 56, 10, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4482610, 110, to_date('25-12-2018', 'dd-mm-yyyy'), '27837821', 118, 2, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9431495, 111, to_date('29-08-2002', 'dd-mm-yyyy'), '21482021', 176, 8, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3445522, 115, to_date('22-05-2023', 'dd-mm-yyyy'), '56787821', 94, 4, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8526123, 117, to_date('21-09-2021', 'dd-mm-yyyy'), '21482021', 142, 10, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3626498, 118, to_date('17-01-2003', 'dd-mm-yyyy'), '27837821', 123, 2, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3116796, 119, to_date('30-07-2014', 'dd-mm-yyyy'), '28208921', 1, 10, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9593470, 121, to_date('13-10-2007', 'dd-mm-yyyy'), '27837821', 140, 7, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4335602, 122, to_date('23-09-2024', 'dd-mm-yyyy'), '28208921', 57, 4, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (6334806, 124, to_date('27-06-2015', 'dd-mm-yyyy'), '27837821', 79, 1, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (796068, 126, to_date('18-06-2007', 'dd-mm-yyyy'), '28208921', 118, 2, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2034597, 127, to_date('19-01-2022', 'dd-mm-yyyy'), '21437821', 6, 4, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (332617, 128, to_date('18-03-2016', 'dd-mm-yyyy'), '56787821', 17, 9, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5549036, 130, to_date('17-06-2007', 'dd-mm-yyyy'), '28208921', 79, 3, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9792768, 131, to_date('25-05-2023', 'dd-mm-yyyy'), '21482021', 121, 6, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8823004, 133, to_date('03-01-2026', 'dd-mm-yyyy'), '27837821', 163, 9, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7219292, 134, to_date('06-11-2002', 'dd-mm-yyyy'), '34567821', 115, 2, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (772855, 136, to_date('08-05-2012', 'dd-mm-yyyy'), '28920218', 170, 10, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7982304, 137, to_date('31-05-2004', 'dd-mm-yyyy'), '21482021', 89, 6, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3881911, 139, to_date('04-02-2008', 'dd-mm-yyyy'), '56787821', 21, 9, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3780990, 140, to_date('26-06-2000', 'dd-mm-yyyy'), '27837821', 138, 3, 'delivered');
commit;
prompt 100 records committed...
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2908328, 142, to_date('28-06-2000', 'dd-mm-yyyy'), '21437821', 125, 1, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5330985, 143, to_date('24-10-2015', 'dd-mm-yyyy'), '56787821', 52, 6, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3242937, 144, to_date('13-06-2004', 'dd-mm-yyyy'), '21837821', 179, 10, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7379570, 145, to_date('07-08-2024', 'dd-mm-yyyy'), '21482021', 3, 8, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (6652874, 147, to_date('01-09-2023', 'dd-mm-yyyy'), '21437821', 103, 9, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9653911, 149, to_date('17-07-2016', 'dd-mm-yyyy'), '27837821', 27, 7, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2113173, 151, to_date('10-06-2007', 'dd-mm-yyyy'), '21482021', 44, 4, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5924247, 152, to_date('10-01-2008', 'dd-mm-yyyy'), '56787821', 94, 3, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5524474, 154, to_date('12-02-2021', 'dd-mm-yyyy'), '21837821', 164, 6, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3072828, 155, to_date('20-04-2017', 'dd-mm-yyyy'), '34567821', 190, 4, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1383710, 157, to_date('15-12-2005', 'dd-mm-yyyy'), '56787821', 140, 4, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4858907, 158, to_date('18-12-2011', 'dd-mm-yyyy'), '21482021', 137, 3, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5057572, 160, to_date('24-04-2019', 'dd-mm-yyyy'), '21482021', 22, 10, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4257829, 162, to_date('09-01-2007', 'dd-mm-yyyy'), '56787821', 101, 8, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5152743, 163, to_date('22-09-2012', 'dd-mm-yyyy'), '34567821', 7, 7, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7677661, 165, to_date('07-12-2011', 'dd-mm-yyyy'), '27837821', 172, 1, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3579134, 166, to_date('03-09-2008', 'dd-mm-yyyy'), '27837821', 135, 8, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3949717, 167, to_date('07-04-2016', 'dd-mm-yyyy'), '21837821', 184, 6, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8894718, 169, to_date('25-05-2003', 'dd-mm-yyyy'), '28920218', 138, 4, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (242430, 171, to_date('14-07-2017', 'dd-mm-yyyy'), '27837821', 17, 4, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1489576, 172, to_date('15-05-2009', 'dd-mm-yyyy'), '21482021', 26, 2, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2104228, 176, to_date('16-02-2024', 'dd-mm-yyyy'), '28208921', 74, 4, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7747578, 178, to_date('29-10-2008', 'dd-mm-yyyy'), '56787821', 183, 2, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7729953, 180, to_date('28-11-2017', 'dd-mm-yyyy'), '34567821', 10, 4, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3117487, 181, to_date('20-11-2024', 'dd-mm-yyyy'), '2892028', 147, 9, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2589151, 183, to_date('03-08-2004', 'dd-mm-yyyy'), '21437821', 69, 9, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7760822, 184, to_date('06-02-2022', 'dd-mm-yyyy'), '34567821', 152, 7, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1669843, 186, to_date('04-02-2012', 'dd-mm-yyyy'), '2892028', 82, 1, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5870643, 187, to_date('27-12-2000', 'dd-mm-yyyy'), '21482021', 2, 10, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5012138, 188, to_date('18-01-2019', 'dd-mm-yyyy'), '56787821', 62, 7, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7126151, 189, to_date('11-03-2012', 'dd-mm-yyyy'), '56787821', 44, 8, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8638214, 191, to_date('13-07-2012', 'dd-mm-yyyy'), '21837821', 177, 8, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7348323, 192, to_date('28-07-2009', 'dd-mm-yyyy'), '27837821', 128, 7, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5843877, 194, to_date('21-08-2002', 'dd-mm-yyyy'), '2892028', 141, 6, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2758243, 196, to_date('26-01-2019', 'dd-mm-yyyy'), '28208921', 161, 6, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9135947, 197, to_date('23-10-2026', 'dd-mm-yyyy'), '2892028', 48, 2, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4729511, 198, to_date('07-10-2020', 'dd-mm-yyyy'), '28208921', 86, 2, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8345808, 200, to_date('07-06-2021', 'dd-mm-yyyy'), '28920218', 191, 3, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3272226, 202, to_date('09-01-2011', 'dd-mm-yyyy'), '34567821', 130, 6, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3652098, 203, to_date('24-06-2017', 'dd-mm-yyyy'), '21437821', 113, 2, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3180270, 205, to_date('16-05-2000', 'dd-mm-yyyy'), '27837821', 8, 9, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1024511, 206, to_date('08-01-2025', 'dd-mm-yyyy'), '21837821', 39, 9, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1655982, 208, to_date('24-12-2018', 'dd-mm-yyyy'), '34567821', 126, 7, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (6181505, 209, to_date('20-04-2000', 'dd-mm-yyyy'), '34567821', 149, 1, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3461687, 210, to_date('27-04-2022', 'dd-mm-yyyy'), '27837821', 16, 1, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1782314, 212, to_date('27-11-2014', 'dd-mm-yyyy'), '28920218', 126, 3, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1210428, 213, to_date('05-05-2020', 'dd-mm-yyyy'), '2892028', 159, 3, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3526891, 214, to_date('29-04-2004', 'dd-mm-yyyy'), '21437821', 182, 1, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (89900, 217, to_date('16-07-2020', 'dd-mm-yyyy'), '27837821', 12, 2, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (70050, 218, to_date('16-06-2020', 'dd-mm-yyyy'), '27837821', 20, 7, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (50000, 219, to_date('17-04-2020', 'dd-mm-yyyy'), '27837821', 161, 7, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (80000, 221, to_date('16-08-2020', 'dd-mm-yyyy'), '27837821', 26, 7, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2699, 229, to_date('13-05-2020', 'dd-mm-yyyy'), '27837821', 17, 7, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (10090, 231, to_date('16-07-2024', 'dd-mm-yyyy'), '21', 3, 3, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (15000, 233, to_date('16-07-2024 16:42:23', 'dd-mm-yyyy hh24:mi:ss'), '22', 2, 4, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (16300, 234, to_date('17-07-2024 11:55:43', 'dd-mm-yyyy hh24:mi:ss'), '135', 100, 4, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (14500, 235, to_date('17-07-2024 11:55:46', 'dd-mm-yyyy hh24:mi:ss'), '172', 171, 7, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7900, 237, to_date('17-07-2024 11:55:55', 'dd-mm-yyyy hh24:mi:ss'), '177', 197, 3, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (12700, 238, to_date('17-07-2024 11:55:56', 'dd-mm-yyyy hh24:mi:ss'), '31', 117, 4, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (13800, 239, to_date('17-07-2024 12:28:20', 'dd-mm-yyyy hh24:mi:ss'), '81', 136, 2, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (13700, 241, to_date('17-07-2024 12:28:22', 'dd-mm-yyyy hh24:mi:ss'), '82', 192, 1, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (12400, 242, to_date('17-07-2024 12:28:23', 'dd-mm-yyyy hh24:mi:ss'), '20', 32, 2, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (13000, 244, to_date('17-07-2024 12:39:07', 'dd-mm-yyyy hh24:mi:ss'), '157', 93, 4, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (13200, 245, to_date('17-07-2024 12:39:12', 'dd-mm-yyyy hh24:mi:ss'), '181', 73, 8, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (16400, 247, to_date('17-07-2024 12:39:23', 'dd-mm-yyyy hh24:mi:ss'), '182', 64, 4, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (11700, 249, to_date('17-07-2024 12:43:28', 'dd-mm-yyyy hh24:mi:ss'), '115', 15, 6, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (16500, 250, to_date('17-07-2024 12:43:30', 'dd-mm-yyyy hh24:mi:ss'), '154', 166, 7, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (15300, 251, to_date('17-07-2024 12:43:37', 'dd-mm-yyyy hh24:mi:ss'), '105', 188, 8, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8000, 252, to_date('17-07-2024 12:43:39', 'dd-mm-yyyy hh24:mi:ss'), '218', 157, 3, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (14400, 253, to_date('17-07-2024 12:43:42', 'dd-mm-yyyy hh24:mi:ss'), '43', 95, 9, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (139, 11979, to_date('16-04-2024', 'dd-mm-yyyy'), '704448570', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (38, 12250, to_date('19-01-2024', 'dd-mm-yyyy'), '761433673', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (199, 12632, to_date('18-03-2024', 'dd-mm-yyyy'), '735716196', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (179, 12869, to_date('12-02-2024', 'dd-mm-yyyy'), '850094083', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (125, 12999, to_date('03-02-2024', 'dd-mm-yyyy'), '388964714', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (55, 13231, to_date('16-02-2024', 'dd-mm-yyyy'), '704448570', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (159, 13297, to_date('12-03-2024', 'dd-mm-yyyy'), '320214197', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (399, 13340, to_date('05-04-2024', 'dd-mm-yyyy'), '476782813', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (75, 13604, to_date('13-03-2024', 'dd-mm-yyyy'), '464221141', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (25, 14722, to_date('03-02-2024', 'dd-mm-yyyy'), '535781565', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (265, 15279, to_date('04-01-2024', 'dd-mm-yyyy'), '190012393', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (99, 15420, to_date('18-01-2024', 'dd-mm-yyyy'), '322102919', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (89, 15697, to_date('23-05-2024', 'dd-mm-yyyy'), '273481859', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (199, 15782, to_date('26-05-2024', 'dd-mm-yyyy'), '987656414', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (229, 16625, to_date('12-03-2024', 'dd-mm-yyyy'), '709566924', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (595, 16791, to_date('29-04-2024', 'dd-mm-yyyy'), '341627864', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (119, 17045, to_date('02-02-2024', 'dd-mm-yyyy'), '353482730', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (159, 17887, to_date('09-02-2024', 'dd-mm-yyyy'), '445757640', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (36, 18689, to_date('09-01-2024', 'dd-mm-yyyy'), '764421102', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (235, 18733, to_date('30-03-2024', 'dd-mm-yyyy'), '750919835', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (30, 18980, to_date('29-01-2024', 'dd-mm-yyyy'), '790353923', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (375, 19134, to_date('01-01-2024', 'dd-mm-yyyy'), '935291735', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (59, 19231, to_date('09-02-2024', 'dd-mm-yyyy'), '673202124', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (23, 19322, to_date('18-01-2024', 'dd-mm-yyyy'), '362427181', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (138, 19516, to_date('13-01-2024', 'dd-mm-yyyy'), '847683496', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (106, 19701, to_date('17-04-2024', 'dd-mm-yyyy'), '567225446', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (20, 19888, to_date('10-03-2024', 'dd-mm-yyyy'), '255733886', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (45, 20029, to_date('24-04-2024', 'dd-mm-yyyy'), '833739957', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (375, 20030, to_date('15-05-2024', 'dd-mm-yyyy'), '826107453', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (39, 20127, to_date('25-05-2024', 'dd-mm-yyyy'), '654712365', 1, null, 'Sent');
commit;
prompt 200 records committed...
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (35, 20340, to_date('28-02-2024', 'dd-mm-yyyy'), '224495473', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (579, 20942, to_date('05-04-2024', 'dd-mm-yyyy'), '983955606', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (299, 21059, to_date('27-03-2024', 'dd-mm-yyyy'), '867830048', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (10, 21392, to_date('16-05-2024', 'dd-mm-yyyy'), '682288204', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (229, 21603, to_date('23-05-2024', 'dd-mm-yyyy'), '654825535', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (115, 21626, to_date('28-01-2024', 'dd-mm-yyyy'), '654712365', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (109, 21699, to_date('14-05-2024', 'dd-mm-yyyy'), '138000652', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (125, 21832, to_date('15-01-2024', 'dd-mm-yyyy'), '192646604', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (289, 22328, to_date('19-04-2024', 'dd-mm-yyyy'), '963819761', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (28, 22459, to_date('11-02-2024', 'dd-mm-yyyy'), '144207533', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (289, 24062, to_date('13-04-2024', 'dd-mm-yyyy'), '399318419', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (229, 24835, to_date('12-02-2024', 'dd-mm-yyyy'), '974693239', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (16, 24848, to_date('16-04-2024', 'dd-mm-yyyy'), '681572378', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (45, 24858, to_date('18-05-2024', 'dd-mm-yyyy'), '895204813', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (169, 24870, to_date('08-05-2024', 'dd-mm-yyyy'), '946312472', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (95, 24895, to_date('30-03-2024', 'dd-mm-yyyy'), '501237230', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (78, 24927, to_date('10-02-2024', 'dd-mm-yyyy'), '709566924', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (94, 25069, to_date('01-04-2024', 'dd-mm-yyyy'), '197619991', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (179, 25469, to_date('26-03-2024', 'dd-mm-yyyy'), '935291735', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (115, 25495, to_date('25-01-2024', 'dd-mm-yyyy'), '216541625', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (20, 25737, to_date('18-03-2024', 'dd-mm-yyyy'), '815123821', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (44, 25789, to_date('01-01-2024', 'dd-mm-yyyy'), '507754009', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (10, 26243, to_date('22-01-2024', 'dd-mm-yyyy'), '850094083', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (118, 26352, to_date('13-03-2024', 'dd-mm-yyyy'), '446436968', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (45, 26630, to_date('15-02-2024', 'dd-mm-yyyy'), '427332445', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (39, 26631, to_date('01-01-2024', 'dd-mm-yyyy'), '351022726', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (140, 26757, to_date('02-03-2024', 'dd-mm-yyyy'), '605867286', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (149, 27027, to_date('13-04-2024', 'dd-mm-yyyy'), '777678448', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (255, 27108, to_date('23-04-2024', 'dd-mm-yyyy'), '563480832', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (299, 27249, to_date('04-03-2024', 'dd-mm-yyyy'), '533475097', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (19, 27300, to_date('15-03-2024', 'dd-mm-yyyy'), '360260555', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7, 27308, to_date('04-03-2024', 'dd-mm-yyyy'), '251002805', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (75, 27419, to_date('08-05-2024', 'dd-mm-yyyy'), '590210023', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (194, 27478, to_date('14-01-2024', 'dd-mm-yyyy'), '897322670', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (99, 27738, to_date('06-03-2024', 'dd-mm-yyyy'), '205272172', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (99, 28357, to_date('07-04-2024', 'dd-mm-yyyy'), '221770313', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (209, 28440, to_date('04-02-2024', 'dd-mm-yyyy'), '272724345', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (265, 28486, to_date('06-01-2024', 'dd-mm-yyyy'), '799777319', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (205, 28836, to_date('20-04-2024', 'dd-mm-yyyy'), '507754009', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (54, 28857, to_date('11-03-2024', 'dd-mm-yyyy'), '761433673', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1, 28892, to_date('07-01-2024', 'dd-mm-yyyy'), '701436220', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7, 28977, to_date('17-02-2024', 'dd-mm-yyyy'), '907287038', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (45, 29434, to_date('08-01-2024', 'dd-mm-yyyy'), '660797697', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (39, 29727, to_date('02-05-2024', 'dd-mm-yyyy'), '990813819', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3, 29875, to_date('15-05-2024', 'dd-mm-yyyy'), '141067913', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (39, 30036, to_date('04-01-2024', 'dd-mm-yyyy'), '656442110', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (35, 30440, to_date('23-02-2024', 'dd-mm-yyyy'), '328879351', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (327, 31211, to_date('16-03-2024', 'dd-mm-yyyy'), '395931910', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (38, 31887, to_date('25-04-2024', 'dd-mm-yyyy'), '747630593', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (48, 32090, to_date('30-03-2024', 'dd-mm-yyyy'), '871869784', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (209, 32407, to_date('09-05-2024', 'dd-mm-yyyy'), '166381326', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (250, 32626, to_date('02-04-2024', 'dd-mm-yyyy'), '423632765', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (20, 32723, to_date('07-05-2024', 'dd-mm-yyyy'), '805401712', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (89, 32789, to_date('11-04-2024', 'dd-mm-yyyy'), '838318068', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (189, 32848, to_date('10-03-2024', 'dd-mm-yyyy'), '573755457', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8, 33204, to_date('13-03-2024', 'dd-mm-yyyy'), '640331895', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (132, 33271, to_date('22-05-2024', 'dd-mm-yyyy'), '795843818', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (375, 33286, to_date('21-02-2024', 'dd-mm-yyyy'), '682288204', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (10, 33364, to_date('01-05-2024', 'dd-mm-yyyy'), '242192420', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (24, 33488, to_date('21-03-2024', 'dd-mm-yyyy'), '563480832', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (179, 33769, to_date('19-05-2024', 'dd-mm-yyyy'), '654684525', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (169, 33802, to_date('21-05-2024', 'dd-mm-yyyy'), '705165132', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (145, 34030, to_date('16-04-2024', 'dd-mm-yyyy'), '960671680', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (35, 34274, to_date('18-04-2024', 'dd-mm-yyyy'), '454954065', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (109, 34690, to_date('13-04-2024', 'dd-mm-yyyy'), '927524225', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (169, 34742, to_date('22-04-2024', 'dd-mm-yyyy'), '826107453', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7, 34808, to_date('14-03-2024', 'dd-mm-yyyy'), '640019960', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (28, 35602, to_date('07-01-2024', 'dd-mm-yyyy'), '361558168', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (289, 35836, to_date('12-04-2024', 'dd-mm-yyyy'), '205272172', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (99, 36044, to_date('01-02-2024', 'dd-mm-yyyy'), '273626310', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (135, 36485, to_date('21-05-2024', 'dd-mm-yyyy'), '750919835', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (135, 36670, to_date('25-04-2024', 'dd-mm-yyyy'), '282036733', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (20, 36681, to_date('24-03-2024', 'dd-mm-yyyy'), '681572378', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (109, 36951, to_date('25-02-2024', 'dd-mm-yyyy'), '275420456', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (115, 36975, to_date('25-05-2024', 'dd-mm-yyyy'), '235167090', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (35, 37009, to_date('17-05-2024', 'dd-mm-yyyy'), '987938231', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (95, 37145, to_date('23-02-2024', 'dd-mm-yyyy'), '853517846', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (359, 37148, to_date('17-01-2024', 'dd-mm-yyyy'), '908589616', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (875, 37194, to_date('21-03-2024', 'dd-mm-yyyy'), '218763605', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (10, 37623, to_date('11-01-2024', 'dd-mm-yyyy'), '867830048', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (125, 37671, to_date('19-03-2024', 'dd-mm-yyyy'), '216541625', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (43, 37794, to_date('07-01-2024', 'dd-mm-yyyy'), '756920718', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (45, 37868, to_date('25-01-2024', 'dd-mm-yyyy'), '438477170', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (125, 38435, to_date('10-02-2024', 'dd-mm-yyyy'), '900468358', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (95, 38809, to_date('12-04-2024', 'dd-mm-yyyy'), '750919835', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (35, 39128, to_date('13-05-2024', 'dd-mm-yyyy'), '597936180', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (115, 39657, to_date('19-05-2024', 'dd-mm-yyyy'), '179794254', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (16, 39709, to_date('23-02-2024', 'dd-mm-yyyy'), '197619991', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (35, 40275, to_date('16-04-2024', 'dd-mm-yyyy'), '594264009', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (385, 40297, to_date('02-05-2024', 'dd-mm-yyyy'), '446436968', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (179, 41047, to_date('02-02-2024', 'dd-mm-yyyy'), '605867286', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (40, 41176, to_date('02-03-2024', 'dd-mm-yyyy'), '353134007', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (165, 41351, to_date('19-03-2024', 'dd-mm-yyyy'), '750919835', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (299, 41599, to_date('28-02-2024', 'dd-mm-yyyy'), '296255366', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5, 41614, to_date('24-04-2024', 'dd-mm-yyyy'), '152909198', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (385, 42080, to_date('18-02-2024', 'dd-mm-yyyy'), '862513457', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (255, 42104, to_date('11-02-2024', 'dd-mm-yyyy'), '738961356', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (68, 42371, to_date('15-05-2024', 'dd-mm-yyyy'), '352004805', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (259, 42390, to_date('11-01-2024', 'dd-mm-yyyy'), '336195988', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (65, 42565, to_date('15-04-2024', 'dd-mm-yyyy'), '203093493', 1, null, 'Ready');
commit;
prompt 300 records committed...
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (265, 42600, to_date('15-04-2024', 'dd-mm-yyyy'), '649748137', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (39, 42625, to_date('05-02-2024', 'dd-mm-yyyy'), '529665183', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (156, 43069, to_date('25-04-2024', 'dd-mm-yyyy'), '979954238', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (59, 43344, to_date('27-02-2024', 'dd-mm-yyyy'), '275420456', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9, 43689, to_date('21-01-2024', 'dd-mm-yyyy'), '427332445', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (45, 43714, to_date('25-04-2024', 'dd-mm-yyyy'), '838802596', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3, 43910, to_date('03-05-2024', 'dd-mm-yyyy'), '193177293', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (44, 44544, to_date('14-04-2024', 'dd-mm-yyyy'), '416941052', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (49, 44549, to_date('25-05-2024', 'dd-mm-yyyy'), '202988966', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (20, 44583, to_date('17-03-2024', 'dd-mm-yyyy'), '312294196', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (159, 44590, to_date('04-02-2024', 'dd-mm-yyyy'), '323148897', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (235, 45203, to_date('16-03-2024', 'dd-mm-yyyy'), '455396724', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (69, 45695, to_date('16-04-2024', 'dd-mm-yyyy'), '216541625', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (76, 46222, to_date('18-05-2024', 'dd-mm-yyyy'), '535355728', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (20, 46483, to_date('14-05-2024', 'dd-mm-yyyy'), '252721669', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (58, 46561, to_date('05-03-2024', 'dd-mm-yyyy'), '336195988', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (145, 46819, to_date('16-03-2024', 'dd-mm-yyyy'), '216541625', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (135, 47456, to_date('26-03-2024', 'dd-mm-yyyy'), '200082966', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (99, 47475, to_date('23-04-2024', 'dd-mm-yyyy'), '544629310', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (179, 47782, to_date('26-04-2024', 'dd-mm-yyyy'), '202423128', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (198, 47834, to_date('25-02-2024', 'dd-mm-yyyy'), '458886237', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (75, 48643, to_date('28-01-2024', 'dd-mm-yyyy'), '530559367', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (149, 48748, to_date('11-05-2024', 'dd-mm-yyyy'), '179794254', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (35, 48816, to_date('30-01-2024', 'dd-mm-yyyy'), '689426993', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (265, 48817, to_date('09-05-2024', 'dd-mm-yyyy'), '151517503', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9, 49082, to_date('28-01-2024', 'dd-mm-yyyy'), '922094598', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (92, 49231, to_date('11-05-2024', 'dd-mm-yyyy'), '202890933', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (35, 49245, to_date('09-04-2024', 'dd-mm-yyyy'), '929328580', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (16, 49352, to_date('09-01-2024', 'dd-mm-yyyy'), '216541625', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (29, 49361, to_date('04-05-2024', 'dd-mm-yyyy'), '257662071', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (19, 49420, to_date('24-05-2024', 'dd-mm-yyyy'), '906393556', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (18, 49445, to_date('24-03-2024', 'dd-mm-yyyy'), '805401712', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (49, 49599, to_date('17-03-2024', 'dd-mm-yyyy'), '409771057', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8, 49636, to_date('07-05-2024', 'dd-mm-yyyy'), '296255366', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9, 49739, to_date('16-05-2024', 'dd-mm-yyyy'), '838802596', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (139, 49835, to_date('01-04-2024', 'dd-mm-yyyy'), '242192420', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1, 50051, to_date('06-03-2024', 'dd-mm-yyyy'), '974693239', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (179, 50309, to_date('02-04-2024', 'dd-mm-yyyy'), '463878923', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (45, 50999, to_date('25-02-2024', 'dd-mm-yyyy'), '652286041', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5, 51690, to_date('08-05-2024', 'dd-mm-yyyy'), '903486694', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (125, 52464, to_date('28-01-2024', 'dd-mm-yyyy'), '597771718', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (385, 52809, to_date('11-01-2024', 'dd-mm-yyyy'), '523316363', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (135, 52830, to_date('10-02-2024', 'dd-mm-yyyy'), '739894646', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (10, 53224, to_date('13-01-2024', 'dd-mm-yyyy'), '181724644', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (10, 53802, to_date('06-02-2024', 'dd-mm-yyyy'), '620322646', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (71, 54264, to_date('26-01-2024', 'dd-mm-yyyy'), '756920718', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (99, 54591, to_date('13-02-2024', 'dd-mm-yyyy'), '251066882', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (138, 54648, to_date('24-03-2024', 'dd-mm-yyyy'), '193177293', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (159, 54954, to_date('03-05-2024', 'dd-mm-yyyy'), '764421102', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (209, 54976, to_date('30-01-2024', 'dd-mm-yyyy'), '688095708', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (10, 55213, to_date('26-02-2024', 'dd-mm-yyyy'), '224495473', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (229, 55270, to_date('01-03-2024', 'dd-mm-yyyy'), '575427604', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (142, 55724, to_date('09-05-2024', 'dd-mm-yyyy'), '924245604', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (23, 55778, to_date('29-01-2024', 'dd-mm-yyyy'), '318322784', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (10, 55900, to_date('06-05-2024', 'dd-mm-yyyy'), '771701713', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (375, 55995, to_date('01-05-2024', 'dd-mm-yyyy'), '709566924', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (55, 56387, to_date('30-01-2024', 'dd-mm-yyyy'), '312294196', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (269, 56419, to_date('27-01-2024', 'dd-mm-yyyy'), '738961356', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (106, 56847, to_date('06-04-2024', 'dd-mm-yyyy'), '929328580', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (159, 56866, to_date('03-05-2024', 'dd-mm-yyyy'), '903277991', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (44, 57470, to_date('01-01-2024', 'dd-mm-yyyy'), '805854680', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (15, 57588, to_date('23-02-2024', 'dd-mm-yyyy'), '369053838', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (219, 57715, to_date('16-04-2024', 'dd-mm-yyyy'), '202423128', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (99, 58566, to_date('26-01-2024', 'dd-mm-yyyy'), '894904744', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (239, 58572, to_date('30-04-2024', 'dd-mm-yyyy'), '903486694', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5, 58643, to_date('14-04-2024', 'dd-mm-yyyy'), '463371951', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (129, 58785, to_date('24-02-2024', 'dd-mm-yyyy'), '970287710', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (175, 58849, to_date('19-04-2024', 'dd-mm-yyyy'), '423632765', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (58, 58886, to_date('12-01-2024', 'dd-mm-yyyy'), '654712365', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (25, 59034, to_date('05-01-2024', 'dd-mm-yyyy'), '974693239', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (119, 59102, to_date('06-05-2024', 'dd-mm-yyyy'), '942708002', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (11, 59111, to_date('29-04-2024', 'dd-mm-yyyy'), '847683496', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (188, 59182, to_date('04-01-2024', 'dd-mm-yyyy'), '199640888', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (10, 59350, to_date('02-02-2024', 'dd-mm-yyyy'), '603150426', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (28, 59409, to_date('17-05-2024', 'dd-mm-yyyy'), '908589616', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (69, 59718, to_date('02-05-2024', 'dd-mm-yyyy'), '783806626', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (121, 59889, to_date('29-01-2024', 'dd-mm-yyyy'), '909762395', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (65, 59943, to_date('19-02-2024', 'dd-mm-yyyy'), '805854680', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (155, 60090, to_date('12-01-2024', 'dd-mm-yyyy'), '640331895', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (75, 60140, to_date('22-03-2024', 'dd-mm-yyyy'), '903486694', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (49, 60239, to_date('02-02-2024', 'dd-mm-yyyy'), '783806626', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (72, 60302, to_date('16-03-2024', 'dd-mm-yyyy'), '449860234', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (155, 60728, to_date('06-01-2024', 'dd-mm-yyyy'), '362427181', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (79, 60888, to_date('05-01-2024', 'dd-mm-yyyy'), '746060762', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (78, 61084, to_date('13-05-2024', 'dd-mm-yyyy'), '903277991', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (135, 61398, to_date('11-01-2024', 'dd-mm-yyyy'), '216541625', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (121, 61558, to_date('01-05-2024', 'dd-mm-yyyy'), '620162965', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (398, 61649, to_date('30-03-2024', 'dd-mm-yyyy'), '588037827', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (76, 61773, to_date('07-05-2024', 'dd-mm-yyyy'), '533475097', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (89, 61805, to_date('24-04-2024', 'dd-mm-yyyy'), '395931910', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (109, 61886, to_date('19-03-2024', 'dd-mm-yyyy'), '500276225', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (92, 61893, to_date('01-05-2024', 'dd-mm-yyyy'), '738200510', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (69, 62055, to_date('17-04-2024', 'dd-mm-yyyy'), '318322784', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (119, 62208, to_date('23-02-2024', 'dd-mm-yyyy'), '604322566', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (239, 62222, to_date('25-02-2024', 'dd-mm-yyyy'), '390110769', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (259, 62397, to_date('30-04-2024', 'dd-mm-yyyy'), '192646604', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (399, 62671, to_date('05-04-2024', 'dd-mm-yyyy'), '895204813', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (119, 63034, to_date('23-05-2024', 'dd-mm-yyyy'), '833739957', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (219, 63144, to_date('02-01-2024', 'dd-mm-yyyy'), '772545227', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (35, 63840, to_date('26-04-2024', 'dd-mm-yyyy'), '750119869', 1, null, 'in-preparation');
commit;
prompt 400 records committed...
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (24, 64409, to_date('11-01-2024', 'dd-mm-yyyy'), '849303235', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (439, 64517, to_date('20-03-2024', 'dd-mm-yyyy'), '915869687', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (136, 64860, to_date('08-02-2024', 'dd-mm-yyyy'), '221770313', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (289, 65289, to_date('20-05-2024', 'dd-mm-yyyy'), '318322784', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9, 65447, to_date('16-04-2024', 'dd-mm-yyyy'), '177644588', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (119, 65475, to_date('27-02-2024', 'dd-mm-yyyy'), '272031711', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (90, 65592, to_date('20-04-2024', 'dd-mm-yyyy'), '296255366', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (159, 65615, to_date('09-01-2024', 'dd-mm-yyyy'), '644923088', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (179, 65660, to_date('14-01-2024', 'dd-mm-yyyy'), '282036733', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (275, 65668, to_date('02-03-2024', 'dd-mm-yyyy'), '464221141', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (125, 65757, to_date('05-02-2024', 'dd-mm-yyyy'), '296255366', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (109, 65762, to_date('07-04-2024', 'dd-mm-yyyy'), '153843514', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (135, 65915, to_date('13-01-2024', 'dd-mm-yyyy'), '202988966', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (519, 66170, to_date('18-03-2024', 'dd-mm-yyyy'), '777766742', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (14, 66321, to_date('09-02-2024', 'dd-mm-yyyy'), '163717059', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (22, 66680, to_date('26-03-2024', 'dd-mm-yyyy'), '898190326', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (209, 66724, to_date('17-05-2024', 'dd-mm-yyyy'), '462977437', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (42, 66809, to_date('07-01-2024', 'dd-mm-yyyy'), '923324345', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (239, 66958, to_date('17-03-2024', 'dd-mm-yyyy'), '349840942', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8, 67124, to_date('12-03-2024', 'dd-mm-yyyy'), '896151890', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (659, 67193, to_date('06-05-2024', 'dd-mm-yyyy'), '815123821', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (618, 67538, to_date('08-04-2024', 'dd-mm-yyyy'), '987656414', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (89, 68154, to_date('07-01-2024', 'dd-mm-yyyy'), '115550235', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (35, 68596, to_date('18-01-2024', 'dd-mm-yyyy'), '573755457', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (255, 68695, to_date('02-03-2024', 'dd-mm-yyyy'), '896757685', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (198, 69001, to_date('10-02-2024', 'dd-mm-yyyy'), '202988966', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (28, 69995, to_date('06-03-2024', 'dd-mm-yyyy'), '826107453', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (55, 70069, to_date('30-03-2024', 'dd-mm-yyyy'), '701436220', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (59, 70117, to_date('07-03-2024', 'dd-mm-yyyy'), '907287038', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (99, 70179, to_date('18-04-2024', 'dd-mm-yyyy'), '805854680', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (56, 70313, to_date('02-01-2024', 'dd-mm-yyyy'), '427332445', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (35, 70342, to_date('06-03-2024', 'dd-mm-yyyy'), '514205703', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (229, 70413, to_date('22-04-2024', 'dd-mm-yyyy'), '944370934', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (78, 70495, to_date('22-03-2024', 'dd-mm-yyyy'), '167375351', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (199, 70591, to_date('09-02-2024', 'dd-mm-yyyy'), '324402203', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (18, 70816, to_date('11-04-2024', 'dd-mm-yyyy'), '732741572', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (39, 70838, to_date('18-01-2024', 'dd-mm-yyyy'), '836439971', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8, 71353, to_date('30-04-2024', 'dd-mm-yyyy'), '529665183', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (299, 71835, to_date('08-01-2024', 'dd-mm-yyyy'), '181724644', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (179, 71880, to_date('21-03-2024', 'dd-mm-yyyy'), '688095708', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (179, 71930, to_date('27-02-2024', 'dd-mm-yyyy'), '563480832', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (155, 72084, to_date('22-04-2024', 'dd-mm-yyyy'), '960671680', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (389, 72289, to_date('11-03-2024', 'dd-mm-yyyy'), '900468358', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (10, 73066, to_date('21-01-2024', 'dd-mm-yyyy'), '530559367', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (95, 73079, to_date('02-02-2024', 'dd-mm-yyyy'), '355899957', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (195, 73356, to_date('24-02-2024', 'dd-mm-yyyy'), '833739957', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (70, 73892, to_date('06-03-2024', 'dd-mm-yyyy'), '733139526', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (169, 74134, to_date('08-02-2024', 'dd-mm-yyyy'), '789224520', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (118, 74382, to_date('11-02-2024', 'dd-mm-yyyy'), '251021859', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (289, 74675, to_date('27-03-2024', 'dd-mm-yyyy'), '203881975', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (6, 74919, to_date('21-04-2024', 'dd-mm-yyyy'), '237093998', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (159, 75486, to_date('13-02-2024', 'dd-mm-yyyy'), '756920718', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (155, 75609, to_date('09-02-2024', 'dd-mm-yyyy'), '320214197', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (119, 75660, to_date('25-02-2024', 'dd-mm-yyyy'), '911729605', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (265, 75923, to_date('28-03-2024', 'dd-mm-yyyy'), '349840942', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (209, 75930, to_date('13-02-2024', 'dd-mm-yyyy'), '993714527', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (519, 76051, to_date('08-04-2024', 'dd-mm-yyyy'), '436759233', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (145, 76133, to_date('01-02-2024', 'dd-mm-yyyy'), '427332445', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (385, 76341, to_date('18-03-2024', 'dd-mm-yyyy'), '649748137', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2, 76355, to_date('09-01-2024', 'dd-mm-yyyy'), '336195988', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (145, 76381, to_date('19-02-2024', 'dd-mm-yyyy'), '497469605', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (365, 76937, to_date('14-01-2024', 'dd-mm-yyyy'), '960671680', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (69, 77517, to_date('04-05-2024', 'dd-mm-yyyy'), '603150426', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (159, 77648, to_date('19-04-2024', 'dd-mm-yyyy'), '989065808', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (22, 77761, to_date('29-02-2024', 'dd-mm-yyyy'), '656234359', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (139, 77882, to_date('29-04-2024', 'dd-mm-yyyy'), '295158882', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (25, 77945, to_date('29-03-2024', 'dd-mm-yyyy'), '761433673', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (198, 78421, to_date('09-02-2024', 'dd-mm-yyyy'), '251002805', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (29, 78815, to_date('22-04-2024', 'dd-mm-yyyy'), '202938205', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (18, 78919, to_date('04-03-2024', 'dd-mm-yyyy'), '563480832', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (89, 78934, to_date('06-05-2024', 'dd-mm-yyyy'), '928549846', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (6, 79488, to_date('03-01-2024', 'dd-mm-yyyy'), '738200510', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (24, 79722, to_date('13-03-2024', 'dd-mm-yyyy'), '886831669', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (259, 80222, to_date('04-02-2024', 'dd-mm-yyyy'), '390110769', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (20, 80447, to_date('12-01-2024', 'dd-mm-yyyy'), '935291735', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (35, 80531, to_date('23-05-2024', 'dd-mm-yyyy'), '420529630', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8, 80621, to_date('17-05-2024', 'dd-mm-yyyy'), '907597444', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (109, 80875, to_date('01-02-2024', 'dd-mm-yyyy'), '849466338', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (49, 80923, to_date('13-04-2024', 'dd-mm-yyyy'), '832430127', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (27, 81313, to_date('26-04-2024', 'dd-mm-yyyy'), '586258847', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (519, 81331, to_date('26-03-2024', 'dd-mm-yyyy'), '218429826', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (36, 81336, to_date('14-01-2024', 'dd-mm-yyyy'), '909762395', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (75, 81348, to_date('29-03-2024', 'dd-mm-yyyy'), '655844485', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (39, 81401, to_date('13-04-2024', 'dd-mm-yyyy'), '529782749', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (29, 81587, to_date('17-05-2024', 'dd-mm-yyyy'), '463371951', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (48, 81934, to_date('18-03-2024', 'dd-mm-yyyy'), '895204813', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1, 82193, to_date('05-03-2024', 'dd-mm-yyyy'), '190711252', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (79, 82287, to_date('20-02-2024', 'dd-mm-yyyy'), '990813819', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (56, 82646, to_date('17-05-2024', 'dd-mm-yyyy'), '221244365', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (519, 82691, to_date('04-05-2024', 'dd-mm-yyyy'), '181724644', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8, 82772, to_date('22-03-2024', 'dd-mm-yyyy'), '171880121', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (265, 83038, to_date('03-05-2024', 'dd-mm-yyyy'), '689426993', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (72, 83159, to_date('12-01-2024', 'dd-mm-yyyy'), '688095708', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (43, 83376, to_date('24-02-2024', 'dd-mm-yyyy'), '656234359', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (595, 83491, to_date('06-04-2024', 'dd-mm-yyyy'), '484622079', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (94, 84168, to_date('20-01-2024', 'dd-mm-yyyy'), '911729605', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (145, 84259, to_date('06-04-2024', 'dd-mm-yyyy'), '789562188', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (69, 84806, to_date('20-03-2024', 'dd-mm-yyyy'), '862513457', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (156, 84999, to_date('24-02-2024', 'dd-mm-yyyy'), '152909198', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (39, 85504, to_date('02-03-2024', 'dd-mm-yyyy'), '977753609', 1, null, 'Sent');
commit;
prompt 500 records committed...
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (149, 85929, to_date('22-03-2024', 'dd-mm-yyyy'), '704448570', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (99, 86234, to_date('22-03-2024', 'dd-mm-yyyy'), '736264193', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (109, 86256, to_date('12-03-2024', 'dd-mm-yyyy'), '496245735', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (75, 86569, to_date('24-01-2024', 'dd-mm-yyyy'), '721140035', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (90, 86660, to_date('28-01-2024', 'dd-mm-yyyy'), '618573694', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8, 86739, to_date('10-01-2024', 'dd-mm-yyyy'), '576090664', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (121, 87126, to_date('11-01-2024', 'dd-mm-yyyy'), '366643056', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (139, 87608, to_date('16-03-2024', 'dd-mm-yyyy'), '328879351', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (89, 87739, to_date('06-05-2024', 'dd-mm-yyyy'), '446436968', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9, 87787, to_date('30-03-2024', 'dd-mm-yyyy'), '581815622', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (35, 87961, to_date('01-05-2024', 'dd-mm-yyyy'), '371061470', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (72, 88324, to_date('19-05-2024', 'dd-mm-yyyy'), '497469605', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (72, 88351, to_date('22-02-2024', 'dd-mm-yyyy'), '966414435', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (179, 88653, to_date('04-01-2024', 'dd-mm-yyyy'), '656442110', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (229, 88687, to_date('10-01-2024', 'dd-mm-yyyy'), '203881975', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (344, 88772, to_date('11-05-2024', 'dd-mm-yyyy'), '458886237', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (249, 88995, to_date('16-03-2024', 'dd-mm-yyyy'), '805897636', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (45, 89117, to_date('25-03-2024', 'dd-mm-yyyy'), '129466992', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (43, 89590, to_date('22-03-2024', 'dd-mm-yyyy'), '237093998', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (149, 90296, to_date('17-01-2024', 'dd-mm-yyyy'), '966414435', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8, 90871, to_date('14-05-2024', 'dd-mm-yyyy'), '785335488', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5, 90988, to_date('04-03-2024', 'dd-mm-yyyy'), '975723107', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (24, 91377, to_date('29-03-2024', 'dd-mm-yyyy'), '185636514', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (215, 91425, to_date('17-04-2024', 'dd-mm-yyyy'), '272724345', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (45, 91497, to_date('21-04-2024', 'dd-mm-yyyy'), '497469605', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9, 91609, to_date('02-03-2024', 'dd-mm-yyyy'), '157141811', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (399, 91881, to_date('09-02-2024', 'dd-mm-yyyy'), '909589275', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (69, 91902, to_date('16-01-2024', 'dd-mm-yyyy'), '618573694', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (209, 91903, to_date('09-01-2024', 'dd-mm-yyyy'), '575427604', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (299, 91999, to_date('31-03-2024', 'dd-mm-yyyy'), '304261315', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (269, 92098, to_date('01-04-2024', 'dd-mm-yyyy'), '898674199', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (389, 92215, to_date('19-01-2024', 'dd-mm-yyyy'), '903277991', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (129, 92346, to_date('11-04-2024', 'dd-mm-yyyy'), '449616736', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (125, 92979, to_date('11-03-2024', 'dd-mm-yyyy'), '897322670', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (149, 93280, to_date('03-02-2024', 'dd-mm-yyyy'), '798816085', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (169, 93691, to_date('21-01-2024', 'dd-mm-yyyy'), '388964714', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (239, 93938, to_date('20-03-2024', 'dd-mm-yyyy'), '504536643', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (149, 94029, to_date('27-03-2024', 'dd-mm-yyyy'), '974693239', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (45, 94380, to_date('27-01-2024', 'dd-mm-yyyy'), '560391764', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (198, 94695, to_date('09-05-2024', 'dd-mm-yyyy'), '705165132', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (152, 94928, to_date('16-01-2024', 'dd-mm-yyyy'), '750919835', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (24, 95007, to_date('05-03-2024', 'dd-mm-yyyy'), '218429826', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1, 95080, to_date('12-05-2024', 'dd-mm-yyyy'), '589291628', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (40, 95091, to_date('12-03-2024', 'dd-mm-yyyy'), '894904744', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (24, 95100, to_date('11-04-2024', 'dd-mm-yyyy'), '201884188', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (105, 95118, to_date('23-04-2024', 'dd-mm-yyyy'), '861744214', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7, 95330, to_date('26-01-2024', 'dd-mm-yyyy'), '257662071', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (139, 95732, to_date('10-02-2024', 'dd-mm-yyyy'), '484733518', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (179, 95864, to_date('24-01-2024', 'dd-mm-yyyy'), '861744214', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (85, 95905, to_date('17-03-2024', 'dd-mm-yyyy'), '679380064', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (23, 95918, to_date('07-02-2024', 'dd-mm-yyyy'), '760945270', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (25, 96276, to_date('26-05-2024', 'dd-mm-yyyy'), '898190326', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (8, 96704, to_date('21-04-2024', 'dd-mm-yyyy'), '544629310', 1, null, 'Sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (125, 96721, to_date('06-05-2024', 'dd-mm-yyyy'), '221244365', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (149, 97433, to_date('11-05-2024', 'dd-mm-yyyy'), '312294196', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (10, 97579, to_date('25-03-2024', 'dd-mm-yyyy'), '977753609', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (229, 97641, to_date('21-05-2024', 'dd-mm-yyyy'), '487981995', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (6, 97733, to_date('22-02-2024', 'dd-mm-yyyy'), '993714527', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (35, 98042, to_date('15-04-2024', 'dd-mm-yyyy'), '420529630', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5, 98441, to_date('06-05-2024', 'dd-mm-yyyy'), '251066882', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (38, 98527, to_date('08-03-2024', 'dd-mm-yyyy'), '620162965', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (40, 98632, to_date('31-01-2024', 'dd-mm-yyyy'), '164502431', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (159, 98756, to_date('05-03-2024', 'dd-mm-yyyy'), '977753609', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (99, 99066, to_date('02-01-2024', 'dd-mm-yyyy'), '703201506', 1, null, 'Delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (99, 99134, to_date('19-01-2024', 'dd-mm-yyyy'), '756920718', 1, null, 'Ready');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (38, 99235, to_date('17-04-2024', 'dd-mm-yyyy'), '129121934', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (185, 99743, to_date('26-03-2024', 'dd-mm-yyyy'), '479411599', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (85, 99773, to_date('11-04-2024', 'dd-mm-yyyy'), '899381603', 1, null, 'in-preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (145, 99848, to_date('20-04-2024', 'dd-mm-yyyy'), '138000652', 1, null, 'Received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2932311, 116, to_date('16-07-2020', 'dd-mm-yyyy'), '27837821', 169, 2, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9929146, 120, to_date('27-04-2024', 'dd-mm-yyyy'), '2892028', 102, 1, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9450919, 123, to_date('04-04-2023', 'dd-mm-yyyy'), '27837821', 143, 7, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (6103662, 129, to_date('13-12-2004', 'dd-mm-yyyy'), '27837821', 30, 2, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7750837, 132, to_date('04-11-2018', 'dd-mm-yyyy'), '2892028', 182, 7, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1327349, 138, to_date('16-09-2017', 'dd-mm-yyyy'), '56787821', 53, 2, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (526171, 141, to_date('17-09-2006', 'dd-mm-yyyy'), '21437821', 97, 7, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2656816, 146, to_date('07-01-2020', 'dd-mm-yyyy'), '56787821', 146, 7, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (815070, 150, to_date('21-01-2026', 'dd-mm-yyyy'), '56787821', 47, 7, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (5673620, 156, to_date('04-07-2010', 'dd-mm-yyyy'), '2892028', 14, 7, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (741816, 159, to_date('12-04-2024', 'dd-mm-yyyy'), '21482021', 47, 10, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7938530, 164, to_date('14-10-2016', 'dd-mm-yyyy'), '21437821', 46, 7, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (489612, 170, to_date('22-01-2010', 'dd-mm-yyyy'), '34567821', 150, 6, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (216497, 173, to_date('29-01-2010', 'dd-mm-yyyy'), '28208921', 17, 10, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (3593119, 182, to_date('23-01-2007', 'dd-mm-yyyy'), '56787821', 87, 1, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (1918575, 185, to_date('28-05-2018', 'dd-mm-yyyy'), '28208921', 170, 1, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (6685067, 190, to_date('31-10-2019', 'dd-mm-yyyy'), '34567821', 10, 3, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4953461, 193, to_date('02-12-2014', 'dd-mm-yyyy'), '28208921', 172, 1, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (4525396, 199, to_date('25-02-2019', 'dd-mm-yyyy'), '27837821', 198, 6, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (6206463, 204, to_date('15-12-2009', 'dd-mm-yyyy'), '28920218', 62, 4, 'received');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (10900, 230, to_date('16-07-2024', 'dd-mm-yyyy'), '23', 5, 6, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7369311, 211, to_date('11-10-2014', 'dd-mm-yyyy'), '28208921', 11, 4, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (2395, 215, to_date('16-05-2020', 'dd-mm-yyyy'), '27837821', 17, 6, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (90000, 220, to_date('14-05-2020', 'dd-mm-yyyy'), '27837821', 141, 8, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (20900, 232, to_date('16-07-2024', 'dd-mm-yyyy'), '22', 4, 4, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (12000, 236, to_date('17-07-2024 11:55:49', 'dd-mm-yyyy hh24:mi:ss'), '49', 4, 2, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (7700, 240, to_date('17-07-2024 12:28:21', 'dd-mm-yyyy hh24:mi:ss'), '68', 155, 3, 'in preparation');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (9900, 243, to_date('17-07-2024 12:28:24', 'dd-mm-yyyy hh24:mi:ss'), '28', 14, 3, 'delivered');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (11000, 246, to_date('17-07-2024 12:39:18', 'dd-mm-yyyy hh24:mi:ss'), '157', 93, 2, 'sent');
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid, orderstatus)
values (13100, 248, to_date('17-07-2024 12:39:25', 'dd-mm-yyyy hh24:mi:ss'), '55', 185, 4, 'in preparation');
commit;
prompt 599 records loaded
prompt Loading MEALORDER...
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 487, 55270);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 519, 55270);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 91377);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 173, 70179);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 173, 64517);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 364, 36485);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 30440);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 446, 95864);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 636, 46483);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 643, 27027);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 519, 42625);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 173, 76355);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 364, 95100);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 364, 25737);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 970, 54591);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 446, 80531);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 519, 65447);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 364, 55900);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 21392);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 774, 66958);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 487, 87961);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 487, 68596);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 364, 42390);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 643, 62208);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 970, 77882);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 88995);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 487, 43689);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 41599);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 364, 41599);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 487, 49445);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 970, 97733);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 364, 52809);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 774, 64409);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 970, 95905);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 20942);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 50051);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 364, 61649);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 173, 42371);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 643, 35602);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 446, 52464);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 643, 66321);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 446, 65475);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 173, 32407);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 636, 48817);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 636, 92346);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 364, 26757);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 774, 72289);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 446, 65615);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 643, 36485);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 970, 43910);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 636, 58785);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 519, 26243);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 970, 88687);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 487, 80447);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 643, 14722);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 487, 71880);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 636, 95905);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 636, 33286);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 62208);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 519, 59350);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 84259);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 11979);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 487, 15420);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 173, 88772);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 519, 28892);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 774, 16625);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 636, 20340);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 446, 88324);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 364, 76355);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 643, 97733);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 636, 68596);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 68695);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 32789);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 643, 39657);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 487, 42600);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 636, 65475);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 15420);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 519, 66958);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 774, 76051);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 364, 70342);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 487, 19516);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 774, 91902);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 487, 58572);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 487, 35602);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 519, 39657);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 487, 63034);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 28977);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 970, 97641);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 970, 71930);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 519, 50309);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 643, 20029);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 173, 57715);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 446, 76381);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 970, 43689);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 24835);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 774, 87961);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 636, 74675);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 173, 22459);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 13231);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 774, 99848);
commit;
prompt 100 records committed...
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 12250);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 774, 98527);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 364, 19134);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 487, 87608);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 65447);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 636, 99066);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 92215);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 774, 98756);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 487, 89590);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 58849);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 774, 25495);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 86569);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 364, 28857);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 446, 76937);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 62671);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 643, 25469);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 94380);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 173, 56387);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 970, 81313);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 49599);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 643, 81401);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 636, 27738);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 65615);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 636, 82287);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 173, 83376);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 446, 16625);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 643, 67193);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 487, 55995);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 970, 99743);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 173, 74919);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 519, 15279);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 173, 95080);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 970, 42600);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 519, 65475);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 970, 70838);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 643, 50999);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 774, 26630);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 643, 66680);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 364, 22459);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 636, 99235);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 970, 79488);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 487, 94928);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 636, 99134);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 446, 41047);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 173, 91902);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 364, 72289);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 643, 99235);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 636, 31887);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 643, 41176);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 636, 28486);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 364, 42080);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 774, 49835);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 643, 58785);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 44583);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 364, 27419);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 643, 69995);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 57588);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 24848);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 487, 43910);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 173, 13340);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 643, 28857);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 636, 54264);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 636, 76341);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 636, 55213);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 446, 65668);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 446, 31211);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 446, 33802);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 636, 78934);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 91425);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 83159);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 970, 32723);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 970, 20029);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 636, 29875);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 487, 49739);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 173, 65757);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 519, 59182);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 364, 60239);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 487, 93691);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 643, 28977);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 519, 98756);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 446, 38435);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 446, 42600);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 774, 63034);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 364, 24927);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 970, 13340);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 774, 95732);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 636, 64860);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 487, 81313);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 970, 61886);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 446, 78919);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 970, 40297);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 446, 91377);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 970, 49231);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 487, 46222);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 12999);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 519, 29875);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 173, 90988);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 970, 45203);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 636, 71930);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 970, 59034);
commit;
prompt 200 records committed...
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 636, 49835);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 774, 66809);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 774, 37194);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 643, 49835);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 58849);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 54976);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 636, 97733);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 774, 46819);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 487, 92098);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 173, 94029);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 446, 49245);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 636, 75923);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 487, 29727);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 19134);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 970, 26630);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 643, 58849);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 446, 80875);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 173, 20340);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 636, 77761);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 446, 65762);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 636, 45695);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 364, 83038);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 774, 61649);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 61805);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 970, 81348);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 364, 30036);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 487, 22459);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 91999);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 487, 85504);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 970, 87608);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 446, 49636);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 970, 28440);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 970, 12999);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 519, 15782);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 774, 85929);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 636, 88772);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 519, 45203);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 173, 75923);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 487, 43069);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 774, 47456);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 636, 69995);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 364, 97733);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 774, 59889);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 446, 43910);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 76937);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 446, 48816);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 96704);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 970, 25495);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 519, 43714);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 173, 32789);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 173, 45695);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 446, 72084);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 59409);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 636, 27249);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 774, 65915);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 636, 76133);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 82772);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 519, 38435);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 487, 59111);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 19322);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 173, 27108);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 519, 86256);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 774, 84259);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 774, 18689);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 774, 60728);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 636, 48643);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 487, 78919);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 519, 91902);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 446, 98042);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 49245);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 636, 88324);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 636, 33769);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 519, 33769);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 173, 48748);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 13297);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 643, 31887);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 970, 61773);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 636, 25789);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 643, 59111);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 364, 88772);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 643, 33364);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 487, 47782);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 519, 67538);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 636, 50999);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 519, 91903);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 487, 95905);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 364, 30440);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 970, 91425);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 173, 49245);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 364, 91903);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 63144);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 446, 86739);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 519, 64409);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 636, 19231);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 487, 70117);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 364, 16625);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 636, 65915);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 636, 91609);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 446, 80222);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 636, 15782);
commit;
prompt 300 records committed...
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 643, 36975);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 774, 65757);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 173, 21832);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 643, 17045);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 173, 24858);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 643, 34274);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 364, 14722);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 774, 94029);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 487, 91377);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 774, 55724);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 487, 92979);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 92215);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 636, 90871);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 519, 81313);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 970, 46483);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 47475);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 446, 37868);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 96704);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 87126);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 364, 69995);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 173, 47782);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 173, 34274);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 636, 98632);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 519, 37794);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 364, 19701);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 970, 82772);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 643, 97579);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 173, 87961);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 774, 43344);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 35836);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 364, 21626);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 970, 49420);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 970, 70313);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 970, 55724);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 173, 38809);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 636, 81336);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 519, 41614);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 32090);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 42390);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 643, 70838);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 173, 49361);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 636, 63034);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 446, 70495);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 643, 55724);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 643, 77882);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 364, 61398);
insert into MEALORDER (mealamount, mealid, orderid)
values (10, 446, 29434);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 519, 34690);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 519, 15420);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 364, 61893);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 487, 49352);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 364, 91497);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 84806);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 970, 35602);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 173, 92215);
insert into MEALORDER (mealamount, mealid, orderid)
values (6, 636, 26757);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 774, 96721);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 970, 65447);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 519, 13297);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 774, 81348);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 173, 15420);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 62222);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 774, 62222);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 636, 54648);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 487, 16625);
insert into MEALORDER (mealamount, mealid, orderid)
values (7, 173, 26243);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 643, 22328);
insert into MEALORDER (mealamount, mealid, orderid)
values (5, 774, 44544);
insert into MEALORDER (mealamount, mealid, orderid)
values (9, 519, 57470);
insert into MEALORDER (mealamount, mealid, orderid)
values (2, 173, 42104);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 643, 59718);
insert into MEALORDER (mealamount, mealid, orderid)
values (1, 173, 13604);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 487, 47834);
insert into MEALORDER (mealamount, mealid, orderid)
values (3, 487, 93280);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 173, 41614);
insert into MEALORDER (mealamount, mealid, orderid)
values (4, 774, 33286);
insert into MEALORDER (mealamount, mealid, orderid)
values (8, 636, 80447);
commit;
prompt 377 records loaded
prompt Loading WORKERS...
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (886633965, 'Kylie-Atkinson', 'Dishwasher', 8523, to_date('22-09-1999', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (549264564, 'Sarah-Chestnut', 'Sous-chef', 9414, to_date('19-10-1978', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (394524091, 'Rhea-Bragg', 'Delivery-guy', 8464, to_date('29-09-1988', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (333067647, 'Colm-Nicks', 'Chef', 9746, to_date('18-10-1952', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (171664309, 'Simon-Vai', 'Cleaner', 9761, to_date('13-03-2001', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (143274912, 'Elle-Mac', 'Dishwasher', 7623, to_date('17-07-1987', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (719635118, 'Lindsay-Zane', 'Dishwasher', 6678, to_date('26-07-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (718339906, 'Tramaine-Milsap', 'Sous-chef', 9294, to_date('25-02-1961', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (744468530, 'Penelope-Lopez', 'Delivery-guy', 7456, to_date('05-11-1965', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (799323735, 'Taylor-Rain', 'Delivery-guy', 6188, to_date('16-03-1999', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (355004851, 'Forest-Short', 'Cleaner', 7478, to_date('20-08-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (611069104, 'Nastassja-Vannelli', 'Chef', 9674, to_date('01-01-1951', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (962903534, 'Joaquin-MacNeil', 'Director', 8987, to_date('18-08-1965', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (753964648, 'Micky-Gaynor', 'Director', 6158, to_date('28-05-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (544633195, 'Spike-McCready', 'Director', 5277, to_date('19-05-1963', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (464632858, 'Lois-Hatchet', 'Sous-chef', 8579, to_date('17-03-1981', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (334885243, 'Claire-Jenkins', 'Sous-chef', 8471, to_date('17-07-1960', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (314986077, 'Carrie-Anne-Stanley', 'Sous-chef', 6514, to_date('03-08-1955', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (131966671, 'Dwight-Gough', 'Cleaner', 6294, to_date('08-06-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (419094984, 'Beth-McCain', 'Director', 8461, to_date('06-09-1966', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (506838691, 'Melba-Klein', 'Director', 9474, to_date('23-02-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (550647367, 'Ernie-Shawn', 'Cleaner', 6021, to_date('01-11-1950', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (207467856, 'Lynette-Black', 'Director', 7662, to_date('07-01-1952', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (795997162, 'Nik-Sizemore', 'Delivery-guy', 6029, to_date('27-06-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (383489695, 'Rachid-Heron', 'Delivery-guy', 8022, to_date('27-09-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (701137116, 'Shirley-Webb', 'Dishwasher', 7880, to_date('27-04-1951', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (811740389, 'Nils-Rebhorn', 'Delivery-guy', 6856, to_date('18-11-1964', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (426483937, 'Neneh-Crudup', 'Dishwasher', 9566, to_date('09-08-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (192100963, 'Jeffery-Sartain', 'Dishwasher', 5938, to_date('12-02-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (534475954, 'Mel-Jeter', 'Cleaner', 7203, to_date('14-05-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (360876188, 'Samuel-Geldof', 'Dishwasher', 6424, to_date('01-12-2001', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (812761051, 'Gin-Jeter', 'Delivery-guy', 9051, to_date('24-04-1959', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (268930432, 'Pablo-Warburton', 'Dishwasher', 9483, to_date('05-01-2006', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (535752654, 'Jody-Finney', 'Chef', 6293, to_date('19-02-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (460691565, 'Pelvic-Chandler', 'Sous-chef', 9043, to_date('21-05-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (122887112, 'Earl-Dayne', 'Cleaner', 9104, to_date('04-03-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (790134037, 'Herbie-DiCaprio', 'Chef', 8302, to_date('10-02-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (818582464, 'Christopher-Palmieri', 'Dishwasher', 7745, to_date('13-12-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (998741113, 'Antonio-Reilly', 'Chef', 7871, to_date('04-10-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (130009704, 'Howie-Conley', 'Cleaner', 9738, to_date('09-09-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (669335166, 'Lucy-Coyote', 'Cleaner', 9708, to_date('20-09-1999', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (536565440, 'Eddie-Guilfoyle', 'Delivery-guy', 5346, to_date('29-03-1990', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (625220482, 'Aida-Matthau', 'Sous-chef', 7230, to_date('06-03-2009', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (318268161, 'Swoosie-Curry', 'Sous-chef', 9917, to_date('16-07-2000', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (955194097, 'Carlene-Winwood', 'Chef', 8246, to_date('16-01-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (461411448, 'Isaac-Fiorentino', 'Director', 7805, to_date('01-02-1989', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (844980272, 'Joshua-Walker', 'Sous-chef', 8588, to_date('31-07-1976', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (488696353, 'Paul-Richardson', 'Sous-chef', 8942, to_date('18-06-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (284533000, 'Pat-McGoohan', 'Delivery-guy', 5597, to_date('08-02-1982', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (727731831, 'Pelvic-Byrne', 'Delivery-guy', 5276, to_date('12-06-1966', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (387317698, 'Emm-Reubens', 'Cleaner', 6854, to_date('27-05-1964', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (309569900, 'Dennis-Cobbs', 'Sous-chef', 5631, to_date('02-10-2004', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (168794272, 'Tom-King', 'Chef', 5777, to_date('13-04-1954', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (855608849, 'Alice-Roth', 'Chef', 8716, to_date('07-12-1954', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (297990477, 'Rowan-O''Neal', 'Delivery-guy', 7000, to_date('07-12-1994', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (255642288, 'Edward-Beck', 'Dishwasher', 5331, to_date('30-05-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (558276647, 'Whoopi-Sanchez', 'Director', 5657, to_date('15-06-1950', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (273165130, 'Kristin-Flatts', 'Delivery-guy', 7029, to_date('16-04-1988', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (197897385, 'Belinda-Tate', 'Sous-chef', 5972, to_date('11-04-1994', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (380714312, 'Jena-Spacey', 'Chef', 9724, to_date('14-11-1970', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (795260193, 'Gabrielle-Diggs', 'Cleaner', 5790, to_date('18-10-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (228021998, 'Shannyn-Leto', 'Cleaner', 7050, to_date('10-06-1967', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (819536592, 'Raymond-Lyonne', 'Dishwasher', 9938, to_date('20-12-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (479092409, 'Trini-Foster', 'Cleaner', 9457, to_date('23-05-2000', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (622686873, 'Christine-Holiday', 'Director', 6561, to_date('11-03-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (865424474, 'Jon-Short', 'Cleaner', 6319, to_date('03-03-1976', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (376797326, 'Busta-Levy', 'Dishwasher', 6827, to_date('10-03-1963', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (747046992, 'Frankie-Cagle', 'Sous-chef', 9581, to_date('27-01-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (359507764, 'LeVar-Polley', 'Sous-chef', 9632, to_date('04-04-1989', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (584144058, 'Ani-Cross', 'Cleaner', 8682, to_date('21-06-1990', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (768084873, 'Lara-Weaver', 'Chef', 9197, to_date('06-08-2009', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (277604116, 'Tanya-Lovitz', 'Chef', 7806, to_date('17-06-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (242696947, 'Michelle-Stowe', 'Dishwasher', 9716, to_date('07-01-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (336825944, 'Ned-Adler', 'Chef', 7696, to_date('16-06-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (501667802, 'Yaphet-Englund', 'Sous-chef', 7407, to_date('31-10-1982', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (499781590, 'Frank-Conners', 'Dishwasher', 5562, to_date('25-10-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (713709839, 'Eric-Aglukark', 'Chef', 6656, to_date('07-03-1961', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (430336249, 'Warren-Brothers', 'Sous-chef', 7851, to_date('09-12-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (121025184, 'Jerry-Russell', 'Cleaner', 8101, to_date('03-08-1974', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (228936198, 'John-Reno', 'Dishwasher', 6877, to_date('27-12-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (982719305, 'Val-Crystal', 'Delivery-guy', 7820, to_date('16-01-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (492775897, 'Natascha-Stuart', 'Dishwasher', 8604, to_date('15-08-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (574638261, 'Morris-Rooker', 'Director', 8011, to_date('06-05-1987', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (994888701, 'Mena-Warwick', 'Cleaner', 5065, to_date('04-12-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (315073992, 'Albertina-Rhames', 'Cleaner', 5799, to_date('15-01-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (829383402, 'Juliana-Hayes', 'Director', 6221, to_date('01-12-1981', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (752448780, 'Judy-Epps', 'Cleaner', 8065, to_date('17-09-2007', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (425604389, 'Demi-Gibbons', 'Director', 7232, to_date('19-10-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (262201104, 'Donna-Spiner', 'Delivery-guy', 6431, to_date('23-11-2006', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (722882082, 'Glenn-Matarazzo', 'Director', 8444, to_date('17-05-1987', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (411206210, 'Bill-Gibbons', 'Chef', 7811, to_date('29-05-1968', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (353095864, 'Frederic-Griggs', 'Chef', 6586, to_date('30-09-2000', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (725842517, 'Pat-Visnjic', 'Sous-chef', 7130, to_date('27-05-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (789382847, 'Ron-Katt', 'Dishwasher', 6949, to_date('07-10-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (488703859, 'Stockard-Sinise', 'Director', 5155, to_date('08-11-1994', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (308214700, 'Carole-Gracie', 'Delivery-guy', 7565, to_date('15-04-1995', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (522290889, 'Wesley-Lindo', 'Director', 5525, to_date('07-11-1969', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (500953635, 'Annette-Mars', 'Chef', 7640, to_date('08-10-2006', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (806903873, 'Mary-Louise-Tah', 'Delivery-guy', 6411, to_date('23-05-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (404332006, 'Danni-Osborne', 'Chef', 8779, to_date('08-04-1983', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (668847990, 'Jonathan-Olyphant', 'Delivery-guy', 8421, to_date('16-01-2007', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (652633305, 'Nils-Danes', 'Chef', 8740, to_date('10-04-1997', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (497284454, 'Mos-Shalhoub', 'Dishwasher', 6657, to_date('23-02-1968', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (276574532, 'Judge-Shalhoub', 'Director', 8760, to_date('18-07-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (614727484, 'Howie-Vicious', 'Cleaner', 6058, to_date('20-12-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (996112191, 'Mos-Arquette', 'Chef', 6698, to_date('05-05-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (259520422, 'Rosario-Penders', 'Sous-chef', 5414, to_date('23-06-2007', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (298838557, 'Brooke-Rawls', 'Delivery-guy', 9526, to_date('19-03-2003', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (749735483, 'Rowan-Yulin', 'Dishwasher', 6703, to_date('28-01-1998', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (151190438, 'Kathy-Heald', 'Chef', 9915, to_date('04-10-1988', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (231274875, 'Denise-Harmon', 'Chef', 7632, to_date('01-02-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (634137117, 'Bobby-Bates', 'Delivery-guy', 7958, to_date('26-06-1984', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (524062213, 'Brittany-Peniston', 'Dishwasher', 6531, to_date('14-03-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (461680777, 'Pierce-Brown', 'Director', 5268, to_date('26-03-2001', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (580213084, 'Roberta-De Niro', 'Director', 9984, to_date('04-10-2010', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (784947221, 'Ritchie-Hoffman', 'Chef', 9991, to_date('18-03-1961', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (179184793, 'Lionel-Ripley', 'Cleaner', 9837, to_date('30-01-1972', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (906866857, 'Ceili-Tierney', 'Dishwasher', 7470, to_date('17-03-1961', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (373794154, 'Rutger-Duchovny', 'Delivery-guy', 7482, to_date('02-09-1965', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (532445967, 'Dick-Weller', 'Director', 7616, to_date('23-12-1986', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (756547789, 'Micky-Berkoff', 'Dishwasher', 9551, to_date('13-07-1962', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (290739361, 'Jeff-Dukakis', 'Delivery-guy', 6211, to_date('23-04-1954', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (949062696, 'Thomas-Weller', 'Delivery-guy', 5402, to_date('28-05-1955', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (486857760, 'Celia-Robbins', 'Sous-chef', 8691, to_date('21-11-1978', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (606243771, 'Collective-Harry', 'Sous-chef', 8068, to_date('22-03-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (931232113, 'Dustin-Brando', 'Director', 6143, to_date('27-05-2001', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (449107156, 'Elizabeth-Michaels', 'Delivery-guy', 6515, to_date('06-07-1997', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (471134871, 'Sally-Hawke', 'Cleaner', 9572, to_date('11-12-1956', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (840138313, 'Brian-Schiff', 'Delivery-guy', 8393, to_date('03-02-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (405013747, 'Malcolm-McBride', 'Cleaner', 9657, to_date('17-04-1978', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (859518151, 'Elisabeth-Conway', 'Sous-chef', 8639, to_date('06-10-1951', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (182415768, 'Barbara-Kelly', 'Dishwasher', 5550, to_date('08-01-2007', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (173883880, 'Jane-Nugent', 'Delivery-guy', 5592, to_date('18-05-1984', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (681168260, 'Earl-Bradford', 'Sous-chef', 7474, to_date('13-01-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (878180135, 'Hal-Saxon', 'Sous-chef', 7501, to_date('20-12-1972', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (353483451, 'Jack-Heatherly', 'Dishwasher', 9107, to_date('11-07-1967', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (491155942, 'Laura-Wilder', 'Delivery-guy', 8566, to_date('14-04-1961', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (865986682, 'Tyrone-Birch', 'Dishwasher', 7065, to_date('18-11-1976', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (396174177, 'Emma-Sandler', 'Dishwasher', 9911, to_date('25-06-1994', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (858668229, 'Nina-Beckinsale', 'Director', 5970, to_date('18-08-1961', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (907889083, 'Solomon-McCoy', 'Delivery-guy', 7121, to_date('07-04-2010', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (225536517, 'Guy-Buscemi', 'Cleaner', 8863, to_date('04-11-1976', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (589791847, 'Larnelle-Diesel', 'Chef', 7242, to_date('08-04-1958', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (208639386, 'Curtis-McCoy', 'Cleaner', 9004, to_date('02-03-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (780957556, 'Oliver-Potter', 'Cleaner', 9371, to_date('04-12-1958', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (819342302, 'Wang-Witt', 'Sous-chef', 5297, to_date('19-11-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (512549110, 'Elvis-Chung', 'Cleaner', 9242, to_date('24-08-1999', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (878530182, 'Joanna-Duncan', 'Delivery-guy', 9885, to_date('16-02-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (994633620, 'Leelee-Crewson', 'Dishwasher', 9438, to_date('24-07-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (856288382, 'Mili-Ruiz', 'Chef', 7641, to_date('24-09-1970', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (853866878, 'Horace-Connelly', 'Sous-chef', 8129, to_date('16-08-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (913840631, 'Davis-Heron', 'Chef', 8616, to_date('11-10-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (858156979, 'Lari-Chan', 'Dishwasher', 5466, to_date('03-05-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (994966133, 'Cate-Cartlidge', 'Director', 5668, to_date('30-04-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (642196010, 'Alessandro-Stallone', 'Chef', 8029, to_date('22-11-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (258562500, 'Vertical-Gertner', 'Sous-chef', 5829, to_date('07-06-1957', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (392193120, 'Janeane-Gaynor', 'Cleaner', 7963, to_date('14-01-1986', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (477354519, 'Crispin-Hynde', 'Cleaner', 5126, to_date('21-11-1959', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (225920093, 'Dorry-Leary', 'Director', 9706, to_date('21-05-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (472193198, 'Franco-Kier', 'Chef', 7924, to_date('28-10-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (893069423, 'Mindy-Bell', 'Director', 8429, to_date('04-07-1958', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (873611755, 'Ronnie-Crimson', 'Chef', 8016, to_date('07-08-1999', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (754258216, 'Emily-Matarazzo', 'Director', 5606, to_date('18-07-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (502305221, 'Dylan-Graham', 'Sous-chef', 9999, to_date('07-02-1958', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (219233491, 'Wallace-Leachman', 'Director', 8321, to_date('02-09-1998', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (549089202, 'Adrien-Holeman', 'Delivery-guy', 5690, to_date('05-12-2006', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (158167749, 'Patty-Mills', 'Chef', 5231, to_date('18-02-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (957115597, 'Davey-Tambor', 'Director', 6605, to_date('24-06-1963', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (577711489, 'Barry-Shocked', 'Cleaner', 8317, to_date('11-03-1996', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (298011916, 'Josh-Astin', 'Sous-chef', 9760, to_date('26-07-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (742358232, 'Jay-Shocked', 'Delivery-guy', 5801, to_date('24-09-2003', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (878055329, 'Rosanna-Levine', 'Dishwasher', 5312, to_date('16-06-2010', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (366122029, 'Rip-Northam', 'Dishwasher', 7896, to_date('11-10-1996', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (588270318, 'Crispin-Holeman', 'Chef', 5816, to_date('30-12-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (832860820, 'Gene-Checker', 'Director', 8247, to_date('25-10-1968', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (345672173, 'Maxine-Lunch', 'Cleaner', 8086, to_date('25-09-2010', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (292467836, 'Lorraine-Crouch', 'Sous-chef', 5232, to_date('20-01-1997', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (195100751, 'Michael-Wine', 'Delivery-guy', 9964, to_date('08-09-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (702375505, 'Tzi-Steiger', 'Cleaner', 8504, to_date('04-07-2001', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (918866751, 'Luke-Keen', 'Dishwasher', 5475, to_date('10-09-1984', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (661594084, 'Celia-Wong', 'Director', 7399, to_date('21-02-1958', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (668099366, 'Albert-Romijn-Stamos', 'Sous-chef', 8166, to_date('28-11-1972', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (551173895, 'Tobey-Stevenson', 'Delivery-guy', 9131, to_date('20-11-1964', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (351906438, 'Etta-Holden', 'Director', 8615, to_date('13-07-1995', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (494980064, 'Kathy-Benoit', 'Delivery-guy', 5885, to_date('12-10-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (631569343, 'Annie-Curry', 'Chef', 8403, to_date('03-03-1963', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (321335320, 'Angela-Hershey', 'Cleaner', 6224, to_date('29-12-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (255883695, 'Billy-Michael', 'Director', 9042, to_date('07-01-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (261641954, 'Jeroen-Sawa', 'Cleaner', 7427, to_date('17-02-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (362645896, 'Stevie-Santa Rosa', 'Chef', 5641, to_date('12-04-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (455427394, 'Isabella-Hudson', 'Chef', 6664, to_date('31-05-1978', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (926841070, 'Wes-Travolta', 'Delivery-guy', 6318, to_date('17-11-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (220146719, 'Boz-Firth', 'Delivery-guy', 5151, to_date('11-03-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (647199048, 'Louise-Wright', 'Sous-chef', 9620, to_date('20-01-1998', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (932964346, 'Chalee-Kristofferson', 'Delivery-guy', 5657, to_date('28-06-2004', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (229451753, 'Ice-Hunt', 'Chef', 8476, to_date('13-10-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (593959323, 'Tyrone-Evett', 'Delivery-guy', 5028, to_date('29-10-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (357958630, 'Kazem-Benet', 'Cleaner', 5443, to_date('16-08-2000', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (362420906, 'Corey-Cummings', 'Delivery-guy', 9599, to_date('14-03-2006', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (980700135, 'Mili-Collette', 'Dishwasher', 5264, to_date('28-12-1959', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (913456625, 'Cole-Milsap', 'Sous-chef', 7641, to_date('31-05-1978', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (754861504, 'Julianne-Bachman', 'Dishwasher', 6992, to_date('17-05-1995', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (462135087, 'Lena-Faithfull', 'Delivery-guy', 9246, to_date('06-08-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (166895689, 'Gloria-Rundgren', 'Director', 9217, to_date('03-08-1995', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (302385709, 'Denise-Garber', 'Sous-chef', 5264, to_date('23-02-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (507621009, 'Sophie-Pressly', 'Chef', 8140, to_date('05-07-1968', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (818988740, 'Roberta-Caine', 'Dishwasher', 8209, to_date('05-12-2013', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (882909089, 'Jude-Gore', 'Delivery-guy', 9528, to_date('23-05-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (486544440, 'Parker-Faithfull', 'Cleaner', 9258, to_date('12-12-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (996074180, 'Freddy-Rucker', 'Delivery-guy', 6792, to_date('04-04-1978', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (813754771, 'Toni-Tomei', 'Chef', 6742, to_date('08-05-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (771408317, 'Joe-DeVito', 'Chef', 8740, to_date('05-06-2003', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (858017575, 'Ralph-Gary', 'Sous-chef', 7770, to_date('23-12-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (554973419, 'Helen-Spacek', 'Delivery-guy', 6725, to_date('01-09-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (713111039, 'Joaquin-Holland', 'Dishwasher', 5862, to_date('10-04-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (517650332, 'Sigourney-Yorn', 'Chef', 7249, to_date('24-01-2010', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (706079543, 'Hilary-Baranski', 'Chef', 8760, to_date('30-10-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (774333712, 'Andrea-Redford', 'Sous-chef', 7250, to_date('25-01-1967', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (150543124, 'Tanya-Curry', 'Cleaner', 6770, to_date('06-05-1998', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (399828289, 'Barbara-Goodman', 'Sous-chef', 5617, to_date('16-10-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (614763884, 'Kasey-Bailey', 'Director', 8320, to_date('14-04-1996', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (855335413, 'Sammy-Posey', 'Sous-chef', 5680, to_date('12-02-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (218358224, 'Lili-Lennox', 'Chef', 5582, to_date('11-01-1965', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (894974321, 'Loretta-Eder', 'Cleaner', 9700, to_date('25-07-1953', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (360432701, 'Andrae-Singh', 'Chef', 9326, to_date('30-09-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (466227015, 'Boyd-Salt', 'Sous-chef', 7616, to_date('08-07-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (281921262, 'Lucy-Meyer', 'Director', 8387, to_date('08-11-1981', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (229306755, 'Hal-Armatrading', 'Cleaner', 8584, to_date('29-10-2015', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (420457209, 'Illeana-Forrest', 'Director', 5387, to_date('04-04-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (431561267, 'Machine-Carlton', 'Chef', 5040, to_date('20-04-1986', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (182779884, 'Gran-Salt', 'Director', 6603, to_date('26-03-1952', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (428577343, 'Rene-Gray', 'Director', 5343, to_date('18-02-1974', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (870787183, 'Grace-Orton', 'Director', 5117, to_date('29-02-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (365875725, 'Jonny-Kirkwood', 'Delivery-guy', 7225, to_date('18-10-1988', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (719567243, 'Dar-Tisdale', 'Dishwasher', 7651, to_date('16-12-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (535085143, 'Juliana-Rickman', 'Director', 5598, to_date('01-06-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (339075958, 'Ann-Yulin', 'Director', 6709, to_date('30-05-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (362928866, 'Laurie-Platt', 'Chef', 9455, to_date('10-03-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (628904772, 'Janeane-Holy', 'Sous-chef', 5941, to_date('16-04-2015', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (991357078, 'Bette-Plummer', 'Delivery-guy', 8898, to_date('05-11-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (346694314, 'Jesse-Hedaya', 'Director', 7836, to_date('10-06-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (518269533, 'Praga-Glover', 'Delivery-guy', 9557, to_date('14-09-1953', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (732971629, 'Lucy-Branagh', 'Chef', 9175, to_date('03-09-1986', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (523828491, 'Lea-Barrymore', 'Cleaner', 7905, to_date('05-05-1997', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (817411037, 'Carrie-Anne-Paltrow', 'Director', 5848, to_date('24-09-2003', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (951806375, 'Davy-Domino', 'Delivery-guy', 7249, to_date('06-06-1953', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (142629699, 'Dick-Chinlund', 'Sous-chef', 9953, to_date('05-02-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (637634813, 'Machine-Hatchet', 'Chef', 5400, to_date('19-09-2015', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (974962360, 'Ernie-Marsden', 'Chef', 8294, to_date('17-12-1953', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (552599520, 'Connie-Dreyfuss', 'Chef', 6297, to_date('05-10-1994', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (516104146, 'Rich-Cattrall', 'Dishwasher', 7697, to_date('24-01-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (833625450, 'Noah-McLean', 'Sous-chef', 9096, to_date('25-05-2004', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (296176965, 'Brent-Luongo', 'Director', 8752, to_date('15-10-1960', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (668096680, 'Rose-Zane', 'Director', 9488, to_date('17-06-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (595441751, 'Robin-Clinton', 'Director', 5895, to_date('07-03-1982', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (547599895, 'Benicio-Gray', 'Cleaner', 9265, to_date('02-11-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (408545424, 'Hope-Craddock', 'Delivery-guy', 7970, to_date('07-04-2009', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (404480378, 'Parker-Owen', 'Director', 6405, to_date('07-05-1982', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (576302575, 'Maria-Spine', 'Chef', 9641, to_date('21-05-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (700654948, 'Edwin-Prinze', 'Chef', 9176, to_date('02-07-1954', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (821122982, 'Mike-Chesnutt', 'Director', 5321, to_date('13-11-1964', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (427015167, 'Goldie-Wilkinson', 'Cleaner', 9037, to_date('17-08-2000', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (311084962, 'Chaka-Shelton', 'Director', 8496, to_date('19-10-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (416198611, 'Sara-Shocked', 'Delivery-guy', 8350, to_date('30-06-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (933210108, 'Gaby-McFadden', 'Sous-chef', 5573, to_date('03-03-1954', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (149283744, 'Chalee-Zeta-Jones', 'Cleaner', 5171, to_date('27-10-2006', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (234272756, 'Collective-Owen', 'Sous-chef', 9673, to_date('12-03-1955', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (459186191, 'Millie-McLachlan', 'Dishwasher', 8623, to_date('31-10-1966', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (320810829, 'Gran-Emmerich', 'Sous-chef', 5968, to_date('05-02-1974', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (755756390, 'Lucy-Evanswood', 'Delivery-guy', 9628, to_date('01-05-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (565560307, 'Sona-Matthau', 'Director', 6507, to_date('01-02-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (953134195, 'Al-Lynne', 'Sous-chef', 8020, to_date('20-04-2015', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (856424401, 'Donal-Crewson', 'Cleaner', 8611, to_date('18-11-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (724360420, 'Alfred-Streep', 'Sous-chef', 8282, to_date('21-08-1986', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (568533024, 'Kurtwood-Jenkins', 'Delivery-guy', 7272, to_date('24-06-2015', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (486023106, 'Madeline-Metcalf', 'Cleaner', 7449, to_date('18-12-1997', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (884392525, 'Christina-Pollak', 'Delivery-guy', 8181, to_date('22-07-1951', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (737938512, 'David-Jamal', 'Delivery-guy', 9919, to_date('12-02-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (531570152, 'Robby-O''Neal', 'Dishwasher', 9275, to_date('05-03-1950', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (160644603, 'Hex-Brickell', 'Cleaner', 5202, to_date('23-04-1955', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (118468794, 'Lea-Gooding', 'Cleaner', 9943, to_date('21-02-1987', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (206818154, 'Simon-Laws', 'Delivery-guy', 5882, to_date('27-06-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (248747551, 'Carol-Fiorentino', 'Dishwasher', 8290, to_date('13-10-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (144948788, 'Bobbi-Mueller-Stahl', 'Chef', 9269, to_date('22-12-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (150499253, 'Wes-Blanchett', 'Director', 8084, to_date('01-06-1968', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (513603308, 'Saffron-Osbourne', 'Chef', 7555, to_date('06-11-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (222962696, 'Johnette-Aniston', 'Delivery-guy', 8294, to_date('20-04-2009', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (277946958, 'Miguel-Dern', 'Chef', 7460, to_date('24-02-1951', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (570214056, 'Gerald-Choice', 'Dishwasher', 9349, to_date('05-05-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (757966082, 'Colleen-Weir', 'Director', 6636, to_date('30-05-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (257948565, 'Jennifer-Hobson', 'Director', 6511, to_date('04-05-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (286725499, 'Jose-Harrison', 'Sous-chef', 5354, to_date('27-07-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (473908032, 'Elijah-Mohr', 'Cleaner', 7002, to_date('26-01-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (223660610, 'Bo-Cruise', 'Delivery-guy', 8237, to_date('13-10-1964', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (772509749, 'Morgan-Armstrong', 'Sous-chef', 8779, to_date('18-12-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (503459771, 'Hilary-Cummings', 'Dishwasher', 7044, to_date('24-02-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (917565677, 'Andrea-Dench', 'Sous-chef', 5090, to_date('23-08-2007', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (456648062, 'Juice-Kleinenberg', 'Director', 6792, to_date('05-12-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (614758568, 'Lara-Shepherd', 'Director', 5218, to_date('06-03-1992', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (415761333, 'Leo-Pitney', 'Delivery-guy', 8704, to_date('25-03-1991', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (314430603, 'Liam-Benson', 'Delivery-guy', 8026, to_date('29-03-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (732110525, 'Mel-Mortensen', 'Chef', 9777, to_date('23-09-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (265240066, 'Caroline-Goodman', 'Sous-chef', 6222, to_date('06-01-1986', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (383691830, 'Buffy-Balaban', 'Delivery-guy', 9964, to_date('17-06-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (554797202, 'Tom-McCoy', 'Chef', 5474, to_date('11-02-1990', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (243687120, 'Holly-Secada', 'Cleaner', 9244, to_date('03-03-1963', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (651168122, 'Mark-Finn', 'Delivery-guy', 8753, to_date('08-04-1950', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (301221329, 'Marisa-Swayze', 'Chef', 8100, to_date('22-04-1987', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (736913428, 'Ashley-Harper', 'Sous-chef', 7566, to_date('10-02-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (792710108, 'Gailard-Coltrane', 'Director', 6164, to_date('27-02-1998', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (238439344, 'Tea-Rourke', 'Chef', 7955, to_date('25-10-1984', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (535464425, 'Harold-Spector', 'Chef', 5040, to_date('04-03-1986', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (731216901, 'Randall-Hamilton', 'Delivery-guy', 5410, to_date('04-11-1950', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (199663225, 'Murray-Laws', 'Sous-chef', 7591, to_date('24-12-1962', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (179202508, 'Lindsay-Blades', 'Director', 9079, to_date('17-08-1969', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (699249693, 'Judge-Wilder', 'Sous-chef', 7175, to_date('01-03-1998', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (355682136, 'Chloe-Navarro', 'Cleaner', 6925, to_date('17-06-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (437862243, 'Chad-Bacon', 'Chef', 6627, to_date('03-05-1974', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (626094671, 'Burt-Williamson', 'Dishwasher', 9715, to_date('02-05-1976', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (701466901, 'Rik-Culkin', 'Dishwasher', 7982, to_date('16-06-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (384501096, 'Edwin-Richter', 'Director', 7981, to_date('26-01-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (267135514, 'Grant-Dayne', 'Dishwasher', 5208, to_date('24-01-2010', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (657588397, 'Leonardo-Pesci', 'Sous-chef', 7345, to_date('19-06-1974', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (519636463, 'Madeline-Bracco', 'Cleaner', 8472, to_date('23-04-2015', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (945652635, 'Arturo-Rudd', 'Cleaner', 8854, to_date('09-10-2000', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (811948984, 'Gwyneth-Paige', 'Director', 9698, to_date('09-06-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (925561192, 'Gordie-Garner', 'Director', 7202, to_date('16-04-1954', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (472478879, 'Claire-Graham', 'Director', 5434, to_date('06-09-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (862916390, 'Noah-Peet', 'Chef', 5997, to_date('24-04-1996', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (972864512, 'Oro-Bergen', 'Delivery-guy', 9299, to_date('11-02-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (136198293, 'Liam-Steagall', 'Chef', 5446, to_date('15-04-2004', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (214706402, 'Bret-Prowse', 'Sous-chef', 7508, to_date('02-07-1962', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (608997777, 'Ellen-Khan', 'Chef', 9117, to_date('17-05-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (449109328, 'Liquid-Child', 'Delivery-guy', 7270, to_date('09-09-1951', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (475339882, 'Harvey-Rossellini', 'Dishwasher', 7647, to_date('06-04-2013', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (898481372, 'Jonny-Morse', 'Chef', 9051, to_date('14-07-1967', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (869764106, 'King-Purefoy', 'Chef', 8566, to_date('27-06-2003', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (594478800, 'Jack-Starr', 'Sous-chef', 9964, to_date('29-11-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (644939423, 'Vern-Craven', 'Chef', 7588, to_date('16-01-1987', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (723763437, 'Rueben-Broderick', 'Director', 6835, to_date('19-11-1963', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (275147357, 'Donald-Stone', 'Sous-chef', 8052, to_date('23-07-1960', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (439905884, 'Pamela-Holliday', 'Cleaner', 8667, to_date('22-06-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (510633107, 'Lindsey-McCready', 'Cleaner', 6371, to_date('02-11-1989', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (766434556, 'Vern-Palin', 'Cleaner', 9548, to_date('21-02-1952', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (296713624, 'Rhett-Spiner', 'Cleaner', 7650, to_date('13-01-1974', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (327141679, 'Jonathan-Li', 'Chef', 9262, to_date('22-06-1997', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (471531514, 'Austin-Bello', 'Delivery-guy', 6847, to_date('23-03-1974', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (639757330, 'John-Henstridge', 'Cleaner', 5105, to_date('11-02-1952', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (423010338, 'Sona-Kudrow', 'Sous-chef', 7137, to_date('11-09-1960', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (709102649, 'Dionne-Murray', 'Director', 9697, to_date('20-06-1985', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (885566843, 'Lizzy-Coolidge', 'Delivery-guy', 8348, to_date('19-09-1961', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (878055555, 'Dave-Shue', 'Cleaner', 5777, to_date('21-03-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (501580155, 'Salma-Feuerstein', 'Delivery-guy', 9631, to_date('19-01-1963', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (561328954, 'Jason-Feore', 'Chef', 5270, to_date('04-03-1976', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (661506793, 'Nigel-Haynes', 'Chef', 6736, to_date('06-01-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (487061452, 'Kirk-Collins', 'Sous-chef', 6131, to_date('25-06-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (469863737, 'Betty-Westerberg', 'Cleaner', 5548, to_date('18-05-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (737887232, 'Alfred-Lane', 'Dishwasher', 6725, to_date('08-10-1971', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (350968456, 'Rosanna-Whitaker', 'Dishwasher', 9768, to_date('03-11-1954', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (327596213, 'Deborah-Hidalgo', 'Chef', 8780, to_date('02-03-2004', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (141658081, 'Salma-Frakes', 'Director', 6871, to_date('25-05-1958', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (716162261, 'Gil-Cash', 'Cleaner', 6154, to_date('08-11-2001', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (851543318, 'Roberta-Levine', 'Chef', 7763, to_date('27-05-1952', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (777028343, 'Jonatha-Marx', 'Sous-chef', 7949, to_date('14-01-2007', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (826908186, 'Harris-Tankard', 'Cleaner', 6726, to_date('14-07-2015', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (286093075, 'Kyle-Liu', 'Cleaner', 5726, to_date('03-01-1973', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (387700034, 'Bill-Cagle', 'Dishwasher', 9598, to_date('07-07-1980', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (779620875, 'Jay-Zappacosta', 'Chef', 5852, to_date('21-03-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (784832057, 'Frankie-Ball', 'Delivery-guy', 9279, to_date('06-11-1983', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (850520181, 'Sissy-Williamson', 'Dishwasher', 9219, to_date('22-12-1967', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (436131650, 'Tcheky-Valentin', 'Chef', 8997, to_date('21-04-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (952434154, 'Patty-Pitt', 'Director', 6881, to_date('18-09-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (510379034, 'Jean-Murdock', 'Chef', 9936, to_date('21-07-1978', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (114421674, 'Swoosie-Hersh', 'Director', 6356, to_date('26-06-2004', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (151102830, 'Avril-Hoffman', 'Delivery-guy', 6148, to_date('23-07-2006', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (969006386, 'Richard-Santana', 'Dishwasher', 9608, to_date('17-07-1977', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (965132574, 'Nick-Eldard', 'Dishwasher', 5866, to_date('10-03-2004', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (607482682, 'Gilberto-Benet', 'Sous-chef', 9980, to_date('16-09-1979', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (623130405, 'Quentin-Capshaw', 'Cleaner', 9627, to_date('12-09-2008', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (998589755, 'Rupert-Walker', 'Cleaner', 6599, to_date('18-06-2007', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (974879690, 'Max-Carrington', 'Director', 6829, to_date('30-05-2009', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (928887028, 'Taryn-Dupree', 'Dishwasher', 6007, to_date('18-04-1998', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (304330600, 'Ty-Bacharach', 'Dishwasher', 8631, to_date('22-05-1994', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (978719866, 'Seth-Van Der Beek', 'Cleaner', 7041, to_date('21-05-1975', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (904958179, 'Ving-Fierstein', 'Sous-chef', 6316, to_date('17-05-1962', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (825442235, 'Richie-Dillon', 'Delivery-guy', 6223, to_date('04-02-1962', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (267099586, 'Sheryl-Hudson', 'Chef', 5529, to_date('28-09-1991', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (387785187, 'Gordie-Dench', 'Delivery-guy', 7184, to_date('10-05-1964', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (168937171, 'Mia-Pride', 'Chef', 8009, to_date('19-10-2012', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (547482300, 'Campbell-Arkin', 'Sous-chef', 8874, to_date('12-06-2005', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (629460708, 'Vienna-Harper', 'Sous-chef', 8725, to_date('06-03-2002', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (295374274, 'Rory-Pullman', 'Cleaner', 8588, to_date('11-03-1950', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (126186583, 'Cary-Pitt', 'Cleaner', 7543, to_date('13-08-2014', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (704770476, 'Ashton-Garofalo', 'Dishwasher', 7069, to_date('21-02-1994', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (591522810, 'Belinda-Root', 'Cleaner', 5826, to_date('24-11-2011', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (579289656, 'Brian-Hatfield', 'Dishwasher', 9193, to_date('25-09-2003', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (812779885, 'Wayne-Walker', 'Chef', 9592, to_date('01-04-1993', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (844624266, 'Sylvester-Overstreet', 'Chef', 5013, to_date('25-12-2001', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (305271909, 'Trey-Tarantino', 'Cleaner', 7136, to_date('19-12-1957', 'dd-mm-yyyy'));
insert into WORKERS (workerid, workname, workerjobtitle, workersalary, workerbirthdate)
values (309228396, 'Lin-Borden', 'Director', 7190, to_date('23-09-1952', 'dd-mm-yyyy'));
commit;
prompt 400 records loaded
prompt Loading WORKERORDER...
insert into WORKERORDER (workerid, orderid)
values (114421674, 37148);
insert into WORKERORDER (workerid, orderid)
values (114421674, 46483);
insert into WORKERORDER (workerid, orderid)
values (121025184, 88324);
insert into WORKERORDER (workerid, orderid)
values (121025184, 90296);
insert into WORKERORDER (workerid, orderid)
values (130009704, 12250);
insert into WORKERORDER (workerid, orderid)
values (130009704, 95905);
insert into WORKERORDER (workerid, orderid)
values (141658081, 17045);
insert into WORKERORDER (workerid, orderid)
values (143274912, 20340);
insert into WORKERORDER (workerid, orderid)
values (143274912, 26243);
insert into WORKERORDER (workerid, orderid)
values (143274912, 42625);
insert into WORKERORDER (workerid, orderid)
values (143274912, 70117);
insert into WORKERORDER (workerid, orderid)
values (143274912, 93691);
insert into WORKERORDER (workerid, orderid)
values (144948788, 37194);
insert into WORKERORDER (workerid, orderid)
values (144948788, 54591);
insert into WORKERORDER (workerid, orderid)
values (150499253, 55900);
insert into WORKERORDER (workerid, orderid)
values (151102830, 37671);
insert into WORKERORDER (workerid, orderid)
values (151190438, 15782);
insert into WORKERORDER (workerid, orderid)
values (151190438, 18733);
insert into WORKERORDER (workerid, orderid)
values (151190438, 19888);
insert into WORKERORDER (workerid, orderid)
values (151190438, 25789);
insert into WORKERORDER (workerid, orderid)
values (158167749, 27027);
insert into WORKERORDER (workerid, orderid)
values (166895689, 99848);
insert into WORKERORDER (workerid, orderid)
values (168794272, 97733);
insert into WORKERORDER (workerid, orderid)
values (171664309, 24870);
insert into WORKERORDER (workerid, orderid)
values (171664309, 59111);
insert into WORKERORDER (workerid, orderid)
values (173883880, 76341);
insert into WORKERORDER (workerid, orderid)
values (182415768, 68154);
insert into WORKERORDER (workerid, orderid)
values (182779884, 99235);
insert into WORKERORDER (workerid, orderid)
values (197897385, 61893);
insert into WORKERORDER (workerid, orderid)
values (206818154, 61649);
insert into WORKERORDER (workerid, orderid)
values (206818154, 67538);
insert into WORKERORDER (workerid, orderid)
values (206818154, 92215);
insert into WORKERORDER (workerid, orderid)
values (208639386, 19888);
insert into WORKERORDER (workerid, orderid)
values (208639386, 56419);
insert into WORKERORDER (workerid, orderid)
values (208639386, 61084);
insert into WORKERORDER (workerid, orderid)
values (218358224, 66809);
insert into WORKERORDER (workerid, orderid)
values (219233491, 41047);
insert into WORKERORDER (workerid, orderid)
values (222962696, 76341);
insert into WORKERORDER (workerid, orderid)
values (223660610, 81348);
insert into WORKERORDER (workerid, orderid)
values (225536517, 43714);
insert into WORKERORDER (workerid, orderid)
values (225536517, 88687);
insert into WORKERORDER (workerid, orderid)
values (225920093, 27419);
insert into WORKERORDER (workerid, orderid)
values (228936198, 37671);
insert into WORKERORDER (workerid, orderid)
values (229306755, 58566);
insert into WORKERORDER (workerid, orderid)
values (229306755, 87126);
insert into WORKERORDER (workerid, orderid)
values (234272756, 87608);
insert into WORKERORDER (workerid, orderid)
values (238439344, 57470);
insert into WORKERORDER (workerid, orderid)
values (238439344, 66170);
insert into WORKERORDER (workerid, orderid)
values (238439344, 76381);
insert into WORKERORDER (workerid, orderid)
values (242696947, 33488);
insert into WORKERORDER (workerid, orderid)
values (243687120, 60140);
insert into WORKERORDER (workerid, orderid)
values (248747551, 50051);
insert into WORKERORDER (workerid, orderid)
values (255642288, 67124);
insert into WORKERORDER (workerid, orderid)
values (255883695, 80923);
insert into WORKERORDER (workerid, orderid)
values (255883695, 93938);
insert into WORKERORDER (workerid, orderid)
values (255883695, 99066);
insert into WORKERORDER (workerid, orderid)
values (258562500, 13340);
insert into WORKERORDER (workerid, orderid)
values (259520422, 28892);
insert into WORKERORDER (workerid, orderid)
values (259520422, 62397);
insert into WORKERORDER (workerid, orderid)
values (261641954, 11979);
insert into WORKERORDER (workerid, orderid)
values (261641954, 34274);
insert into WORKERORDER (workerid, orderid)
values (261641954, 61649);
insert into WORKERORDER (workerid, orderid)
values (261641954, 70413);
insert into WORKERORDER (workerid, orderid)
values (262201104, 78815);
insert into WORKERORDER (workerid, orderid)
values (262201104, 94928);
insert into WORKERORDER (workerid, orderid)
values (265240066, 25737);
insert into WORKERORDER (workerid, orderid)
values (267099586, 42080);
insert into WORKERORDER (workerid, orderid)
values (267099586, 77517);
insert into WORKERORDER (workerid, orderid)
values (267135514, 56866);
insert into WORKERORDER (workerid, orderid)
values (268930432, 12869);
insert into WORKERORDER (workerid, orderid)
values (273165130, 36975);
insert into WORKERORDER (workerid, orderid)
values (275147357, 53224);
insert into WORKERORDER (workerid, orderid)
values (275147357, 70342);
insert into WORKERORDER (workerid, orderid)
values (277604116, 56866);
insert into WORKERORDER (workerid, orderid)
values (277604116, 61805);
insert into WORKERORDER (workerid, orderid)
values (277604116, 61893);
insert into WORKERORDER (workerid, orderid)
values (277946958, 73066);
insert into WORKERORDER (workerid, orderid)
values (277946958, 82287);
insert into WORKERORDER (workerid, orderid)
values (281921262, 51690);
insert into WORKERORDER (workerid, orderid)
values (284533000, 15420);
insert into WORKERORDER (workerid, orderid)
values (284533000, 49361);
insert into WORKERORDER (workerid, orderid)
values (286725499, 85929);
insert into WORKERORDER (workerid, orderid)
values (292467836, 17045);
insert into WORKERORDER (workerid, orderid)
values (292467836, 18689);
insert into WORKERORDER (workerid, orderid)
values (292467836, 92346);
insert into WORKERORDER (workerid, orderid)
values (295374274, 70069);
insert into WORKERORDER (workerid, orderid)
values (295374274, 94029);
insert into WORKERORDER (workerid, orderid)
values (296176965, 21832);
insert into WORKERORDER (workerid, orderid)
values (297990477, 36670);
insert into WORKERORDER (workerid, orderid)
values (297990477, 78919);
insert into WORKERORDER (workerid, orderid)
values (297990477, 84999);
insert into WORKERORDER (workerid, orderid)
values (297990477, 95091);
insert into WORKERORDER (workerid, orderid)
values (298011916, 20340);
insert into WORKERORDER (workerid, orderid)
values (298011916, 73066);
insert into WORKERORDER (workerid, orderid)
values (302385709, 94928);
insert into WORKERORDER (workerid, orderid)
values (302385709, 97579);
insert into WORKERORDER (workerid, orderid)
values (304330600, 24870);
insert into WORKERORDER (workerid, orderid)
values (305271909, 80621);
insert into WORKERORDER (workerid, orderid)
values (311084962, 70179);
insert into WORKERORDER (workerid, orderid)
values (314430603, 81587);
commit;
prompt 100 records committed...
insert into WORKERORDER (workerid, orderid)
values (314986077, 54954);
insert into WORKERORDER (workerid, orderid)
values (315073992, 53224);
insert into WORKERORDER (workerid, orderid)
values (320810829, 61886);
insert into WORKERORDER (workerid, orderid)
values (320810829, 82646);
insert into WORKERORDER (workerid, orderid)
values (320810829, 90296);
insert into WORKERORDER (workerid, orderid)
values (334885243, 27419);
insert into WORKERORDER (workerid, orderid)
values (339075958, 76051);
insert into WORKERORDER (workerid, orderid)
values (339075958, 82287);
insert into WORKERORDER (workerid, orderid)
values (345672173, 82772);
insert into WORKERORDER (workerid, orderid)
values (351906438, 24062);
insert into WORKERORDER (workerid, orderid)
values (353095864, 63144);
insert into WORKERORDER (workerid, orderid)
values (353483451, 84999);
insert into WORKERORDER (workerid, orderid)
values (355004851, 26757);
insert into WORKERORDER (workerid, orderid)
values (355004851, 41047);
insert into WORKERORDER (workerid, orderid)
values (355004851, 54976);
insert into WORKERORDER (workerid, orderid)
values (357958630, 36975);
insert into WORKERORDER (workerid, orderid)
values (357958630, 85504);
insert into WORKERORDER (workerid, orderid)
values (360432701, 68154);
insert into WORKERORDER (workerid, orderid)
values (360432701, 69001);
insert into WORKERORDER (workerid, orderid)
values (360876188, 95905);
insert into WORKERORDER (workerid, orderid)
values (362928866, 87126);
insert into WORKERORDER (workerid, orderid)
values (362928866, 96721);
insert into WORKERORDER (workerid, orderid)
values (366122029, 56847);
insert into WORKERORDER (workerid, orderid)
values (366122029, 95091);
insert into WORKERORDER (workerid, orderid)
values (376797326, 42371);
insert into WORKERORDER (workerid, orderid)
values (376797326, 49739);
insert into WORKERORDER (workerid, orderid)
values (376797326, 66724);
insert into WORKERORDER (workerid, orderid)
values (383489695, 28977);
insert into WORKERORDER (workerid, orderid)
values (383691830, 77882);
insert into WORKERORDER (workerid, orderid)
values (384501096, 31211);
insert into WORKERORDER (workerid, orderid)
values (387317698, 49835);
insert into WORKERORDER (workerid, orderid)
values (387317698, 82772);
insert into WORKERORDER (workerid, orderid)
values (387700034, 12999);
insert into WORKERORDER (workerid, orderid)
values (387700034, 13340);
insert into WORKERORDER (workerid, orderid)
values (387700034, 92098);
insert into WORKERORDER (workerid, orderid)
values (387785187, 98527);
insert into WORKERORDER (workerid, orderid)
values (392193120, 91999);
insert into WORKERORDER (workerid, orderid)
values (396174177, 86256);
insert into WORKERORDER (workerid, orderid)
values (399828289, 59102);
insert into WORKERORDER (workerid, orderid)
values (404480378, 38809);
insert into WORKERORDER (workerid, orderid)
values (408545424, 29434);
insert into WORKERORDER (workerid, orderid)
values (408545424, 77761);
insert into WORKERORDER (workerid, orderid)
values (411206210, 26243);
insert into WORKERORDER (workerid, orderid)
values (411206210, 33204);
insert into WORKERORDER (workerid, orderid)
values (415761333, 25069);
insert into WORKERORDER (workerid, orderid)
values (416198611, 83159);
insert into WORKERORDER (workerid, orderid)
values (420457209, 12250);
insert into WORKERORDER (workerid, orderid)
values (427015167, 82287);
insert into WORKERORDER (workerid, orderid)
values (430336249, 89117);
insert into WORKERORDER (workerid, orderid)
values (431561267, 98632);
insert into WORKERORDER (workerid, orderid)
values (436131650, 41047);
insert into WORKERORDER (workerid, orderid)
values (436131650, 43069);
insert into WORKERORDER (workerid, orderid)
values (437862243, 12632);
insert into WORKERORDER (workerid, orderid)
values (439905884, 91425);
insert into WORKERORDER (workerid, orderid)
values (449107156, 43069);
insert into WORKERORDER (workerid, orderid)
values (449109328, 47456);
insert into WORKERORDER (workerid, orderid)
values (455427394, 19134);
insert into WORKERORDER (workerid, orderid)
values (456648062, 19134);
insert into WORKERORDER (workerid, orderid)
values (456648062, 78421);
insert into WORKERORDER (workerid, orderid)
values (459186191, 88687);
insert into WORKERORDER (workerid, orderid)
values (460691565, 73066);
insert into WORKERORDER (workerid, orderid)
values (461411448, 27249);
insert into WORKERORDER (workerid, orderid)
values (461680777, 67538);
insert into WORKERORDER (workerid, orderid)
values (462135087, 80531);
insert into WORKERORDER (workerid, orderid)
values (462135087, 86234);
insert into WORKERORDER (workerid, orderid)
values (466227015, 43714);
insert into WORKERORDER (workerid, orderid)
values (466227015, 88687);
insert into WORKERORDER (workerid, orderid)
values (469863737, 29875);
insert into WORKERORDER (workerid, orderid)
values (469863737, 46483);
insert into WORKERORDER (workerid, orderid)
values (469863737, 49245);
insert into WORKERORDER (workerid, orderid)
values (471134871, 38809);
insert into WORKERORDER (workerid, orderid)
values (471134871, 46222);
insert into WORKERORDER (workerid, orderid)
values (471531514, 77648);
insert into WORKERORDER (workerid, orderid)
values (472193198, 39657);
insert into WORKERORDER (workerid, orderid)
values (473908032, 96276);
insert into WORKERORDER (workerid, orderid)
values (475339882, 27249);
insert into WORKERORDER (workerid, orderid)
values (475339882, 70117);
insert into WORKERORDER (workerid, orderid)
values (479092409, 57715);
insert into WORKERORDER (workerid, orderid)
values (479092409, 70179);
insert into WORKERORDER (workerid, orderid)
values (486544440, 65915);
insert into WORKERORDER (workerid, orderid)
values (486857760, 63144);
insert into WORKERORDER (workerid, orderid)
values (487061452, 54591);
insert into WORKERORDER (workerid, orderid)
values (488703859, 60888);
insert into WORKERORDER (workerid, orderid)
values (492775897, 34690);
insert into WORKERORDER (workerid, orderid)
values (494980064, 47834);
insert into WORKERORDER (workerid, orderid)
values (494980064, 70591);
insert into WORKERORDER (workerid, orderid)
values (494980064, 87961);
insert into WORKERORDER (workerid, orderid)
values (500953635, 55900);
insert into WORKERORDER (workerid, orderid)
values (502305221, 26352);
insert into WORKERORDER (workerid, orderid)
values (503459771, 77945);
insert into WORKERORDER (workerid, orderid)
values (507621009, 81336);
insert into WORKERORDER (workerid, orderid)
values (510379034, 26243);
insert into WORKERORDER (workerid, orderid)
values (510379034, 66724);
insert into WORKERORDER (workerid, orderid)
values (510379034, 68596);
insert into WORKERORDER (workerid, orderid)
values (510379034, 98042);
insert into WORKERORDER (workerid, orderid)
values (510633107, 26243);
insert into WORKERORDER (workerid, orderid)
values (510633107, 29434);
insert into WORKERORDER (workerid, orderid)
values (510633107, 37868);
insert into WORKERORDER (workerid, orderid)
values (512549110, 22328);
insert into WORKERORDER (workerid, orderid)
values (518269533, 33802);
commit;
prompt 200 records committed...
insert into WORKERORDER (workerid, orderid)
values (519636463, 51690);
insert into WORKERORDER (workerid, orderid)
values (519636463, 65447);
insert into WORKERORDER (workerid, orderid)
values (522290889, 52830);
insert into WORKERORDER (workerid, orderid)
values (522290889, 78919);
insert into WORKERORDER (workerid, orderid)
values (524062213, 60090);
insert into WORKERORDER (workerid, orderid)
values (531570152, 40297);
insert into WORKERORDER (workerid, orderid)
values (531570152, 48748);
insert into WORKERORDER (workerid, orderid)
values (534475954, 56419);
insert into WORKERORDER (workerid, orderid)
values (536565440, 13340);
insert into WORKERORDER (workerid, orderid)
values (536565440, 15697);
insert into WORKERORDER (workerid, orderid)
values (536565440, 96721);
insert into WORKERORDER (workerid, orderid)
values (547482300, 48817);
insert into WORKERORDER (workerid, orderid)
values (547482300, 58785);
insert into WORKERORDER (workerid, orderid)
values (549089202, 15782);
insert into WORKERORDER (workerid, orderid)
values (549089202, 34808);
insert into WORKERORDER (workerid, orderid)
values (550647367, 82646);
insert into WORKERORDER (workerid, orderid)
values (554797202, 49245);
insert into WORKERORDER (workerid, orderid)
values (554797202, 78919);
insert into WORKERORDER (workerid, orderid)
values (554973419, 27738);
insert into WORKERORDER (workerid, orderid)
values (554973419, 45695);
insert into WORKERORDER (workerid, orderid)
values (558276647, 56847);
insert into WORKERORDER (workerid, orderid)
values (565560307, 46222);
insert into WORKERORDER (workerid, orderid)
values (568533024, 97641);
insert into WORKERORDER (workerid, orderid)
values (570214056, 39657);
insert into WORKERORDER (workerid, orderid)
values (570214056, 44544);
insert into WORKERORDER (workerid, orderid)
values (574638261, 30440);
insert into WORKERORDER (workerid, orderid)
values (576302575, 70413);
insert into WORKERORDER (workerid, orderid)
values (579289656, 43689);
insert into WORKERORDER (workerid, orderid)
values (580213084, 56847);
insert into WORKERORDER (workerid, orderid)
values (584144058, 72084);
insert into WORKERORDER (workerid, orderid)
values (589791847, 24848);
insert into WORKERORDER (workerid, orderid)
values (589791847, 27738);
insert into WORKERORDER (workerid, orderid)
values (591522810, 52464);
insert into WORKERORDER (workerid, orderid)
values (593959323, 21392);
insert into WORKERORDER (workerid, orderid)
values (593959323, 34742);
insert into WORKERORDER (workerid, orderid)
values (593959323, 83038);
insert into WORKERORDER (workerid, orderid)
values (593959323, 98042);
insert into WORKERORDER (workerid, orderid)
values (606243771, 76937);
insert into WORKERORDER (workerid, orderid)
values (608997777, 74919);
insert into WORKERORDER (workerid, orderid)
values (611069104, 24835);
insert into WORKERORDER (workerid, orderid)
values (611069104, 47475);
insert into WORKERORDER (workerid, orderid)
values (611069104, 65660);
insert into WORKERORDER (workerid, orderid)
values (614727484, 34274);
insert into WORKERORDER (workerid, orderid)
values (614763884, 65762);
insert into WORKERORDER (workerid, orderid)
values (622686873, 66724);
insert into WORKERORDER (workerid, orderid)
values (623130405, 50999);
insert into WORKERORDER (workerid, orderid)
values (623130405, 55995);
insert into WORKERORDER (workerid, orderid)
values (626094671, 50309);
insert into WORKERORDER (workerid, orderid)
values (628904772, 49082);
insert into WORKERORDER (workerid, orderid)
values (628904772, 88687);
insert into WORKERORDER (workerid, orderid)
values (629460708, 45695);
insert into WORKERORDER (workerid, orderid)
values (631569343, 27738);
insert into WORKERORDER (workerid, orderid)
values (634137117, 48816);
insert into WORKERORDER (workerid, orderid)
values (637634813, 75930);
insert into WORKERORDER (workerid, orderid)
values (637634813, 95118);
insert into WORKERORDER (workerid, orderid)
values (639757330, 66958);
insert into WORKERORDER (workerid, orderid)
values (639757330, 81336);
insert into WORKERORDER (workerid, orderid)
values (647199048, 36951);
insert into WORKERORDER (workerid, orderid)
values (651168122, 13604);
insert into WORKERORDER (workerid, orderid)
values (651168122, 25789);
insert into WORKERORDER (workerid, orderid)
values (651168122, 65447);
insert into WORKERORDER (workerid, orderid)
values (651168122, 98756);
insert into WORKERORDER (workerid, orderid)
values (661506793, 98632);
insert into WORKERORDER (workerid, orderid)
values (661594084, 41614);
insert into WORKERORDER (workerid, orderid)
values (661594084, 44544);
insert into WORKERORDER (workerid, orderid)
values (661594084, 97433);
insert into WORKERORDER (workerid, orderid)
values (668096680, 66724);
insert into WORKERORDER (workerid, orderid)
values (668847990, 35602);
insert into WORKERORDER (workerid, orderid)
values (668847990, 42371);
insert into WORKERORDER (workerid, orderid)
values (669335166, 88324);
insert into WORKERORDER (workerid, orderid)
values (699249693, 24848);
insert into WORKERORDER (workerid, orderid)
values (700654948, 15697);
insert into WORKERORDER (workerid, orderid)
values (700654948, 80923);
insert into WORKERORDER (workerid, orderid)
values (701137116, 94380);
insert into WORKERORDER (workerid, orderid)
values (704770476, 97733);
insert into WORKERORDER (workerid, orderid)
values (706079543, 59102);
insert into WORKERORDER (workerid, orderid)
values (706079543, 62055);
insert into WORKERORDER (workerid, orderid)
values (713111039, 59409);
insert into WORKERORDER (workerid, orderid)
values (713111039, 79488);
insert into WORKERORDER (workerid, orderid)
values (713709839, 65668);
insert into WORKERORDER (workerid, orderid)
values (713709839, 82646);
insert into WORKERORDER (workerid, orderid)
values (716162261, 48816);
insert into WORKERORDER (workerid, orderid)
values (718339906, 22459);
insert into WORKERORDER (workerid, orderid)
values (718339906, 60140);
insert into WORKERORDER (workerid, orderid)
values (719635118, 55900);
insert into WORKERORDER (workerid, orderid)
values (719635118, 75930);
insert into WORKERORDER (workerid, orderid)
values (722882082, 95118);
insert into WORKERORDER (workerid, orderid)
values (723763437, 60728);
insert into WORKERORDER (workerid, orderid)
values (727731831, 28836);
insert into WORKERORDER (workerid, orderid)
values (727731831, 49352);
insert into WORKERORDER (workerid, orderid)
values (731216901, 67193);
insert into WORKERORDER (workerid, orderid)
values (737887232, 57715);
insert into WORKERORDER (workerid, orderid)
values (737938512, 28440);
insert into WORKERORDER (workerid, orderid)
values (737938512, 33488);
insert into WORKERORDER (workerid, orderid)
values (752448780, 48748);
insert into WORKERORDER (workerid, orderid)
values (753964648, 80923);
insert into WORKERORDER (workerid, orderid)
values (754861504, 13604);
insert into WORKERORDER (workerid, orderid)
values (754861504, 76051);
insert into WORKERORDER (workerid, orderid)
values (754861504, 88653);
insert into WORKERORDER (workerid, orderid)
values (756547789, 37671);
commit;
prompt 300 records committed...
insert into WORKERORDER (workerid, orderid)
values (757966082, 77761);
insert into WORKERORDER (workerid, orderid)
values (766434556, 24927);
insert into WORKERORDER (workerid, orderid)
values (766434556, 33769);
insert into WORKERORDER (workerid, orderid)
values (772509749, 88653);
insert into WORKERORDER (workerid, orderid)
values (774333712, 54976);
insert into WORKERORDER (workerid, orderid)
values (774333712, 93691);
insert into WORKERORDER (workerid, orderid)
values (779620875, 59102);
insert into WORKERORDER (workerid, orderid)
values (779620875, 61398);
insert into WORKERORDER (workerid, orderid)
values (789382847, 56866);
insert into WORKERORDER (workerid, orderid)
values (792710108, 70117);
insert into WORKERORDER (workerid, orderid)
values (806903873, 92098);
insert into WORKERORDER (workerid, orderid)
values (811740389, 96721);
insert into WORKERORDER (workerid, orderid)
values (812779885, 33769);
insert into WORKERORDER (workerid, orderid)
values (812779885, 49245);
insert into WORKERORDER (workerid, orderid)
values (817411037, 27027);
insert into WORKERORDER (workerid, orderid)
values (817411037, 47782);
insert into WORKERORDER (workerid, orderid)
values (817411037, 49445);
insert into WORKERORDER (workerid, orderid)
values (818988740, 75609);
insert into WORKERORDER (workerid, orderid)
values (818988740, 94380);
insert into WORKERORDER (workerid, orderid)
values (819536592, 65915);
insert into WORKERORDER (workerid, orderid)
values (821122982, 59718);
insert into WORKERORDER (workerid, orderid)
values (821122982, 98527);
insert into WORKERORDER (workerid, orderid)
values (829383402, 63034);
insert into WORKERORDER (workerid, orderid)
values (833625450, 16791);
insert into WORKERORDER (workerid, orderid)
values (844980272, 59111);
insert into WORKERORDER (workerid, orderid)
values (850520181, 58849);
insert into WORKERORDER (workerid, orderid)
values (851543318, 20942);
insert into WORKERORDER (workerid, orderid)
values (853866878, 26243);
insert into WORKERORDER (workerid, orderid)
values (853866878, 61805);
insert into WORKERORDER (workerid, orderid)
values (855608849, 34690);
insert into WORKERORDER (workerid, orderid)
values (856288382, 17887);
insert into WORKERORDER (workerid, orderid)
values (856424401, 83038);
insert into WORKERORDER (workerid, orderid)
values (858017575, 26352);
insert into WORKERORDER (workerid, orderid)
values (858017575, 27419);
insert into WORKERORDER (workerid, orderid)
values (858017575, 80531);
insert into WORKERORDER (workerid, orderid)
values (858017575, 88995);
insert into WORKERORDER (workerid, orderid)
values (858156979, 71880);
insert into WORKERORDER (workerid, orderid)
values (858668229, 29434);
insert into WORKERORDER (workerid, orderid)
values (858668229, 98632);
insert into WORKERORDER (workerid, orderid)
values (862916390, 33488);
insert into WORKERORDER (workerid, orderid)
values (865424474, 74675);
insert into WORKERORDER (workerid, orderid)
values (873611755, 96704);
insert into WORKERORDER (workerid, orderid)
values (878055555, 34274);
insert into WORKERORDER (workerid, orderid)
values (878180135, 35602);
insert into WORKERORDER (workerid, orderid)
values (878180135, 57715);
insert into WORKERORDER (workerid, orderid)
values (882909089, 41351);
insert into WORKERORDER (workerid, orderid)
values (885566843, 98042);
insert into WORKERORDER (workerid, orderid)
values (886633965, 72289);
insert into WORKERORDER (workerid, orderid)
values (893069423, 60140);
insert into WORKERORDER (workerid, orderid)
values (894974321, 44583);
insert into WORKERORDER (workerid, orderid)
values (904958179, 46819);
insert into WORKERORDER (workerid, orderid)
values (906866857, 70342);
insert into WORKERORDER (workerid, orderid)
values (913456625, 74675);
insert into WORKERORDER (workerid, orderid)
values (913840631, 76355);
insert into WORKERORDER (workerid, orderid)
values (913840631, 87126);
insert into WORKERORDER (workerid, orderid)
values (918866751, 76341);
insert into WORKERORDER (workerid, orderid)
values (925561192, 27027);
insert into WORKERORDER (workerid, orderid)
values (925561192, 42600);
insert into WORKERORDER (workerid, orderid)
values (925561192, 98756);
insert into WORKERORDER (workerid, orderid)
values (926841070, 20030);
insert into WORKERORDER (workerid, orderid)
values (926841070, 28486);
insert into WORKERORDER (workerid, orderid)
values (928887028, 67538);
insert into WORKERORDER (workerid, orderid)
values (931232113, 75486);
insert into WORKERORDER (workerid, orderid)
values (932964346, 38435);
insert into WORKERORDER (workerid, orderid)
values (932964346, 49352);
insert into WORKERORDER (workerid, orderid)
values (933210108, 33204);
insert into WORKERORDER (workerid, orderid)
values (933210108, 43910);
insert into WORKERORDER (workerid, orderid)
values (933210108, 50051);
insert into WORKERORDER (workerid, orderid)
values (933210108, 65447);
insert into WORKERORDER (workerid, orderid)
values (951806375, 20942);
insert into WORKERORDER (workerid, orderid)
values (952434154, 37671);
insert into WORKERORDER (workerid, orderid)
values (952434154, 44544);
insert into WORKERORDER (workerid, orderid)
values (952434154, 61649);
insert into WORKERORDER (workerid, orderid)
values (953134195, 49636);
insert into WORKERORDER (workerid, orderid)
values (953134195, 70313);
insert into WORKERORDER (workerid, orderid)
values (955194097, 27308);
insert into WORKERORDER (workerid, orderid)
values (955194097, 33802);
insert into WORKERORDER (workerid, orderid)
values (955194097, 48816);
insert into WORKERORDER (workerid, orderid)
values (962903534, 98042);
insert into WORKERORDER (workerid, orderid)
values (969006386, 44590);
insert into WORKERORDER (workerid, orderid)
values (969006386, 56419);
insert into WORKERORDER (workerid, orderid)
values (972864512, 42080);
insert into WORKERORDER (workerid, orderid)
values (978719866, 42625);
insert into WORKERORDER (workerid, orderid)
values (980700135, 12632);
insert into WORKERORDER (workerid, orderid)
values (980700135, 13231);
insert into WORKERORDER (workerid, orderid)
values (980700135, 37671);
insert into WORKERORDER (workerid, orderid)
values (980700135, 49361);
insert into WORKERORDER (workerid, orderid)
values (991357078, 52464);
insert into WORKERORDER (workerid, orderid)
values (991357078, 80923);
insert into WORKERORDER (workerid, orderid)
values (994966133, 24848);
insert into WORKERORDER (workerid, orderid)
values (994966133, 59718);
insert into WORKERORDER (workerid, orderid)
values (994966133, 91903);
insert into WORKERORDER (workerid, orderid)
values (996074180, 39128);
insert into WORKERORDER (workerid, orderid)
values (998589755, 66809);
insert into WORKERORDER (workerid, orderid)
values (998589755, 87608);
insert into WORKERORDER (workerid, orderid)
values (998741113, 37868);
insert into WORKERORDER (workerid, orderid)
values (998741113, 38809);
insert into WORKERORDER (workerid, orderid)
values (998741113, 71353);
commit;
prompt 398 records loaded
prompt Enabling foreign key constraints for CONTAINING...
alter table CONTAINING enable constraint SYS_C007376;
alter table CONTAINING enable constraint SYS_C007377;
prompt Enabling foreign key constraints for PRODUCT...
alter table PRODUCT enable constraint FK_PRODUCT_SUPPLIER;
prompt Enabling foreign key constraints for INGREDIENTS...
alter table INGREDIENTS enable constraint SYS_C007333;
alter table INGREDIENTS enable constraint SYS_C007334;
prompt Enabling foreign key constraints for INSTOCK...
alter table INSTOCK enable constraint SYS_C007389;
alter table INSTOCK enable constraint SYS_C007390;
prompt Enabling foreign key constraints for INVITATION...
alter table INVITATION enable constraint SYS_C007397;
alter table INVITATION enable constraint SYS_C007398;
alter table INVITATION enable constraint SYS_C007399;
prompt Enabling foreign key constraints for MEALORDER...
alter table MEALORDER enable constraint FK_MEALORDER_INVITATION;
alter table MEALORDER enable constraint SYS_C007346;
prompt Enabling foreign key constraints for WORKERORDER...
alter table WORKERORDER enable constraint FK_WORKERORDER_INVITATION;
alter table WORKERORDER enable constraint SYS_C007357;
prompt Enabling triggers for CLIENT...
alter table CLIENT enable all triggers;
prompt Enabling triggers for EQUIPMENT...
alter table EQUIPMENT enable all triggers;
prompt Enabling triggers for PAKCAGE...
alter table PAKCAGE enable all triggers;
prompt Enabling triggers for CONTAINING...
alter table CONTAINING enable all triggers;
prompt Enabling triggers for DESIGNER...
alter table DESIGNER enable all triggers;
prompt Enabling triggers for MEAL...
alter table MEAL enable all triggers;
prompt Enabling triggers for SUPPLIER_...
alter table SUPPLIER_ enable all triggers;
prompt Enabling triggers for PRODUCT...
alter table PRODUCT enable all triggers;
prompt Enabling triggers for INGREDIENTS...
alter table INGREDIENTS enable all triggers;
prompt Enabling triggers for INSTOCK...
alter table INSTOCK enable all triggers;
prompt Enabling triggers for INVITATION...
alter table INVITATION enable all triggers;
prompt Enabling triggers for MEALORDER...
alter table MEALORDER enable all triggers;
prompt Enabling triggers for WORKERS...
alter table WORKERS enable all triggers;
prompt Enabling triggers for WORKERORDER...
alter table WORKERORDER enable all triggers;
set feedback on
set define on
prompt Done.
