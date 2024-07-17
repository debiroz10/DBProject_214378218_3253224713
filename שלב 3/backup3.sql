prompt PL/SQL Developer import file
prompt Created on יום רביעי 17 יולי 2024 by IMOE001
set feedback off
set define off
prompt Creating CLIENT...
create table CLIENT
(
  clientid   VARCHAR2(9) not null,
  clientname VARCHAR2(15) not null,
  phone      VARCHAR2(10) not null
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

prompt Creating SUPPLIER_...
create table SUPPLIER_
(
  supplierid   NUMBER(5) not null,
  suppliername VARCHAR2(15) not null,
  area         VARCHAR2(30)
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
  clientid     VARCHAR2(8) not null,
  designerid   NUMBER(5) not null,
  packageid    NUMBER(5) not null
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
prompt Disabling triggers for SUPPLIER_...
alter table SUPPLIER_ disable all triggers;
prompt Disabling triggers for INSTOCK...
alter table INSTOCK disable all triggers;
prompt Disabling triggers for INVITATION...
alter table INVITATION disable all triggers;
prompt Disabling foreign key constraints for CONTAINING...
alter table CONTAINING disable constraint SYS_C007141;
alter table CONTAINING disable constraint SYS_C007142;
prompt Disabling foreign key constraints for INSTOCK...
alter table INSTOCK disable constraint SYS_C007135;
alter table INSTOCK disable constraint SYS_C007136;
prompt Disabling foreign key constraints for INVITATION...
alter table INVITATION disable constraint SYS_C007149;
alter table INVITATION disable constraint SYS_C007150;
alter table INVITATION disable constraint SYS_C007151;
prompt Deleting INVITATION...
delete from INVITATION;
commit;
prompt Deleting INSTOCK...
delete from INSTOCK;
commit;
prompt Deleting SUPPLIER_...
delete from SUPPLIER_;
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
insert into CLIENT (clientid, clientname, phone)
values ('214378218', 'debi', '547683445');
insert into CLIENT (clientid, clientname, phone)
values ('214378214', 'dani', '548983445');
insert into CLIENT (clientid, clientname, phone)
values ('567878214', 'tali', '547683445');
insert into CLIENT (clientid, clientname, phone)
values ('278378218', 'yair', '523478945');
insert into CLIENT (clientid, clientname, phone)
values ('214820218', 'dadi', '537829887');
insert into CLIENT (clientid, clientname, phone)
values ('345678218', 'mali', '533456778');
insert into CLIENT (clientid, clientname, phone)
values ('28920218', 'noa', '537862116');
insert into CLIENT (clientid, clientname, phone)
values ('282089218', 'moshe', '54098765');
insert into CLIENT (clientid, clientname, phone)
values ('21437821', 'debi', '547683445');
insert into CLIENT (clientid, clientname, phone)
values ('56787821', 'tali', '547683445');
insert into CLIENT (clientid, clientname, phone)
values ('27837821', 'yair', '523478945');
insert into CLIENT (clientid, clientname, phone)
values ('214389221', 'chana', '39090555');
insert into CLIENT (clientid, clientname, phone)
values ('21482021', 'dadi', '537829887');
insert into CLIENT (clientid, clientname, phone)
values ('34567821', 'mali', '533456778');
insert into CLIENT (clientid, clientname, phone)
values ('2892028', 'noa', '537862116');
insert into CLIENT (clientid, clientname, phone)
values ('28208921', 'moshe', '54098765');
insert into CLIENT (clientid, clientname, phone)
values ('345678291', 'orit', '543283445');
insert into CLIENT (clientid, clientname, phone)
values ('21837821', 'dani', '548983445');
insert into CLIENT (clientid, clientname, phone)
values ('20', 'Irene', '4541224787');
insert into CLIENT (clientid, clientname, phone)
values ('21', 'Merillee', '4136921532');
insert into CLIENT (clientid, clientname, phone)
values ('22', 'Wang', '7461644214');
insert into CLIENT (clientid, clientname, phone)
values ('23', 'Crispin', '8197196194');
insert into CLIENT (clientid, clientname, phone)
values ('24', 'Juliana', '1365284321');
insert into CLIENT (clientid, clientname, phone)
values ('25', 'Rosie', '1689743385');
insert into CLIENT (clientid, clientname, phone)
values ('26', 'Parker', '2222844349');
insert into CLIENT (clientid, clientname, phone)
values ('27', 'Jeroen', '7919314538');
insert into CLIENT (clientid, clientname, phone)
values ('28', 'Oliver', '5765684594');
insert into CLIENT (clientid, clientname, phone)
values ('29', 'Rolando', '3343352918');
insert into CLIENT (clientid, clientname, phone)
values ('30', 'Minnie', '6455388273');
insert into CLIENT (clientid, clientname, phone)
values ('31', 'Mint', '7514718542');
insert into CLIENT (clientid, clientname, phone)
values ('32', 'Don', '6854184878');
insert into CLIENT (clientid, clientname, phone)
values ('33', 'Gran', '8792991651');
insert into CLIENT (clientid, clientname, phone)
values ('34', 'Alessandro', '5689547885');
insert into CLIENT (clientid, clientname, phone)
values ('40', 'Thomas', '7926966328');
insert into CLIENT (clientid, clientname, phone)
values ('41', 'Jude', '4291951679');
insert into CLIENT (clientid, clientname, phone)
values ('42', 'Bob', '1286586982');
insert into CLIENT (clientid, clientname, phone)
values ('43', 'David', '1614514774');
insert into CLIENT (clientid, clientname, phone)
values ('44', 'Sharon', '8446627179');
insert into CLIENT (clientid, clientname, phone)
values ('45', 'April', '5678853123');
insert into CLIENT (clientid, clientname, phone)
values ('46', 'Emilio', '9297744443');
insert into CLIENT (clientid, clientname, phone)
values ('47', 'Kurt', '2263662325');
insert into CLIENT (clientid, clientname, phone)
values ('48', 'Fionnula', '7875815785');
insert into CLIENT (clientid, clientname, phone)
values ('49', 'Leelee', '5584789691');
insert into CLIENT (clientid, clientname, phone)
values ('50', 'Vondie', '7832558366');
insert into CLIENT (clientid, clientname, phone)
values ('51', 'Joe', '9177662451');
insert into CLIENT (clientid, clientname, phone)
values ('52', 'Leelee', '8118978176');
insert into CLIENT (clientid, clientname, phone)
values ('53', 'Bob', '5399577665');
insert into CLIENT (clientid, clientname, phone)
values ('54', 'Hex', '4458431942');
insert into CLIENT (clientid, clientname, phone)
values ('55', 'Gina', '4116614918');
insert into CLIENT (clientid, clientname, phone)
values ('56', 'Kim', '3829733469');
insert into CLIENT (clientid, clientname, phone)
values ('57', 'Gilberto', '9848533466');
insert into CLIENT (clientid, clientname, phone)
values ('58', 'Cameron', '6767179553');
insert into CLIENT (clientid, clientname, phone)
values ('59', 'Angelina', '5587612386');
insert into CLIENT (clientid, clientname, phone)
values ('60', 'Powers', '1247498366');
insert into CLIENT (clientid, clientname, phone)
values ('61', 'Jay', '5368559157');
insert into CLIENT (clientid, clientname, phone)
values ('62', 'Mary Beth', '1428326468');
insert into CLIENT (clientid, clientname, phone)
values ('63', 'Clive', '3233337743');
insert into CLIENT (clientid, clientname, phone)
values ('64', 'Lynn', '4498614726');
insert into CLIENT (clientid, clientname, phone)
values ('65', 'Ethan', '3898657883');
insert into CLIENT (clientid, clientname, phone)
values ('66', 'Wang', '1926614236');
insert into CLIENT (clientid, clientname, phone)
values ('67', 'Joshua', '4267298891');
insert into CLIENT (clientid, clientname, phone)
values ('68', 'Franz', '7426718615');
insert into CLIENT (clientid, clientname, phone)
values ('69', 'Raul', '3983469596');
insert into CLIENT (clientid, clientname, phone)
values ('70', 'Emerson', '2651127966');
insert into CLIENT (clientid, clientname, phone)
values ('71', 'Armin', '4855194256');
insert into CLIENT (clientid, clientname, phone)
values ('72', 'Danni', '4192735233');
insert into CLIENT (clientid, clientname, phone)
values ('73', 'Loreena', '4155836956');
insert into CLIENT (clientid, clientname, phone)
values ('74', 'Kris', '7599531452');
insert into CLIENT (clientid, clientname, phone)
values ('75', 'Fred', '2132698791');
insert into CLIENT (clientid, clientname, phone)
values ('76', 'CeCe', '5491732544');
insert into CLIENT (clientid, clientname, phone)
values ('77', 'Michael', '8328111216');
insert into CLIENT (clientid, clientname, phone)
values ('78', 'Rueben', '3611436298');
insert into CLIENT (clientid, clientname, phone)
values ('79', 'Trey', '8697797899');
insert into CLIENT (clientid, clientname, phone)
values ('80', 'Terri', '8526351448');
insert into CLIENT (clientid, clientname, phone)
values ('81', 'Miriam', '5512363831');
insert into CLIENT (clientid, clientname, phone)
values ('82', 'Christopher', '7169634989');
insert into CLIENT (clientid, clientname, phone)
values ('83', 'Uma', '3726542561');
insert into CLIENT (clientid, clientname, phone)
values ('84', 'Kathy', '2943293146');
insert into CLIENT (clientid, clientname, phone)
values ('85', 'Sara', '2466427131');
insert into CLIENT (clientid, clientname, phone)
values ('86', 'Collin', '6976885744');
insert into CLIENT (clientid, clientname, phone)
values ('87', 'Samantha', '6572344585');
insert into CLIENT (clientid, clientname, phone)
values ('88', 'Adina', '3319634273');
insert into CLIENT (clientid, clientname, phone)
values ('89', 'Billy', '9481535229');
insert into CLIENT (clientid, clientname, phone)
values ('90', 'Olga', '2549755375');
insert into CLIENT (clientid, clientname, phone)
values ('91', 'Ian', '6581371681');
insert into CLIENT (clientid, clientname, phone)
values ('92', 'Scarlett', '9837416384');
insert into CLIENT (clientid, clientname, phone)
values ('93', 'Cary', '9765159424');
insert into CLIENT (clientid, clientname, phone)
values ('94', 'Vendetta', '8488334961');
insert into CLIENT (clientid, clientname, phone)
values ('95', 'Martha', '1359693646');
insert into CLIENT (clientid, clientname, phone)
values ('96', 'Rachael', '2618561256');
insert into CLIENT (clientid, clientname, phone)
values ('97', 'Kristin', '8116276795');
insert into CLIENT (clientid, clientname, phone)
values ('98', 'Kate', '8481293376');
insert into CLIENT (clientid, clientname, phone)
values ('99', 'Raymond', '6412511395');
insert into CLIENT (clientid, clientname, phone)
values ('100', 'Clive', '3323663458');
insert into CLIENT (clientid, clientname, phone)
values ('101', 'Doug', '5246663927');
insert into CLIENT (clientid, clientname, phone)
values ('102', 'Raymond', '8917283713');
insert into CLIENT (clientid, clientname, phone)
values ('103', 'Naomi', '8778732436');
insert into CLIENT (clientid, clientname, phone)
values ('104', 'Joely', '9316381224');
insert into CLIENT (clientid, clientname, phone)
values ('105', 'Herbie', '3661343854');
insert into CLIENT (clientid, clientname, phone)
values ('106', 'Jann', '4356496864');
commit;
prompt 100 records committed...
insert into CLIENT (clientid, clientname, phone)
values ('107', 'Mary', '6856781542');
insert into CLIENT (clientid, clientname, phone)
values ('108', 'Wang', '1723133426');
insert into CLIENT (clientid, clientname, phone)
values ('109', 'Gil', '1685879772');
insert into CLIENT (clientid, clientname, phone)
values ('110', 'Orlando', '5416379923');
insert into CLIENT (clientid, clientname, phone)
values ('111', 'Judge', '6574517861');
insert into CLIENT (clientid, clientname, phone)
values ('112', 'Rita', '4732791932');
insert into CLIENT (clientid, clientname, phone)
values ('113', 'Horace', '3657817457');
insert into CLIENT (clientid, clientname, phone)
values ('114', 'Collin', '7596266918');
insert into CLIENT (clientid, clientname, phone)
values ('115', 'Bo', '7659565241');
insert into CLIENT (clientid, clientname, phone)
values ('116', 'Queen', '4562377443');
insert into CLIENT (clientid, clientname, phone)
values ('117', 'Kelly', '6123432269');
insert into CLIENT (clientid, clientname, phone)
values ('118', 'Reese', '8694764565');
insert into CLIENT (clientid, clientname, phone)
values ('119', 'Richie', '6643419298');
insert into CLIENT (clientid, clientname, phone)
values ('120', 'Victor', '6657725754');
insert into CLIENT (clientid, clientname, phone)
values ('121', 'Rascal', '7659966468');
insert into CLIENT (clientid, clientname, phone)
values ('122', 'Kiefer', '7374263474');
insert into CLIENT (clientid, clientname, phone)
values ('123', 'Rosanne', '3241726919');
insert into CLIENT (clientid, clientname, phone)
values ('124', 'Burton', '5797596264');
insert into CLIENT (clientid, clientname, phone)
values ('125', 'Sophie', '6498519517');
insert into CLIENT (clientid, clientname, phone)
values ('126', 'Gilberto', '4512892276');
insert into CLIENT (clientid, clientname, phone)
values ('127', 'Ryan', '3688268624');
insert into CLIENT (clientid, clientname, phone)
values ('128', 'Curt', '2788527799');
insert into CLIENT (clientid, clientname, phone)
values ('129', 'Leo', '6548161789');
insert into CLIENT (clientid, clientname, phone)
values ('130', 'Judy', '2342337388');
insert into CLIENT (clientid, clientname, phone)
values ('131', 'Rodney', '5823627515');
insert into CLIENT (clientid, clientname, phone)
values ('132', 'Gloria', '7927973478');
insert into CLIENT (clientid, clientname, phone)
values ('133', 'Robert', '9169719845');
insert into CLIENT (clientid, clientname, phone)
values ('134', 'Rosco', '5349672656');
insert into CLIENT (clientid, clientname, phone)
values ('135', 'Danny', '2841482183');
insert into CLIENT (clientid, clientname, phone)
values ('136', 'Alfred', '9244292724');
insert into CLIENT (clientid, clientname, phone)
values ('137', 'Freddy', '5133924369');
insert into CLIENT (clientid, clientname, phone)
values ('138', 'Scarlett', '2878645214');
insert into CLIENT (clientid, clientname, phone)
values ('139', 'Temuera', '3888726129');
insert into CLIENT (clientid, clientname, phone)
values ('140', 'Nicolas', '7553493826');
insert into CLIENT (clientid, clientname, phone)
values ('141', 'Kirk', '4918787344');
insert into CLIENT (clientid, clientname, phone)
values ('142', 'Fionnula', '1114983989');
insert into CLIENT (clientid, clientname, phone)
values ('143', 'Lucinda', '8914999346');
insert into CLIENT (clientid, clientname, phone)
values ('144', 'Taylor', '8686268645');
insert into CLIENT (clientid, clientname, phone)
values ('145', 'Cathy', '9571535586');
insert into CLIENT (clientid, clientname, phone)
values ('146', 'Kitty', '1198414329');
insert into CLIENT (clientid, clientname, phone)
values ('147', 'Earl', '2837947497');
insert into CLIENT (clientid, clientname, phone)
values ('148', 'Benjamin', '8934412652');
insert into CLIENT (clientid, clientname, phone)
values ('149', 'Andre', '6794455426');
insert into CLIENT (clientid, clientname, phone)
values ('150', 'Debi', '8848335771');
insert into CLIENT (clientid, clientname, phone)
values ('151', 'Geraldine', '2552446138');
insert into CLIENT (clientid, clientname, phone)
values ('152', 'Maria', '1485324393');
insert into CLIENT (clientid, clientname, phone)
values ('153', 'Trey', '1193858873');
insert into CLIENT (clientid, clientname, phone)
values ('154', 'Ann', '7697467714');
insert into CLIENT (clientid, clientname, phone)
values ('155', 'Jon', '5325181743');
insert into CLIENT (clientid, clientname, phone)
values ('156', 'Gordon', '4742699468');
insert into CLIENT (clientid, clientname, phone)
values ('157', 'Frankie', '8534473994');
insert into CLIENT (clientid, clientname, phone)
values ('158', 'Courtney', '5455294972');
insert into CLIENT (clientid, clientname, phone)
values ('159', 'Robin', '8878854348');
insert into CLIENT (clientid, clientname, phone)
values ('160', 'Adam', '5164396684');
insert into CLIENT (clientid, clientname, phone)
values ('161', 'Cathy', '6754938366');
insert into CLIENT (clientid, clientname, phone)
values ('162', 'Carlos', '7552358592');
insert into CLIENT (clientid, clientname, phone)
values ('163', 'Micky', '4483963278');
insert into CLIENT (clientid, clientname, phone)
values ('164', 'Gina', '1666238597');
insert into CLIENT (clientid, clientname, phone)
values ('165', 'Sharon', '7646612749');
insert into CLIENT (clientid, clientname, phone)
values ('166', 'Rob', '6666544215');
insert into CLIENT (clientid, clientname, phone)
values ('167', 'Laurie', '3175725768');
insert into CLIENT (clientid, clientname, phone)
values ('168', 'Joshua', '8841131524');
insert into CLIENT (clientid, clientname, phone)
values ('169', 'Katrin', '5733931428');
insert into CLIENT (clientid, clientname, phone)
values ('170', 'Ewan', '1213387182');
insert into CLIENT (clientid, clientname, phone)
values ('171', 'Eddie', '8841346551');
insert into CLIENT (clientid, clientname, phone)
values ('172', 'Charlie', '3784991873');
insert into CLIENT (clientid, clientname, phone)
values ('173', 'Lili', '6737866787');
insert into CLIENT (clientid, clientname, phone)
values ('174', 'Kurtwood', '5315498227');
insert into CLIENT (clientid, clientname, phone)
values ('175', 'Emily', '5673289543');
insert into CLIENT (clientid, clientname, phone)
values ('176', 'Viggo', '3523863969');
insert into CLIENT (clientid, clientname, phone)
values ('177', 'Kelly', '7956354931');
insert into CLIENT (clientid, clientname, phone)
values ('178', 'Lionel', '1451874549');
insert into CLIENT (clientid, clientname, phone)
values ('179', 'Nikka', '2585965716');
insert into CLIENT (clientid, clientname, phone)
values ('180', 'Debbie', '3898682549');
insert into CLIENT (clientid, clientname, phone)
values ('181', 'Ronny', '4864141141');
insert into CLIENT (clientid, clientname, phone)
values ('182', 'Nils', '2184917772');
insert into CLIENT (clientid, clientname, phone)
values ('183', 'Nickel', '5766563277');
insert into CLIENT (clientid, clientname, phone)
values ('184', 'Jeff', '5986739252');
insert into CLIENT (clientid, clientname, phone)
values ('185', 'Rufus', '1888645453');
insert into CLIENT (clientid, clientname, phone)
values ('186', 'Daryl', '3887268294');
insert into CLIENT (clientid, clientname, phone)
values ('187', 'Salma', '1416862179');
insert into CLIENT (clientid, clientname, phone)
values ('188', 'Timothy', '9586635353');
insert into CLIENT (clientid, clientname, phone)
values ('189', 'Alan', '6846888694');
insert into CLIENT (clientid, clientname, phone)
values ('190', 'Lenny', '1322132393');
insert into CLIENT (clientid, clientname, phone)
values ('191', 'Bonnie', '6145359967');
insert into CLIENT (clientid, clientname, phone)
values ('192', 'Allison', '1658525953');
insert into CLIENT (clientid, clientname, phone)
values ('193', 'Desmond', '7333318475');
insert into CLIENT (clientid, clientname, phone)
values ('194', 'Julianne', '4392298952');
insert into CLIENT (clientid, clientname, phone)
values ('195', 'Crystal', '9618113187');
insert into CLIENT (clientid, clientname, phone)
values ('196', 'Natacha', '6862385447');
insert into CLIENT (clientid, clientname, phone)
values ('197', 'Freddie', '5399445349');
insert into CLIENT (clientid, clientname, phone)
values ('198', 'Derek', '5172494681');
insert into CLIENT (clientid, clientname, phone)
values ('199', 'Ozzy', '4793475811');
insert into CLIENT (clientid, clientname, phone)
values ('200', 'Neil', '5154426729');
insert into CLIENT (clientid, clientname, phone)
values ('201', 'Richie', '9863551399');
insert into CLIENT (clientid, clientname, phone)
values ('202', 'Manu', '1455377279');
insert into CLIENT (clientid, clientname, phone)
values ('203', 'Bobbi', '4138514689');
insert into CLIENT (clientid, clientname, phone)
values ('204', 'Mickey', '9441943663');
insert into CLIENT (clientid, clientname, phone)
values ('205', 'Red', '6815781782');
insert into CLIENT (clientid, clientname, phone)
values ('206', 'Anita', '4816264849');
commit;
prompt 200 records committed...
insert into CLIENT (clientid, clientname, phone)
values ('207', 'Cherry', '9849756568');
insert into CLIENT (clientid, clientname, phone)
values ('208', 'Joaquin', '9157786757');
insert into CLIENT (clientid, clientname, phone)
values ('209', 'Goldie', '9742647628');
insert into CLIENT (clientid, clientname, phone)
values ('210', 'Machine', '7732987579');
insert into CLIENT (clientid, clientname, phone)
values ('211', 'Juliet', '9486741337');
insert into CLIENT (clientid, clientname, phone)
values ('212', 'Willem', '1327728799');
insert into CLIENT (clientid, clientname, phone)
values ('213', 'Pat', '5272384725');
insert into CLIENT (clientid, clientname, phone)
values ('214', 'Luke', '4992734354');
insert into CLIENT (clientid, clientname, phone)
values ('215', 'Connie', '3416565562');
insert into CLIENT (clientid, clientname, phone)
values ('216', 'Clarence', '5125468112');
insert into CLIENT (clientid, clientname, phone)
values ('217', 'Harris', '8573822188');
insert into CLIENT (clientid, clientname, phone)
values ('218', 'Geoff', '6135139693');
insert into CLIENT (clientid, clientname, phone)
values ('219', 'Randy', '1515877945');
insert into CLIENT (clientid, clientname, phone)
values ('546765043', 'tt', '65342235');
commit;
prompt 214 records loaded
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
prompt Loading SUPPLIER_...
insert into SUPPLIER_ (supplierid, suppliername, area)
values (12345, 'debi', 'north');
insert into SUPPLIER_ (supplierid, suppliername, area)
values (12365, 'chani', 'south');
insert into SUPPLIER_ (supplierid, suppliername, area)
values (14565, 'yael', 'south');
insert into SUPPLIER_ (supplierid, suppliername, area)
values (89065, 'meir', 'gushdDan');
insert into SUPPLIER_ (supplierid, suppliername, area)
values (12395, 'chavi', 'jerusalem');
insert into SUPPLIER_ (supplierid, suppliername, area)
values (87655, 'dasi', 'gushdDan');
insert into SUPPLIER_ (supplierid, suppliername, area)
values (89365, 'riki', 'north');
insert into SUPPLIER_ (supplierid, suppliername, area)
values (23565, 'eti', 'south');
insert into SUPPLIER_ (supplierid, suppliername, area)
values (19475, 'talia', 'jerusalem');
insert into SUPPLIER_ (supplierid, suppliername, area)
values (15365, 'noa', 'gushdDan');
commit;
prompt 10 records loaded
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
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (925483, 1, to_date('19-06-2018', 'dd-mm-yyyy'), '34567821', 164, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7729242, 2, to_date('22-07-2020', 'dd-mm-yyyy'), '28208921', 148, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3088278, 3, to_date('20-07-2023', 'dd-mm-yyyy'), '21437821', 78, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4058395, 4, to_date('04-01-2005', 'dd-mm-yyyy'), '21837821', 7, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7510631, 25, to_date('14-09-2004', 'dd-mm-yyyy'), '28920218', 26, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (808891, 26, to_date('04-06-2003', 'dd-mm-yyyy'), '2892028', 52, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3789223, 28, to_date('15-09-2022', 'dd-mm-yyyy'), '21437821', 30, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1403364, 29, to_date('21-05-2021', 'dd-mm-yyyy'), '34567821', 14, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (733614, 30, to_date('14-04-2023', 'dd-mm-yyyy'), '21482021', 35, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3092483, 31, to_date('02-12-2010', 'dd-mm-yyyy'), '34567821', 110, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9011314, 32, to_date('06-05-2018', 'dd-mm-yyyy'), '2892028', 30, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (440513, 33, to_date('31-10-2010', 'dd-mm-yyyy'), '34567821', 97, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4045956, 34, to_date('26-05-2010', 'dd-mm-yyyy'), '21482021', 122, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (752614, 35, to_date('26-12-2023', 'dd-mm-yyyy'), '21437821', 93, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5897997, 36, to_date('27-09-2007', 'dd-mm-yyyy'), '21837821', 199, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (58712, 37, to_date('05-11-2021', 'dd-mm-yyyy'), '21837821', 104, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (651911, 39, to_date('29-09-2002', 'dd-mm-yyyy'), '21437821', 93, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7949636, 40, to_date('19-07-2004', 'dd-mm-yyyy'), '56787821', 71, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7288155, 41, to_date('15-08-2015', 'dd-mm-yyyy'), '21482021', 174, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9750932, 43, to_date('08-11-2006', 'dd-mm-yyyy'), '21437821', 98, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1916000, 45, to_date('23-08-2001', 'dd-mm-yyyy'), '21837821', 93, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1180297, 46, to_date('29-06-2007', 'dd-mm-yyyy'), '28208921', 167, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7930466, 47, to_date('15-11-2003', 'dd-mm-yyyy'), '21437821', 134, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4599656, 48, to_date('14-04-2019', 'dd-mm-yyyy'), '21837821', 42, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (271743, 49, to_date('11-05-2026', 'dd-mm-yyyy'), '2892028', 65, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (6126702, 50, to_date('27-01-2011', 'dd-mm-yyyy'), '21837821', 68, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2895159, 51, to_date('11-07-2021', 'dd-mm-yyyy'), '56787821', 131, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5633516, 52, to_date('27-11-2008', 'dd-mm-yyyy'), '21437821', 140, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9363453, 54, to_date('14-06-2007', 'dd-mm-yyyy'), '28920218', 4, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (8290798, 55, to_date('10-05-2019', 'dd-mm-yyyy'), '21482021', 29, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4829218, 56, to_date('28-08-2001', 'dd-mm-yyyy'), '28920218', 174, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (6171004, 57, to_date('20-06-2025', 'dd-mm-yyyy'), '28208921', 104, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5360663, 58, to_date('18-09-2005', 'dd-mm-yyyy'), '21482021', 117, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5776229, 59, to_date('24-10-2006', 'dd-mm-yyyy'), '56787821', 119, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3197057, 61, to_date('17-07-2010', 'dd-mm-yyyy'), '2892028', 46, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (792236, 62, to_date('29-01-2020', 'dd-mm-yyyy'), '28208921', 64, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2020865, 63, to_date('09-12-2016', 'dd-mm-yyyy'), '21482021', 142, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (6998151, 64, to_date('13-02-2005', 'dd-mm-yyyy'), '56787821', 120, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (8499867, 65, to_date('22-01-2015', 'dd-mm-yyyy'), '21482021', 155, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9627741, 66, to_date('25-03-2022', 'dd-mm-yyyy'), '34567821', 96, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4728437, 67, to_date('01-02-2001', 'dd-mm-yyyy'), '21437821', 152, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4197290, 68, to_date('19-03-2018', 'dd-mm-yyyy'), '21482021', 47, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2835193, 69, to_date('01-11-2021', 'dd-mm-yyyy'), '28208921', 102, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1237383, 70, to_date('26-11-2019', 'dd-mm-yyyy'), '34567821', 154, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9445155, 71, to_date('11-10-2000', 'dd-mm-yyyy'), '21437821', 124, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2299977, 72, to_date('27-12-2006', 'dd-mm-yyyy'), '21437821', 57, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9198265, 73, to_date('30-05-2007', 'dd-mm-yyyy'), '21437821', 131, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9712235, 74, to_date('06-12-2002', 'dd-mm-yyyy'), '21482021', 185, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5613672, 75, to_date('09-06-2025', 'dd-mm-yyyy'), '56787821', 131, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9436867, 76, to_date('06-06-2007', 'dd-mm-yyyy'), '56787821', 137, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5334866, 77, to_date('28-11-2026', 'dd-mm-yyyy'), '56787821', 184, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (6836748, 78, to_date('25-10-2020', 'dd-mm-yyyy'), '34567821', 16, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5080018, 79, to_date('16-10-2015', 'dd-mm-yyyy'), '28920218', 61, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9567299, 80, to_date('19-07-2011', 'dd-mm-yyyy'), '21437821', 101, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5085120, 81, to_date('27-09-2007', 'dd-mm-yyyy'), '21437821', 184, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (8351730, 82, to_date('02-02-2009', 'dd-mm-yyyy'), '21437821', 179, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9087950, 83, to_date('07-05-2024', 'dd-mm-yyyy'), '21837821', 118, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (8161815, 84, to_date('28-05-2015', 'dd-mm-yyyy'), '34567821', 58, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4582153, 85, to_date('02-11-2013', 'dd-mm-yyyy'), '34567821', 35, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7455373, 86, to_date('25-05-2010', 'dd-mm-yyyy'), '27837821', 22, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (8798359, 87, to_date('26-06-2011', 'dd-mm-yyyy'), '21482021', 134, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4731126, 88, to_date('25-07-2024', 'dd-mm-yyyy'), '21482021', 199, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1272285, 89, to_date('04-01-2008', 'dd-mm-yyyy'), '27837821', 91, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7883371, 90, to_date('17-11-2011', 'dd-mm-yyyy'), '2892028', 175, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2173722, 91, to_date('14-01-2006', 'dd-mm-yyyy'), '21437821', 72, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3055608, 92, to_date('15-04-2005', 'dd-mm-yyyy'), '27837821', 27, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5598241, 93, to_date('08-05-2019', 'dd-mm-yyyy'), '21437821', 59, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4891860, 94, to_date('23-03-2011', 'dd-mm-yyyy'), '21482021', 196, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4091619, 95, to_date('18-08-2026', 'dd-mm-yyyy'), '27837821', 78, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3040476, 96, to_date('12-05-2015', 'dd-mm-yyyy'), '21837821', 152, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4674559, 97, to_date('03-11-2005', 'dd-mm-yyyy'), '56787821', 200, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3861676, 98, to_date('17-07-2018', 'dd-mm-yyyy'), '21837821', 190, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1417384, 99, to_date('11-05-2021', 'dd-mm-yyyy'), '28920218', 90, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2759729, 100, to_date('01-09-2005', 'dd-mm-yyyy'), '2892028', 85, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3793004, 101, to_date('14-02-2023', 'dd-mm-yyyy'), '28920218', 181, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3417580, 102, to_date('29-05-2025', 'dd-mm-yyyy'), '21437821', 187, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2529439, 103, to_date('05-08-2025', 'dd-mm-yyyy'), '21482021', 23, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7493978, 104, to_date('17-06-2001', 'dd-mm-yyyy'), '21437821', 97, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (8707616, 105, to_date('21-07-2003', 'dd-mm-yyyy'), '27837821', 105, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (108751, 106, to_date('25-06-2005', 'dd-mm-yyyy'), '21437821', 56, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4482610, 110, to_date('25-12-2018', 'dd-mm-yyyy'), '27837821', 118, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9431495, 111, to_date('29-08-2002', 'dd-mm-yyyy'), '21482021', 176, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3445522, 115, to_date('22-05-2023', 'dd-mm-yyyy'), '56787821', 94, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2932311, 116, to_date('16-07-2020', 'dd-mm-yyyy'), '27837821', 169, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (8526123, 117, to_date('21-09-2021', 'dd-mm-yyyy'), '21482021', 142, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3626498, 118, to_date('17-01-2003', 'dd-mm-yyyy'), '27837821', 123, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3116796, 119, to_date('30-07-2014', 'dd-mm-yyyy'), '28208921', 1, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9929146, 120, to_date('27-04-2024', 'dd-mm-yyyy'), '2892028', 102, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9593470, 121, to_date('13-10-2007', 'dd-mm-yyyy'), '27837821', 140, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4335602, 122, to_date('23-09-2024', 'dd-mm-yyyy'), '28208921', 57, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9450919, 123, to_date('04-04-2023', 'dd-mm-yyyy'), '27837821', 143, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (6334806, 124, to_date('27-06-2015', 'dd-mm-yyyy'), '27837821', 79, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (796068, 126, to_date('18-06-2007', 'dd-mm-yyyy'), '28208921', 118, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2034597, 127, to_date('19-01-2022', 'dd-mm-yyyy'), '21437821', 6, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (332617, 128, to_date('18-03-2016', 'dd-mm-yyyy'), '56787821', 17, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (6103662, 129, to_date('13-12-2004', 'dd-mm-yyyy'), '27837821', 30, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5549036, 130, to_date('17-06-2007', 'dd-mm-yyyy'), '28208921', 79, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9792768, 131, to_date('25-05-2023', 'dd-mm-yyyy'), '21482021', 121, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7750837, 132, to_date('04-11-2018', 'dd-mm-yyyy'), '2892028', 182, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (8823004, 133, to_date('03-01-2026', 'dd-mm-yyyy'), '27837821', 163, 9);
commit;
prompt 100 records committed...
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7219292, 134, to_date('06-11-2002', 'dd-mm-yyyy'), '34567821', 115, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (772855, 136, to_date('08-05-2012', 'dd-mm-yyyy'), '28920218', 170, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7982304, 137, to_date('31-05-2004', 'dd-mm-yyyy'), '21482021', 89, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1327349, 138, to_date('16-09-2017', 'dd-mm-yyyy'), '56787821', 53, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3881911, 139, to_date('04-02-2008', 'dd-mm-yyyy'), '56787821', 21, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3780990, 140, to_date('26-06-2000', 'dd-mm-yyyy'), '27837821', 138, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (526171, 141, to_date('17-09-2006', 'dd-mm-yyyy'), '21437821', 97, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2908328, 142, to_date('28-06-2000', 'dd-mm-yyyy'), '21437821', 125, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5330985, 143, to_date('24-10-2015', 'dd-mm-yyyy'), '56787821', 52, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3242937, 144, to_date('13-06-2004', 'dd-mm-yyyy'), '21837821', 179, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7379570, 145, to_date('07-08-2024', 'dd-mm-yyyy'), '21482021', 3, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2656816, 146, to_date('07-01-2020', 'dd-mm-yyyy'), '56787821', 146, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (6652874, 147, to_date('01-09-2023', 'dd-mm-yyyy'), '21437821', 103, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9653911, 149, to_date('17-07-2016', 'dd-mm-yyyy'), '27837821', 27, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (815070, 150, to_date('21-01-2026', 'dd-mm-yyyy'), '56787821', 47, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2113173, 151, to_date('10-06-2007', 'dd-mm-yyyy'), '21482021', 44, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5924247, 152, to_date('10-01-2008', 'dd-mm-yyyy'), '56787821', 94, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5524474, 154, to_date('12-02-2021', 'dd-mm-yyyy'), '21837821', 164, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3072828, 155, to_date('20-04-2017', 'dd-mm-yyyy'), '34567821', 190, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5673620, 156, to_date('04-07-2010', 'dd-mm-yyyy'), '2892028', 14, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1383710, 157, to_date('15-12-2005', 'dd-mm-yyyy'), '56787821', 140, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4858907, 158, to_date('18-12-2011', 'dd-mm-yyyy'), '21482021', 137, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (741816, 159, to_date('12-04-2024', 'dd-mm-yyyy'), '21482021', 47, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5057572, 160, to_date('24-04-2019', 'dd-mm-yyyy'), '21482021', 22, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4257829, 162, to_date('09-01-2007', 'dd-mm-yyyy'), '56787821', 101, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5152743, 163, to_date('22-09-2012', 'dd-mm-yyyy'), '34567821', 7, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7938530, 164, to_date('14-10-2016', 'dd-mm-yyyy'), '21437821', 46, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7677661, 165, to_date('07-12-2011', 'dd-mm-yyyy'), '27837821', 172, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3579134, 166, to_date('03-09-2008', 'dd-mm-yyyy'), '27837821', 135, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3949717, 167, to_date('07-04-2016', 'dd-mm-yyyy'), '21837821', 184, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (8894718, 169, to_date('25-05-2003', 'dd-mm-yyyy'), '28920218', 138, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (489612, 170, to_date('22-01-2010', 'dd-mm-yyyy'), '34567821', 150, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (242430, 171, to_date('14-07-2017', 'dd-mm-yyyy'), '27837821', 17, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1489576, 172, to_date('15-05-2009', 'dd-mm-yyyy'), '21482021', 26, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (216497, 173, to_date('29-01-2010', 'dd-mm-yyyy'), '28208921', 17, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2104228, 176, to_date('16-02-2024', 'dd-mm-yyyy'), '28208921', 74, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7747578, 178, to_date('29-10-2008', 'dd-mm-yyyy'), '56787821', 183, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7729953, 180, to_date('28-11-2017', 'dd-mm-yyyy'), '34567821', 10, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3117487, 181, to_date('20-11-2024', 'dd-mm-yyyy'), '2892028', 147, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3593119, 182, to_date('23-01-2007', 'dd-mm-yyyy'), '56787821', 87, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2589151, 183, to_date('03-08-2004', 'dd-mm-yyyy'), '21437821', 69, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7760822, 184, to_date('06-02-2022', 'dd-mm-yyyy'), '34567821', 152, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1918575, 185, to_date('28-05-2018', 'dd-mm-yyyy'), '28208921', 170, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1669843, 186, to_date('04-02-2012', 'dd-mm-yyyy'), '2892028', 82, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5870643, 187, to_date('27-12-2000', 'dd-mm-yyyy'), '21482021', 2, 10);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5012138, 188, to_date('18-01-2019', 'dd-mm-yyyy'), '56787821', 62, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7126151, 189, to_date('11-03-2012', 'dd-mm-yyyy'), '56787821', 44, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (6685067, 190, to_date('31-10-2019', 'dd-mm-yyyy'), '34567821', 10, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (8638214, 191, to_date('13-07-2012', 'dd-mm-yyyy'), '21837821', 177, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7348323, 192, to_date('28-07-2009', 'dd-mm-yyyy'), '27837821', 128, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4953461, 193, to_date('02-12-2014', 'dd-mm-yyyy'), '28208921', 172, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (5843877, 194, to_date('21-08-2002', 'dd-mm-yyyy'), '2892028', 141, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2758243, 196, to_date('26-01-2019', 'dd-mm-yyyy'), '28208921', 161, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9135947, 197, to_date('23-10-2026', 'dd-mm-yyyy'), '2892028', 48, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4729511, 198, to_date('07-10-2020', 'dd-mm-yyyy'), '28208921', 86, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (4525396, 199, to_date('25-02-2019', 'dd-mm-yyyy'), '27837821', 198, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (8345808, 200, to_date('07-06-2021', 'dd-mm-yyyy'), '28920218', 191, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3272226, 202, to_date('09-01-2011', 'dd-mm-yyyy'), '34567821', 130, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3652098, 203, to_date('24-06-2017', 'dd-mm-yyyy'), '21437821', 113, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (6206463, 204, to_date('15-12-2009', 'dd-mm-yyyy'), '28920218', 62, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3180270, 205, to_date('16-05-2000', 'dd-mm-yyyy'), '27837821', 8, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1024511, 206, to_date('08-01-2025', 'dd-mm-yyyy'), '21837821', 39, 9);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (10900, 230, to_date('16-07-2024', 'dd-mm-yyyy'), '23', 5, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1655982, 208, to_date('24-12-2018', 'dd-mm-yyyy'), '34567821', 126, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (6181505, 209, to_date('20-04-2000', 'dd-mm-yyyy'), '34567821', 149, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3461687, 210, to_date('27-04-2022', 'dd-mm-yyyy'), '27837821', 16, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7369311, 211, to_date('11-10-2014', 'dd-mm-yyyy'), '28208921', 11, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1782314, 212, to_date('27-11-2014', 'dd-mm-yyyy'), '28920218', 126, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (1210428, 213, to_date('05-05-2020', 'dd-mm-yyyy'), '2892028', 159, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (3526891, 214, to_date('29-04-2004', 'dd-mm-yyyy'), '21437821', 182, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2395, 215, to_date('16-05-2020', 'dd-mm-yyyy'), '27837821', 17, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (89900, 217, to_date('16-07-2020', 'dd-mm-yyyy'), '27837821', 12, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (70050, 218, to_date('16-06-2020', 'dd-mm-yyyy'), '27837821', 20, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (50000, 219, to_date('17-04-2020', 'dd-mm-yyyy'), '27837821', 161, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (90000, 220, to_date('14-05-2020', 'dd-mm-yyyy'), '27837821', 141, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (80000, 221, to_date('16-08-2020', 'dd-mm-yyyy'), '27837821', 26, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (2699, 229, to_date('13-05-2020', 'dd-mm-yyyy'), '27837821', 17, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (10090, 231, to_date('16-07-2024', 'dd-mm-yyyy'), '21', 3, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (20900, 232, to_date('16-07-2024', 'dd-mm-yyyy'), '22', 4, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (15000, 233, to_date('16-07-2024 16:42:23', 'dd-mm-yyyy hh24:mi:ss'), '22', 2, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (16300, 234, to_date('17-07-2024 11:55:43', 'dd-mm-yyyy hh24:mi:ss'), '135', 100, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (14500, 235, to_date('17-07-2024 11:55:46', 'dd-mm-yyyy hh24:mi:ss'), '172', 171, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (12000, 236, to_date('17-07-2024 11:55:49', 'dd-mm-yyyy hh24:mi:ss'), '49', 4, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7900, 237, to_date('17-07-2024 11:55:55', 'dd-mm-yyyy hh24:mi:ss'), '177', 197, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (12700, 238, to_date('17-07-2024 11:55:56', 'dd-mm-yyyy hh24:mi:ss'), '31', 117, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (13800, 239, to_date('17-07-2024 12:28:20', 'dd-mm-yyyy hh24:mi:ss'), '81', 136, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (7700, 240, to_date('17-07-2024 12:28:21', 'dd-mm-yyyy hh24:mi:ss'), '68', 155, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (13700, 241, to_date('17-07-2024 12:28:22', 'dd-mm-yyyy hh24:mi:ss'), '82', 192, 1);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (12400, 242, to_date('17-07-2024 12:28:23', 'dd-mm-yyyy hh24:mi:ss'), '20', 32, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (9900, 243, to_date('17-07-2024 12:28:24', 'dd-mm-yyyy hh24:mi:ss'), '28', 14, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (13000, 244, to_date('17-07-2024 12:39:07', 'dd-mm-yyyy hh24:mi:ss'), '157', 93, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (13200, 245, to_date('17-07-2024 12:39:12', 'dd-mm-yyyy hh24:mi:ss'), '181', 73, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (11000, 246, to_date('17-07-2024 12:39:18', 'dd-mm-yyyy hh24:mi:ss'), '157', 93, 2);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (16400, 247, to_date('17-07-2024 12:39:23', 'dd-mm-yyyy hh24:mi:ss'), '182', 64, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (13100, 248, to_date('17-07-2024 12:39:25', 'dd-mm-yyyy hh24:mi:ss'), '55', 185, 4);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (11700, 249, to_date('17-07-2024 12:43:28', 'dd-mm-yyyy hh24:mi:ss'), '115', 15, 6);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (16500, 250, to_date('17-07-2024 12:43:30', 'dd-mm-yyyy hh24:mi:ss'), '154', 166, 7);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (15300, 251, to_date('17-07-2024 12:43:37', 'dd-mm-yyyy hh24:mi:ss'), '105', 188, 8);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (8000, 252, to_date('17-07-2024 12:43:39', 'dd-mm-yyyy hh24:mi:ss'), '218', 157, 3);
insert into INVITATION (finalprice, invitationid, datte, clientid, designerid, packageid)
values (14400, 253, to_date('17-07-2024 12:43:42', 'dd-mm-yyyy hh24:mi:ss'), '43', 95, 9);
commit;
prompt 200 records loaded
prompt Enabling foreign key constraints for CONTAINING...
alter table CONTAINING enable constraint SYS_C007141;
alter table CONTAINING enable constraint SYS_C007142;
prompt Enabling foreign key constraints for INSTOCK...
alter table INSTOCK enable constraint SYS_C007135;
alter table INSTOCK enable constraint SYS_C007136;
prompt Enabling foreign key constraints for INVITATION...
alter table INVITATION enable constraint SYS_C007149;
alter table INVITATION enable constraint SYS_C007150;
alter table INVITATION enable constraint SYS_C007151;
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
prompt Enabling triggers for SUPPLIER_...
alter table SUPPLIER_ enable all triggers;
prompt Enabling triggers for INSTOCK...
alter table INSTOCK enable all triggers;
prompt Enabling triggers for INVITATION...
alter table INVITATION enable all triggers;
set feedback on
set define on
prompt Done.
