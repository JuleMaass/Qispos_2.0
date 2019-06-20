
Select * FROM dozents;

Select * FROM students;



Select * FROM pruefungs;

Select * FROM students_has_studiengangs;

Select * FROM moduls;


call insert_matrikelnummer();

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

<<<<<<< Updated upstream
=======
INSERT into students_has_pruefungs
values (10002,3,default, NULL);

INSERT into students_has_pruefungs
values (10002,4,default, 1.7);


>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
=======
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

select sum(note) from students_has_pruefungs where students_id = 10002 div 3;



select students_id, sum(note) as gesamtNote, count(*) 
from students_has_pruefungs
where students_id = 10002 and note is not null;



INSERT into students_has_pruefungs
values (10002,3,default, 3.3);

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
>>>>>>> Stashed changes
      