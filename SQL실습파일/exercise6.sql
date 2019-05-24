--QUESTION
--�������ϸ� : exercise6.sql
--��� ���������� ����ؼ� �ذ��մϴ�.

-- 1. 'DALLAS'���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ�� ����Ͻÿ�.
--�̸�         ����        �μ���ȣ              
---------- --------- ----------
select ename �̸�, job ����, deptno �μ���ȣ
from emp
where deptno = (select deptno from dept where loc = 'DALLAS');

--2. 'SMITH'���� ������ ���� �޴� ������� �̸��� ���� �׸��� �μ����� ����Ѵ�.
--�����               �޿�             �μ���         
---------- ---------- ------------
select ename �����, sal �޿�, dname �μ���
from emp natural join dept
where sal > (select sal from emp where ename='SMITH');


--3. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����, 
--   �μ���ȣ�� ����Ѵ�.(10���μ� �����ϰ�)
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



--4. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ� 'BLAKE'�� ���� ����Ѵ�. 
--ENAME      HIREDATE
---------- --------
select ename, hiredate
from emp
where deptno = (select deptno from emp where ename = 'BLAKE')
and ename != 'BLAKE';



--5. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������
-- ����ϵ�, ������ ���� ��� ������ ����Ѵ�.
--  EMPNO ENAME             SAL
---------- ---------- ----------
select empno, ename, sal
from emp 
where sal > (select avg(sal) from emp)
order by sal desc;

--6. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�
--   �ִ� ����� �����ȣ�� �̸��� ����Ѵ�.
--     EMPNO ENAME     
---------- ----------
  select empno, ename
  from emp
  where deptno = any(select deptno from emp where ename like '%T%');

--7 �ڽ��� �޿��� ��ձ޿����� ����,�̸��� S�ڰ� ���� ����� ������
--  �μ����� �ٹ��ϴ� ��� ����� �����ȣ,�̸� �� �޿��� ����Ͻÿ�.
--     EMPNO    ENAME      SAL
--    --------  --------  -------
  select empno, ename, sal
  from emp
  where sal > (select avg(sal) from emp)
  and deptno = any(select deptno from emp where ename like '%S%');

--8. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������
--   ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����Ѵ�. 
--   (��, ALL �Ǵ� ANY �����ڸ� ����� ��)
--  �̸�    �μ���ȣ   ����
--------------------------------
select ename �̸�, deptno �μ���ȣ, sal ����
from emp
where sal > all(select sal from emp where deptno = 30);

--9. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����
--   �̸�, �μ���ȣ, ������ ����Ѵ�.(5��)
--ENAME          DEPTNO JOB      
---------- ---------- ---------
--1���� �ߺ��� ������

--10. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����Ѵ�.
--    DEPTNO ENAME      JOB      
---------- ---------- ---------
 select deptno, ename, job 
 from emp join dept using (deptno)
 where dname = all (select dname from dept where dname = 'SALES');
 
  select deptno, ename, job 
 from emp
 where deptno = (select deptno from dept where dname = 'SALES');

--11. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����Ѵ�. 
--     (KING���� �����ϴ� ����̶� mgr�� KING�� ����� �ǹ���) 
--ENAME             SAL
---------- ----------
select ename, sal
from emp
where mgr = (select empno from emp where ename = 'KING');


