prompt PL/SQL Developer import file
prompt Created on יום שני 27 מאי 2024 by IMOE001
set feedback off
set define off
prompt Creating DESIGNER...
create table DESIGNER
(
  designername VARCHAR2(15) not null,
  designerid   NUMBER(5) not null,
  payment      NUMBER(5) not null
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

prompt Disabling triggers for DESIGNER...
alter table DESIGNER disable all triggers;
prompt Deleting DESIGNER...
delete from DESIGNER;
commit;
prompt Loading DESIGNER...
insert into DESIGNER (designername, designerid, payment)
values (' Debbie', 1, 5000);
insert into DESIGNER (designername, designerid, payment)
values (' Daniel', 2, 8000);
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
prompt 200 records loaded
prompt Enabling triggers for DESIGNER...
alter table DESIGNER enable all triggers;
set feedback on
set define on
prompt Done.
