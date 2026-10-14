DROP TABLE IF EXISTS salaries_sf;

CREATE TABLE salaries_sf (
    id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    job_title VARCHAR(255),
    base_pay NUMERIC(12, 2),
    overtime_pay NUMERIC(12, 2),
    other_pay NUMERIC(12, 2),
    benefits NUMERIC(12, 2),
    total_pay NUMERIC(12, 2),
    total_pay_benefits NUMERIC(12, 2),
    year INT,
    notes TEXT,
    agency VARCHAR(255),
    status VARCHAR(100)
);

\copy salaries_sf FROM '/imports/Salaries.csv' WITH (FORMAT csv, HEADER true, NULL '', ON_ERROR ignore)
