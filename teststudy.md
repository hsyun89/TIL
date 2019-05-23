# 시험대비

## 오라클

1. 기본키

   - 식별할 수 있는 유일한 값.
   - 값의 중복이 없어야 한다.
   - NULL 값을 가질 수 없다.

2. 한글 몇글자가 들어가는 무슨 타입을 만들고 싶다.

   - UTF-8 한글 3byte / 한글 6글자 -> varchar2(18) 

3. 셀렉트문 행에대한 조건 그룹에대한 조건의 위치

   ```sql
   select deptno, job, avg(sal)
   from emp
   --행 조건 where
   	where sal <= 3000
   group by deptno, job
   --그룹 조건 having
   	having avg(sal) >=2000;
   
   ```

4. 컬럼값이 널이면 어떤값으로 쓰시오 함수

   - ```sql
     NVL(검사데이터,null이면반환할데이터);
     ```

   - ```sql
     NVL2(검사데이터,null이아니면,null이면)
     ```

5. 연산자 and or ||를 사용하면 결합

   - 오라클에서는 ||를 결합 연산자로 사용한다.

6. 등가 연산자, 비등가 연산자 between a and b

   ```sql
   select ename, grade
   from emp, salgrade
   where sal between losal and hisal;
   ```

7. 그룹함수 다중행 데이터 뭐가있는지~로 시작하는, ~로 비교하는 패턴비교

   - SUM, COUNT, MAX, MIN, AVG

8. 다중행 연산자 in, all/ 다중행 서브쿼리

   - 다중행 서브쿼리 IN 연산자

     - 각 부서별 최고 급여와 동일한 급여를 받는 사원 정보 출력하기

     - ```sql
       select * from emp
       where sal in (select max(sal) from emp group by deptno);
       ```

   - 다중행 서브쿼리 ANY/SOME 연산자

     - 30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원 정보 출력하기

     - ```sql
       select * from emp
       where sal < any(select sal from emp where deptno = 30);
       ```

9. 날짜 데이터 to_char 원하는 방식으로 변환하기

   - ```sql
     to_char(sysdate,'yyyy"년"mm"월"dd"일"');
     ```

10. dml의 종류

    - DML (Data Manipulation Language) RDBMS 내 테이블의 데이터를 저장, 수정, 삭제 하는 명령어: INSERT, UPDATE, ROLLBACK, DELETE (FROM),

11. execute update

12. statement, prepare statement

13. 라운드 함수

    - ROUND(1234.5678, 0) 	결과 1235
    - ROUND(1234.5678, 1) 	결과 1234.6
    - ROUND(1234.5678, -1) 	결과 1230

## 실습

1. dbms 10개/ 5개쉽개 5개 어렵게
2. jdbc 1문제 셀렉트 실습한거 한개중 두개



