drop database if exists my_film_search;
create database my_film_search;
use my_film_search;

drop table if exists users;
create table users (
	id serial primary key,
	first_name varchar(255),
	last_name varchar(255),
	created_at datetime default now()
)comment = 'Список пользователей'
;

drop table if exists user_profiles;
create table user_profiles (
	user_id serial primary key,
	country_id bigint unsigned,
	city_id bigint unsigned,
	gender enum('m', 'f'),
	premium boolean,
	mail varchar(255)
)comment = 'Профили пользователей, информация о пользователях'
;

drop table if exists films;
create table films (
	id serial primary key,
	film_name varchar(255) not null,
	created_at datetime default now()
)comment = 'Список фильмов'
;

drop table if exists films_profiles;
create table films_profiles (
	film_id serial primary key,
	country_id bigint unsigned not null,
	worldwide_fees integer,
	russians_fees integer,
	date_premiere date not null,
	age_limit integer not null,
	duration integer not null,
	access_for_premium boolean not null
)comment = 'Информация о фильмах'
;

drop table if exists person;
create table person (
	id serial primary key,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	country_id bigint unsigned not null,
	city_id bigint unsigned not null,
	birthday date,
	created_at datetime default now()
)comment = 'Персоны  из киноидустрии'
;

drop table if exists film_rating;
create table film_rating (
	film_id bigint unsigned  not null,
	user_id bigint unsigned  not null,
	user_rate integer check(user_rate>0 and user_rate<=10), 
	created_at datetime default now()
)comment = 'Пользовательский рейтинг фильму'
;

drop table if exists reviews;
create table reviews (
	id serial primary key,
	film_id bigint unsigned  not null,
	user_id bigint unsigned  not null,
	heading varchar(255)  not null,
	body text  not null,
	type_riviews enum ('good', 'neutral', 'bad')  not null,
	created_at datetime default now()
)comment = 'Рецензии пользователей для фильма'
;


drop table if exists film_crew;
create table film_crew (
	id serial primary key,
	film_id bigint unsigned  not null,
	person_id bigint unsigned  not null,
	position_id bigint unsigned not null
)comment = 'Люди учавствующие в создании фильма'
;

drop table if exists positions;
create table positions (
	id serial primary key,
	position_name varchar(255)  not null
)comment = 'Список должностей при создании фильма'
;

drop table if exists media;
create table media (
	id serial primary key,
	target_id bigint unsigned  not null,
	target_type enum('films', 'persons'),
	media_type_id bigint unsigned  not null,
	created_at datetime default now()
)comment = 'Список всех медиафайлов'
;

drop table if exists media_type;
create table media_type (
	id serial primary key,
	type_name enum('film', 'trailer', 'photo'),
	created_at datetime default now()
)comment = 'Принадлежность медиа к конкретному типу'
;

drop table if exists country;
create table country (
	id serial primary key,
	country_name varchar(255)  not null
)comment = 'Список стран'
;

drop table if exists city;
create table city (
	id serial primary key,
	country_id bigint unsigned  not null,
	city_name varchar(255)  not null
)comment = 'Список городов'
;

drop table if exists history_changes;
create table history_changes (
	id serial primary key,
	table_name varchar(255)  not null,
	action_name varchar(255)  not null,
	responsible varchar(255)  not null,
	created_at datetime default now()
)comment = 'История изменений'
;




