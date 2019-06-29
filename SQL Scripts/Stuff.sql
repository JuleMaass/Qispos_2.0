
SELECT 
    *
FROM
    dozents;
SELECT 
    *
FROM
    students;
SELECT 
    *
FROM
    pruefungs;
SELECT 
    *
FROM
    students_has_studiengangs;
SELECT 
    *
FROM
    students_has_pruefungs;
SELECT 
    *
FROM
    students_has_moduls;
SELECT 
    *
FROM
    studiengangs_has_moduls;
SELECT 
    *
FROM
    moduls;
SELECT 
    *
FROM
    studiengangs;
SELECT 
    *
FROM
    termins;

/*delete*/ 
DELETE FROM termins 
WHERE
    students_id = 10030;
DELETE FROM students_has_pruefungs 
WHERE
    students_id = 10030;
DELETE FROM students 
WHERE
    id = 10001;
DELETE FROM pruefungs 
WHERE
    id = 16;

/*update*/
UPDATE pruefungs 
SET 
    moduls_id = 14
WHERE
    id = 25;
UPDATE students 
SET 
    email = 'jmaass@hs-bremen.de'
WHERE
    id = 10002;
UPDATE students_has_pruefungs 
SET 
    note = 1.0
WHERE
    students_id = (SELECT 
            id
        FROM
            students
        WHERE
            matrikelnummer = 50002)
        AND pruefungs_id = 3;
UPDATE moduls 
SET 
    bezeichnung = 'Mensch-Computer-Interaktion'
WHERE
    id = 15;
UPDATE dozents 
SET 
    benutzername = 'btannert'
WHERE
    id = 301;
UPDATE termins 
SET 
    erledigt = 1
WHERE
    id = 1;
UPDATE pruefungs 
SET 
    moduls_id = 7
WHERE
    id = 11;

/*select*/

SELECT DISTINCT
    T1.id,
    T1.benutzername,
    T2.pruefungs_id,
    T3.bezeichnung,
    T3.pruefungsdatum
FROM
    students T1,
    students_has_pruefungs T2,
    pruefungs T3
WHERE
    T1.id = 10002 AND T2.students_id = 10002
        AND T3.id = T2.pruefungs_id;

SELECT 
    T1.id,
    T1.benutzername,
    T2.nummer,
    T2.bezeichnung,
    T2.versuch,
    T2.pruefungsart,
    T2.semester,
    T3.note
FROM
    students T1,
    pruefungs T2,
    students_has_pruefungs T3
WHERE
    T1.id = 10002 AND T3.students_id = 10002
        AND T2.id = T3.pruefungs_id;

SELECT 
    T1.id,
    T1.benutzername,
    T2.nummer,
    T2.bezeichnung,
    T2.versuch,
    T2.pruefungsart,
    T2.semester,
    T3.note,
    T4.credits
FROM
    students T1,
    pruefungs T2,
    students_has_pruefungs T3,
    moduls T4,
    students_has_moduls T5
WHERE
    T1.id = 10002 AND T3.students_id = 10002
        AND T2.id = T3.pruefungs_id
        AND T5.students_id = 10002
        AND T4.id = T5.moduls_id
        AND T2.moduls_id = T4.id;


SELECT 
    T1.id, T1.benutzername, T2.bezeichnung
FROM
    dozents T1,
    pruefungs T2
WHERE
    T2.dozents_id = 100 AND T1.id = 100;


/* Select Prüfungen für Studenten */
SELECT 
    T1.id, T1.benutzername, T3.bezeichnung
FROM
    students T1,
    students_has_pruefungs T2,
    pruefungs T3
WHERE
    T2.students_id = 10001 AND T1.id = 10001
        AND T3.id = T2.pruefungs_id;



/* select Studiengang und abschluss für student*/
SELECT 
    T1.id, T1.benutzername, T2.bezeichnung, T2.abschluss
FROM
    students T1,
    studiengangs T2,
    students_has_studiengangs T3
WHERE
    T1.id = 10001 AND T3.students_id = 10001
        AND T2.id = T3.studiengangs_id;

/* select module für student*/
SELECT DISTINCT
    T1.id,
    T2.bezeichnung,
    T3.nummer,
    T3.dozents_id,
    T2.semester,
    T3.anmeldedatum,
    T3.pruefungsdatum
FROM
    students T1,
    moduls T2,
    pruefungs T3,
    students_has_moduls T4,
    students_has_pruefungs T5
WHERE
    T1.id = 10002 AND T4.students_id = 10002
        AND T2.id = T4.moduls_id
        AND T5.students_id = 10002
        AND T3.moduls_id = T4.moduls_id;

/* Select Termine für Studenten */
SELECT 
    T2.termin_bezeichnung, T2.datum, T2.erledigt
FROM
    termins T2
WHERE
    T2.students_id = 10002;

SELECT 
    *
FROM
    termins;

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

SELECT 
    bezeichnung AS pruefungs_bez, pruefungsart, pruefungsdatum
FROM
    pruefungs
WHERE
    dozents_id = 100;

SELECT 
    T1.nummer,
    T1.bezeichnung AS pruefungs_bez,
    T1.pruefungsart,
    T1.pruefungsdatum,
    T2.matrikelnummer,
    T3.note
FROM
    pruefungs T1,
    students T2,
    students_has_pruefungs T3
WHERE
    T1.dozents_id = 100
        AND T3.pruefungs_id = T1.id
        AND T3.students_id = T2.id;

SELECT 
    note
FROM
    students_has_pruefungs
WHERE
    students_id = (SELECT 
            id
        FROM
            students
        WHERE
            matrikelnummer = 50001)
        AND pruefungs_id = 3;

SELECT DISTINCT
    T1.id,
    T3.bezeichnung,
    T3.nummer,
    T3.versuch,
    T3.dozents_id,
    T2.semester,
    T3.anmeldedatum,
    T3.pruefungsdatum,
    T4.status,
    T6.benutzername,
    T3.id AS pruef_id
FROM
    students T1,
    moduls T2,
    pruefungs T3,
    students_has_moduls T4,
    students_has_pruefungs T5,
    dozents T6
WHERE
    T1.id = 10002 AND T4.students_id = 10002
        AND T2.id = T4.moduls_id
        AND T5.students_id = 10002
        AND T3.moduls_id = T4.moduls_id
        AND T6.id = T3.dozents_id;

/* Semester eines Studiengangs*/
SELECT DISTINCT
    T1.semester
FROM
    moduls T1,
    studiengangs_has_moduls T2
WHERE
    T2.studiengangs_id = 1;

/* Module eines Semesters */
SELECT DISTINCT
    moduls.bezeichnung, moduls.beschreibung AS moduls_bez
FROM
    pruefungs,
    moduls
WHERE
    moduls.semester = 1;

SELECT 
    T1.*
FROM
    moduls T1,
    studiengangs_has_moduls T3
WHERE
    T3.studiengangs_id = 1
        AND T1.id = T3.moduls_id;

SELECT 
    moduls.id AS moduls_id,
    pruefungs.bezeichnung AS pruefungs_bez,
    pruefungs.pruefungsdatum,
    dozents.nachname
FROM
    pruefungs,
    moduls,
    dozents,
    studiengangs_has_moduls
WHERE
    studiengangs_has_moduls.studiengangs_id = 1
        AND moduls.id = studiengangs_has_moduls.moduls_id
        AND pruefungs.moduls_id = moduls.id
        AND dozents.id = pruefungs.dozents_id;
 
SELECT 
    T1.bezeichnung, T2.pruefungs_id, T2.students_id
FROM
    pruefungs T1,
    students_has_pruefungs T2
WHERE
    T2.students_id = 10002
        AND T1.id = T2.pruefungs_id;

/*Pruefungsinformationen eines Moduls*/
SELECT 
    moduls.bezeichnung AS moduls_as,
    pruefungs.bezeichnung AS pruefungs_bez,
    pruefungs.pruefungsdatum,
    dozents.nachname
FROM
    pruefungs,
    moduls,
    dozents
WHERE
    moduls.semester = 1
        AND pruefungs.moduls_id = moduls.id
        AND dozents.id = pruefungs.dozents_id;
 
SELECT 
    T1.count(note)
FROM
    (SELECT 
        SUM(note), students_id
    FROM
        students_has_pruefungs
    WHERE
        students_id = 10002 AND note IS NOT NULL) T1;

SELECT 
    COUNT(*)
FROM
    students_has_pruefungs
WHERE
    students_id = 10002 AND note IS NOT NULL;

SELECT 
    SUM(note)
FROM
    students_has_pruefungs
WHERE
    students_id = 10002;



SELECT 
    students_id, SUM(note) AS gesamtNote, COUNT(*)
FROM
    students_has_pruefungs
WHERE
    students_id = 10002 AND note IS NOT NULL;

/*anzahl der studierenden* -anzahl der studentenids die in student has studiengang auftauchen, aber jede matrikelnummer nur 1x */


SELECT 
    COUNT(DISTINCT students_id) AS summe_studs
FROM
    students_has_pruefungs;

SELECT 
    *
FROM
    students_has_pruefungs;

SELECT 
    T1.students_id,
    SUM(T1.note) AS gesamtNote,
    COUNT(*) AS count,
    T2.matrikelnummer
FROM
    students_has_pruefungs T1,
    students T2
WHERE
    students_id = 10002 AND note IS NOT NULL
        AND T2.id = 10002;

/*alle module mit semestern eines studiengangs, */
SELECT 
    T1.bezeichnung AS studBezeichnung,
    T2.bezeichnung AS modBezeichnung,
    T2.semester
FROM
    studiengangs T1,
    moduls T2,
    studiengangs_has_moduls T3
WHERE
    T1.id = T3.studiengangs_id
        AND T2.id = T3.moduls_id;

/*anzahl der semester eines studiengangs zählen*/
SELECT 
    T1.bezeichnung AS stud_ezeichnung,
    COUNT(DISTINCT T2.semester) AS semester_anzahl
FROM
    studiengangs T1,
    moduls T2,
    studiengangs_has_moduls T3
WHERE
    T1.id = T3.studiengangs_id
        AND T2.id = T3.moduls_id;



SELECT 
    students_id, SUM(note) AS gesamtNote, COUNT(*)
FROM
    students_has_pruefungs
WHERE
    students_id = 10002 AND note IS NOT NULL;
 
 /*insert*/
INSERT into students_has_pruefungs
values (10001,3,default, NULL);

Insert into termins
values("neue Pruefung", 20190303, 0, 1);
insert into moduls values(5, "Informatik 1 EA", 1, 5, 6, null, 1150);
insert into dozents values (null, "rmüller", "rmüller@hs-bremen.de", "123", "Rudi", "Müller");
insert into studiengangs_has_moduls values (1, 14);
INSERT into pruefungs
values (NULL,4, "Computergrafik", "Klausur", 1, 20200620, 20200920, 1421, 18 ,301);
INSERT into studiengangs
values (NULL,'Internationaler Studiengang Medieninformatik','','Bachelor of Science',210);
/*delete*/

DELETE FROM studiengangs_has_moduls 
WHERE
    moduls_id = 37;
DELETE FROM students 
WHERE
    id = 10014;
DELETE FROM pruefungs 
WHERE
    id = 2;
DELETE FROM termins 
WHERE
    id = 2;
DELETE FROM students_has_pruefungs 
WHERE
    pruefungs_id = 3;