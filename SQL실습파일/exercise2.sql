--�������ϸ� : exercise2.sql
--QUESTION
--1. ��� ���̺��� ����̸��� ù���ڴ� �빮�ڷ�, �������� �ҹ��ڷ� ����Ͻÿ�.
-- [���]       ����̸�
--           ---------------------
--                  Smith
--		:
select initcap(ename) ����̸� from emp;

--2. ������̺��� ����̸��� �̰� �� �̸��� �ι�° ���ں��� �׹�° ���ڱ���
-- ����Ͻÿ�.
-- [���]         ����̸�    2-4����
--                  ---------------------
--                  SMITH        MIT
--		:	:
select ename, substr(ename,2,3) from emp;

--3. ������̺��� ��� �̸��� ���� ������ ����Ͻÿ�.
select length(ename) from emp;

--4. ������̺��� ��� �̸��� �� ���� �ϳ��� ������ ���� �ϳ��� ����ϵ� 
-- ��� �ҹ��ڷ� ���� ����Ͻÿ�.
select ename, lower(SUBSTR(ename,1,1) || SUBSTR(ename, length(ename)))
from emp;

--5. 3456.78�� �ݿø��Ͽ� �Ҽ��� �Ʒ� ù��° �ڸ� ������ ��Ÿ���ÿ�.
select round(3456.78 , 1)
from dual;
--6. ���޿� 55�� ���ϰ� �ʴ����� �����Ͽ� ����ϴµ� ���޵ڿ� '��'�� ���̰� 
--    õ�������� ','�� �ٿ��� ����Ѵ�.
--[���]	��� ���
-----------------
--          40,000��
--	80,000��
-- 	62,500��
--	148,700��
select to_char(trunc(sal*55,-2), '999,999')||'��' 
as "��� ���" 
from emp;
--7. ���� �̸��� Ŀ�̼� ���� ���θ� ����ϴµ� �����Ǿ����� '����'
--    �������� �ʾ����� '����'�� ����Ͻÿ�.
--    	SMITH	����	
--	    ALLEN	    ����	300
--	    WARD	    ����	200
--	    JONES	    ����	30

select ename, nvl2(comm,'����','����'), comm
from emp;

--8. ���� �̸��� �μ���ȣ �׸��� �μ���ȣ�� ���� �μ����� ����Ͻÿ�.
--    �μ��� ���� ������ '����' �� ����Ͻÿ�.
--    (�μ��� : 10 �̸� 'A �μ�', 20 �̸� 'B �μ�', 30 �̸� 'C �μ�')
select ename, deptno ,
case deptno
    when 10 then 'A �μ�'
    when 20 then 'B �μ�'
    when 30 then 'C �μ�'
    else '����'
    end as �μ���
from emp;


--9. ������ 'SALESMAN'�̰� ������ 1000�̻��� �����
-- �̸��� ������ ����Ͻÿ�.

select ename, sal from emp
where job='SALESMAN'
and
sal>=1000;

--10. ���ó�¥�� ���ó�¥���� 10���� ���� ��¥�� ����Ͻÿ�.

select sysdate, sysdate+10
from dual;

--11. ���� �ð��� "....�� ..�� ..�� ..�� ..��" ���� ����Ͻÿ�. --fm�� ���̸� �տ� 0�� ������!
select TO_char(sysdate, 'YYYY"��" fmmm"��" dd"��" hh24"��" mi"��"')
from dual;

--12. ������ �̸�, ���޿�, ������ ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ�.
--(��, ������ ������ $200�� �� ���ʽ��� �����Ͽ� ����մϴ�.)

--�̸�              ���޿�               ����
---------------------------------------------------
--SMITH             800                 12000
--ALLEN            1600                 21600
--WARD             1250                 17400

select ename, sal, (sal+200)*12 as ����
from emp;

--13.  5��16��_�߰�.docx �� ��ü
select ename, sal, 
case
    when sal<1000 then 'A'
    when sal >=1000 and sal<2000 then 'B'
    when sal >=2000 and sal<3000 then 'C'
    when sal >=3000 and sal<4000 then 'D'
    else 'E'
end as �ڵ�
from emp;
--14. 5��16��_�߰�.docx �� ��ü
select ename, deptno,
decode(deptno,
        10,'A',
        20,'B',
        30,'C',
        40,'E',
        'F') as �ڵ�
from emp;

--15.  ���̸��� Employee and Job Title�̰�, �޸��� �������� ���е� �����̸��� 
--������ ����ǵ��� �ϴ� ���Ǹ� �ۼ��Ͻÿ�.

--Employee and Job Title
---------------------------
--SMITH, CLERK
--ALLEN, SALESMAN
select ename||', '||job as "Employee and Job Title"
from emp;

--16. �̸��� �ι�° ���ڰ� ��A���� ��� ������ �̸��� ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ� 

--ENAME
----------
--WARD 
--MARTIN
--JAMES

select ename from emp
where ename like '_A%';

--17. �̸�, �Ի���, �Ի��� ������ ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ�
--�Ի��� ������ �������� �������� �����մϴ�.(�̶� ���ؿ����� �����Ϸ� �մϴ�)
--(�̶�, �̸�, �Ի��� �Ի���� ��Ī�� ����մϴ�.)

--�̸�                �Ի���              �Ի����
---------------------------------------------------
--MARTIN         1981��9��28��        ������

select ename �̸�
    , to_char(hiredate,'yyyy"��"mon"��"dd"��"') as �Ի���
    , to_char(hiredate,'day') as �Ի����
from emp
order by TO_CHAR(hiredate-1, 'd');



--18.   ��� ������ �̸��� ��������� �Ի�Ⱓ�� ������(���� ����� ���� �ݿø��� ��)�� 
--   ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ�
--   (�̶�, �Ի�Ⱓ�� �ش��ϴ� ����Ī�� ��MONTHS WORKED���� �ϰ�, 
--    �Ի�Ⱓ�� ���� ���� ���������� �����մϴ�.)

--��¿�)
--ENAME         MONTHS WORKED
--------------------------------
--ADAMS            284
--SCOTT            286
--MILLER           348
select ename,
    round(months_between(sysdate, hiredate),0) as "months worked"
from emp
order by hiredate desc;

select ename,
    round(months_between(sysdate, hiredate),0) as "months worked"
from emp
order by "months worked";

select * from emp;
--��� ������ ������ ����
select ename,
    round(months_between(sysdate, hiredate),0) as "months worked"
from emp
order by 2;


--19. ������̺��� ����̸��� ������� ���� ��¥������ �ٹ��ϼ��� ���Ͻÿ�.
--����̸�   �ٹ��ϼ�
-- -----------------------
--SMITH    12474��
--ALLEN    12409��
--WARD    12407��
--JONES    12368��
--MARTIN    12189��
--BLAKE    12369��

select ename as ����̸�
    ,round(sysdate-hiredate,0) as �ٹ��ϼ�
from emp;

--20. 1981�⵵�� �Ի��� �������� �̸�, ���� �׸��� �Ի�����
--         �Ի��� ������ ����Ͻÿ�.
select ename, job, hiredate
from emp
where to_char(hiredate,'yyyy') = '1981'
order by hiredate;

--21. �������� �������� ������ ����ϴ� SQL  ����� �ۼ��Ͻÿ�.

select to_char(to_date('1989/10/31','yyyy/mm/dd') , 'day') 
from dual;

--22. ���縦 �������� ���� �¾�� �� ���� �Ǿ����� �� �� �ִ� 
--      SQL ����� �ۼ��Ͻÿ�.
 select round(months_between(sysdate,to_date('1989/10/31','yyyy/mm/dd')),0)
 from dual;

--23. �������� �̸��� ���� �׸��� Ŀ�̼� ������ ����ϴµ�
--     Ŀ�̼��� �������� ���� ������ "����"�̶�� ����Ͻÿ�.
select ename, nvl2(comm,'','����')||comm
from emp;

select ename, sal, nvl2(comm, to_char(comm), '����')
from emp;
--24. ������̺��� �̸��� ù���ڰ� A�̰� ������ ���ڰ� N�� �ƴ� �����
-- �̸��� ����Ͻÿ�.

select ename
from emp
where ename like 'A%'
    and
    ename not like '%N';


--25. ������ �̸�, �Ի� ��¥ �׸��� �⵵�� �������� �Ͽ� �ݿø��� ��¥��
--     ����Ͻÿ�.        
select ename, hiredate, round(hiredate,'yy')
from emp;
