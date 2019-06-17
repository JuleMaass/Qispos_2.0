CREATE PROCEDURE `all_pruefung_student` (student_id VARCHAR(45))
BEGIN
/* Select Prüfungen für Studenten */
select T1.id, T1.benutzername, T3.bezeichnung
from students T1, students_has_pruefungs T2, pruefungs T3
where T2.students_id = student_id
and T1.id = student_id
and T3.id = T2.pruefungs_id;
END
