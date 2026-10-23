CREATE TABLE departments (
    department_id    NUMBER(5)       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name  VARCHAR2(100)   NOT NULL UNIQUE,
    building         VARCHAR2(50)
);

CREATE TABLE professors (
    professor_id     NUMBER(8)       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name       VARCHAR2(50)    NOT NULL,
    last_name        VARCHAR2(50)    NOT NULL,
    email            VARCHAR2(120)   NOT NULL UNIQUE,
    hire_date        DATE            NOT NULL,
    department_id    NUMBER(5)       NOT NULL,
    CONSTRAINT fk_prof_dept FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE students (
    student_id       NUMBER(10)      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name       VARCHAR2(50)    NOT NULL,
    last_name        VARCHAR2(50)    NOT NULL,
    email            VARCHAR2(120)   NOT NULL UNIQUE,
    date_of_birth    DATE,
    enrollment_year  NUMBER(4)       NOT NULL,
    major_dept_id    NUMBER(5),
    CONSTRAINT fk_stud_dept FOREIGN KEY (major_dept_id)
        REFERENCES departments(department_id)
);

CREATE TABLE courses (
    course_id        NUMBER(8)       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_code      VARCHAR2(10)    NOT NULL UNIQUE,   -- e.g. CS101
    title            VARCHAR2(150)   NOT NULL,
    credits          NUMBER(2)       NOT NULL CHECK (credits BETWEEN 1 AND 12),
    department_id    NUMBER(5)       NOT NULL,
    CONSTRAINT fk_course_dept FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

-- A course offered in a particular term, taught by one professor
CREATE TABLE sections (
    section_id       NUMBER(10)      GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_id        NUMBER(8)       NOT NULL,
    professor_id     NUMBER(8)       NOT NULL,
    term             VARCHAR2(6)     NOT NULL CHECK (term IN ('FALL','SPRING','SUMMER')),
    academic_year    NUMBER(4)       NOT NULL,
    room             VARCHAR2(20),
    max_capacity     NUMBER(4)       DEFAULT 30 NOT NULL,
    CONSTRAINT fk_sect_course FOREIGN KEY (course_id)    REFERENCES courses(course_id),
    CONSTRAINT fk_sect_prof   FOREIGN KEY (professor_id) REFERENCES professors(professor_id),
    CONSTRAINT uq_section UNIQUE (course_id, term, academic_year, professor_id)
);

CREATE TABLE enrollments (
    student_id       NUMBER(10)      NOT NULL,
    section_id       NUMBER(10)      NOT NULL,
    enrollment_date  DATE            DEFAULT SYSDATE NOT NULL,
    grade            VARCHAR2(2)     CHECK (grade IN ('A','A-','B+','B','B-','C+','C','C-','D','F','W','I')),
    CONSTRAINT pk_enrollments PRIMARY KEY (student_id, section_id),
    CONSTRAINT fk_enr_student FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_enr_section FOREIGN KEY (section_id) REFERENCES sections(section_id)
);

-- Indexes on foreign keys (Oracle doesn't create these automatically)
-- indexes are for performance
CREATE INDEX idx_prof_dept     ON professors(department_id);
CREATE INDEX idx_stud_dept     ON students(major_dept_id);
CREATE INDEX idx_course_dept   ON courses(department_id);
CREATE INDEX idx_sect_course   ON sections(course_id);
CREATE INDEX idx_sect_prof     ON sections(professor_id);
CREATE INDEX idx_enr_section   ON enrollments(section_id);
EXIT

