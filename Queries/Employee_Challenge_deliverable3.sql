-- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
-- Count the number of employees
SELECT ts.title, COUNT (ts.title)
INTO employee_number
FROM titles AS ts
GROUP BY ts.title
ORDER BY COUNT DESC;

Select * From employee_number

-- 443,308 employees
SELECT SUM(count) AS "Total Employees"
FROM employee_number

-- Find total number of Retirees: 72,458
SELECT SUM(count) AS "Total Retirees"
FROM retiring_titles;

-- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
SELECT me.title, COUNT (me.title)
INTO mentor_titles
FROM mentorship_eligibility AS me
GROUP BY me.title
ORDER BY COUNT DESC;

-- combine mentor titles with retirement titles
SELECT DISTINCT ON (rt.title) rt.title,
	mt.count AS mentor_count,
    rt.count AS retire_count
INTO combined_mentor_retire
FROM retiring_titles AS rt
LEFT JOIN mentor_titles AS mt
    ON (rt.title = mt.title);

SELECT title,
	cmr.mentor_count,
	cmr.retire_count,
	cmr.mentor_count - cmr.retire_count AS difference
INTO combined_table_difference
FROM combined_mentor_retire AS cmr;
