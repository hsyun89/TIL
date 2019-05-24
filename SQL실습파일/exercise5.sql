--�������ϸ� : exercise5.sql
--ANSI(SQL-99) ���� ������ ����Ͽ� ������ �ذ��Ͻÿ�.
--
---- 1. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸��� ����Ͻÿ�.
----�̸�         ����        �μ���ȣ    �μ��̸�          
------------ --------- ------------------
----SMITH      CLERK       20           RESEARCH      
----JONES      MANAGER  20           RESEARCH          
----FORD       ANALYST   20           RESEARCH      
--
--
select ename �̸�, job ����, deptno �μ���ȣ, dname �μ��̸�
from emp natural join dept ;


---- 2. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����Ͻÿ�.
----�̸�         �μ��̸�          
------------ --------------
----ALLEN      SALES         
----WARD       SALES         
----MARTIN     SALES        
--
select ename �̸�, dname �μ��̸�
from emp join dept using (deptno)
where ename like '%A%';
---- 3. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������ 
----����ϴµ� ������ 3000�̻��� ����� ����Ͻÿ�. 
----����̸�       �μ���                    ����
------------ -------------- ----------
----KING       ACCOUNTING           5000
----FORD       RESEARCH             3000
select ename ����̸�, dname �μ���, sal ����
from emp join dept using (deptno)
where sal >= 3000;
---- 4. ������ 'SALESMAN'�� ������� ������ �� ����̸�, �׸���
---- �� ����� ���� �μ� �̸��� ����Ͻÿ�. 
----����        ����̸�       �μ��̸�          
----------- ---------- --------------
----SALESMAN  TURNER     SALES         
----SALESMAN  MARTIN     SALES         
----SALESMAN  WARD       SALES         
----SALESMAN  ALLEN      SALES       
select job ����, ename ����̸�, dname �μ��̸�
from emp join dept using (deptno)
where job = 'SALESMAN';
---- 5. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,
---- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
---- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����Ͻÿ�. 
----  �����ȣ ����̸�               ����        �Ǳ޿�       �޿����
------------ ---------- ---------- ---------- ----------
----  7521 WARD            15000      15200          2
----  7654 MARTIN          15000      15300          2
----  7844 TURNER          18000      18000          3
select empno �����ȣ
, ename ����̸�
, sal*12 ����
, sal*12+comm �Ǳ޿�
, grade �޿����
from emp join dept on(emp.deptno=dept.deptno)
join salgrade on (sal between losal and hisal)
where comm is not null;

---- 6. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,
---- ����, �޿������ ����Ͻÿ�. (3��)
----   �μ���ȣ �μ��̸�           ����̸�               ����       �޿����
------------ -------------- ---------- ---------- ----------
----      10 ACCOUNTING     CLARK            2450          4
----      10 ACCOUNTING     KING             5000          5
----      10 ACCOUNTING     MILLER           1300          2 
select deptno �μ���ȣ
, dname �μ��̸�
, ename ����̸�
, sal ����
, grade �޿����
from emp join dept using (deptno)
join salgrade on (sal between losal and hisal)
where deptno = 10;
---- 7. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�, 
---- ����̸�, ����, �޿������ ����Ͻÿ�. �׸��� �� ��µ� 
---- ������� �μ���ȣ�� ���� ������, ������ ���� ������ �����Ͻÿ�. 
----   �μ���ȣ �μ��̸�           ����̸�               ����       �޿����
------------ -------------- ---------- ---------- ----------
----    10 ACCOUNTING     KING             5000          5
----    10 ACCOUNTING     CLARK            2450          4
select deptno �μ���ȣ
, dname �μ��̸�
, ename ����̸�
, sal ����
, grade �޿����
from emp join dept using (deptno)
join salgrade on (sal between losal and hisal)
where deptno in (10,20)
order by deptno, sal desc;
---- 8. ������� �̸�, �μ���ȣ, �μ��̸��� ����Ͻÿ�. 
---- ��, ������ ���� �μ��� ����ϸ� �̰�� �̸��� '����'�̶��
---- ����Ѵ�.        
----�̸�               �μ���ȣ �μ��̸�          
------------ ---------- --------------
----SMITH              20 RESEARCH      
----ALLEN              30 SALES         
----WARD               30 SALES         
----JONES              20 RESEARCH      
select nvl(ename,'����') �̸�, deptno �μ���ȣ, dname �μ��̸�
from emp right outer join dept using (deptno);
---- 9. ������� �̸�, �μ���ȣ, �μ��̸��� ����Ͻÿ�. 
---- ��, ���� �μ� ��ġ�� ������ ������  ����ϸ� �̰�� �μ���ȣ��  0 ����
---- ����Ѵ�.        
----�̸�               �μ���ȣ �μ��̸�          
------------ ---------- --------------
----SMITH              20 RESEARCH      
----ALLEN              30 SALES         
----WARD               30 SALES         
----JONES              20 RESEARCH      
select ename �̸�
, nvl(deptno,0) �μ���ȣ
, dname �μ��̸�
from emp left outer join dept using (deptno);

---- 10. ������� �̸�, �μ���ȣ, �μ��̸��� ����Ͻÿ�. 
---- ��, ������ ���� �μ��� ����ϸ� �̰�� �̸��� �μ���ȣ�� '����'�̶��
---- ����Ѵ�. ���� �μ� ��ġ�� ������ ������  ����ϸ� �μ� ��ȣ�� �μ� �̸���
---- '����' �̶�� ����Ѵ�.     
----�̸�               �μ���ȣ �μ��̸�          
------------ ---------- --------------
----SMITH              20 RESEARCH      
----ALLEN              30 SALES         
----WARD               30 SALES         
----JONES              20 RESEARCH    
select nvl(ename,'����') �̸�
, nvl2(deptno,to_char(deptno),'����') �μ���ȣ
, nvl(dname,'����') �μ��̸�
from emp full outer join dept using (deptno);

----11. Ŀ�̼��� ������ ��� ������ �̸�, Ŀ�̼�, �μ��̸�, ��ġ�� ��ȸ�ϴ� sql�� �ۼ��Ͻÿ�.
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

---- 12. DALLAS���� �ٹ��ϴ� ����� �̸�,  ����, ����� ����Ͻÿ�.
----�̸�         ����             ���          
------------ --------- --------------
----SMITH      800         1      
----JONES      2975       4   
----FORD       3000        4      
select ename �̸�, sal ����, grade ���
from emp join salgrade on (sal between losal and hisal);
----13. 'DALLAS'���� �ٹ����� ������ ����� ������ ���� ������ ���� �������� �����Ͻÿ�.
--
--	ó�����
--	----------------------------
--                �������� X���̰� ������ ���� X�Դϴ�.
select '�������� '||count(ename)||'���̰� ������ ����'||sum(sal)||'�Դϴ�.' ó�����
from emp join dept using (deptno)
where loc = 'DALLAS';
----14. �μ��� �ִ� ������ "�μ���", "�ִ����" ���� ����Ͻÿ�.(�ִ������ ū ��)
--	
--	�μ���	�ִ����
--	----------------------------
--	xxxx          xxx
--	 :	   :

select dname �μ���, max(sal) �ִ����
from emp join dept using (deptno)
group by dname
order by �ִ���� desc;

----16. �μ��� ��տ����� ����ϵ�, ��տ��ް� 2000����
---- ū �μ��� �μ� �̸��� ��տ����� ����Ͻÿ�.
--
--	�μ���     ��տ���
--           	------------------------
--	xxxx          xxx
--	 :	   :

select dname �μ���, avg(sal) ��տ���
from emp join dept using (deptno)
group by dname 
having avg(sal) >= 2000;

----17. Ŀ�̼��� ������ ������ �߿��� �μ��� �ִ������ ����Ͻÿ�. 
----�ִ� ������ ���� ������ �����Ͽ� ����Ͻÿ�.
--
--	�μ���     �ִ����
--           	------------------------
--	xxxx          xxx
--	 :	   :
--
select dname �μ���, max(sal) �ִ����
from emp join dept using (deptno)
where comm is not null
group by dname 
order by �ִ���� desc;
----18. �μ��� �ٹ� ������ 5�� �̻��� �μ��� �μ���� �������� ����Ѵ�.
--
--	�μ���       �ٹ��ο� ��
--              ---------------------------
--              xxxx            x
--	 :	    :
select dname �μ���, count(ename)  "�ٹ��ο� ��"
from emp join dept using (deptno)
group by dname
having count(ename) > 5;
----19. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� �������� 
----   �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
----   '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����Ͻÿ�. 
--      ������,��ȣ�� ������ '����'�� ��� ����Ѵ�.
----    �����ȣ ����̸�            �����ڹ�ȣ �������̸�     
------------ ---------- ---------- ----------
----    7902    FORD               7566        JONES     
----    7788    SCOTT              7566       JONES     
----    7900   JAMES              7698       BLAKE 

select e1.empno �����ȣ
, e1.ename ����̸�
, nvl2(e1.mgr,to_char(e1.mgr),'����') �����ڹ�ȣ
, nvl(e2.ename,'����') �������̸�
from emp e1 left outer join emp e2 on(e1.mgr = e2.empno);
