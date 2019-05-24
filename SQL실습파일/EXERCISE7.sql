--생성 파일명 : exercise7.sql
--
---- 모든 실습문제는 EMP와 DEPT 테이블의 데이터 보존을 위해 명령을 수행하고
---- 변경된 것을 확인한 다음 ROLLBACK 명령을 수행한다.
--
---- 변경전 확인
---- 문제에서 요구되는 DML 문 수행
---- 변경후 확인
---- rollback
--
---- 1. EMP 테이블에서 사원번호가 7499번인 사원의 월급을 5000달러로 변경한다.
--

UPDATE EMP 
SET SAL = 5000
WHERE EMPNO=7499;

SELECT * FROM EMP;

ROLLBACK;
---- 2. EMP테이블에서 부서번호가 20번인 사원들의 월급을 현재 월급에서 10% 인상한 금액으로 변경한다.
--
UPDATE EMP
SET SAL= SAL*1.1
WHERE DEPTNO = 20;

SELECT * FROM EMP;

ROLLBACK;
---- 3. DEPT 테이블에 아래의 조건으로 데이터를 입력한다.
---- 부서번호: 50, 부서위치: BOSTON,  부서명: RESERCH
INSERT INTO DEPT
VALUES (50, 'RESEARCH','BOSTON');

SELECT* FROM DEPT;

ROLLBACK;
---- 4. EMP 테이블에 아래와 같은 데이터를 삽입한다.
---- 사원번호: 9900, 사원이름: JACKSON, 직업: SALESMAN, 부서번호: 10, 월급 : 800
INSERT INTO EMP(EMPNO, ENAME, JOB, DEPTNO, SAL)
VALUES(9900,'JACKSON','SALESMAN',10,800);

SELECT * FROM EMP;

ROLLBACK;
---- 5. DEPT 테이블에 아래의 조건으로 데이터를 입력한다.
---- 부서번호: 60, 부서위치: NULL,  부서명: MARKETING
INSERT INTO DEPT(DEPTNO, LOC, DNAME)
VALUES(60,NULL,'MARKETING');

SELECT * FROM DEPT;

ROLLBACK;
---- 6. 사원번호가 7698번인 사원의 부서번호를 7369번 사원의 
---- 부서번호로 변경한다.
SELECT * FROM EMP;

UPDATE EMP
SET DEPTNO =(SELECT DEPTNO FROM EMP WHERE EMPNO=7369)
WHERE EMPNO=7698;

ROLLBACK;
---- 7. 20번 부서의 직원들을 모두 삭제한다.
DELETE EMP
WHERE DEPTNO = 20;

SELECT * FROM EMP;

ROLLBACK;

---- 8. 월급이 1000 이하인 직원들을 삭제한다.
--
DELETE EMP
WHERE SAL<=1000;

ROLLBACK;

---- 9. 사원번호가 7900 인 직원의 월급을 현재 월급에서 5% 증가시키고
--         부서번호를 40으로 변경한다.

UPDATE EMP 
SET SAL=SAL*1.05, DEPTNO=40
WHERE EMPNO = 7900;

SELECT * FROM EMP;

ROLLBACK;

---- 10. 현재를 기준으로 입사한지 38년 이상인 직원들에 대하여 
--          월급을 2배로 변경하고 커미션도 3000으로 변경한다.
--          (입사일은 년도를 기준으로 반올림하여 계산한다.)
--
select (sysdate-hiredate)/365 from emp;
select MONTHS_between(sysdate, round(hiredate))/12
from emp;

UPDATE EMP
SET SAL=SAL*2, COMM=3000
WHERE   round(MONTHS_between(sysdate, hiredate)/12,0) > 37;

SELECT * FROM EMP;

ROLLBACK;