select *
from employees
where hire_date = (select hire_date 
                    from employees
                    where email like '%king%'
                    );

select *
from employees
where hire_date >= (select hire_date 
                    from employees
                    where email like '%king%'
                    );
--조건은 단일행이 와야함

select *
from employees 
where salary = (select salary 
                from employees
                where hire_date = '90/01/03');
                --고용된날짜가 '90/01/03' 직원의 월급과 같은 사람들의 정보
select *
from employees 
where salary >= (select salary 
                from employees
                where hire_date = '90/01/03');
                --고용된날짜가 '90/01/03' 직원의 월급 이


--다중행서브쿼리
select *
from employees
where salary in (select MAX(salary)
                 from employees
                 group by department_id);
                  
--부서별로 직원의 가장 샐러리가 높은사 
select MAX(salary)
from employees
group by department_id
order by max(salary) asc;

select *
from employees
where salary in (4400,6500,8200,9000,10000,11000,..) ;     


--부서별로 샐러리가 제일높은사람 제외 
select *
from employees
where salary not in (select MAX(salary)
                     from employees
                      group by department_id);
--값의 여부를 확인하는 용도                      
select *
from employees                    
where exists (select *
              from employees
              where employee_id =100 );
              
select *
from employees
where employee_id =100;    


--any / all 6000,10000,12000 조건을 충족 하나라도 만족하면 true
select *
from employees 
where salary = any(6000,10000,12000);

select *
from employees 
where salary != any(6000,10000,12000);

--3개의 조건중 하나라도 만족하는거면 질의결과로 나옴
select *
from employees 
where salary < any(6000,10000,12000);

--6000이하만 나옴
select *
from employees 
where salary <= all(6000,10000,12000);
--12000 이상만 나옴
select *
from employees 
where salary >= all(6000,10000,12000);

--6000,10000,12000 없
select *
from employees 
where salary <> all(6000,10000,12000);


--기준이되는 가장큰값으로 그값 밑으로 다 나옴
select *
from employees 
where salary < any (select salary 
                    from employees
                    where hire_date > '90/01/03');
                    
select salary 
from employees
where hire_date > '90/01/03';                  


select *
from employees 
where salary < all (select salary 
                    from employees
                    where hire_date > '94/08/01');
                    
select salary 
from employees
where hire_date > '94/08/01';    

--제일 작은 4400보다 큰 샐러리의 정보가 다옴  
select *
from employees 
where salary > any (select max(salary)
                    from employees 
                    group by department_id);
select max(salary)
from employees 
group by department_id;

--제일 작은 4400보다 작은 샐러리의 정보가 다옴  
select *
from employees 
where salary  all (select max(salary)
                    from employees 
                    group by department_id);
                    
--전체를 모두 만족하는 경우는 all
--그중에 하나만 만족하는 경우는 any 라고 기억


select *
from employees e , (select department_id 
                      from departments
                      where department_name ='IT') D
WHERE e.department_id = d.department_id ;




select department_id 
from departments
where department_name ='IT';


select department_name 
from departments;


select e.last_name m e,salary , d.avg_sal
from employees e , department d
where e.department_id = d.department_id ;


select e.last_name, e.salary , d.avg_sal
from employees e ,(select department_id,
                    avg(salary) avg_sal 
                    from employees 
                    group by department_id )d
where e.department_id = d.department_id
and e.salary >d.avg_sal;

select department_id, avg(salary) avg_sal 
from employees 
group by department_id;


select department_name , (select avg(salary)
                          from employees
                          group by department_name)
from departments;


--10번이하 
select rownum ,salary
from ( select salary 
        from employees 
        order by salary desc)
where rownum <=10;        



--실습

select first_name ,last_name , job_id , salary 
from employees 
where department_id = (select department_id 
                        from departments 
                        where department_name = 'IT');

--실습2                      
select department_id,department_name
from departments
where location_id = (select location_id                        
                     from locations 
                     where state_province='California');

--실습3
select city,state_province,street_address
from locations
where country_id IN (select country_id
                    from countries
                    where region_id = 2 );


--실습 4
select first_name, last_name,job_id,salary
from employees 
where department_id in (select department_id
                       from departments
                       where manager_id is not null );
                  
--실습 5
select department_id,department_name  
from departments                       
where location_id not in (select location_id                       
                          from locations
            
                      where city = 'Seattle');

--실습 6
select city ,state_province, street_address 
from locations
where country_id in (select country_id
                     from countries 
                     where region_id in (select region_id                          
                                         from regions
                                         where region_name='Europe'))


