--제출파일명 : exercise5.sql
--ANSI(SQL-99) 조인 구문을 사용하여 문제를 해결하시오.
--
---- 1. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을 출력하시오.
----이름         직위        부서번호    부서이름          
------------ --------- ------------------
----SMITH      CLERK       20           RESEARCH      
----JONES      MANAGER  20           RESEARCH          
----FORD       ANALYST   20           RESEARCH      
--
--
select ename 이름, job 직위, deptno 부서번호, dname 부서이름
from emp natural join dept ;


---- 2. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하시오.
----이름         부서이름          
------------ --------------
----ALLEN      SALES         
----WARD       SALES         
----MARTIN     SALES        
--
select ename 이름, dname 부서이름
from emp join dept using (deptno)
where ename like '%A%';
---- 3. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을 
----출력하는데 월급이 3000이상인 사원을 출력하시오. 
----사원이름       부서명                    월급
------------ -------------- ----------
----KING       ACCOUNTING           5000
----FORD       RESEARCH             3000
select ename 사원이름, dname 부서명, sal 월급
from emp join dept using (deptno)
where sal >= 3000;
---- 4. 직위가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
---- 그 사원이 속한 부서 이름을 출력하시오. 
----직위        사원이름       부서이름          
----------- ---------- --------------
----SALESMAN  TURNER     SALES         
----SALESMAN  MARTIN     SALES         
----SALESMAN  WARD       SALES         
----SALESMAN  ALLEN      SALES       
select job 직위, ename 사원이름, dname 부서이름
from emp join dept using (deptno)
where job = 'SALESMAN';
---- 5. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
---- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
---- '연봉','실급여', '급여등급'으로 하여 출력하시오. 
----  사원번호 사원이름               연봉        실급여       급여등급
------------ ---------- ---------- ---------- ----------
----  7521 WARD            15000      15200          2
----  7654 MARTIN          15000      15300          2
----  7844 TURNER          18000      18000          3
select empno 사원번호
, ename 사원이름
, sal*12 연봉
, sal*12+comm 실급여
, grade 급여등급
from emp join dept on(emp.deptno=dept.deptno)
join salgrade on (sal between losal and hisal)
where comm is not null;

---- 6. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
---- 월급, 급여등급을 출력하시오. (3개)
----   부서번호 부서이름           사원이름               월급       급여등급
------------ -------------- ---------- ---------- ----------
----      10 ACCOUNTING     CLARK            2450          4
----      10 ACCOUNTING     KING             5000          5
----      10 ACCOUNTING     MILLER           1300          2 
select deptno 부서번호
, dname 부서이름
, ename 사원이름
, sal 월급
, grade 급여등급
from emp join dept using (deptno)
join salgrade on (sal between losal and hisal)
where deptno = 10;
---- 7. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름, 
---- 사원이름, 월급, 급여등급을 출력하시오. 그리고 그 출력된 
---- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로 정렬하시오. 
----   부서번호 부서이름           사원이름               월급       급여등급
------------ -------------- ---------- ---------- ----------
----    10 ACCOUNTING     KING             5000          5
----    10 ACCOUNTING     CLARK            2450          4
select deptno 부서번호
, dname 부서이름
, ename 사원이름
, sal 월급
, grade 급여등급
from emp join dept using (deptno)
join salgrade on (sal between losal and hisal)
where deptno in (10,20)
order by deptno, sal desc;
---- 8. 사원들의 이름, 부서번호, 부서이름을 출력하시오. 
---- 단, 직원이 없는 부서도 출력하며 이경우 이름을 '미정'이라고
---- 출력한다.        
----이름               부서번호 부서이름          
------------ ---------- --------------
----SMITH              20 RESEARCH      
----ALLEN              30 SALES         
----WARD               30 SALES         
----JONES              20 RESEARCH      
select nvl(ename,'미정') 이름, deptno 부서번호, dname 부서이름
from emp right outer join dept using (deptno);
---- 9. 사원들의 이름, 부서번호, 부서이름을 출력하시오. 
---- 단, 아직 부서 배치를 못받은 직원도  출력하며 이경우 부서번호는  0 으로
---- 출력한다.        
----이름               부서번호 부서이름          
------------ ---------- --------------
----SMITH              20 RESEARCH      
----ALLEN              30 SALES         
----WARD               30 SALES         
----JONES              20 RESEARCH      
select ename 이름
, nvl(deptno,0) 부서번호
, dname 부서이름
from emp left outer join dept using (deptno);

---- 10. 사원들의 이름, 부서번호, 부서이름을 출력하시오. 
---- 단, 직원이 없는 부서도 출력하며 이경우 이름과 부서번호를 '미정'이라고
---- 출력한다. 아직 부서 배치를 못받은 직원도  출력하며 부서 번호와 부서 이름을
---- '미정' 이라고 출력한다.     
----이름               부서번호 부서이름          
------------ ---------- --------------
----SMITH              20 RESEARCH      
----ALLEN              30 SALES         
----WARD               30 SALES         
----JONES              20 RESEARCH    
select nvl(ename,'미정') 이름
, nvl2(deptno,to_char(deptno),'미정') 부서번호
, nvl(dname,'미정') 부서이름
from emp full outer join dept using (deptno);

----11. 커미션이 정해진 모든 직원의 이름, 커미션, 부서이름, 위치를 조회하는 sql을 작성하시오.
--
----ENAME           COMM        DNAME         	LOC
------------------------------------------------------
----KING		3500	ACCOUNTING	NEW YORK
----JONES		30	RESEARCH	DALLAS
----TURNER	0	SALES		CHICAGO
----MARTIN	300	SALES		CHICAGO
----WARD		200	SALES		CHICAGO
----ALLEN		300	SALES		CHICAGO         
select ename, comm, dname, loc 
from emp join dept using (deptno)
where comm is not null;

---- 12. DALLAS에서 근무하는 사원의 이름,  월급, 등급을 출력하시오.
----이름         월급             등급          
------------ --------- --------------
----SMITH      800         1      
----JONES      2975       4   
----FORD       3000        4      
select ename 이름, sal 월급, grade 등급
from emp join salgrade on (sal between losal and hisal);
----13. 'DALLAS'에서 근무중인 직원의 명수와 월급의 합을 다음과 같은 형식으로 추출하시오.
--
--	처리결과
--	----------------------------
--                직원들은 X명이고 월급의 합은 X입니다.
select '직원들은 '||count(ename)||'명이고 월급의 합은'||sum(sal)||'입니다.' 처리결과
from emp join dept using (deptno)
where loc = 'DALLAS';
----14. 부서별 최대 월급을 "부서명", "최대월급" 으로 출력하시오.(최대월급이 큰 순)
--	
--	부서명	최대월급
--	----------------------------
--	xxxx          xxx
--	 :	   :

select dname 부서명, max(sal) 최대월급
from emp join dept using (deptno)
group by dname
order by 최대월급 desc;

----16. 부서별 평균월급을 출력하되, 평균월급가 2000보다
---- 큰 부서의 부서 이름과 평균월급을 출력하시오.
--
--	부서명     평균월급
--           	------------------------
--	xxxx          xxx
--	 :	   :

select dname 부서명, avg(sal) 평균월급
from emp join dept using (deptno)
group by dname 
having avg(sal) >= 2000;

----17. 커미션이 정해진 직원들 중에서 부서별 최대월급을 출력하시오. 
----최대 월급이 높은 순으로 정렬하여 출력하시오.
--
--	부서명     최대월급
--           	------------------------
--	xxxx          xxx
--	 :	   :
--
select dname 부서명, max(sal) 최대월급
from emp join dept using (deptno)
where comm is not null
group by dname 
order by 최대월급 desc;
----18. 부서별 근무 직원의 5명 이상인 부서의 부서명과 직원수를 출력한다.
--
--	부서명       근무인원 수
--              ---------------------------
--              xxxx            x
--	 :	    :
select dname 부서명, count(ename)  "근무인원 수"
from emp join dept using (deptno)
group by dname
having count(ename) > 5;
----19. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의 
----   사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
----   '사원이름', '관리자번호', '관리자이름'으로 하여 출력하시오. 
--      관리자,번호가 없으면 '없음'을 대신 출력한다.
----    사원번호 사원이름            관리자번호 관리자이름     
------------ ---------- ---------- ----------
----    7902    FORD               7566        JONES     
----    7788    SCOTT              7566       JONES     
----    7900   JAMES              7698       BLAKE 

select e1.empno 사원번호
, e1.ename 사원이름
, nvl2(e1.mgr,to_char(e1.mgr),'없음') 관리자번호
, nvl(e2.ename,'없음') 관리자이름
from emp e1 left outer join emp e2 on(e1.mgr = e2.empno);
