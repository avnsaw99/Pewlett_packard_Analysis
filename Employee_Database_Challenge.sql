--CHALLENGE

--TABLE 1 -

SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date

INTO retirement_titles
FROM employees AS e
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

SELECT * FROM retirement_titles

--Table 2 Unique Titles

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.titles

INTO unique_titles
FROM retirement_titles AS rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles

--Table 3

SELECT COUNT(ut.emp_no), ut.titles
INTO retiring_titles
FROM unique_titles as ut
GROUP BY titles
ORDER BY COUNT(titles) DESC;

select * from retiring_titles

--Deliverable 2
--Mentorship eligibility table

SELECT DISTINCT ON(e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.titles
--DISTINCT ON(emp_no)
INTO mentorship_table
FROM employees AS e
	INNER JOIN dept_employees AS de
		ON (e.emp_no = de.emp_no)
			INNER JOIN titles AS ti
				ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

select * from mentorship_table
