-- Retirees table 
SELECT  e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date

INTO retirement_titles
FROM employees as e
INNER JOIN titles AS t 
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
SELECT * FROM retirement_titles

-- Use DISTINCT with ORDR BY to remove dupes

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC;

SELECT * FROM unique_titles

-- Retiring titles COUNT
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;