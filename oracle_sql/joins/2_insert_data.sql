-- Departments
INSERT INTO departments (department_name, building) VALUES ('Computer Science', 'Turing Hall');
INSERT INTO departments (department_name, building) VALUES ('Mathematics',      'Euler Building');
INSERT INTO departments (department_name, building) VALUES ('Physics',          'Newton Center');
INSERT INTO departments (department_name, building) VALUES ('English',          'Austen Hall');

-- Professors
INSERT INTO professors (first_name, last_name, email, hire_date, department_id)
VALUES ('Alan',   'Reeves',  'areeves@uni.edu',  DATE '2010-08-15', 1);
INSERT INTO professors (first_name, last_name, email, hire_date, department_id)
VALUES ('Grace',  'Nguyen',  'gnguyen@uni.edu',  DATE '2015-01-10', 1);
INSERT INTO professors (first_name, last_name, email, hire_date, department_id)
VALUES ('Carl',   'Hoffman', 'choffman@uni.edu', DATE '2008-09-01', 2);
INSERT INTO professors (first_name, last_name, email, hire_date, department_id)
VALUES ('Marie',  'Dubois',  'mdubois@uni.edu',  DATE '2012-03-20', 3);
INSERT INTO professors (first_name, last_name, email, hire_date, department_id)
VALUES ('Emily',  'Clarke',  'eclarke@uni.edu',  DATE '2018-08-25', 4);

-- Students
INSERT INTO students (first_name, last_name, email, date_of_birth, enrollment_year, major_dept_id)
VALUES ('Liam',   'Johnson',  'liam.j@student.edu',   DATE '2005-04-12', 2024, 1);
INSERT INTO students (first_name, last_name, email, date_of_birth, enrollment_year, major_dept_id)
VALUES ('Olivia', 'Martinez', 'olivia.m@student.edu', DATE '2004-11-02', 2023, 2);
INSERT INTO students (first_name, last_name, email, date_of_birth, enrollment_year, major_dept_id)
VALUES ('Noah',   'Patel',    'noah.p@student.edu',   DATE '2005-07-30', 2024, 1);
INSERT INTO students (first_name, last_name, email, date_of_birth, enrollment_year, major_dept_id)
VALUES ('Emma',   'Kim',      'emma.k@student.edu',   DATE '2003-01-19', 2022, 3);
INSERT INTO students (first_name, last_name, email, date_of_birth, enrollment_year, major_dept_id)
VALUES ('Ava',    'Brown',    'ava.b@student.edu',    DATE '2005-09-08', 2025, 4);
INSERT INTO students (first_name, last_name, email, date_of_birth, enrollment_year, major_dept_id)
VALUES ('Ethan',  'Garcia',   'ethan.g@student.edu',  DATE '2004-06-25', 2023, NULL);

-- Courses
INSERT INTO courses (course_code, title, credits, department_id) VALUES ('CS101',   'Intro to Programming',   4, 1);
INSERT INTO courses (course_code, title, credits, department_id) VALUES ('CS230',   'Database Systems',       3, 1);
INSERT INTO courses (course_code, title, credits, department_id) VALUES ('MATH201', 'Calculus II',            4, 2);
INSERT INTO courses (course_code, title, credits, department_id) VALUES ('PHYS110', 'General Physics I',      4, 3);
INSERT INTO courses (course_code, title, credits, department_id) VALUES ('ENG105',  'Academic Writing',       3, 4);

-- Sections (Fall 2026 and Spring 2026)
INSERT INTO sections (course_id, professor_id, term, academic_year, room, max_capacity) VALUES (1, 1, 'FALL',   2026, 'TH-101', 40);
INSERT INTO sections (course_id, professor_id, term, academic_year, room, max_capacity) VALUES (2, 2, 'FALL',   2026, 'TH-204', 30);
INSERT INTO sections (course_id, professor_id, term, academic_year, room, max_capacity) VALUES (3, 3, 'FALL',   2026, 'EB-12',  35);
INSERT INTO sections (course_id, professor_id, term, academic_year, room, max_capacity) VALUES (4, 4, 'FALL',   2026, 'NC-300', 50);
INSERT INTO sections (course_id, professor_id, term, academic_year, room, max_capacity) VALUES (5, 5, 'FALL',   2026, 'AH-110', 25);
INSERT INTO sections (course_id, professor_id, term, academic_year, room, max_capacity) VALUES (1, 2, 'SPRING', 2026, 'TH-101', 40);

-- Enrollments (section 6 = past Spring 2026 term, so grades are filled in)
INSERT INTO enrollments (student_id, section_id, enrollment_date, grade) VALUES (1, 6, DATE '2026-01-12', 'A');
INSERT INTO enrollments (student_id, section_id, enrollment_date, grade) VALUES (3, 6, DATE '2026-01-12', 'B+');
INSERT INTO enrollments (student_id, section_id, enrollment_date, grade) VALUES (6, 6, DATE '2026-01-13', 'C');

-- Current Fall 2026 enrollments (no grades yet)
INSERT INTO enrollments (student_id, section_id, enrollment_date) VALUES (1, 2, DATE '2026-08-20');
INSERT INTO enrollments (student_id, section_id, enrollment_date) VALUES (1, 3, DATE '2026-08-20');
INSERT INTO enrollments (student_id, section_id, enrollment_date) VALUES (2, 3, DATE '2026-08-21');
INSERT INTO enrollments (student_id, section_id, enrollment_date) VALUES (2, 5, DATE '2026-08-21');
INSERT INTO enrollments (student_id, section_id, enrollment_date) VALUES (3, 1, DATE '2026-08-22');
INSERT INTO enrollments (student_id, section_id, enrollment_date) VALUES (3, 2, DATE '2026-08-22');
INSERT INTO enrollments (student_id, section_id, enrollment_date) VALUES (4, 4, DATE '2026-08-22');
INSERT INTO enrollments (student_id, section_id, enrollment_date) VALUES (4, 3, DATE '2026-08-23');
INSERT INTO enrollments (student_id, section_id, enrollment_date) VALUES (5, 5, DATE '2026-08-24');
INSERT INTO enrollments (student_id, section_id, enrollment_date) VALUES (5, 1, DATE '2026-08-24');
INSERT INTO enrollments (student_id, section_id, enrollment_date) VALUES (6, 1, DATE '2026-08-25');

COMMIT;

EXIT

