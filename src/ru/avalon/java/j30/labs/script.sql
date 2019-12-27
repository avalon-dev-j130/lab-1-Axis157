/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */
create table "Order" (
    id integer,
    "user" integer,
    created timestamp,
    constraint order_id_pk primary key (id)
);

create table "User"(
    id integer generated always as identity,
    email varchar(255),
    password varchar(255),
    info integer,
    role integer,
    constraint user_email_pk primary key (email),
    constraint user_id_uq unique(id),
    constraint user_info_uq unique(info)
);

create table Roles(
    id integer generated always as identity,
    name varchar(255),
    constraint roles_name_pk primary key (name),
    constraint roles_id_uq unique (id)
);

create table Order2Product (
    order integer,
    product integer,
);

create table UserInfo (
    id integer,
    name varchar(255) not null,
    surname varchar(255) not null,
    constraint userinfo_id_pk primary key (id)
);

create table Product(
    id integer generated always as identity,
    code varchar(255),
    title varchar(255),
    supplier integer,
    initial_price double,
    retail_value double,
    constraint product_code_pk primary key (code),
    constraint product_id_uq unique (id)
);

create table Supplier (
    id integer generated always as identity,
    name varchar(255),
    address varchar(255) not null,
    phone varchar(255),
    representative varchar(255) not null,
    constraint supplier_name_pk primary key(name),
    constraint supplier_id_uq unique (id)
);