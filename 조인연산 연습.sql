select * 
from locations;
select * 
from countries;

select * 
from locations,countries;

--일치하는 조건 동등조인 / 내부조인 

--둘다 있는거에 대해서 출력
select * 
from locations l, countries c
where c.country_id=l.country_id;

select * 
from employees;

--직원중에 department_id를 가지고 있는데이터만 
select * 
from employees e , departments d
where e.department_id = d.department_id;

--테이블에 동일한 열이 없는경우 
--조건이 없는경우 
--비동등조인

select *
from employees e,jobs j
where e.salary between j.min_salary and j.max_salary;

select e.first_name , e.hire_date , h.start_date ,h.end_date
from employees e ,job_history h
where e.hire_date between h.start_date and h.end_date;
-- e.hire_date 고용된 날짜가   h.start_date ~ h.end_date 사이에 있으면 출력 


--외부조인 outer join  
--조인하는 테이블에서 조인조건을 만족하지 않는 행도 출력 
--
select  * 
from jobs j ,job_history h 
where j.job_id= h.job_id(+) ;

--셀프조인 
--e.manager_id 가 m.employees_id 와 같은경우    e.manager_id 같은  m.employees_id를 가진사람을 출력 
select e.first_name ,e.last_name , m.first_name,m.last_name
from employees e ,employees m
where e.manager_id = m.employee_id; 

select*
from employees;