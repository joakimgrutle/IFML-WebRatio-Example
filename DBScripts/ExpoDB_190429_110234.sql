-- Group [Group]
create table "APP"."GROUP" (
   "OID"  integer  not null,
   "GROUPNAME"  varchar(255),
  primary key ("OID")
);


-- User [User]
create table "APP"."USER" (
   "OID"  integer  not null,
   "EMAIL"  varchar(255),
   "PASSWORD"  varchar(255),
   "USERNAME"  varchar(255),
  primary key ("OID")
);


-- Exhibit [ent1]
create table "APP"."EXHIBIT" (
   "OID"  integer  not null,
   "NAME"  varchar(255),
  primary key ("OID")
);


-- Vote [ent2]
create table "APP"."VOTE" (
   "OID"  integer  not null,
   "SCORE"  double,
  primary key ("OID")
);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "APP"."USER"   add constraint FK_USER_GROUP foreign key () references "APP"."GROUP" ();
create index "IDX_USER_GROUP" on "APP"."USER"();


-- User_Group [User2Group_Group2User]
create table "APP"."USER_GROUP" (
  primary key ()
);
alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_USER foreign key () references "APP"."USER" ();
alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_GROUP foreign key () references "APP"."GROUP" ();
create index "IDX_USER_GROUP_USER" on "APP"."USER_GROUP"();
create index "IDX_USER_GROUP_GROUP" on "APP"."USER_GROUP"();


-- Vote_Exhibit [rel2]
create table "APP"."VOTE_EXHIBIT" (
   "VOTE_OID"  integer not null,
   "EXHIBIT_OID"  integer not null,
  primary key ("VOTE_OID", "EXHIBIT_OID")
);
alter table "APP"."VOTE_EXHIBIT"   add constraint FK_VOTE_EXHIBIT_VOTE foreign key ("VOTE_OID") references "APP"."VOTE" ("OID");
alter table "APP"."VOTE_EXHIBIT"   add constraint FK_VOTE_EXHIBIT_EXHIBIT foreign key ("EXHIBIT_OID") references "APP"."EXHIBIT" ("OID");
create index "IDX_VOTE_EXHIBIT_VOTE" on "APP"."VOTE_EXHIBIT"("VOTE_OID");
create index "IDX_VOTE_EXHIBIT_EXHIBIT" on "APP"."VOTE_EXHIBIT"("EXHIBIT_OID");


