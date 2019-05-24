--제출파일명 : exercise3.sql
-- scott_db.sql 을 복사하여 scott 사용자 역역에서 수행시키고 
-- course1 과 couse2 테이블을 생성한 후에 진행한다.

-- 1. 집합연산자 실습

-- 1.1 course1 과 course2 를 모두 수강하는 학생들의 이름, 전화 번호 그리고 
--    나이를 출력하시오.
select name, phone, age from course1
intersect
select name, phone, age from course2;

  
-- 1.2 course1 이든 course2 든 수강하는 학생들의 이름, 전화 번호 그리고 
--    나이를 출력하는데 나이가 많은 순으로 출력하시오.

select name, phone, age from course1
union
select name, phone, age from course2
order by age desc;

-- 1.3 course1은 수강하지만 course2 는 수강하지 않는 학생들의 이름을 출력하시오.
select name, phone, age from course1
minus
select name, phone, age from course2;
-- 1.4 course2는 수강하지만 course1 은 수강하지 않는 학생들의 이름과 전화번호를 
--    이름 순으로 출력하시오.

select name, phone, age from course2
minus
select name, phone, age from course1
order by name;
--2. 모든 직원들 월급의 평균을 구하시오. 
   --    (소수점 이하 둘째자리까지만 나타내고 셋째자리 부터는 절삭하시오)

	--월급 평균
               -----------
	 --  x
select round(avg(sal),2) as "월급 평균"
from emp;

--3. 모든 직원들이 받는 커미션의 합을 구하시오.
--	커미션 합
               -----------
--	  x
select sum(comm) as "커미션 합" from emp;

--4. 'DALLAS'에서 근무중인 직원의 명수와 월급의 합을 다음과 같은 형식으로 추출하시오.

--	처리결과
	----------------------------
 --               직원들은 X명이고 월급의 합은 X입니다.


--5. 부서별 최대 월급을 "부서명", "최대월급" 으로 출력하시오.(최대월급이 큰 순)
	
--	부서명	최대월급
--	----------------------------
--	xxxx          xxx
--	 :	   :

--6. 직급별 최소 월급이 3000 이상이 되는 직급의 직급명과 최소 월급을  출력하시오. 

--	직급명	최소월급
--	----------------------------
--	xxxx          xxx
--	 :	   :


--7. 부서별 평균월급을 출력하되, 평균월급가 2000보다
-- 큰 부서의 부서 이름과 평균월급을 출력하시오.

--	부서명     평균월급
           	------------------------
--	xxxx          xxx
--	 :	   :



--8. 각 직급별로 총월급을 출력하되 총월급이 낮은 순으로 출력하시오.

--	직급명	총월급
	----------------------------
--	xxxx          xxx
--	 :	   :
select job 직급명, sum(sal) 총월급
from emp
group by job
order by 총월급;

--9. 직급별 총월급을 출력하되, 직급이 'MANAGER'인 직원들은 제외하시오. 
--   그리고 그 총월급이 5000보다 큰 직급와 총월급만 출력하시오.

--	직급명	총월급
	----------------------------
--	xxxx          xxx
--	 :	   :

select job 직급명, sum(sal) 총월급
from emp
    where job != 'MANAGER'
group by job
    having sum(sal)>5000
order by 총월급;


--10. 커미션이 정해진 직원들 중에서 부서별 최대월급을 출력하시오. 
--최대 월급이 높은 순으로 정렬하여 출력하시오.

--	부서명     최대월급
           	------------------------
--	xxxx          xxx
--	 :	   :

--11. 30번 부서의 업무별 년봉의 평균을 검색한다.
-- 연봉계산은 월급+커미션(null이면 0으로 계산)이며 
-- 출력 양식은 소수점 이하 두 자리(반올림)까지 통일된 양식으로 출력한다.
  --            업무명       평균월급
              ---------------------------
--              xxxx         xxx.xx
--	 :	    :
select job 업무명
, round(avg(sal+nvl2(comm,comm,0)),2) 평균월급
from emp
where deptno = 30
group by job;


--12. 부서별 근무 직원의 5명 이상인 부서의 부서명과 직원수를 출력한다.

--	부서명       근무인원 수
              ---------------------------
 --             xxxx            x
--	 :	    :



  