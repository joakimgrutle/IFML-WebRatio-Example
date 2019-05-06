-- Group [Group]
create table "APP"."GROUP_2" (
   "OID"  integer  not null,
   "GROUPNAME"  varchar(255),
  primary key ("OID")
);


-- Module [Module]
create table "APP"."MODULE_2" (
   "OID"  integer  not null,
   "MODULEID"  varchar(255),
   "MODULENAME"  varchar(255),
  primary key ("OID")
);


-- User [User]
create table "APP"."USER_2" (
   "OID"  integer  not null,
   "USERNAME"  varchar(255),
   "PASSWORD"  varchar(255),
   "EMAIL"  varchar(255),
  primary key ("OID")
);


-- Exhibit [ent1]
create table "APP"."EXHIBIT_2" (
   "OID"  integer  not null,
   "NAME"  varchar(255),
  primary key ("OID")
);


-- Vote [ent2]
create table "APP"."VOTE_2" (
   "OID"  integer  not null,
   "SCORE"  double,
   "USERID"  varchar(255),
  primary key ("OID")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "APP"."GROUP_2"  add column  "MODULE_2_OID"  integer;
alter table "APP"."GROUP_2"   add constraint FK_GROUP_2_MODULE_2 foreign key ("MODULE_2_OID") references "APP"."MODULE_2" ("OID");


-- Group_Module [Group2Module_Module2Group]
create table "APP"."GROUP_MODULE_2" (
   "GROUP_2_OID"  integer not null,
   "MODULE_2_OID"  integer not null,
  primary key ("GROUP_2_OID", "MODULE_2_OID")
);
alter table "APP"."GROUP_MODULE_2"   add constraint FK_GROUP_MODULE_2_GROUP_2 foreign key ("GROUP_2_OID") references "APP"."GROUP_2" ("OID");
alter table "APP"."GROUP_MODULE_2"   add constraint FK_GROUP_MODULE_2_MODULE_2 foreign key ("MODULE_2_OID") references "APP"."MODULE_2" ("OID");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "APP"."USER_2"  add column  "GROUP_2_OID"  integer;
alter table "APP"."USER_2"   add constraint FK_USER_2_GROUP_2 foreign key ("GROUP_2_OID") references "APP"."GROUP_2" ("OID");


-- User_Group [User2Group_Group2User]
create table "APP"."USER_GROUP_2" (
   "USER_2_OID"  integer not null,
   "GROUP_2_OID"  integer not null,
  primary key ("USER_2_OID", "GROUP_2_OID")
);
alter table "APP"."USER_GROUP_2"   add constraint FK_USER_GROUP_2_USER_2 foreign key ("USER_2_OID") references "APP"."USER_2" ("OID");
alter table "APP"."USER_GROUP_2"   add constraint FK_USER_GROUP_2_GROUP_2 foreign key ("GROUP_2_OID") references "APP"."GROUP_2" ("OID");


-- Vote_Exhibit [rel2]
create table "APP"."VOTE_EXHIBIT_2" (
   "VOTE_2_OID"  integer not null,
   "EXHIBIT_2_OID"  integer not null,
  primary key ("VOTE_2_OID", "EXHIBIT_2_OID")
);
alter table "APP"."VOTE_EXHIBIT_2"   add constraint FK_VOTE_EXHIBIT_2_VOTE_2 foreign key ("VOTE_2_OID") references "APP"."VOTE_2" ("OID");
alter table "APP"."VOTE_EXHIBIT_2"   add constraint FK_VOTE_EXHIBIT_2_EXHIBIT_2 foreign key ("EXHIBIT_2_OID") references "APP"."EXHIBIT_2" ("OID");


-- User_Exhibit [rel3]
create table "APP"."USER_EXHIBIT_2" (
   "USER_2_OID"  integer not null,
   "EXHIBIT_2_OID"  integer not null,
  primary key ("USER_2_OID", "EXHIBIT_2_OID")
);
alter table "APP"."USER_EXHIBIT_2"   add constraint FK_USER_EXHIBIT_2_USER_2 foreign key ("USER_2_OID") references "APP"."USER_2" ("OID");
alter table "APP"."USER_EXHIBIT_2"   add constraint FK_USER_EXHIBIT_2_EXHIBIT_2 foreign key ("EXHIBIT_2_OID") references "APP"."EXHIBIT_2" ("OID");


