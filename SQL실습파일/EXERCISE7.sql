--���� ���ϸ� : exercise7.sql
--
---- ��� �ǽ������� EMP�� DEPT ���̺��� ������ ������ ���� ����� �����ϰ�
---- ����� ���� Ȯ���� ���� ROLLBACK ����� �����Ѵ�.
--
---- ������ Ȯ��
---- �������� �䱸�Ǵ� DML �� ����
---- ������ Ȯ��
---- rollback
--
---- 1. EMP ���̺��� �����ȣ�� 7499���� ����� ������ 5000�޷��� �����Ѵ�.
--

UPDATE EMP 
SET SAL = 5000
WHERE EMPNO=7499;

SELECT * FROM EMP;

ROLLBACK;
---- 2. EMP���̺��� �μ���ȣ�� 20���� ������� ������ ���� ���޿��� 10% �λ��� �ݾ����� �����Ѵ�.
--
UPDATE EMP
SET SAL= SAL*1.1
WHERE DEPTNO = 20;

SELECT * FROM EMP;

ROLLBACK;
---- 3. DEPT ���̺� �Ʒ��� �������� �����͸� �Է��Ѵ�.
---- �μ���ȣ: 50, �μ���ġ: BOSTON,  �μ���: RESERCH
INSERT INTO DEPT
VALUES (50, 'RESEARCH','BOSTON');

SELECT* FROM DEPT;

ROLLBACK;
---- 4. EMP ���̺� �Ʒ��� ���� �����͸� �����Ѵ�.
---- �����ȣ: 9900, ����̸�: JACKSON, ����: SALESMAN, �μ���ȣ: 10, ���� : 800
INSERT INTO EMP(EMPNO, ENAME, JOB, DEPTNO, SAL)
VALUES(9900,'JACKSON','SALESMAN',10,800);

SELECT * FROM EMP;

ROLLBACK;
---- 5. DEPT ���̺� �Ʒ��� �������� �����͸� �Է��Ѵ�.
---- �μ���ȣ: 60, �μ���ġ: NULL,  �μ���: MARKETING
INSERT INTO DEPT(DEPTNO, LOC, DNAME)
VALUES(60,NULL,'MARKETING');

SELECT * FROM DEPT;

ROLLBACK;
---- 6. �����ȣ�� 7698���� ����� �μ���ȣ�� 7369�� ����� 
---- �μ���ȣ�� �����Ѵ�.
SELECT * FROM EMP;

UPDATE EMP
SET DEPTNO =(SELECT DEPTNO FROM EMP WHERE EMPNO=7369)
WHERE EMPNO=7698;

ROLLBACK;
---- 7. 20�� �μ��� �������� ��� �����Ѵ�.
DELETE EMP
WHERE DEPTNO = 20;

SELECT * FROM EMP;

ROLLBACK;

---- 8. ������ 1000 ������ �������� �����Ѵ�.
--
DELETE EMP
WHERE SAL<=1000;

ROLLBACK;

---- 9. �����ȣ�� 7900 �� ������ ������ ���� ���޿��� 5% ������Ű��
--         �μ���ȣ�� 40���� �����Ѵ�.

UPDATE EMP 
SET SAL=SAL*1.05, DEPTNO=40
WHERE EMPNO = 7900;

SELECT * FROM EMP;

ROLLBACK;

---- 10. ���縦 �������� �Ի����� 38�� �̻��� �����鿡 ���Ͽ� 
--          ������ 2��� �����ϰ� Ŀ�̼ǵ� 3000���� �����Ѵ�.
--          (�Ի����� �⵵�� �������� �ݿø��Ͽ� ����Ѵ�.)
--
select (sysdate-hiredate)/365 from emp;
select MONTHS_between(sysdate, round(hiredate))/12
from emp;

UPDATE EMP
SET SAL=SAL*2, COMM=3000
WHERE   round(MONTHS_between(sysdate, hiredate)/12,0) > 37;

SELECT * FROM EMP;

ROLLBACK;