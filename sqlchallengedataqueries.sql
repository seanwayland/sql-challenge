/*
List the following details of each employee:
employee number, last name, first name, gender, and salary.

*/

select (employees.emp_no, last_name, first_name, gender, salary) from "sql-challenge".employees
JOIN "sql-challenge".salaries on "sql-challenge".employees.emp_no = salaries.emp_no;

/*
 List employees who were hired in 1986.
 */

select (first_name, last_name, hire_date) from "sql-challenge".employees where (extract(year from hire_date )) = 1986;

/*
 List the manager of each department with the following information:
 department number, department name, the manager's employee number, last name,
 first name, and start and end employment dates.
 */

select (departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date) from "sql-challenge".dept_manager
JOIN "sql-challenge".departments on "sql-challenge".dept_manager.dept_no = departments.dept_no
JOIN "sql-challenge".employees on  dept_manager.emp_no = employees.emp_no;

/*
 List the department of each employee with the following information: employee number, last name, first name, and department name.
 */
select (employees.emp_no,  employees.last_name, employees.first_name, departments.dept_name) from "sql-challenge".dept_emp
JOIN "sql-challenge".employees on "sql-challenge".dept_emp.emp_no = employees.emp_no
JOIN "sql-challenge".departments on  departments.dept_no = dept_emp.dept_no;

/*
 List all employees whose first name is "Hercules" and last names begin with "B."
 */

select ( emp_no, first_name, last_name) from "sql-challenge".employees as a
where a.first_name = 'Hercules' AND LEFT(a.last_name, 1) = 'B';

/*
 List all employees in the Sales department,
 including their employee number, last name, first name, and department name
 */

select (employees.emp_no,  employees.last_name, employees.first_name, departments.dept_name) from "sql-challenge".dept_emp
JOIN "sql-challenge".employees on "sql-challenge".dept_emp.emp_no = employees.emp_no
JOIN  "sql-challenge".departments on "sql-challenge".departments.dept_no = "sql-challenge".dept_emp.dept_no
WHERE "sql-challenge".departments.dept_name = 'Sales'

/*
 List all employees in the Sales and Development departments,
 including their employee number, last name, first name, and department name.
 */

select (employees.emp_no,  employees.last_name, employees.first_name, departments.dept_name) from "sql-challenge".dept_emp
JOIN "sql-challenge".employees on "sql-challenge".dept_emp.emp_no = employees.emp_no
JOIN  "sql-challenge".departments on "sql-challenge".departments.dept_no = "sql-challenge".dept_emp.dept_no
WHERE "sql-challenge".departments.dept_name = 'Sales' or "sql-challenge".departments.dept_name = 'Development'

/*
 In descending order, list the frequency count of employee last names,
 i.e., how many employees share each last name.
 */
SELECT last_name, COUNT(last_name) AS "name counts"
FROM "sql-challenge".employees
group by employees.last_name
order by COUNT(employees.last_name) DESC



