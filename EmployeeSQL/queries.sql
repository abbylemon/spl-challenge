--List the following details of each employee: employee number, last name, first name, gender, and salary.

select e."emp_no", e."last_name", e."first_name", e."gender", s."salary"
from "employees" e
left join "salaries" s
on e."emp_no" = s."emp_no"
;

--List employees who were hired in 1986.

select e."emp_no", e."hire_date"
from "employees" e
where "hire_date" like '1986%';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

select dm."dept_no", d."dept_name", e."emp_no", e."last_name", e."first_name", de."from_date", de."to_date" 
from "dept_manager" dm
left join "departments" d
on dm."dept_no" = d."dept_no"
left join "dept_emp" de
on dm."emp_no" = de."emp_no"
left join "employees" e
on de."emp_no" = e."emp_no";

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select e."emp_no", e."last_name", e."first_name", d."dept_name"
from "employees" e
left join "dept_emp" de
on e."emp_no" = de."emp_no"
left join "departments" d
on de."dept_no" = d."dept_no";

--List all employees whose first name is "Hercules" and last names begin with "B."

select e."first_name", e."last_name"
from "employees" e
where "first_name" = 'Hercules'
and "last_name" like 'B%';

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

select e."emp_no", e."last_name", e."first_name", d."dept_name"
from "departments" d
left join "dept_emp" de
on d."dept_no" = de."dept_no"
left join "employees" e
on de."emp_no" = e."emp_no"
where "dept_name" = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

select e."emp_no", e."last_name", e."first_name", d."dept_name"
from "departments" d
left join "dept_emp" de
on d."dept_no" = de."dept_no"
left join "employees" e
on de."emp_no" = e."emp_no"
where "dept_name" in ('Sales', 'Development')
order by d."dept_name";

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

select "last_name",
count("last_name") as number_of_employees_with_last_name
from "employees"
group by "last_name"
order by number_of_employees_with_last_name DESC;


