prompt PL/SQL Developer import file
prompt Created on יום שני 27 מאי 2024 by IMOE001
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

prompt Disabling triggers for CLIENT...
alter table CLIENT disable all triggers;
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
commit;
prompt 213 records loaded
prompt Enabling triggers for CLIENT...
alter table CLIENT enable all triggers;
set feedback on
set define on
prompt Done.
