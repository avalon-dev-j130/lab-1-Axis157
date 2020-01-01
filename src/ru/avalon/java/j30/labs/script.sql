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
insert into "Order"(id, "user", created) values (1, 1, '2019-12-23 12:12:12');
insert into "Order"(id, "user", created) values (2, 2, '2019-12-23 12:15:12');
insert into "Order"(id, "user", created) values (3, 1, '2019-12-23 12:20:12');

create table "User"(
    id integer generated always as identity,
    email varchar(255),
    password varchar(255),
    info integer,
    "role" integer,
    constraint user_email_pk primary key (email),
    constraint user_id_uq unique(id),
    constraint user_info_uq unique(info)
);
insert into "User"(email, info, "role") values ('first@user.ru', 1,1);
insert into "User"(email, info, "role") values ('second@user.ru', 2,2);

create table Roles(
    id integer generated always as identity,
    name varchar(255),
    constraint roles_name_pk primary key (name),
    constraint roles_id_uq unique (id)
);
insert into Roles(name) values ('User');
insert into Roles(name) values ('Admin');

create table Order2Product (
    "order" integer,
    product integer
);
insert into Order2Product("order", product) values (1,1);
insert into Order2Product("order", product) values (2,1);
insert into Order2Product("order", product) values (3,2);

create table UserInfo (
    id integer,
    name varchar(255) not null,
    surname varchar(255) not null,
    constraint userinfo_id_pk primary key (id)
);
insert into UserInfo(id, name, surname) values (1, 'Жора', 'Жорский');
insert into UserInfo(id, name, surname) values (2, 'Жора', 'Мажорский');

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
insert into Product(code, title, supplier, initial_price) values ('prod1','title 1', 1, 300);
insert into Product(code, title, supplier, initial_price) values ('prod2','title 2', 1, 300);

create table Supplier (
    id integer generated always as identity,
    name varchar(255),
    address varchar(255) not null,
    phone varchar(255),
    representative varchar(255) not null,
    constraint supplier_name_pk primary key(name),
    constraint supplier_id_uq unique (id)
);
insert into Supplier(name, address, phone, representative) values ('Supp1','Address1','8-800-555-35-35','representative');

alter table "Order" add constraint order_user_fk foreign key("user") references "User"(id);

alter table "User" add constraint User_info_fk foreign key(info) references Userinfo(id);
alter table "User" add constraint User_role_fk foreign key("role") references Roles(id);

alter table Order2Product add constraint Order2Product_order_fk foreign key("order") references "Order"(id);
alter table Order2Product add constraint Order2Product_product_fk foreign key(product) references Product(id);

alter table Product add constraint Product_code_fk foreign key(supplier) references Supplier(id);