select count(salary)
from employees;

-- 열의행의 개수를 구한다

select count(manager_id)
from employees;

select count(*)
from employees; --전체 행의 개수

select sum(salary), avg(salary)
from employees;

-- 전체의 합에서 전체 개수를 나누면 평균값 
select sum(salary)/count(salary)
from employees;

--누적합계 
select first_name,salary ,
        sum(salary) over (order by first_name)
        from employees;
        

select min(first_name), max(salary)
from employees;        
        
        
--표준편차 stddev/ 분산값 variance
select stddev(salary), variance(salary)
from employees;

select first_name ,salary, 
        STDDEV(salary) OVER (ORDER BY first_name)
        from employees 
        where department_id=9;
        
        
        select *
        from employees;


--group by : 지정한 열의 데이터 값을 기준으로 그룹화하여 집계 함수 적용
select job_id ,sum(salary),avg(salary)
from employees
where department_id =9
group by job_id;

select department_id , min(salary),max(salary)
from employees
where hire_date >'20000101'
group by department_id;

select country_id ,count(country_id)
from locations;

select country_id , count(country_id)
from locations
group by country_id
order by country_id;

select job_id,department_id,sum(salary),avg(salary)
from employees
where department_id between 1 and 9
group by job_id , department_id
order by job_id;


select department_id ,manager_id, 
    sum(salary),avg(salary)
    from employees 
    where department_id=9
    group by department_id,manager_id
    order by manager_id;

--having 
-- WHERE 절에서는 그룹 함수를 사용할 수 없음
-- 그룹화된 집계 결과에 조건식을 적용할 때 HAVING 절 사용

SELECT job_id, SUM(salary), AVG(salary)
FROM employees
GROUP BY job_id
HAVING AVG(salary) > 10000;

select *
from employees;
select manager_id ,department_id,job_id ,
sum(salary),min(salary),max(salary)
from employees
where manager_id in (100,101)
GROUP by manager_id,department_id,job_id
having sum(salary) between 10000 and 30000
order by manager_id ,department_id;

--집계함수 
select count(*)
from employees 
where salary >= 8000;

--실습
select count(*)
from employees 
where hire_date > '00/01/01';

select sum(max_salary),avg(max_salary)
from jobs;

SELECT SUM(SALARY) , AVG(SALARY)
from employees
where job_id='2';

SELECT *
FROM EMPLOYEES ;

alter table employees 
add(commision_pct number);


SELECT first_name, salary, avg(nvl(commision_pct,0)) over (order by first_name)
FROM EMPLOYEES 
WHERE DEPARTMENT_ID BETWEEN 10 AND 20 ;

--집계함수 실습2 

select min(max_salary), max(max_salary)
from jobs;

select min(max_salary), max(max_salary)
from jobs
where job_title= 'programmer';

select min(hire_date), max(hire_date)
from employees
where department_id= 50 ;

select first_name,salary , variance(salary) over (order by hire_date )
from employees
where department_id =10 ;

--그룹함수 
select job_id , min(salary) ,max(salary)
from employees
where hire_date between '00/01/01' and '07/12/31'
group by job_id;

select department_id ,job_id ,sum(salary),min(salary),max(salary) 
from employees 
where department_id in(3,5)
group by department_id ,job_id 
order by job_id;


select department_id, job_id , min(salary),max(salary),avg(salary)
from employees
group by department_id,job_id 
having avg(salary) >= 12000 
order by department_id ;


alter table employees 
drop constraint 