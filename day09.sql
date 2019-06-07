--����) ȸ�翡 �Ŵ����� ������ ������ ����ΰ� ��Ī: ��簡 �ִ� ������ ��

SELECT COUNT(e.mgr) "��簡 �ִ� ������ ��"
  FROM emp e
;  

--����)�Ŵ��� ���� �ð��ִ� ������ ����ΰ�?
--1.emp ���̺��� mgr�÷��� ������ ���¸� �ľ�
--2.mgr�÷��� �ߺ������͸� ����
--3.�ߺ������Ͱ� ���ŵ� ����� ī��Ʈ

SELECT COUNT(DISTINCT e.mgr) "�Ŵ��� ���� �ð��ִ� ����"
  FROM emp e
;

--����)�μ��� ������ ������ ����̳� �ִ°�
SELECT COUNT(e.deptno) "�μ�"
  FROM emp e
;

--����) ��ü�ο�, �μ� �����ο�, �μ� �̹��� �ο��� ���Ͻÿ�.
SELECT COUNT(*) ��ü�ο�
      ,COUNT(e.deptno)
      ,COUNT(*) - COUNT(e.deptno)
  FROM emp e
;


--SALESMAN�� ���� ����� ���غ���
--������� ����� ������� ����$, ���ڸ� ���� �б�����

SELECT to_char(AVG(e.comm),'$9,999') 
  FROM emp e
;

----3. GROUP BY
--����) �� �μ����� �޿��� ����, ���, �ִ�, �ּҸ� ��ȸ

--1.�� �μ����� �޿��� ������ ��ȸ�Ϸ��� SUM()�� ���
-- �׷�ȭ ������ �μ���ȣ�� ���

SELECT e.deptno �μ���ȣ
      ,SUM(e.sal) "�μ� �޿� ����"
      ,AVG(e.sal) "�μ� �޿� ���"
      ,MAX(e.sal) "�μ� �޿� �ִ�"
      ,MIN(e.sal) "�μ� �޿� �ּ�"
  FROM emp e
 GROUP BY e.deptno
 ORDER By e.deptno
;

SELECT SUM(e.sal) "�μ� �޿� ����"
      ,TO_CHAR(AVG(e.sal),'$9,999') "�μ� �޿� ���"
      ,TO_CHAR(MAX(e.sal),'$9,999') "�μ� �޿� �ִ�"
      ,TO_CHAR(MIN(e.sal),'$9,999') "�μ� �޿� �ּ�"
  FROM emp e
 GROUP BY e.deptno
 ORDER By e.deptno
;

SELECT e.deptno �μ���ȣ
      ,SUM(e.sal) "�μ� �޿� ����"
      ,AVG(e.sal) "�μ� �޿� ���"
      ,MAX(e.sal) "�μ� �޿� �ִ�"
      ,MIN(e.sal) "�μ� �޿� �ּ�"
  FROM emp e
-- GROUP BY e.deptno
 ORDER By e.deptno
;

--����) ������ �޿��� ����, ���, �ִ�, �ּ� �� ���غ���
--��Ī:����, �޿�����, �޿����, �ִ�޿�, �ּұ޿�
SELECT NVL(e.job,'���� �̹���') ����
      ,SUM(e.sal) �޿�����
      ,AVG(e.sal) �޿����
      ,MAX(e.sal) �ִ�޿�
      ,MIN(e.sal) �ּұ޿�
  FROM emp e
 GROUP BY e.job
 ORDER By e.job
;

--������ �̹����� ������� ������ ��� '�����̹���'���� ���

/*
GROUP BY ����� ������ �ɾ �� ����� ������ �������� ���Ǵ� ��
HAVING ���� WHERE ���� ���������
SELECT ������ ������� ������ 
GROUP BY�� ����� ������ �� ����.

���� GROUP BY ���� ��������� ������ HAVING���� �����Ѵ�
*/

--����) �μ��� �޿� ����� 2000�̻��� �μ��� ��ȸ�Ͽ���

--a) �켱 �μ��� �޿� ����� ���Ѵ�
SELECT e.deptno �μ���ȣ
      ,AVG(e.sal) �޿����
  FROM emp e
 GROUP BY e.deptno
;
--b) a�� ������� �޿������ 2000�̻��� ���� ����� 
SELECT e.deptno �μ���ȣ
      ,AVG(e.sal) �޿����
  FROM emp e
 GROUP BY e.deptno
HAVING AVG(e.sal) >= 2000
;

--HAVING ���� �����ϴ°�� SELECT������ ���� ���� ����
/*
1. FROM     ���� ���̺� �� �� ��θ� ������� 
2. WHERE    ���� ���ǿ� ���� �ุ �����ϰ�
3. GROUP BY ���� ���� �÷�, ������ �׷�ȭ ����
4. HAVING   ���� ������ ������Ű�� �׷��ุ ���� 4 ���� ���õ� �׷� ������ ���� �࿡ ���ؼ�
5. SELECT   ���� ��õ� �÷�, �ĸ� ���
7. ORDER BY �� �ִٸ� ���� ���ǿ� ���߾� ���� �����Ͽ� ��� ���
*/

-- ������ �ǽ�

-- 1. �Ŵ�����, ���������� ���� ���ϰ�, ���� ������ ����
--   : mgr �÷��� �׷�ȭ ���� �÷�
SELECT e.mgr
      ,COUNT(*) "�������� ��"
  FROM emp e 
 GROUP BY e.mgr
 ORDER BY "�������� ��" DESC
;
/*
MGR, �������� ��
7698	5
(null)  3
7839	3
7566	1
7782	1
7902	1
*/
-- 2.1 �μ��� �ο��� ���ϰ�, �ο��� ���� ������ ����
--    : deptno �÷��� �׷�ȭ ���� �÷�
SELECT e.deptno �μ���ȣ
      ,COUNT(e.empno) �ο�
  FROM emp e
 GROUP BY e.deptno
 ORDER BY �ο� DESC
;
/*
�μ���ȣ, �ο�
30	    6
20	    3
10	    3
        2
*/
-- 2.2 �μ� ��ġ �̹��� �ο� ó��
SELECT NVL(TO_CHAR(e.deptno),'���� �̹���') �μ���ġ
  FROM emp e
 GROUP BY e.deptno
;
/*
�μ���ġ
30
���� �̹���
10
20
*/

-- 3.1 ������ �޿� ��� ���ϰ�, �޿���� ���� ������ ����
--   : job �� �׷�ȭ ���� �÷�
SELECT TO_CHAR(AVG(e.sal),'$9,999.99') ���
  FROM emp e
 GROUP BY e.job
 ORDER BY  ��� DESC
;
/*
���

 $5,000.00
 $3,000.00
 $2,758.33
 $1,400.00
 $1,016.67
*/
-- 3.2 job �� null �� ������ ó��
SELECT NVL(e.job,'���� �̹���') ����
  FROM emp e
 GROUP BY e.job
;
/*
����
CLERK
SALESMAN
ANALYST
MANAGER
���� �̹���
PRESIDENT
*/

-- 4. ������ �޿� ���� ���ϰ�, ���� ���� ������ ����
--   : job �� �׷�ȭ ���� �÷�
SELECT SUM(e.sal) ����
  FROM emp e
 GROUP BY e.job
 ORDER BY ���� DESC
;
/*
����

8275
5600
5000
3050
3000
*/
-- 5. �޿��� �մ����� 1000�̸�, 1000, 2000, 3000, 5000 ���� �ο����� ���Ͻÿ�
--    �޿� ���� ������������ ����
SELECT COUNT(CASE WHEN e.sal >= 5000 THEN 1 END) as "5" 
      ,COUNT(CASE WHEN e.sal >= 3000 AND e.sal < 5000 THEN 1 END)  as "3"
      ,COUNT(CASE WHEN e.sal >= 2000 AND e.sal < 3000 THEN 1 END)   as "2"
      ,COUNT(CASE WHEN e.sal >= 1000 AND e.sal < 2000 THEN 1 END)   as "1"
      ,COUNT(CASE WHEN e.sal < 1000 THEN 1 END)   as "0"
  FROM emp e
;
SELECT SUBSTR(e.sal,1,1)
      ,COUNT(*)
  FROM emp e
 GROUP BY  SUBSTR(e.sal,1,1)
;
-- 6. ������ �޿� ���� ������ ���ϰ�, �޿� ���� ������ ū ������ ����
SELECT *
  FROM emp e
 GROUP BY SUBSTR((SELECT SUM(e.sal)
                    FROM emp e
                   GROUP BY e.job),1,2)
;

-- 7. ������ �޿� ����� 2000������ ��츦 ���ϰ� ����� ���� ������ ����
SELECT e.job "����"
      ,AVG(e.sal) "�޿� ���"
  FROM emp e
 GROUP BY e.job
 HAVING AVG(e.sal) <= 2000
 ORDER BY "�޿� ���" DESC
;
/*
����,      �޿� ���
SALESMAN	1400
CLERK	    1016.666666666666666666666666666666666667
*/

-- 8. �⵵�� �Ի� �ο��� ���Ͻÿ�
SELECT SUBSTR(e.hiredate,1,2) "�Ի�⵵"
      ,COUNT (*) �ο�
  FROM emp e
 GROUP BY SUBSTR(e.hiredate,1,2)
;
/*
�Ի�⵵, �ο�
82	        1
            2
80      	1
81	       10
*/