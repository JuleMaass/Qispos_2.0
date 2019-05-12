CREATE TABLE student (
    benutzername VARCHAR(15) NOT NULL,
    id INT NOT NULL PRIMARY KEY,
    email VARCHAR(30),
    PW INT NOT NULL
);

alter table student add column studentenname varchar(15);

CREATE TABLE modul (
    id INT NOT NULL PRIMARY KEY,
    modulname VARCHAR(30) NOT NULL,
    credits FLOAT,
    semester INT
);

alter table student drop column id;
alter table student add column id int Not null primary key;



DELETE FROM modul 
WHERE
    id = 12;

SELECT 
    *
FROM
    modul;


SELECT 
    *
FROM
    student;

CREATE TABLE student_has_modul (
    student_id INT NOT NULL,
    modul_id INT NOT NULL,
    PRIMARY KEY (student_id , modul_id)
);


SELECT 
    *
FROM
    student_has_modul;

SELECT 
    student_id
FROM
    student_has_modul
WHERE
    modul_id = 12;
    

SELECT 
    benutzername
FROM
    student
WHERE
    id IN (SELECT 
            student_id
        FROM
            student_has_modul
        WHERE
            modul_id = 11);
    
CREATE TABLE klausur (
    id INT NOT NULL PRIMARY KEY,
    note FLOAT NOT NULL,
    bezeichnung VARCHAR(30) NOT NULL,
    versuch INT(10)
);
    
  
    
 


SELECT 
    *
FROM
    klausur;
    
SELECT 
    modulname
FROM
    modul
WHERE
    id IN (SELECT 
            modul_id
        FROM
            klausur
        WHERE
            note = 1);

SELECT 
    T1.benutzername,
    T2.modulname,
    T2.credits,
    T3.bezeichnung,
    T3.note
FROM
    student T1,
    modul T2,
    klausur T3
WHERE
    T1.id = 11;

SELECT 
    T1.benutzername, T2.modulname
FROM
    student T1,
    modul T2
WHERE
    T2.id = (SELECT 
            modul_id
        FROM
            student_has_modul
        WHERE
            student_id = 11);


    
SELECT 
    student.benutzername,
    student.email,
    modul.modulname,
    modul.semester
FROM
    student
        INNER JOIN
    modul ON modul.id = (SELECT 
            modul_id
        FROM
            student_has_modul
        WHERE
            student_id = 10 AND student.id = 10);

SELECT 
    T1.benutzername, T1.email, modul.modulname, T2.semester
FROM
    student T1,
    modul T2
        INNER JOIN
    modul ON modul.id = (SELECT 
            modul_id
        FROM
            student_has_modul
        WHERE
            student_id = 10 AND T2.id = 10);
    
	SELECT 
    student.benutzername,
    student.email,
    modul.modulname,
    modul.semester,
    klausur.bezeichnung,
    klausur.note
FROM
    student
        INNER JOIN
    modul ON (modul.id , klausur.modul_id) = (SELECT 
            modul_id
        FROM
            student_has_modul
        WHERE
            student_id = 10 AND student.id = 10
                AND klausur.modul_id = (SELECT 
                    modul_id
                FROM
                    student_has_modul
                WHERE
                    student_id = 10));
    
    
SELECT 
    T1.benutzername, T1.id, T2.modulname, T2.id, T3.note
FROM
    student T1,
    modul T2,
    klausur T3
WHERE
    T2.id = (SELECT 
            modul_id
        FROM
            student_has_modul
        WHERE
            student_id = 10)
        AND T3.modul_id = (SELECT 
            modul_id
        FROM
            student_has_modul
        WHERE
            student_id = 10);
    

SELECT 
    modul_id
FROM
    student_has_modul
WHERE
    student_id = 10;



DELETE FROM student_has_klausur 
WHERE
    student_id > 0;
  
SELECT 
    *
FROM
    student
        INNER JOIN
    modul ON modul.id IN (SELECT 
            modul_id
        FROM
            student_has_modul
        WHERE
            student_id = 1 AND student.id = 1);
    
/*alle studenten die das modul mit der id 11 belegen*/
SELECT 
    *
FROM
    student
WHERE
    student.id IN (SELECT 
            student_id
        FROM
            student_has_modul
        WHERE
            modul_id = 11);
  
/*ein student mit all seinen modulen*/
SELECT 
    T1.benutzername, T2.modulname
FROM
    student T1,
    modul T2,
    student_has_modul T3
WHERE
    T1.id = 5 AND T3.student_id = 5;

/*(ein student mit seinen klausuren und noten)*/
SELECT 
    T1.benutzername, T3.note
FROM
    student T1,
    klausur T2,
    student_has_klausur T3
WHERE
    T1.id = 1
        AND T3.klausur_id IN (SELECT 
            klausur_id
        FROM
            student_has_klausur
        WHERE
            student_id = 1);
    
  
    /*ein student mit seinen klausuren und noten: */
 
 select T1.student_id, T1.note, T2.bezeichnung
	from student_has_klausur T1 inner join klausur T2
   where T1.student_id = 1
   and T2.id = (select T1.klausur_id where T1.student_id = 1);
   
   /*ein student mit seinen klausuren und noten und modulbezeichnung: */
 
 select distinct T1.student_id, T1.note, T2.bezeichnung, T3.modulname
	from student_has_klausur T1 inner join klausur T2, modul T3, student_has_modul T4
   where T1.student_id = 5
   and T2.id = (select T1.klausur_id where T1.student_id = 5)
   and T3.id = (select T4.modul_id where T4.student_id =5) 
   group by (T2.bezeichnung);
   
   
   
   
   
   
   
SELECT 
    T1.benutzername
FROM
    student T1
WHERE
    T1.id IN (SELECT 
            student_id
        FROM
            student_has_klausur
        WHERE
            klausur_id = 002);

SELECT 
    T1.benutzername
FROM
    student T1
WHERE
    T1.id = 2;
   
SELECT 
    student_id
FROM
    student_has_klausur
WHERE
    klausur_id = 002;
SELECT 
    klausur_id
FROM
    student_has_klausur
WHERE
    student_id = 2;
   
   

SELECT 
    *
FROM
    student_has_klausur;
	SELECT 
    note
FROM
    student_has_klausur
WHERE
    student_id = 3;
klausurstudent_has_klausur

delete from klausur where id = 5;
/******************************************************************************************************/
/*3. veruch: */


insert into student values ('phans', 1, 'phans@hs-bremen.de', 111, 'Peter', 'Hans');
insert into student values ('kkönig', 2, 'könig@hs-bremen.de', 222, 'Klaus', 'König');
insert into student values ('hulla', 3, 'hulla@hs-bremen.de', 333, 'Horst', 'Ulla');
insert into student values ('lmeier', 4, 'lmeier@hs-bremen.de', 444, 'Lisa', 'Meier');
insert into student values ('hschmitz', 5, 'hschmitz@hs-bremen.de', 555, 'Heinz', 'Schmitz');
SELECT 
    *
FROM
    student;
CREATE TABLE dozent (
    benutzername VARCHAR(45) NOT NULL,
    id int NOT NULL PRIMARY KEY,
    email VARCHAR(40),
    PW INT NOT NULL,
    vorname varchar(30),
    nachname varchar(30)
);
insert into dozent values('pkrug', 100, 'pkrug@hs-bremen.de', 100100, 'peter', 'krug');
insert into dozent values('oheike', 200, 'oheike@hs-bremen.de', 200200, 'otto', 'heike');
insert into dozent values('tbruns', 300, 'tbruns@hs-bremen.de', 300300, 'torben', 'bruns');

select * from dozent;

insert into modul values (10, 'Mathe1', 1, 4, 100);
insert into modul values (11, 'Mathe2', 2, 4, 100);
insert into modul values (12, 'Rechnernetze', 2, 4, 200);
insert into modul values (13, 'Programmieren1', 1, 4, 300);
insert into modul values (14, 'Englisch', 4, 4, 400);
SELECT 
    *
FROM
    modul;
SET SQL_SAFE_UPDATES=0;
TRUNCATE TABLE modul;


    insert into klausur values (001,  'Matheklausur1'); 
    insert into klausur values (002, 'Matheklausur2'); 
	insert into klausur values (003, 'Rechnernetze1'); 
    insert into klausur values (004, 'Programmieren1'); 
    insert into klausur values (005, 'Englisch'); 
    insert into klausur values (006, 'Englisch_Referat');
    
    
SELECT 
    *
FROM
    klausur;
  
SELECT 
    *
FROM
    student_belegt_modul;
 
 
 /*********select******************/
 
/*studenten id, modul id, klausur id, noten, versuch, credtits*/
insert into student_belegt_modul values (1, 10, 001, 1.0, 1, 4);
insert into student_belegt_modul values (1, 12, 003, 3.0, 2, 4);  
insert into student_belegt_modul values (2, 13, 004, 5.0, 1, 0);
insert into student_belegt_modul values (3, 14, 005, 1.0, 1, 2);
insert into student_belegt_modul values (3, 14, 006, 2.0, 1, 2);
insert into student_belegt_modul values (3, 11, 002, 2.0, 1, 4);
  TRUNCATE TABLE student_belegt_modul;



/* Student mit namen, modul klausur, noten, credits*/

select T1.benutzername, T2.modulname, T3.bezeichnung, T4.note, T4.credits
	from student T1, modul T2, klausur T3, student_belegt_modul T4
		where T1.id = 3
        and T2.id = (select T4.modul_id where student_id =3)
        and T3.id = (select T4.klausur_id where student_id =3)
        and T4.note = (select T4.note where student_id =3);
        
        
/*Dozent mit allen modulen*/

select T1.benutzername, T1.id, T2.modulname 
	from dozent T1, modul T2
		where T2.dozent_id = 100
        and T1.id = 100;
        
/*dozent mit klausuren*/
select T1.benutzername, T1.id, T2.bezeichnung
	from dozent T1, Klausur T2, modul T3, student_belegt_modul T4
		where T1.id = 100
        and T3.dozent_id = 100
        and T4.modul_id = (select T3.id where T3.dozent_id = 100)
        and T2.id = (select T4.klausur_id where T4.modul_id = (select T3.id where T3.dozent_id = 100));
        
        
/***********updaten***********/

/*dozent möchte noten ändern können von student / klausur*/

update student_belegt_modul set note = 5.0 where student_id = 1 and klausur_id = 001;
select * from student_belegt_modul where student_id = 1; 

/*student will module ändern, jede spalte muss einzeln geändert werden*/
update student_belegt_modul set note = null where modul_id = 10 and student_id =1;
update student_belegt_modul set klausur_id = 002 where modul_id = 10 and student_id =1;
update student_belegt_modul set versuch = 1 where modul_id = 10 and student_id =1;
update student_belegt_modul set credits = null where modul_id = 10 and student_id =1;
update student_belegt_modul set modul_id = 11 where modul_id = 10 and student_id = 1;


update student_belegt_modul set note = 2.0 where modul_id = 13 and student_id = 2;
update student_belegt_modul set klausur_id = 001 where modul_id = 13 and student_id =2;
update student_belegt_modul set versuch = 1 where modul_id = 13 and student_id =2;
update student_belegt_modul set credits = 4 where modul_id = 13 and student_id =2;
update student_belegt_modul set modul_id = 10 where modul_id = 13 and student_id = 2;

select * from student_belegt_modul where student_id =2;

/*dozent möchte modulnamen ändern können*/

update modul set modulname = 'Mathe-leicht' where modulname = 'Mathe1';
select * from modul;
select T1.modulname, T2.student_id
	from modul T1, student_belegt_modul T2
    where T1.id = (select T2.modul_id where T2.student_id = 2);

/***********DELETE****************/

/*Student möchte module entfernen können*/
delete from student_belegt_modul where modul_id = 11 and student_id = 3;
select * from student_belegt_modul where student_id = 3;







