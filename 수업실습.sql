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