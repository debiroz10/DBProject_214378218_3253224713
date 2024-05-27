prompt PL/SQL Developer import file
prompt Created on יום שני 27 מאי 2024 by IMOE001
set feedback off
set define off
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

prompt Disabling triggers for EQUIPMENT...
alter table EQUIPMENT disable all triggers;
prompt Deleting EQUIPMENT...
delete from EQUIPMENT;
commit;
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
prompt Enabling triggers for EQUIPMENT...
alter table EQUIPMENT enable all triggers;
set feedback on
set define on
prompt Done.
