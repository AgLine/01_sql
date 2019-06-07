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
