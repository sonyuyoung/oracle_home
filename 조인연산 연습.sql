select * 
from locations;
select * 
from countries;

select * 
from locations,countries;

--��ġ�ϴ� ���� �������� / �������� 

--�Ѵ� �ִ°ſ� ���ؼ� ���
select * 
from locations l, countries c
where c.country_id=l.country_id;

select * 
from employees;

--�����߿� department_id�� ������ �ִµ����͸� 
select * 
from employees e , departments d
where e.department_id = d.department_id;

--���̺� ������ ���� ���°�� 
--������ ���°�� 
--�񵿵�����

select *
from employees e,jobs j
where e.salary between j.min_salary and j.max_salary;

select e.first_name , e.hire_date , h.start_date ,h.end_date
from employees e ,job_history h
where e.hire_date between h.start_date and h.end_date;
-- e.hire_date ���� ��¥��   h.start_date ~ h.end_date ���̿� ������ ��� 


--�ܺ����� outer join  
--�����ϴ� ���̺��� ���������� �������� �ʴ� �൵ ��� 
--
select  * 
from jobs j ,job_history h 
where j.job_id= h.job_id(+) ;

--�������� 
--e.manager_id �� m.employees_id �� �������    e.manager_id ����  m.employees_id�� ��������� ��� 
select e.first_name ,e.last_name , m.first_name,m.last_name
from employees e ,employees m
where e.manager_id = m.employee_id; 

select*
from employees;