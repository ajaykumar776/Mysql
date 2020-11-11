Drop DATABASE IF EXISTS messege;

CREATE DATABASE messege;

USE messege;

CREATE TABLE users 
(
	id int not null auto_increment,
	name varchar(50) not null,
	primary key(id)
);

INSERT INTO users VALUES (null,"Aaqib"),(null,"Nazish"),(null,"Danish"),(null,"Appi"),(null,"Shahnaj"),(null,"Ammi"),(null,"papa");

CREATE TABLE chats
(
	id int auto_increment primary key,
	from_id int not null,
	to_id int not null,
	message_details varchar(500) not null,
	date_time datetime not null,
	is_read int not null DEFAULT 0
);

INSERT INTO chats VALUES (null,1,2,"chhotebhaijaan mobile me paisa daal dijyena !","2020-03-16 16:00:00",0);
INSERT INTO chats VALUES (null,1,3,"bhaijaan mobile me paisa daal dijyena !","2020-03-16 16:02:30",1);
INSERT INTO chats VALUES (null,3,1,"thik daal de rhe h !","2020-03-16 16:03:00",1);
INSERT INTO chats VALUES (null,3,1,"bhabi kya kr rhi ?","2020-03-16 16:04:00",1);
INSERT INTO chats VALUES (null,1,3,"khana bna rhi !","2020-03-16 16:04:05",1);
INSERT INTO chats VALUES (null,1,3,"aapka kitna roti banega bhaijaan ?","2020-03-16 16:04:06",1);
INSERT INTO chats VALUES (null,3,1,"4 roti kaafi h !","2020-03-16 16:04:10",1);
INSERT INTO chats VALUES (null,3,1,"Nazish se bhi puchh lo !!","2020-03-16 16:04:15",1);
INSERT INTO chats VALUES (null,1,3,"puche the online nhi h shayad !","2020-03-16 16:04:20",0);
INSERT INTO chats VALUES (null,3,1,"thik hum call krte h !","2020-03-16 16:04:25",1);
INSERT INTO chats VALUES (null,1,3,"thk bhaijaan","2020-03-16 16:04:30",0);
INSERT INTO chats VALUES (null,3,2,"Nazish kitna roti khayega bhabi ko bta do !","2020-03-16 16:04:35",1);
INSERT INTO chats VALUES (null,2,3,"thik h bhaijaan !","2020-03-16 16:04:40",1);
INSERT INTO chats VALUES (null,2,5,"bhabi mera 6 roti bnaega,bht bhook lga h !!","2020-03-16 16:04:45",1);
INSERT INTO chats VALUES (null,5,2,"thik bna denge.","2020-03-16 16:04:50",1);
INSERT INTO chats VALUES (null,5,3,"aji aap kb aayeag ?","2020-03-16 16:04:55",0);
INSERT INTO chats VALUES (null,5,3,"online aaye na ji ...","2020-03-16 16:05:00",1);
INSERT INTO chats VALUES (null,3,5,"aa rhe bs raaste me h","2020-03-16 16:05:10",1);
INSERT INTO chats VALUES (null,5,3,"thik jldii aye !","2020-03-16 16:05:15",1);
INSERT INTO chats VALUES (null,2,7,"papa paisa daal diye h,check krke btaeye !","2020-03-16 17:00:30",0);
INSERT INTO chats VALUES (null,2,6,"Ammi papa ko paisa check krne ke liye bolye !","2020-03-16 17:01:30",1);
INSERT INTO chats VALUES (null,6,2,"thik bol dete h !","2020-03-16 17:01:35",1);
INSERT INTO chats VALUES (null,6,7,"ajii nazish paisa daal diya h,check krne bol rha ..","2020-03-16 17:01:55",1);
INSERT INTO chats VALUES (null,6,7,"ajii nazish paisa daal diya h,check krne bol rha.","2020-03-16 17:01:55",1);
INSERT INTO chats VALUES (null,7,6,"thik h..","2020-03-16 17:01:59",1);
INSERT INTO chats VALUES (null,6,4,"Happy birhtday mahira !!","2020-03-15 00:0:01",0);
INSERT INTO chats VALUES (null,1,4,"Happy birhtday mahira !!","2020-03-15 00:0:01",0);
INSERT INTO chats VALUES (null,2,4,"Happy birhtday mahira !!","2020-03-15 00:0:01",0);
INSERT INTO chats VALUES (null,3,4,"Happy birhtday mahira !!","2020-03-15 00:0:01",0);
INSERT INTO chats VALUES (null,5,4,"Happy birhtday mahira !!","2020-03-15 00:0:01",0);
INSERT INTO chats VALUES (null,7,4,"Happy birhtday mahira !!","2020-03-15 00:0:01",0);
INSERT INTO chats VALUES (null,4,1,"thankuu maamu !","2020-03-15 09:10:24",1);
INSERT INTO chats VALUES (null,4,2,"thankuu maamu !","2020-03-15 09:10:25",0);
INSERT INTO chats VALUES (null,4,3,"thankuu maamu !","2020-03-15 09:10:26",1);
INSERT INTO chats VALUES (null,4,5,"thankuu mawanii !","2020-03-15 09:10:27",1);
INSERT INTO chats VALUES (null,4,5,"thankuu naani !","2020-03-15 09:10:28",0);
INSERT INTO chats VALUES (null,4,5,"are bhabi,ammi ko bhej rhe the !","2020-03-15 09:10:29",1);
INSERT INTO chats VALUES (null,5,4,"koi nhii !!","2020-03-15 09:10:30",1);
INSERT INTO chats VALUES (null,4,6,"thankuuu naani !","2020-03-15 09:10:32",0);
INSERT INTO chats VALUES (null,4,7,"thankuuu naanuu !","2020-03-15 09:10:35",1);

-- for a particular user id,list of every to_id and count ? 
SELECT f.name as from_name, t.name as to_name, count(c.is_read) as count FROM chats c left join users f on f.id=c.from_id left join users t on t.id=c.to_id where c.is_read=0 group by c.from_id, c.to_id;
-- for a particular user id,top 3 name of from_it whose to_id count is more ?
select to_id, count(*) as count from chats where from_id = 1 group by to_id order by count desc limit 3;
-- for a particular user,max count of from_id ?
select from_id, count(*) as count from chats group by from_id order by count desc limit 3;