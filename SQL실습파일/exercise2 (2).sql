--1
select initcap(ename) from emp;

--2
select ename,substr(ename,2,3) from emp;

--3
select LENGTH(ename) from emp;

--4
select lower(substr(ename,1,1)), lower(substr(ename,length(ename),1)) from emp;

--5
select trunc(3456.78,1) from dual;

--6
select concat(to_char(trunc(sal*55,-2),'999,999'),'원') from emp;

--7
select ename, nvl2(comm, '설정','미정'), nvl2(comm, to_char(comm),' ') from emp;

--8
select ename, 
    case 
        when deptno = 10 then 'A부서'
        when deptno = 20 then 'B부서'
        when deptno = 30 then 'C부서'
        else '없당'
    end
from emp;

--9
select ename, sal from emp where sal>=1000 and job = 'SALESMAN';

--10
select sysdate +10 from dual;

--11
select to_char(sysdate,'yyyy"년"-mm"월"-dd"일" hh"시":mi"분"') from dual;

--12
select ename 이름, sal 월급여, (sal+200)*12 연봉 from emp;

--13
select ename 이름, sal 월급, 
    case
        when sal<1000 then 'A'
        when sal>=1000 and sal<2000 then 'B'
        when sal>=2000 and sal<3000 then 'C'
        when sal>=3000 and sal<4000 then 'D'
        else 'D'
    end as 코드
from emp;

--14
select ename 이름, deptno 부서명,
    decode (deptno,
        10 , 'A',
        20 , 'B',
        30 , 'C',
        40 , 'E',
        'F') as 코드
from emp;

--15
select concat(concat(ename,', '), job) as "Employee and Job Title" from emp;

--16
select ename from emp where ename like '_A%';

--17
select ename 이름,  to_char(hiredate,'yyyy"년"mm"월"dd"일"') 입사일, to_char(hiredate,'day') 입사요일  
from emp 
order by to_char(hiredate-1,'d');

--18
select ename, round(months_between(sysdate,hiredate)) as "MONTHS WORKED"
from emp 
order by "MONTHS WORKED";

--19
select ename, concat(trunc(sysdate-hiredate),'일') from emp;

--20
select ename, job, hiredate from emp where hiredate like '81%' order by hiredate;

--21 
select to_char(to_date('94/10/08'),'day') from dual;

--22
select trunc(months_between(sysdate,to_date('94/10/08'))) from dual; 

--23
select ename, sal, nvl2(comm, to_char(comm),'미정') from emp;

--24
select ename from emp where ename not like ( 'A%N');

--25
select ename, hiredate,round(hiredate, 'yy') from emp;