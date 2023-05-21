# Module_7_SQL: Pewlett-Hackard-Analysis

## Purpose

For this challenge our manager has asked that we determine the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program. We will utilize PostgresSQL to analyize our provided CSV files and generate our initial tables. After looking through our initial data we will generate new tables to show retirement and mentorship information.  

## Results

ERD or Entity Relationship Diagram to visualize the relationship between our datasources
<img width="453" alt="ERDiagram" src="https://github.com/Jall3n/Module_7_SQL/assets/119149740/a867329d-9e55-41c5-9245-c3ff5b24e370">

1. 
2. Out of the 72,458 employes eligible for retirement 25,916 are Senior Engineers and 24,926 are Senior Staff.

![Screenshot 2023-05-21 at 1 48 30 PM](https://github.com/Jall3n/Module_7_SQL/assets/119149740/64318300-ca49-4736-aca9-833c76e2c6d9)

Using SUM we find out that there are 72,458 employees eligibile for retirement

    SELECT SUM(count) AS "Total Retirees"
    FROM retiring_titles;

3.
4.

## Summary

1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?


### Resources
https://learnsql.com/blog/difference-between-two-rows-in-sql/
https://courses.bootcampspot.com/courses/2957/pages/7-dot-3-5-create-additional-lists?module_item_id=870082
