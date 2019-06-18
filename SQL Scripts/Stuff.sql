
Select * FROM dozents;
Select * FROM moduls;
Select * FROM pruefungs;
Select * FROM students;
Select * FROM students_has_moduls;
Select * FROM students_has_pruefungs;
Select * FROM students_has_studiengangs;
Select * FROM studiengangs;
Select * FROM studiengangs_has_moduls;





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
INSERT into students_has_studiengangs
values (10002,1);

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

INSERT into students_has_moduls
values (10002,2, 0);

INSERT into studiengangs
values (NULL,'Internationaler Studiengang Medieninformatik','','Bachelor of Science',210);

Insert into pruefungs
values (NULL, 1, "Mathe 1 KL", "Klasur", 1, "2019.02.20 1800", "2019.07.20 1800", 1112, 2, 200);


INSERT into moduls
values (NULL,'Programmieren 1',1,1,6,'',1110);
INSERT into moduls
values (NULL,'Mathe 1',1,2,6,'',1120);


call all_grades_student(10002);

call all_pruefung_student(10001);

/*Dozent mit allen Prüfungen*/

select DISTINCT T1.id, T2.bezeichnung, T3.nummer, T3.versuch, T3.dozents_id, T2.semester, T3.anmeldedatum, T3.pruefungsdatum, T4.status, T6.benutzername
from students T1, moduls T2, pruefungs T3, students_has_moduls T4, students_has_pruefungs T5, dozents T6
where T1.id = 10002
and T4.students_id = 10002
and T2.id = T4.moduls_id
and T5.students_id = 10002
and T3.moduls_id = T4.moduls_id
and T6.id = T3.dozents_id;

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


      