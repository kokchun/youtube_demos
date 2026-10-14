DESC system.students;

ALTER TABLE students
ADD email VARCHAR2(100);

SELECT * FROM students;

ALTER TABLE students
MODIFY major VARCHAR2(100);

DESC system.students;

ALTER TABLE students
MODIFY email VARCHAR2(100) NOT NULL;

ALTER TABLE students
MODIFY major VARCHAR2(100) NOT NULL;

DESC system.students;
ALTER TABLE students DROP COLUMN email;

DESC system.students;


EXIT
