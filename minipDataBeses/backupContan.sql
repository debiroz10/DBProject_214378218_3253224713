prompt PL/SQL Developer import file
prompt Created on יום שני 27 מאי 2024 by IMOE001
set feedback off
set define off
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

prompt Disabling triggers for CONTAINING...
alter table CONTAINING disable all triggers;
prompt Disabling foreign key constraints for CONTAINING...
alter table CONTAINING disable constraint SYS_C007141;
alter table CONTAINING disable constraint SYS_C007142;
prompt Deleting CONTAINING...
delete from CONTAINING;
commit;
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
prompt Enabling foreign key constraints for CONTAINING...
alter table CONTAINING enable constraint SYS_C007141;
alter table CONTAINING enable constraint SYS_C007142;
prompt Enabling triggers for CONTAINING...
alter table CONTAINING enable all triggers;
set feedback on
set define on
prompt Done.
