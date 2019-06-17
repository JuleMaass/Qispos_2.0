
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

      