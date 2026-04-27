SELECT 
    employee.emp_id employee_id,
    employee.emp_name employee_name,
    employee.salary employee_sal,
    manager.emp_name manager_name,
    manager.salary manager_sal
FROM
    emp employee,
    emp manager
WHERE
    employee.manager_id = manager.emp_id
    and employee.salary > manager.salary;
    
