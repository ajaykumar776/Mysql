DROP DATABASE IF EXISTS blood_bank;
CREATE DATABASE blood_bank;

-- creating user table
create table users (
    id int auto_increment,
    name varchar(50),
    primary key (id)
);

-- inserting user informations
insert into users values (null,"Nazish");
insert into users values (null,"Danish");
insert into users values (null,"Aaqib");
insert into users values (null,"Shahnaj");

-- creating table hospital
create table hospitals (
    id int auto_increment,
    name varchar(50),
    primary key (id)
);

-- inserting hospital names
insert into hospitals values (null,"Appolo");
insert into hospitals values (null,"Jayadeva");
insert into hospitals values (null,"Colombia Asia");

-- creating table blood request
create table blood_request (
    id int auto_increment,
    user_id int,
    hospital_id int,
    blood_type varchar(10),
    quantity int comment "in ml",
    primary key(id)
);

-- insering blood request 
insert into blood_request values (null,1,1,"A+",500);
insert into blood_request values (null,1,2,"B+",400);
insert into blood_request values (null,1,3,"AB+",450);
insert into blood_request values (null,2,1,"AB+",350);
insert into blood_request values (null,2,2,"AB+",300);
insert into blood_request values (null,3,3,"AB+",250);
insert into blood_request values (null,4,3,"O+",600);
insert into blood_request values (null,4,2,"A+",500);
insert into blood_request values (null,3,3,"AB+",300);
insert into blood_request values (null,2,1,"B+",550);
insert into blood_request values (null,2,2,"AB+",450);
insert into blood_request values (null,1,2,"B+",650);
insert into blood_request values (null,4,2,"B+",350);
insert into blood_request values (null,2,3,"A+",150);
insert into blood_request values (null,1,2,"A+",350);
insert into blood_request values (null,3,3,"B",550);
insert into blood_request values (null,2,1,"B",650);
insert into blood_request values (null,3,3,"AB",750);
insert into blood_request values (null,3,1,"AB+",150);
insert into blood_request values (null,2,1,"O+",550);

-- creating table blood avaliaility
create table hospital_blood (
    id int auto_increment,
    hospital_id int,
    blood_type varchar(10),
    quantity int comment "in ml",
    primary key (id)
);

insert into hospital_blood values (null,1,"A+",300);
insert into hospital_blood values (null,1,"AB+",500);
insert into hospital_blood values (null,1,"B+",400);
insert into hospital_blood values (null,1,"A+",600);
insert into hospital_blood values (null,1,"AB+",800);
insert into hospital_blood values (null,2,"AB+",400);
insert into hospital_blood values (null,2,"B+",900);
insert into hospital_blood values (null,3,"A+",500);
insert into hospital_blood values (null,3,"AB+",450);
insert into hospital_blood values (null,3,"B+",700);
insert into hospital_blood values (null,1,"O+",750);
insert into hospital_blood values (null,2,"B+",400);
insert into hospital_blood values (null,2,"O+",500);
insert into hospital_blood values (null,1,"AB+",250);
insert into hospital_blood values (null,3,"O+",350);

-- total blood availability by hopital 
SELECT
    h.name,
    SUM(hb.quantity) AS total
FROM
    hospital_blood hb
LEFT JOIN
    hospitals h
ON
    hb.hospital_id = h.id
GROUP BY
    hb.hospital_id;

-- total blood type wise availability by hospitals
SELECT
    h.name,
    hb.blood_type,
    SUM(hb.quantity) AS total
FROM
    hospital_blood hb
LEFT JOIN
    hospitals h
ON
    hb.hospital_id = h.id
GROUP BY
    hb.hospital_id,
    hb.blood_type
    
-- blood type wise total request from user
SELECT
    blood_type,
    COUNT(*) AS COUNT
FROM
    blood_request
GROUP BY
    blood_type

-- user wise request count 
SELECT
    br.user_id,
    u.name,
    COUNT(*) AS COUNT
FROM
    blood_request br
LEFT JOIN
    users u
ON
    u.id = br.user_id
GROUP BY
    br.user_id
