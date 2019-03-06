-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- schema.sql
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
create schema if not exists translator authorization dbadmin;

create table if not exists translator.engine (
  engine_id bigserial primary key,
  engine_name varchar(80) not null,
  updated_on date not null default now(),
  created_on date not null default now()
);

create table if not exists translator.user (
  user_id bigserial primary key,
  first_name varchar(80) not null,
  last_name varchar(80) not null,
  lang varchar(2) not null default 'en',
  updated_on date not null default now(),
  created_on date not null default now()
);

create table if not exists translator.room (
  room_id bigserial primary key,
  room_name varchar(80) not null unique,
  updated_on date not null default now(),
  created_on date not null default now()
);

create table if not exists translator.room_members (
  room_id integer references translator.room(room_id),
  user_id integer references translator.user(user_id),
  position integer not null default 0,
  updated_on date not null default now(),
  created_on date not null default now(),
  primary key (room_id, user_id)
);

create table if not exists translator.message (
  message_id bigserial primary key,
  room_id integer references translator.room(room_id),
  user_id integer references translator.user(user_id),
  message varchar (280) not null default '',
  updated_on date not null default now(),
  created_on date not null default now()
);

create table if not exists translator.message_translation (
  message_id integer references translator.message(message_id),
  engine_id integer references translator.engine(engine_id),
  lang varchar(2) not null,
  translation varchar (560) not null default '',
  updated_on date not null default now(),
  created_on date not null default now(),
  primary key (message_id, engine_id, lang)
);