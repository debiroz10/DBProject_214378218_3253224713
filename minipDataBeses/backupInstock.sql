prompt PL/SQL Developer import file
prompt Created on יום שני 27 מאי 2024 by IMOE001
set feedback off
set define off
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

prompt Disabling triggers for INSTOCK...
alter table INSTOCK disable all triggers;
prompt Disabling foreign key constraints for INSTOCK...
alter table INSTOCK disable constraint SYS_C007135;
alter table INSTOCK disable constraint SYS_C007136;
prompt Deleting INSTOCK...
delete from INSTOCK;
commit;
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
prompt Enabling foreign key constraints for INSTOCK...
alter table INSTOCK enable constraint SYS_C007135;
alter table INSTOCK enable constraint SYS_C007136;
prompt Enabling triggers for INSTOCK...
alter table INSTOCK enable all triggers;
set feedback on
set define on
prompt Done.
