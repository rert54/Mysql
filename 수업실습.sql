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