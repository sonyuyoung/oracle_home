--데이터 정의어 : DDL(data definition language ): 데이터베이스 객체들을 정의하는데 사용
--객체 - 테이블/뷰/인덱스/시퀀스/시노님 

--create :데이터 베이스 객체생성
--drop : 데이터베이스 객체 삭제 
--alter :데이터 베이스 객체 수정
--truncate : 테이블내의 전체 데이터 삭제


--데이터베이스 객체 생성 
--create table 
--(열이름 데이터 타입
--열이름2 테이터타입);
--• 테이블 이름 중복 불가
--• 테이블 내 열 이름 중복 불가
--• 데이터베이스 예약어 사용 불가(check,insert,create,...)
--• 1~30 바이트 영어 이름을 권장

create table customers
    (customer_id number         not null    PRIMARY KEY,
    first_name  varchar2(10)    not null,
    last_name   varchar2(10)    not null,
    email       varchar2(10),    
    phone_number    varchar2(20),
    regist_date     date );
    
SELECT *
FROM CUSTOMERS;


insert into customers
values 
(2,'yuyoung','son',
'asd3205','010-4733-2048','23/07/30');

insert into customers
values f
(4,'bill','gates',
'bill','010-5555-6666','21/11/01');

insert into customers
values 
(5,'mark','zukerberg',
'mark','010-7777-8888','21/05/01');

--alter 열추가 
--새로운 열 추가 가능
--하지만
--• 기존 열 제거 불가능
--• 열의 위치 지정 불가능
--• 새로운 열의 데이터 값은 null

--예시)
--ALTER TABLE customers
--ADD (열이름1 데이터 타입,
--열이름1 데이터 타입,...  );


ALTER TABLE customers
ADD (gender varchar2(10));


ALTER TABLE customers
ADD (age number);

ALTER TABLE customers
ADD ( dob date );


select *
from customers;

UPDATE customers
set gender ='male', age = 40 , dob= '80/07/12'
where customer_id = 3;

UPDATE customers
set gender ='male', age = 60 , dob= '60/06/02'
where customer_id = 4;

UPDATE customers
set gender ='male', age = 70 , dob= '65/04/02'
where customer_id = 5;


--제약조건을 지정한다
--예시)
--ALTER TABLE 테이블 이름
--ADD CONSTRAINT 제약조건 이름
--CHECK ( 조건 지정 );

ALTER TABLE customers
ADD CONSTRAINT AK_email 
UNIQUE (email);

ALTER TABLE customers
ADD CONSTRAINT AK_phone
UNIQUE (phone_number);

ALTER TABLE customers
ADD CONSTRAINT CK_age
CHECK (age >= 0);
--AGE가 0 이상으로 입력 


select *
from customers;


insert into customers
values 
(6,'yuyoung','son',
'asd32052','010-4733-2040','23/07/30','female','29','93/08/13');

--ALTER TABLE 테이블 이름
--MODIFY ( 열 이름 1 데이터 타입,
--열 이름 2 데이터 타입,
--…,
--열 이름 N 데이터 타입
--);


UPDATE customers
SET first_name = 'steven paul', gender = 'male',age = 50, 
dob ='50/01/01'
where customer_id = 3; 
--기존에 first_name의 값이 10 이라서 오류가남

ALTER TABLE customers
MODIFY (first_name varchar2(30));
--first_name의 열 크기를 varchar2(20)->(30)으로 변경 해줌 

ALTER TABLE customers
MODIFY (last_name varchar2(30));
--last_name의 열 크기를 varchar2(20)->(30)으로 변경 해줌 

ALTER TABLE customers
MODIFY (email varchar2(30));
--email의 열 크기를 varchar2(20)->(30)으로 변경 해줌 

ALTER TABLE customers
MODIFY age DEFAULT 0;
--age 값이 없을때 null 값이 아닌 0으로 하기

select *
from customers;

UPDATE customers
SET first_name = 'william henry', gender = 'male',age = 40, 
dob ='89/01/01'
where customer_id = 4; 

insert into customers (customer_id ,first_name ,last_name,email)
values (7,'lawrence edward','page','larry');


--ALTER TABLE RENAME/DROP COLUMN
--ALTER TABLE 테이블 이름
--RENAME COLUMN 열 이름 TO 변경할 열 이름;
ALTER TABLE customers
RENAME COLUMN phone_number to phone ;

ALTER TABLE customers
RENAME COLUMN dob to date_of_birth ;


ALTER TABLE customers
DROP COLUMN date_of_birth;

ALTER TABLE customers
DROP CONSTRAINT CK_age;


--<TRUNCATE/DROP TABLE:테이블의 모든 데이터 삭제 (테이블 구조 유지)>

TRUNCATE TABLE customers;

DROP TABLE customers;

select *
from products;

--[실습] 테이블 생성
create table products
( product_id   number       NOT NULL    PRIMARY KEY,
  product_name varchar2(10) NOT NULL,
  reg_date     date );
  
  insert into products
  VALUES (1,'computer','21/01/01');
   insert into products
  VALUES (2,'smartphone','21/02/01');
  insert into products
  VALUES (3,'television','21/03/01');
  
  --[실습] 테이블 열/제약조건 추가

alter table products
add (weight number);

alter table products
add (price number);

--제약조건 추가
alter table products 
add CONSTRAINT ck_weight
check (weight >=0 );

alter table products 
add CONSTRAINT ck_price
check (price >=0 );

update products
set  weight = 10 , price = 1600000
where product_id = 1;

update products 
set weight=0.2, price = 1000000
where product_id=2;

update products 
set weight=20, price = 2000000
where product_id=3;

select *
from products;


--테이블 열수정 
alter table products 
rename column reg_date to regist_date ;

alter table products 
modify (product_name varchar2(30));

alter table products 
drop column weight;

--모든데이터를 삭제 그러나 테이블 구조는남김 truncate 

truncate table products;

--테이블 완전삭제 
drop table products;
