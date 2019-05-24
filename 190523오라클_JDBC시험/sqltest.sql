--
--�ǽ� ����
--�ۼ��� sql ���ϰ� JDBC ���� Java �ҽ��� "�̸�.zip"���� �����Ͽ� �����ϼ���.
--
--[ SQL ]
--hr �������� �����Ͽ� ������ �������� �ذ��ϰ� �� ���� �Ʒ��� SQL ���� 
--�ۼ��� �� ���ε��Ͽ� �����մϴ�. ���ϸ��� sqltest.sql �Դϴ�.
--
--1. employees ���̺��� ������ �ľ��� �� �ִ� SQL ����� �ۼ��Ͻÿ�.
desc employees;
--2. departments ���̺��� ������ �ľ��� �� �ִ� SQL ����� �ۼ��Ͻÿ�.
desc departments;
--
--3. ������ ��¥�� �ۼ��ϴ� SQL ����� �ۼ��Ͻÿ�.
--��¥�� �ۼ� ���� : 2019�� 5�� 24�� 
select to_char(sysdate, 'yyyy"��" month dd"��"') from dual;
--4. �������� �� ������� ����մϴ�.
select count(employee_id) from employees;
--5. ������ ũ���������� ���� �������� ����Ͻÿ�.
select to_char(to_date('2019/12/15','yyyy/mm/dd') , 'day') 
from dual;

--6. �μ� ��ġ�� ���� ���� ���� ������ id(employee_id), �̸�(first_name), �ش� ������ ����ϴ� �Ŵ��� ID, �Ŵ����� �̸��� ��ȸ�Ͽ� ����Ͻÿ�. 
--
--��� ��� �̸� �Ŵ��� ��� �Ŵ��� �̸�
-----------------------------------------------------------------------
--178 Kimberely 149 Eleni 
--
select e.employee_id ���
, e.first_name "��� �̸�"
, e.manager_id "�Ŵ��� ���"
, e1.first_name "�Ŵ��� �̸�" 
from employees e, employees e1
where e.manager_id = e1.employee_id
and e.department_id is null;

--7. �Ի�� ���� ������ �ְ�޿��� ��ȸ�Ͽ� ����Ͻÿ�. ��, ��½� �ְ�޿� ������������ ���ĵǾ� ����ϸ� �ְ�޿��� 10000 �̻��� ������ ����մϴ�. 
--
--�Ի��	�ְ�޿�
----------------------------
--6�� 24,000��
--1��	17,000��
--9��	17,000��
--10��	14,000��
--:
--11�� 10,500��

select to_char(hire_date, 'month') �Ի��, to_char(max(salary),'99,999')||'��' �ְ�޿� 
from employees 
group by to_char(hire_date, 'month')
having max(salary)>10000
order by �ְ�޿� desc;
--8. �Ի�⵵�� ���� ���� ���Ͽ� ����Ͻÿ�. ��, �޿��� 5000���� 10000 ���̸� ������ �׸��� �������� 7�� �̻��� ��츸 ����Ͻÿ�. ���� ����� �Ի�⵵ ������ �����Ͻÿ�.
--�Ի�⵵ ���ǿ� �´� ������
-------------------------------------------------
--05	11
--06	9
--07	8
select to_char(hire_date, 'yyyy') �Ի�⵵, count(employee_id) "���ǿ� �´� ������"
from employees
where salary between 5000 and 10000
group by to_char(hire_date, 'yyyy')
having count(employee_id)>=7
order by �Ի�⵵;

--9. �Ի����� 6���� ������ �̸�(first_name), �μ��̸�(department_name) �� ����-�Ի���ޡ��� ����Ͻÿ�. 
--�����̸� ������������ �����Ͽ� ��� �մϴ�.
--
--�̸� �μ��̸� ���ϸ޽���
----------------------------------------------------------------
--David IT ��-�Ի����
--Donald Shipping ��-�Ի����
--
--:
--
--William Accounting ��-�Ի���� 

 select first_name �̸� , department_name �μ��̸�, '��-�Ի����' ���ϸ޽���
 from employees e, departments d
 where e.department_id = d.department_id
 and to_char(hire_date, 'mm')='06'
 order by �̸�;
 
--10. 'Den'�� ���� �μ����� �ٹ��ϴ� �������� �ִ����, �ּҿ��� �׸��� ������ ����� ���Ͻÿ�.
--��, ��հ��� ����Ҷ� ����������� ����Ͻÿ�.
--
--�ִ���� �ּҿ��� �������
-----------------------------------------------------
--11000 2500 4150

select max(salary) �ִ����, min(salary) �ּҿ���, trunc(avg(salary),-2) �������
from employees
where department_id = some(select department_id from employees where first_name='Den');