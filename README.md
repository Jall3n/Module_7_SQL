# Module_7_SQL: Pewlett-Hackard-Analysis

## Purpose

For this challenge our manager has asked that we determine the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program. We will utilize PostgresSQL to analyize our provided CSV files and generate our initial tables. After looking through our initial data we will generate new tables to show retirement and mentorship information.  

## Results

ERD or Entity Relationship Diagram to visualize the relationship between our datasources
<img width="453" alt="ERDiagram" src="https://github.com/Jall3n/Module_7_SQL/assets/119149740/a867329d-9e55-41c5-9245-c3ff5b24e370">

- The initial retirement table utilized the employee number, first name, last name, title, from date and to date. However, we are shown duplicates stemming from an employee having a title change within the company. Used SELECT DISTICT ON to remove the duplicates and excluded employees that have already left the company. 

![Screenshot 2023-05-21 at 6 07 04 PM](https://github.com/Jall3n/Module_7_SQL/assets/119149740/595a440e-63bd-4275-b3c7-656b737e0e2d)


- Created a unique titles table from our retirement titles table. Utilized SELECT DISTINCT ON and ORDER BY emp_no ASC, to_date DESC. It is where we get the Senior Engineer, Senior Staff, Engineer, Staff, Manager, etc. job titles that we use in the retiring titles data. 

![Screenshot 2023-05-21 at 8 19 05 PM](https://github.com/Jall3n/Module_7_SQL/assets/119149740/a4a1ded6-1ca0-446f-9845-599660b70dc0)


- Out of the 72,458 employes eligible for retirement 25,916 are Senior Engineers and 24,926 are Senior Staff. Utilized COUNT, GROUP BY, and ORDER BY COUNT to create our retiring titles table.

![Screenshot 2023-05-21 at 1 48 30 PM](https://github.com/Jall3n/Module_7_SQL/assets/119149740/64318300-ca49-4736-aca9-833c76e2c6d9)


- A screenshot of the employees that are eligible for the mentorship program with a total of 1,549 rows. Utilized INNER JOIN to merge dept_emp and titles with employees data. 

        INNER JOIN dept_emp as de
            ON (e.emp_no = de.emp_no)
        INNER JOIN titles as ts
            ON (e.emp_no = ts.emp_no)

![Screenshot 2023-05-21 at 7 49 01 PM](https://github.com/Jall3n/Module_7_SQL/assets/119149740/fd49afba-7fb1-41cb-b0a2-3357dd898cd5)


## Summary

1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?

Used SUM to find the totals and from that we figure out that around 16% of the employees are eligible for retirement.

443,308 total employees

    SELECT SUM(count) AS "Total Employees"
    FROM employee_number;

72,458 employees eligibile for retirement

    SELECT SUM(count) AS "Total Retirees"
    FROM retiring_titles;

2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees? In the senior level roles such as Senior Engineer and Senior Staff there are enough retirement ready employees to act as mentors. 

Created a mentor_titles table that counts the number of titles that fall under the mentorship eligibility data.

![Screenshot 2023-05-21 at 8 26 39 PM](https://github.com/Jall3n/Module_7_SQL/assets/119149740/cc607f74-59df-433d-aa46-805ad1a7e7c1)

Then made a table that counts the number of eligible mentors with the number of potential retirees to find the difference between the two. Inverse the difference column. A negative amount means there are more retirement-ready employees. 

![Screenshot 2023-05-21 at 8 25 11 PM](https://github.com/Jall3n/Module_7_SQL/assets/119149740/91721087-ecc7-4300-acdc-7c91816e8b78)


### Resources
https://learnsql.com/blog/difference-between-two-rows-in-sql/
https://courses.bootcampspot.com/courses/2957/pages/7-dot-3-5-create-additional-lists?module_item_id=870082
