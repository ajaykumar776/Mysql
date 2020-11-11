DROP DATABASE IF EXISTS attendence;
CREATE DATABASE attendence;

-- creating table
CREATE TABLE attendence(
    id INT auto_increment,
    name VARCHAR(50),
    date DATE,
    status VARCHAR(50),
    PRIMARY KEY (id)
);

-- insert data
INSERT INTO attendence VALUES (null, "Nazish", "2020-01-01", "Present");
INSERT INTO attendence VALUES (null, "Aaqib", "2020-01-01", "Absent");
INSERT INTO attendence VALUES (null, "Danish", "2020-01-01", "Absent");
INSERT INTO attendence VALUES (null, "Shahnaj", "2020-01-01", "Present");

INSERT INTO attendence VALUES (null, "Nazish", "2020-01-02", "Holiday");
INSERT INTO attendence VALUES (null, "Aaqib", "2020-01-02", "Holiday");
INSERT INTO attendence VALUES (null, "Danish", "2020-01-02", "Holiday");
INSERT INTO attendence VALUES (null, "Shahnaj", "2020-01-02", "Holiday");

INSERT INTO attendence VALUES (null, "Nazish", "2020-01-03", "Absent");
INSERT INTO attendence VALUES (null, "Aaqib", "2020-01-03", "Absent");
INSERT INTO attendence VALUES (null, "Danish", "2020-01-03", "Absent");
INSERT INTO attendence VALUES (null, "Shahnaj", "2020-01-03", "Present");

INSERT INTO attendence VALUES (null, "Nazish", "2020-01-04", "Present");
INSERT INTO attendence VALUES (null, "Aaqib", "2020-01-04", "Present");
INSERT INTO attendence VALUES (null, "Danish", "2020-01-04", "Present");
INSERT INTO attendence VALUES (null, "Shahnaj", "2020-01-04", "Present");

INSERT INTO attendence VALUES (null, "Nazish", "2020-01-03", "Present");
INSERT INTO attendence VALUES (null, "Aaqib", "2020-01-03", "Present");
INSERT INTO attendence VALUES (null, "Danish", "2020-01-03", "Absent");
INSERT INTO attendence VALUES (null, "Shahnaj", "2020-01-03", "Present");

-- questions

-- write a query to select student wise count of present and absent
SELECT 
    name,
    SUM(CASE
        WHEN status = 'Present' THEN 1
        ELSE 0
    END) AS present,
    SUM(CASE
        WHEN status = 'Absent' THEN 1
        ELSE 0
    END) AS absent
FROM
    attendence.attendence
GROUP BY name;

-- list of all the student who has less than 75% attence
SELECT 
    *, present * 100 / (present + absent) AS percentage
FROM
    (SELECT 
        name,
            SUM(CASE
                WHEN status = 'Present' THEN 1
                ELSE 0
            END) AS present,
            SUM(CASE
                WHEN status = 'Absent' THEN 1
                ELSE 0
            END) AS absent
    FROM
        attendence.attendence
    GROUP BY name) t having percentage<75;

-- top 3 student who has maximum attendence
SELECT 
    *, present * 100 / (present + absent) AS percentage
FROM
    (SELECT 
        name,
            SUM(CASE
                WHEN status = 'Present' THEN 1
                ELSE 0
            END) AS present,
            SUM(CASE
                WHEN status = 'Absent' THEN 1
                ELSE 0
            END) AS absent
    FROM
        attendence.attendence
    GROUP BY name) t order by percentage desc limit 3;

-- which date has maximum and minimum student count
SELECT 
    date, COUNT(status) AS count
FROM
    attendence.attendence
WHERE
    status = 'Present'
GROUP BY date
ORDER BY count DESC
LIMIT 1;

