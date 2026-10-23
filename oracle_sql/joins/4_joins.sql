-- what professors are teaching what courses and when?
SELECT 
    p.first_name AS prof_fname,
    p.last_name AS prof_lname,
    s.term || ' ' ||  s.academic_year AS time,
    c.title AS course_name,
    c.credits
FROM professors p
JOIN sections s ON s.professor_id = p.professor_id
JOIN courses c ON c.course_id = s.course_id;

-- what courses students are enrolled in?
-- what departments are those in?
SELECT 
    s.first_name || ' ' || s.last_name AS student_name,
    c.title AS course_name,
    d.department_name
FROM students s
JOIN enrollments e ON e.student_id = s.student_id
JOIN sections sec ON sec.section_id = e.section_id
JOIN courses c ON c.course_id = sec.course_id
JOIN departments d ON d.department_id = c.department_id;



EXIT
