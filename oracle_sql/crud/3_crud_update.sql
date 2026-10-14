DESC system.students;

SELECT * FROM students;

SELECT * 
FROM students
WHERE first_name = 'Emma' AND last_name = 'Watson';

UPDATE students
SET gpa=4
WHERE first_name = 'Emma' AND last_name = 'Watson';

SELECT * FROM students;

COMMIT;

EXIT
