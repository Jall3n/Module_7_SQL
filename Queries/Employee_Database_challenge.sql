-- Deliverable 1 The Number of Retiring Employees by Title
------------------------------------------------------------
-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name 
FROM employees
-- Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date 
FROM titles

-- Create a new table using the INTO clause &
-- Join both tables on the primary key &
-- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number 
-- ascending to match image in challenge
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ts.title,
	ts.from_date,
	ts.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as ts
ON e.emp_no = ts.emp_no
WHERE (e.birth_date between '1951-01-01' and '1955-12-31')
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows & 
-- Retrieve the employee number, first and last name, and title coulmns from the Retirement titles table.
-- Use DISTINCT ON to retrieve first occurrence of employee number for each set of rows defined by ON() clause.
-- Exclude employees that have already left the company. Create Unique Titles table 
-- and sort table in ascending order by employee number and descending order by last date of most recent title
SELECT DISTINCT ON (rt.emp_no)
    rt.emp_no,
    rt.first_name,
    rt.last_name,
    rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY emp_no ASC, to_date DESC;
-- First, retrieve the number of titles from the Unique Titles table.
-- Then, create a Retiring Titles table to hold the required information.
-- Group the table by title, then sort the count column in descending order.
SELECT ut.title, COUNT (ut.title)
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT DESC;
-- view table before exporting
SELECT * FROM unique_titles
SELECT * FROM retiring_titles

-- Deliverable 2 The Employees Eligible for the Mentorship Program
--------------------------------------------------------------------
-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table
-- Retrieve the title column from the Titles table
-- Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
-- Create a new table using the INTO clause.
-- Join the Employees and the Department Employee tables on the primary key.
-- Join the Employees and the Titles tables on the primary key.
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
    ON (e.emp_no = de.emp_no)
INNER JOIN titles as ts
    ON (e.emp_no = ts.emp_no)
-- Filter the data on the to_date column to all the current employees, 
-- then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
-- Order the table by the employee number. Module 7.3.5
WHERE (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
    AND (de.to_date = '9999-01-01')
ORDER BY emp_no ASC;

SELECT * FROM mentorship_eligibility


