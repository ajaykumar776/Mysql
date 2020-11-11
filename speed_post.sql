Drop DATABASE IF EXISTS speed_post;

CREATE DATABASE speed_post;

USE speed_post;

CREATE TABLE users
(
	id int auto_increment,
	name varchar(20),
	primary key (id)
);

INSERT INTO users VALUES (null,"Aaqib"),(null,"Nazish");

-- select * from users;
CREATE TABLE docate
(
	id int auto_increment,
	user_id int,
	from_address varchar(50),
	to_address varchar(50),
	city varchar(20),
	state varchar(20),
	pincode int,
	weight int comment "in grms",
	price int comment "in RS",
	status varchar(50) default "CREATED",
	submission_date date,
	expected_date date,
	primary key(id)
);

INSERT INTO docate VALUES (null,1,"Bangalore","shah muhalla","Daltonganj","Jharkhand",822101,150,220,"DELIEVERED","2020-03-17","2020-03-23");
INSERT INTO docate VALUES (null,1,"Bangalore","near bus depo","Patna","Jharkhand",822101,120,200,"DELIEVERED","2020-03-18","2020-03-22");
INSERT INTO docate VALUES (null,1,"Bangalore","sobha market","Garhwa","Jharkhand",822101,100,150,"TO_HUB_REACHED","2020-03-18","2020-03-15");
INSERT INTO docate VALUES (null,1,"Bangalore","sabjii market","kochi","kerela",822121,90,500,"BOOKED","2020-03-19","2020-03-25");
INSERT INTO docate VALUES (null,1,"Bangalore","pani muhalla","simdega","xyz",822123,80,620,"BOOKED","2020-03-20","2020-03-22");
INSERT INTO docate VALUES (null,1,"Bangalore","near shop","namudag","manika",822132,70,920,"FROM_HUB_REACHED","2020-03-21","2020-03-22");

INSERT INTO docate VALUES (null,2,"Bangalore","near everest","heaven","Jammu",821111,50,5000,"CREATED","2020-03-17","2020-03-22");
INSERT INTO docate VALUES (null,2,"Bangalore","hsthtgsg","acdce","Maharashtra",823454,500,3000,"DELIEVERED","2020-03-18","2020-03-26");
INSERT INTO docate VALUES (null,2,"Bangalore","grergeg","rsvd","M.P",821345,150,2000,"TO_HUB_REACHED","2020-03-19","2020-03-29");
INSERT INTO docate VALUES (null,2,"Bangalore","rgegsrser","vrgezr","U.P",829875,350,1000,"CREATED","2020-03-20","2020-03-30");

-- select * from docate;

CREATE TABLE tracker
(
	id int auto_increment,
	docate_id int,
	status varchar(50),
	created_date date,
	primary key(id)
);

INSERT INTO tracker VALUES (null,1,"CREATED","2020-03-17");
INSERT INTO tracker VALUES (null,1,"FROM_HUB_REACHED","2020-03-17");
INSERT INTO tracker VALUES (null,1,"BOOKED","2020-03-17");
INSERT INTO tracker VALUES (null,1,"TO_HUB_REACHED","2020-03-22");
INSERT INTO tracker VALUES (null,1,"OUT_FOR_DELIEVERY","2020-03-23");
INSERT INTO tracker VALUES (null,1,"DELIEVERED","2020-03-25");

INSERT INTO tracker VALUES (null,2,"CREATED","2020-03-18");
INSERT INTO tracker VALUES (null,2,"FROM_HUB_REACHED","2020-03-18");
INSERT INTO tracker VALUES (null,2,"BOOKED","2020-03-19");
INSERT INTO tracker VALUES (null,2,"TO_HUB_REACHED","2020-03-21");
INSERT INTO tracker VALUES (null,2,"OUT_FOR_DELIEVERY","2020-03-22");
INSERT INTO tracker VALUES (null,2,"DELIEVERED","2020-03-22");

INSERT INTO tracker VALUES (null,3,"CREATED","2020-03-18");
INSERT INTO tracker VALUES (null,3,"FROM_HUB_REACHED","2020-03-18");
INSERT INTO tracker VALUES (null,3,"BOOKED","2020-03-18");
INSERT INTO tracker VALUES (null,3,"TO_HUB_REACHED","2020-03-21");

INSERT INTO tracker VALUES (null,4,"CREATED","2020-03-19");
INSERT INTO tracker VALUES (null,4,"FROM_HUB_REACHED","2020-03-19");
INSERT INTO tracker VALUES (null,4,"BOOKED","2020-03-19");

INSERT INTO tracker VALUES (null,5,"CREATED","2020-03-20");
INSERT INTO tracker VALUES (null,5,"FROM_HUB_REACHED","2020-03-17");
INSERT INTO tracker VALUES (null,5,"BOOKED","2020-03-22");

INSERT INTO tracker VALUES (null,6,"CREATED","2020-03-21");
INSERT INTO tracker VALUES (null,6,"FROM_HUB_REACHED","2020-03-22");

INSERT INTO tracker VALUES (null,7,"CREATED","2020-03-22");

INSERT INTO tracker VALUES (null,8,"CREATED","2020-03-18");
INSERT INTO tracker VALUES (null,8,"FROM_HUB_REACHED","2020-03-18");
INSERT INTO tracker VALUES (null,8,"BOOKED","2020-03-18");
INSERT INTO tracker VALUES (null,8,"TO_HUB_REACHED","2020-03-22");
INSERT INTO tracker VALUES (null,8,"OUT_FOR_DELIEVERY","2020-03-25");
INSERT INTO tracker VALUES (null,8,"DELIEVERED","2020-03-25");

INSERT INTO tracker VALUES (null,9,"CREATED","2020-03-19");
INSERT INTO tracker VALUES (null,9,"FROM_HUB_REACHED","2020-03-19");
INSERT INTO tracker VALUES (null,9,"BOOKED","2020-03-22");
INSERT INTO tracker VALUES (null,9,"TO_HUB_REACHED","2020-03-30");

INSERT INTO tracker VALUES (null,10,"CREATED","2020-03-31");


-- total number of docate created ?
SELECT count(*) as count FROM docate where status = "CREATED";

-- datewise count of docate ?
select submission_date,count(*) from docate group by submission_date;

-- for a particular docate,select the tracker ,created order by descending order(status,created_date) ?
SELECT id,docate_id,status,created_date FROM tracker where docate_id = 1 order by id desc;

-- docate_wise count of tracking status ?
select docate_id,count(status) as count from tracker group by docate_id;

-- count of DELIEVERED and undelievered ?
select sum(case when status = 'DELIEVERED' then 1 else 0 end) as delivered, sum(case when status != 'DELIEVERED' then 1 else 0 end) as undelivered from docate;

-- select the docate which is getting late DELIEVERED ?
select id, expected_date, created_date, status, (case when created_date is null and expected_date < now() then 1 when created_date is null and expected_date > now() then 0 when expected_date < created_date then 1 else 0 end) as is_late from (select d.id, d.expected_date,t.created_date, t.status from docate d left join tracker t on t.docate_id = d.id and t.status = 'DELIEVERED') t;
