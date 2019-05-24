--QUESTION
--제출파일명 : exercise6.sql
--모두 서브쿼리를 사용해서 해결합니다.

-- 1. 'DALLAS'에서 근무하는 사원의 이름, 직위, 부서번호를 출력하시오.
--이름         직위        부서번호              
---------- --------- ----------
select ename 이름, job 직위, deptno 부서번호
from emp
where deptno = (select deptno from dept where loc = 'DALLAS');

--2. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급 그리고 부서명을 출력한다.
--사원명               급여             부서명         
---------- ---------- ------------
select ename 사원명, sal 급여, dname 부서명
from emp natural join dept
where sal > (select sal from emp where ename='SMITH');


--3. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급, 
--   부서번호를 출력한다.(10번부서 제외하고)
--ENAME             SAL     DEPTNO
---------- ---------- ----------
select ename
, sal
, deptno 
from emp 
where sal = any (select sal from emp where deptno = 10)
and deptno != 10;

select ename
, sal
, deptno 
from emp 
where sal in (select sal from emp where deptno = 10)
and deptno != 10;



--4. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데 'BLAKE'는 빼고 출력한다. 
--ENAME      HIREDATE
---------- --------
select ename, hiredate
from emp
where deptno = (select deptno from emp where ename = 'BLAKE')
and ename != 'BLAKE';



--5. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력한다.
--  EMPNO ENAME             SAL
---------- ---------- ----------
select empno, ename, sal
from emp 
where sal > (select avg(sal) from emp)
order by sal desc;

--6. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
--   있는 사원의 사원번호와 이름을 출력한다.
--     EMPNO ENAME     
---------- ----------
  select empno, ename
  from emp
  where deptno = any(select deptno from emp where ename like '%T%');

--7 자신의 급여가 평균급여보다 많고,이름에 S자가 들어가는 사원과 동일한
--  부서에서 근무하는 모든 사원의 사원번호,이름 및 급여를 출력하시오.
--     EMPNO    ENAME      SAL
--    --------  --------  -------
  select empno, ename, sal
  from emp
  where sal > (select avg(sal) from emp)
  and deptno = any(select deptno from emp where ename like '%S%');

--8. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
--   많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력한다. 
--   (단, ALL 또는 ANY 연산자를 사용할 것)
--  이름    부서번호   월급
--------------------------------
select ename 이름, deptno 부서번호, sal 월급
from emp
where sal > all(select sal from emp where deptno = 30);

--9. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
--   이름, 부서번호, 직업을 출력한다.(5개)
--ENAME          DEPTNO JOB      
---------- ---------- ---------
--1번과 중복된 문제임

--10. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력한다.
--    DEPTNO ENAME      JOB      
---------- ---------- ---------
 select deptno, ename, job 
 from emp join dept using (deptno)
 where dname = all (select dname from dept where dname = 'SALES');
 
  select deptno, ename, job 
 from emp
 where deptno = (select deptno from dept where dname = 'SALES');

--11. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력한다. 
--     (KING에게 보고하는 사원이란 mgr이 KING인 사원을 의미함) 
--ENAME             SAL
---------- ----------
select ename, sal
from emp
where mgr = (select empno from emp where ename = 'KING');


