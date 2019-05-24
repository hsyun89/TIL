--insert into emp values
--    (7940,'MARRY','CLERK',7782,'1999-05-13',1000,null,null);
--commit;

--�������ϸ� : exercise4.sql
-- 1. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸��� ����Ͻÿ�.(5��)
--�̸�         ����        �μ��̸�          
---------- --------- --------------
--SMITH      CLERK     RESEARCH      
--JONES      MANAGER   RESEARCH      
--SCOTT      ANALYST   RESEARCH      
--ADAMS      CLERK     RESEARCH      
--FORD       ANALYST   RESEARCH      

select ename �̸�, job ����, e.deptno �μ���ȣ, dname �μ��̸�
from emp e, dept d
where e.deptno =d.deptno and d.loc = 'DALLAS';

-- 2. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����Ͻÿ�.(7��)
--�̸�         �μ��̸�          
---------- --------------
--ALLEN      SALES         
--WARD       SALES         
--MARTIN     SALES       

select ename �̸�, dname �μ��̸�
from emp e, dept d
where e.deptno =d.deptno(+) and ename like '%A%';

-- 3. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������ 
--����ϴµ� ������ 3000�̻��� ����� ����Ͻÿ�. (3��)
--����̸�       �μ���                    ����
---------- -------------- ----------
--KING       ACCOUNTING           5000
--FORD       RESEARCH             3000
--SCOTT      RESEARCH             3000

select ename �̸�, dname �μ��̸�, sal ����
from emp e, dept d
where e.deptno =d.deptno(+) and sal>=3000;

-- 4. ������ 'SALESMAN'�� ������� ������ �� ����̸�, �׸���
-- �� ����� ���� �μ� �̸��� ����Ͻÿ�. (4��)
--����        ����̸�       �μ��̸�          
--------- ---------- --------------
--SALESMAN  TURNER     SALES         
--SALESMAN  MARTIN     SALES         
--SALESMAN  WARD       SALES         
--SALESMAN  ALLEN      SALES       

select job ����, ename ����̸�, dname �μ��̸�
from emp e, dept d
where e.deptno = d.deptno and job= 'SALESMAN';

-- 5. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,
-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����Ͻÿ�. (6��)
--  �����ȣ ����̸�               ����        �Ǳ޿�       �޿����
---------- ---------- ---------- ---------- ----------
--  7521 WARD            15000      15200          2
--  7654 MARTIN          15000      15300          2
--  7844 TURNER          18000      18000          3

select empno �����ȣ
, ename ����̸�
, sal*12 ����
, sal*12+nvl2(comm,to_char(comm),0) �Ǳ޿�
, grade �޿����
from emp e, salgrade s
where comm is not null 
and
(e.sal between s.losal and s.hisal);

-- 6. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,
-- ����, �޿������ ����Ͻÿ�. (3��)
--   �μ���ȣ �μ��̸�           ����̸�               ����       �޿����
---------- -------------- ---------- ---------- ----------
--      10 ACCOUNTING     CLARK            2450          4
--      10 ACCOUNTING     KING             5000          5
--      10 ACCOUNTING     MILLER           1300          2 

select d.deptno �μ���ȣ
, d.dname �μ��̸�
, e.ename ����̸�
, e.sal ����
, s.grade �޿����
from dept d, emp e, salgrade s
where d.deptno=10
and d.deptno=e.deptno 
and e.sal between s.losal and s.hisal;

-- 7. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�, 
-- ����̸�, ����, �޿������ ����Ͻÿ�. �׸��� �� ��µ� 
-- ������� �μ���ȣ�� ���� ������, ������ ���� ������ �����Ͻÿ�. (8��)
--   �μ���ȣ �μ��̸�           ����̸�               ����       �޿����
---------- -------------- ---------- ---------- ----------
--    10 ACCOUNTING     KING             5000          5
--    10 ACCOUNTING     CLARK            2450          4

select d.deptno �μ���ȣ
, d.dname �μ��̸�
, e.ename ����̸�
, e.sal ����
, s.grade �޿����
from dept d, emp e, salgrade s
where d.deptno in(10,20)
and d.deptno=e.deptno 
and e.sal between s.losal and s.hisal
order by �μ���ȣ, ���� desc;


-- 8. ������� �̸�, �μ���ȣ, �μ��̸��� ����Ͻÿ�. (15��) 
-- ��, ������ ���� �μ��� ����ϸ� �̰�� �̸��� '����'�̶��
-- ����Ѵ�.        
--�̸�               �μ���ȣ �μ��̸�          
---------- ---------- --------------
--SMITH              20 RESEARCH      
--ALLEN              30 SALES         
--WARD               30 SALES         
--JONES              20 RESEARCH      

select nvl(ename,'����') �̸�
, d.deptno �μ���ȣ
, dname �μ��̸�
from emp e, dept d
where e.deptno(+) = d.deptno;


-- 9. ������� �̸�, �μ���ȣ, �μ��̸��� ����Ͻÿ�. (15��) 
-- ��, ���� �μ� ��ġ�� ������ ������  ����ϸ� �̰�� �μ���ȣ��  0 ����
-- ����Ѵ�.        
--�̸�               �μ���ȣ �μ��̸�          
---------- ---------- --------------
--SMITH              20 RESEARCH      
--ALLEN              30 SALES         
--WARD               30 SALES         
--JONES              20 RESEARCH      
select ename �̸�
, nvl(d.deptno,0) �μ���ȣ
, dname �μ��̸�
from emp e, dept d
where e.deptno = d.deptno(+);


-- 10. ������� �̸�, �μ���ȣ, �μ��̸��� ����Ͻÿ�. (16��) 
-- ��, ������ ���� �μ��� ����ϸ� �̰�� �̸��� �μ���ȣ�� '����'�̶��
-- ����Ѵ�. ���� �μ� ��ġ�� ������ ������  ����ϸ� �μ� ��ȣ�� �μ� �̸���
-- '����' �̶�� ����Ѵ�.     
--�̸�               �μ���ȣ �μ��̸�          
---------- ---------- --------------
--SMITH              20 RESEARCH      
--ALLEN              30 SALES         
--WARD               30 SALES         
--JONES              20 RESEARCH    
select nvl(ename,'����') �̸�
, nvl2(e.deptno,to_char(e.deptno),'����') �μ���ȣ
, dname �μ��̸�
from emp e, dept d
where e.deptno(+)=d.deptno
union
select ename �̸�
, nvl2(d.deptno,to_char(d.deptno),'����') �μ���ȣ
, nvl(dname,'����') �μ��̸�
from emp e, dept d
where e.deptno=d.deptno(+);



--11. Ŀ�̼��� ������ ��� ������ �̸�, Ŀ�̼�, �μ��̸�, ��ġ�� ��ȸ�ϴ� sql�� �ۼ��Ͻÿ�.

--ENAME           COMM        DNAME         	LOC
----------------------------------------------------
--KING		3500	ACCOUNTING	NEW YORK
--JONES		30	RESEARCH	DALLAS
--TURNER	0	SALES		CHICAGO
--MARTIN	300	SALES		CHICAGO
--WARD		200	SALES		CHICAGO
--ALLEN		300	SALES		CHICAGO         

select ename, nvl(comm,0) comm, dname, loc
from emp e, dept d
where e.deptno = d.deptno;

-- 12. DALLAS���� �ٹ��ϴ� ����� �̸�,  ����, ����� ����Ͻÿ�.(5��)
--�̸�         ����             ���          
---------- --------- --------------
--SMITH      800         1      
--JONES      2975       4   
--SCOTT      3000      4      
--ADAMS    1100         1
--FORD       3000        4      

select ename �̸�, sal ����, grade ���
from emp e, salgrade s, dept d
where  e.deptno =  d.deptno
and loc = 'DALLAS'
and sal between losal and hisal;


--13. 'DALLAS'���� �ٹ����� ������ ����� ������ ���� ������ ���� �������� �����Ͻÿ�.

--	ó�����
--	----------------------------
--                �������� X���̰� ������ ���� X�Դϴ�.

select '�������� '||count(ename)||'���̰� ������ ����'||sum(sal)||'�Դϴ�.' ó�����
from emp e, dept d
where  e.deptno =  d.deptno
and loc = 'DALLAS';

--14. �μ��� �ִ� ������ "�μ���", "�ִ����" ���� ����Ͻÿ�.(�ִ������ ū ��)
	
--	�μ���	�ִ����
	----------------------------
--	xxxx          xxx
--	 :	   :

select dname �μ��� ,max(sal) �ִ����
from emp e, dept d
where e.deptno= d.deptno
group by dname
order by �ִ���� desc;


--15. ���޺� �ּ� ������ 3000 �̻��� �Ǵ� ������ ���޸�� �ּ� ������  ����Ͻÿ�. 

--	���޸�	�ּҿ���
	----------------------------
--	xxxx          xxx
--	 :	   :

select job ���޸� ,min(sal) �ּҿ���
from emp
group by job
having min(sal) >= 3000;

--16. �μ��� ��տ����� ����ϵ�, ��տ��ް� 2000����
-- ū �μ��� �μ� �̸��� ��տ����� ����Ͻÿ�.

--	�μ���     ��տ���
           	------------------------
--	xxxx          xxx
--	 :	   :
select dname �μ���, avg(sal) ��տ���
from emp e, dept d
where e.deptno= d.deptno
group by dname
having avg(sal) > 2000;
 

--17. Ŀ�̼��� ������ ������ �߿��� �μ��� �ִ������ ����Ͻÿ�. 
--�ִ� ������ ���� ������ �����Ͽ� ����Ͻÿ�.

--	�μ���     �ִ����
           	------------------------
--	xxxx          xxx
--	 :	   :

select dname �μ���, max(sal) �ִ����
from emp e, dept d
where e.deptno= d.deptno
group by dname
order by �ִ���� desc;

--18. �μ��� �ٹ� ������ 5�� �̻��� �μ��� �μ���� �������� ����Ѵ�.
--
--	�μ���       �ٹ��ο� ��
--              -------------------------
--             xxxx            x
--	 :	    :

select dname �μ���, count(ename) "�ٹ��ο� ��"
from emp e, dept d
where e.deptno= d.deptno
group by dname
having count(ename)>=5;

