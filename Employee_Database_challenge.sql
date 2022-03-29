
--- Deliverable 1
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE to_date = '9999-01-01';

select ut.title, count(ut.title) 
INTO retiring_titles
FROM unique_titles as ut group by title
ORDER BY count DESC;

--- Deliverable 2
SELECT e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility_duplicates
FROM employees as e
LEFT JOIN dept_emp as de
ON e.emp_no = de.emp_no
LEFT JOIN titles as t
ON e.emp_no = t.emp_no 
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31';

SELECT DISTINCT ON (med.emp_no) med.first_name, med.last_name, med.birth_date, med.from_date, med.to_date, med.title
INTO mentorship_eligibility
FROM mentorship_eligibility_duplicates as med
WHERE to_date = '9999-01-01'
ORDER BY med.emp_no;