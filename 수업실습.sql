use testdb;  #db 선택
 
select*from dept; #테이블내 모든 데이터 보기
select*
from dept;
select *from emp; 

select empno,ename,job,hiredate,job 
from emp; 


select empno, ename, sal, sal *1.1, round(sal *1.1)
#전체중 보고싶은거 고른거, 중복가능
from emp; 
#emp 에서
#db건드는게 아니고 연산된 결과만 표현해줌
-- 별칭 as사용, 생략가능하지만 가독성을 위해 as 사용권장
select empno as 사번, ename as 성명, sal 급여, sal*12 as "연 봉"
#as별칭은 띄어쓰기가 안된다 하려면 ""로 묶어주어야 한다
from emp;
-- 리터럴
select empno as 사번, ename as 성명, sal 급여, sal*12 as "연 봉", '홍길동'
from emp;

-- null 값 연산
select empno, ename, sal, comm, (sal*12) + 
comm,0 as 연봉1, (sal*12) + ifnull(comm,0) as 연봉2
from emp;

select deptno
from emp;
-- distinct 중복제거 distinct 바로 뒤 값만 적용 된다
select distinct deptno
from emp;

select *
from emp
where sal != 3000;

select *
from emp
where ename = 'SMITH';

select *
from emp
where ename = 'smith';

select *
from emp
where hiredate = '1980-12-17';

select *
from emp
where hiredate > '1980-12-17'; -- 1970-01-01이 기준

-- 범위 연산자 between
select *
from emp
where sal between 3000 and 5000;

select *
from emp
where hiredate between'1980-12-17' and '1983-12-17' ;

select *
from emp
where sal in (800,3000,1500);

select *
from emp
where ename in ('SMITH','FORd');

select *
from emp
where sal between ('1981-12-03','1980-12-19'tb_department);

-- is null
select *
from emp
where comm is null; -- job이 salesman이 아닌 레코드 검색

select *
from emp
where comm is not null; -- job이 salesman인 레코드 검색

select *
from emp
where ename LIKE '%A%';

select *
from emp
where ename LIKE 'A%';

select *
from emp
where ename LIKE '_____R'; -- 이름이 6글자고 R로 끝나는 것

select *
from emp
where ename LIKE '_____R%'; -- 이름이 6글자고 R로 끝나고 뒤로 더붙어도 됨

-- and or not
select *
from emp
where ename = 'SMITH' and sal > 3000;

select *
from emp
where ename = 'SMITH' or sal > 3000;

select *
from emp
where ename != 'SMITH';

select *
from emp
where ename = 'SMITH';

select *
from emp
where not sal between 3000 and 5000;

select *
from emp
where not sal in (800,3000,1500);

select *
from emp
where not ename LIKE 'A%';

select *
from emp
where not ename LIKE '%A%';

-- 정렬
select *
from emp
order by sal; -- 오름차순

select *
from emp
order by sal asc; -- 오름차순

select *
from emp
order by sal desc; -- 내림차순

select *
from emp
order by hiredate desc; -- 내림차순

select *
from emp
order by sal desc, hiredate desc; -- sal로 먼저 내림차순하고 그뒤 hiredate 기준으로 내림차순 한번 더한다

select ename, ename, sal as salary, hiredate
from emp
order by salary desc, 4 desc; -- order by 옆에 별칭도 올 수 있고 select 에서 지정된 순서도 숫자로 지정 가능하다

-----------------------------------
-- 문자함수
select empno, lower(ename), upper(ename), upper('heLLo')
from emp;

select empno, concat(ename, '  ',sal, ',',hiredate)
from emp;

select empno, concat_ws(",",ename,sal,hiredate)
from emp;

select empno, lpad(ename, 10,'*'),rpad(ename, 10,'*')
from emp;

select empno, substr(ename, 2), substring(ename, 2,2)
from emp;
-- substr = substring(가져올곳,n부터,n글자수)
select empno, length(ename), length('홍길동'), char_length('홍길동')
 -- 한글은 하나에 3byte, length는 byte로 센다 char_length는 표현되는 길이로 
from emp;

select ename, REPLAce(sal,'0','o'),insert('Quadratic',3,4,'what')
from emp;
-- insert(치환될문자,시작위치,몇개,치환될문자) 기본의 문자에서 치환

select ename, instr(ename,'NES')
from emp;
-- instr(찾을곳, 찾을 문자) 지정된 문자를 주고 찾는것 못찾으면 0 반환

-- ltrim(),rtrim()좌,우측 공백 체거
-- trim( '       bar         ') 양쪽 공백 제거
select ename, ltrim('           hello        '),
rtrim('           hello        '),
trim('           hello        ')
from emp;

select ename, trim(leading 'x' from 'xxxxxhelloxxxxxxx'),
			trim(trailing 'x' from 'xxxxxhelloxxxxxxx'),
            trim(both'x' from 'xxxxxhelloxxxxxxx')
from emp;
-- leading좌측부터 trailing우측부터 both양쪽 에서 x를 지운다

select empno, concat(ename, '      ',sal),
				concat(ename, space(6),sal)
from emp; -- 공백을 space()로 대체 가능하다

select format(12332.123456,4); -- 
select format(12332.123456,0); -- 소수점 날림
select format(12332.123456,4,'ko_kr'); -- 한국어 포맷

select left(12332.123456,5); -- 왼쪽에서 5글자 
select right(12332.123456,5); -- 우측에서 5글자 

-- 수치함수
select abs(2), abs(-22); -- 절대값 abs
select sign(-32),sign(0)sign(-322222);
select round(1234.456),round(-322.222,1); -- 반올림 소수점자리수 생략 가능
select truncate(1.999,1),truncate(1.999,0); -- 절삭(버림), 소수점 자릿수 생략 불가 남길 소수점 자리수를 넣는다
select ceil(1.23); -- 소수점을 가진 값을 정수로 변경, 지정값 과 같거나 큰 정수로 리턴
select floor(1.23); -- 소수점을 가진 값을 정수로 변경, 지정값 과 같거나 작은 정수로 리턴
select mod(234,10), 56 % 7;

-- 날짜함수
select now(), now() +0, sysdate();
-- now는 sql 문 이실행되는 시점
select now(), sleep(2), now();
select sysdate(), sleep(2), sysdate();
-- sysdate는 함수가 호출되는 시점
select curdate();

select adddate(now(),3), subdate(now(),20);


select date_add('2008-01-02',interval 31 day);
select date_add('2008-01-02',interval 31 year);
select date_add('2008-01-02',interval 31 month);

select date_sub('2008-01-02',interval 31 day);
select date_sub('2008-01-02',interval 31 year);
select date_sub('2008-01-02',interval 31 month);

select datediff('2008-12-31 23:59:59','2007-12-30');

select timestampdiff(day,'2003-02-01','2003-05-01');
select timestampdiff(month,'2002-05-01','2001-01-01');
select timestampdiff(year,'2002-05-01','2001-01-01');

select now(), date_format(now(), '%y-%m-%d %h:%i:%s'),
			date_format(now(), '%y년%m월%d일 %h:%i:%s'),
            date_format(now(), '%y-%m'),
            date_format(now(), '%h:%i:%s')
            ;
            
select str_to_date('2019년2월23일','%Y년%m월%d일'),
str_to_date('20190223','%Y%m%D'),
 str_to_date('02232009','%m%d%Y')
 ;
 
select empno, ename, sal, if(sal>3000,'과장이상','일반사원')
from emp;

select empno, ename, job, sal, 
case job when 'CLERK' then sal * 1.1
	when 'MANAGER' then sal * 1.2
    when 'ANALYST' then sal * 1.4
    else sal
	end as 실수령
from emp;

select empno, ename, job, sal, 
case job when sal>3000 then '이사급'
	when sal>3200  then '과장급'
	else '사원급'
	end as 실수령
from emp;

select cast(10 as char); -- 10을 "10"으로
select cast(10 as float); -- 

select cast('10' as unsigned); -- "10"-->10
select cast('2010-02-23' as Date); -- 문자를 날자로 


-- 그룹함수
use testdb;
select job, sum(sal), avg(sal), max(sal), min(sal), count(sal)
-- job별 sal의 sum avg max min count
from emp
group by job;

select deptno, sum(sal), avg(sal), max(sal), min(sal), count(sal), count(comm)
from emp
group by deptno;

select deptno as no, sum(sal), avg(sal), max(sal), min(sal), count(sal), count(comm)
from emp
where sal > 1000
group by deptno -- 부서별
having sum(sal)>9000;

select deptno, job, sum(sal), avg(sal), max(sal), min(sal), count(sal), count(comm)
from emp
where sal > 1000
group by deptno, job -- 부서별로 묶고 추가로 job으로 묶는다
having sum(sal)>9000;

select count(comm), count(sal), count(*) -- count(*) 은 무조건 전체 레코드 수를 센다 즉 null도 센다
from emp;

-- 조인
-- cross join
use testdb;
select *
from emp cross join dept;
-- 컬럼을 행으로 그냥 연결 시킨다
-- natural join
select *
from emp natural join dept;
-- 중복되는 컬럼을 기준으로 연결 시킨다. 첫번째 행으로 중복이나고 deptno이다

select empno, ename, sal,dname
from emp natural join dept;

select empno, ename, sal,dname, emp.sal, dept.dname, dept.deptno
from emp natural join dept;
-- 테이블명.헤더명
select empno, ename, sal,dname, emp.sal, dept.dname, dept.deptno
from emp e natural join dept d; -- 조인시 별칭은 from에서 해야한다 여기선 e d고 as가 생략된 모습으로 해야한다

-- using(공통컬럼)
select *
from emp inner join dept using(deptno);

-- on 범용적
select *
from emp join dept on emp.deptno = dept.deptno; -- emp의 deptno와 dept테이블의deptno가 같은걸 찾는다

select *
from emp e join dept d on e.deptno = d.deptno;
-- on절은 반드시 소속을 알려주어야 한다, 별칭사용가능

-- non-equil 조인
select *
from emp e join salgrade s on e.sal between s.losal and s.hisal;

-- 3개 조인


-- emp와dept의 deptno를 공통 컬럼으로 연결 시키고 salgrade를 s라 별칭하고 emp의sal에 s의 losal hisal을 연결시킴
select *
from emp e join dept using(deptno)
			join salgrade s ON  e.sal between s.losal and s.hisal;

select *
from emp e join dept d ON e.deptno = d.deptno
			join salgrade s ON  e.sal between s.losal and s.hisal;
            
 -- 서브 쿼리
 
select sal
 from emp
 where ename ='smith';
select empno, ename,sal
from emp
where sal > 1000;
-- 위 두 select문을 서브쿼리로 합칠 수 있다
 select empno, ename,sal -- 메인쿼리
 from emp
 where sal > (select sal
				from emp
				where ename = 'smith');
-- 괄호가 있는게 서브쿼리고 먼저실행되면 결과값을 이용하여 메인 쿼리가 실행된다	
            
-- ex1

-- ex2 emp테이블에서 job이 MANAGER 인 사원의 최소급여보다 적은 급여를 받는 사원 정보(사원번호,이름,job,hiredate,sal)?
select min(sal)
from emp
where job = 'manager'; -- MANAGER 인 사원의 최소 급여;

select empno,ename,job,hiredate,sal
from emp
where sal < (select min(sal)
			from emp
			where job = 'MANAGER');
 select empno,ename,job,hiredate,sal
from emp
where sal < ALL(select sal  -- < 단일 연산자 활용 최소값보다작은 < all과 같다
			from emp
			where job = 'MANAGER');           
            
            
-- ex3 emp테이블에서 job이 MANAGER 인 사원의 최소급여보다 적은 급여를 받는 사원정보(사원번호, 이름, job,hiredate,
select empno,ename,job,hiredate,sal
from emp
where sal > (select min(sal)
			from emp
			where job = 'MANAGER');
            
            select empno,ename,job,hiredate,sal
from emp
where sal > any (select sal -- > any 최소값보다 많은 any는 하나만 만족하면 된다
			from emp
			where job = 'MANAGER');
            
--  ex4. emp테이블에서 job이 MANAGER 인 사원의 최대급여보다 적은 급여를 받는 사원 정보(사원번호,이름,job,hiredate,sal)?
select empno,ename,job,hiredate,sal
from emp
where sal < (select max(sal)
			from emp
			where job = 'MANAGER');
            
select empno,ename,job,hiredate,sal
from emp
where sal < any (select sal -- > any 최소값보다 많은 any는 하나만 만족하면 된다
			from emp
			where job = 'MANAGER');
            


-- ex5. emp테이블에서 job이 MANAGER 인 사원의 최대급여보다 많은 급여를 받는 사원 정보(사원번호,이름,job,hiredate,sal)?
select empno,ename,job,hiredate,sal
from emp
where sal > (select max(sal)
			from emp
			where job = 'MANAGER');
 select empno,ename,job,hiredate,sal
from emp
where sal > ALL(select sal  -- < 단일 연산자 활용
			from emp
			where job = 'MANAGER');  
            
use testdb;
show variables like 'autocommit%'; 
set autocommit=false;

-- DML
-- INSERT
select * from dept;
insert into dept (deptno,dname,loc)
values ( 41, '인사과', '서울');

insert into dept (deptno,dname,loc)
values ( 41, '인사과', '서울');

insert into dept (deptno,dname)
values ( 42, '인사과', '서울'); -- 오류발생
insert into dept (deptno,dname,loc)
values ( 43, '인사과', null);

insert into dept
values ( 44, '인사과', null);


insert into dept
values ( 45, '인사과');-- 오류발생

commit; 

create table my_emp
as
select empno,ename,sal
from emp
where 1=2;

insert into my_emp ( empno,ename,sal )
select empno,ename,sal
from emp;

select*from my_emp;
update my_emp
set name='이순신', sal=100;
rollback
commit;

update my_emp
set ename='이순신', sal=100
where empno=7369;
rollback; -- 실습하고 데이터 원복을 위함

delete from my_emp;
rollback; -- 실습후 원복을 위함

delete from my_emp
where empno=7369;
rollback; -- 실습후 원복을 위함

-- ============실습 문제1
select empno, ename, EMPNO,dname
from emp natural join dept
ORDER BY ENAME;

-- ============실습 문제2
select empno, ename, SAL,DEPTNO,DNAME
from emp natural join dept
ORDER BY SAL desc;

-- ============실습 문제3
select empno, ename, SAL,DEPTNO,DNAME
from emp natural join dept 
where sal > 2500 and job = 'MANAGER'
ORDER BY empno;

-- ============실습 문제4
 select empno, ename, SAL,grade
from  emp e join salgrade s ON e.sal BETWEEN s.losal AND s.hisal
where grade = 4
order by sal desc;	

-- ============실습 문제5

-- DDL 오토 커밋된다

create table IF NOT EXISTS board
(
	num int primary key auto_increment,
	tile varchar(100) not null,
	author varchar(10) NOT NULL,
	CONTENT VARCHAR(500) NOT NULL,
	writeday datetime DEFAULT now(),
	redcnt int default 0
	);
    
insert into board (tile, author, CONTENT) values ('테스트','홍길동','내용무');
select * from board;

create table IF NOT EXISTS board2
(
	num int primary key auto_increment,
	title varchar(100) not null,
	author varchar(10) NOT NULL,
	CONTENT VARCHAR(500) NOT NULL,
	writeday datetime DEFAULT now(),
    gender char(4) constraint check (gender in ('M','F')),
	readcnt int default 0
	);
insert into board2 (title,author,content,gender)
values ('테스트','홍길동','내용물','M');
insert into board2 (title,author,content,gender)
values ('테스트','홍길동','내용물','F');
insert into board2 (title,author,content,gender)
values ('테스트','홍길동','내용물','남'); -- 오류발생 m or f만으로 지정해서
select * from board2;

create table IF NOT EXISTS board3
(
	num int auto_increment, -- 글번호
	title varchar(100) not null, -- 타이틀
	author varchar(10),
	CONTENT VARCHAR(500) not null, -- 글
	writeday datetime DEFAULT now(),
    gender char(4),
	readcnt int default 0, -- 조회수
	
	Constraint primary key(num), -- 제약조건 설정
	Constraint unique(author), -- autorh에 제약 조건 unique
	Constraint check (gender in('M','F'))
	);
insert into board3 (title,author,content,gender)
values ('테스트','홍길동','내용물','F');
select * from board3;

create table IF NOT EXISTS board4
(
	num int auto_increment,
	title varchar(100), 
	author varchar(10),
	CONTENT VARCHAR(500),
	writeday datetime DEFAULT now(), 
	gender char(4),
	readcnt int default 0
);
alter table board4
modify title varchar(100) not null;

alter table board4
modify content varchar(100) not null;

alter table board4
add constraint primary key(num);

alter table board4
add constraint unique(author);

alter table board4
add constraint check (gender in('M','F'));

create table IF NOT EXISTS board5
(
	num int,
	title varchar(100), 
	author varchar(10),
	CONTENT VARCHAR(500),
	writeday datetime DEFAULT now(), 
	gender char(4),
	readcnt int default 0
);
alter table board5
modify title varchar(100) not null;

alter table board5
modify content varchar(100) not null;
alter table board5
modify num INT auto_increment,
add constraint primary key(num);

alter table board5
add constraint unique(author);

alter table board5
add constraint check (gender in('M','F'));
select * from board5;

create table master1
( no int PRIMARY KEY,
	name varchar(10) NOT NULL);

insert into master1 (no,name) values (1,'aa1');
insert into master1 (no,name) values (2,'aa2');
insert into master1 (no,name) values (3,'aa3');
commit;

create table slave1
( num int PRIMARY KEY,
	ename VARCHAR(10) NOT NULL,
	no int,
	
	constraint foreign key(no) references master1(no) on delete cascade 
    );

insert into slave1 (num,ename,no) values (10,'slvae1',1);
insert into slave1 (num,ename,no) values (20,'slvae2',2);
insert into slave1 (num,ename,no) values (30,'slvae3',3);
insert into slave1 (num,ename,no) values (40,'slvae4',4); -- 에러발생
insert into slave1 (num,ename,no) values (50,'slvae5',null);
commit;
select * from master1;
select * from slave1;
delete from master1 where no = 1;

create table master2
( no int PRIMARY KEY,
name varchar(10) NOT NULL);

insert into master2 (no,name) values (1,'aa1');
insert into master2 (no,name) values (2,'aa2');
insert into master2 (no,name) values (3,'aa3');
commit;

create table slave2
( num int PRIMARY KEY,
	ename VARCHAR(10) NOT NULL,
	no int,
	
	CONSTRAINT FOREIGN KEY(no) REFERENCES master2(no) ON DELETE SET NULL
);

insert into slave2 (num,ename,no) values (10,'slvae1',2);
insert into slave2 (num,ename,no) values (20,'slvae2',2);
insert into slave2 (num,ename,no) values (30,'slvae3',3);
insert into slave2 (num,ename,no) values (50,'slvae5',null);
commit;
select * from master2;
select * from slave2;
delete from master2 where no = 1;

drop table if exists board,board2,board3;

truncate table my_emp;
select * from my_emp;

create table if not exists my_dept
( no int primary key,
name varchar(10)
);
-- 컬럼 추가
alter table my_dept
add column adress varchar(20);
-- 컬럼 변경 ( 크기 변경 )
alter table my_dept
modify adress varchar(50);
modify adress varchar(10);
-- 컬럼 이름 변경
alter table my_dept
RENAME COLUMN address To addr;
-- 컬럼삭제
alter table my_dept
drop name;

select * from emp;
select * from emp limit 4;