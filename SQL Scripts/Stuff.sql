
Select * FROM dozents;

Select * FROM students;

Select * FROM pruefungs;

Select * FROM students_has_studiengangs;
Select * FROM students_has_pruefungs;
Select * FROM students_has_moduls;
Select * FROM studiengangs_has_moduls;
Select * FROM moduls;
select * from studiengangs;

/* Semester eines Studiengangs*/
select distinct T1.semester  
from moduls T1, studiengangs_has_moduls T2
where T2.studiengangs_id = 1;

/* Module eines Semesters */
select distinct moduls.bezeichnung, moduls.beschreibung as moduls_bez
 from pruefungs, moduls
 where moduls.semester = 1;

select T1.* 
from moduls T1, studiengangs_has_moduls T3
where T3.studiengangs_id = 1
and T1.id = T3.moduls_id;

 select moduls.id as moduls_id, pruefungs.bezeichnung as pruefungs_bez,  pruefungs.pruefungsdatum,  dozents.nachname
 from pruefungs, moduls, dozents, studiengangs_has_moduls
 where studiengangs_has_moduls.studiengangs_id = 1
 and moduls.id = studiengangs_has_moduls.moduls_id
 and pruefungs.moduls_id = moduls.id
 and dozents.id = pruefungs.dozents_id;

/*Pruefungsinformationen eines Moduls*/
 select moduls.bezeichnung as moduls_as, pruefungs.bezeichnung as pruefungs_bez,  pruefungs.pruefungsdatum,  dozents.nachname
 from pruefungs, moduls, dozents
 where moduls.semester = 1
 and pruefungs.moduls_id = moduls.id
 and dozents.id = pruefungs.dozents_id;

insert into moduls values(5, "Informatik 1 EA", 1, 5, 6, null, 1150);
insert into moduls values(6, "Programmieren 2 EA", 2, 1, 6, null, 1210);
insert into moduls values(7, "Mathe 2 EA", 2, 2, 6, null, 1220);
insert into moduls values(8, "Gestaltung 2 EA", 2, 3, 6, null, 1230);
insert into moduls values(9, "Medieninformatik 2 EA", 2, 4, 6, null, 1240);
insert into moduls values(10, "Informatik 2 EA", 2, 5, 6, null, 1250);
insert into moduls values(11, "Rechnernetze EA", 3, 1, 6, null, 1310);
call insert_matrikelnummer();

insert into studiengangs_has_moduls values( 1, 2);
insert into studiengangs_has_moduls values( 1, 3);
insert into studiengangs_has_moduls values( 1, 4);
insert into studiengangs_has_moduls values( 1, 5);
insert into studiengangs_has_moduls values( 1, 6);
insert into studiengangs_has_moduls values( 1, 7);
insert into studiengangs_has_moduls values( 1, 8);
insert into studiengangs_has_moduls values( 1, 9);
insert into studiengangs_has_moduls values( 1, 10);
insert into studiengangs_has_moduls values( 1, 11);

insert into studiengangs values(NULL, "Technische Informatik", "Die Langweiler vom Dienst.", "Bachelor of Science", 210); 

DELETE FROM students WHERE id = 10014;

CREATE TABLE TestTable(id varchar(45)) AS
SELECT id
FROM students;

DELETE FROM pruefungs WHERE  id =2;


UPDATE students
SET matrikelnummer = 10001
WHERE id >= 0;


INSERT into students_has_studiengangs
values (10001,1);

INSERT into studiengangs_has_moduls
values (1,1);


INSERT into students_has_pruefungs
values (10001,3,default, NULL);

INSERT into students_has_pruefungs
values (10002,3,default, NULL);

INSERT into students_has_pruefungs
values (10002,4,default, 1.7);


INSERT into students_has_moduls
values (10001,1);

INSERT into studiengangs
values (NULL,'Internationaler Studiengang Medieninformatik','','Bachelor of Science',210);

INSERT into moduls
values (NULL,'Programmieren 1',1,1,6,'',1110);




call all_pruefung_student(10001);

/*Dozent mit allen Prüfungen*/



select T1.id, T1.benutzername, T2.bezeichnung
from dozents T1, pruefungs T2
where T2.dozents_id = 100
and T1.id = 100;


/* Select Prüfungen für Studenten */
select T1.id, T1.benutzername, T3.bezeichnung
from students T1, students_has_pruefungs T2, pruefungs T3
where T2.students_id = 10001
and T1.id = 10001
and T3.id = T2.pruefungs_id;



/* select Studiengang und abschluss für student*/
select T1.id, T1.benutzername, T2.bezeichnung, T2.abschluss
from students T1, studiengangs T2, students_has_studiengangs T3
where T1.id = 10001
and T3.students_id = 10001
and T2.id = T3.studiengangs_id;

/* select module für student*/
select DISTINCT T1.id, T2.bezeichnung, T3.nummer, T3.dozents_id, T2.semester, T3.anmeldedatum, T3.pruefungsdatum
from students T1, moduls T2, pruefungs T3, students_has_moduls T4, students_has_pruefungs T5
where T1.id = 10002
and T4.students_id = 10002
and T2.id = T4.moduls_id
and T5.students_id = 10002
and T3.moduls_id = T4.moduls_id;

/* Select Termine für Studenten */
select  T2.termin_bezeichnung, T2.datum, T2.erledigt
from  termins T2
where T2.students_id = 10002;

select * from termins;

/* Insert Termine */
INSERT into termins
values (NULL,'Motorrad FAAAAAAAHN',20190202,0,10002);
/* Insert Termine */
INSERT into termins
values (NULL,'Datenbank abgeben',20190202,0,10002);
/* Insert Termine */
INSERT into termins
values (NULL,'Buchi Boxen',20190202,0,10002);
/* Insert Termine */
INSERT into termins
values (NULL,'Tutorenlehrgang',20190202,0,10002);


DELETE FROM termins WHERE id = 2;

select T1.bezeichnung, T2.pruefungs_id, T2.students_id
from pruefungs T1, students_has_pruefungs T2
where T2.students_id = 10002
and T1.id = T2.pruefungs_id;

Insert into termins
values("neue Pruefung", 20190303, 0, 1);



select T1.count(note) from 
(select sum(note), students_id
from students_has_pruefungs
where students_id = 10002 and note is not null) T1;

select count(*) 
from students_has_pruefungs
where students_id = 10002 and note is not null;

select sum(note) from students_has_pruefungs where students_id = 10002;



select students_id, sum(note) as gesamtNote, count(*) 
from students_has_pruefungs
where students_id = 10002 and note is not null;



INSERT into students_has_pruefungs
values (1000,3,default, 3.3);

select * from students_has_pruefungs;

Insert into pruefungs
values (NULL, 1, "Gestaltung 1", "Klasur", 1, "2019.02.22", "2019.07.22", 1113, 3, 200);

INSERT into moduls
values (NULL,'Gestaltung 1 EA',1,3,6,'',1130);

delete from students_has_pruefungs where pruefungs_id = 3;

INSERT into termins
select T1.bezeichnung 
from pruefungs T1, students_has_pruefungs T2
where T2.students_id = 10002
and T1.id = T2.pruefungs_id;


call delete_termin(5);


UPDATE termins
SET erledigt = 1
WHERE id = 1;


select students_id, sum(note) as gesamtNote, count(*) 
from students_has_pruefungs
where students_id = 10002 and note is not null;

/*anzahl der studierenden* -anzahl der studentenids die in student has studiengang auftauchen, aber jede matrikelnummer nur 1x */


select count(DISTINCT students_id) as summe_studs 
from students_has_pruefungs;

Select * FROM students_has_pruefungs;

select T1.students_id, sum(T1.note) as gesamtNote, count(*) as count, T2.matrikelnummer
from students_has_pruefungs T1, students T2
where students_id = 10002 and note is not null
and T2.id = 10002;

/*alle module mit semestern eines studiengangs, */
select T1.bezeichnung as studBezeichnung, T2.bezeichnung as modBezeichnung, T2.semester
from studiengangs T1, moduls T2, studiengangs_has_moduls T3
where T1.id = T3.studiengangs_id
and T2.id = T3.moduls_id;

/*anzahl der semester eines studiengangs zählen*/
select T1.bezeichnung as stud_ezeichnung, count(distinct T2.semester) as semester_anzahl
from studiengangs T1, moduls T2, studiengangs_has_moduls T3
where T1.id = T3.studiengangs_id
and T2.id = T3.moduls_id;
      
      call studiengang_with_moduls;
           call count_students();student_studies

       
       
SELECT (select T1.bezeichnung as studBezeichnung, T2.bezeichnung as modBezeichnung, T2.semester
from studiengangs T1, moduls T2, studiengangs_has_moduls T3
where T1.id = T3.studiengangs_id
and T2.id = T3.moduls_id) RIGHT JOIN (select T1.bezeichnung as stud_ezeichnung, count(distinct T2.semester) as semester_anzahl
from studiengangs T1, moduls T2, studiengangs_has_moduls T3
where T1.id = T3.studiengangs_id
and T2.id = T3.moduls_id);