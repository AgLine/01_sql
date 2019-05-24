--day05


/*
�־��� ���� 3��
1.mgr=7698
2.job='CLERK'
3.sal>1300

�� ������ ���� ������ ���� ����� ��� �޶������� Ȯ���غ���
*/

--1)�Ŵ����� ����� 7698�̸�, ������ 'CLERK'�̰ų�
--  �޿��� 1300�� �Ѵ� ������ �����ϴ� ������ ������ ��ȸ
--  ���,�̸�,����,�޿�,�Ŵ������

SELECT e.empno
      ,e.ename
      ,e.job
      ,e.sal
      ,e.mgr
  FROM emp e
 WHERE e.mgr=7698
   AND e.job='CLERK'
    OR e.sal > 1300
;
--2)�Ŵ����� 7698�� �����߿���
--  ������ ''CLERK' �̰ų� �޿��� 1300�� �Ѵ� ������ �����ϴ�
--  ������ ����
SELECT e.empno
      ,e.ename
      ,e.job
      ,e.sal
      ,e.mgr
  FROM emp e
 WHERE e.mgr=7698
   AND (e.job='CLERK' OR e.sal > 1300)
;
--3)������ CLERK�̰ų� 
--  �޿��� 1300�� �����鼭
--  �Ŵ����� 7698 �� ������ ���� ��ȸ
SELECT e.empno
      ,e.ename
      ,e.job
      ,e.sal
      ,e.mgr
  FROM emp e
 WHERE e.job='CLERK'
    OR (e.sal > 1300 AND e.mgr = 7698)
;
--AND�����ڴ� OR �����ں��� �켱������ ���� ������ 
--�ι�° ����ó�� ��ȣ�� ������� �ʾƵ� �������� �����ϰ� ���´�

----------------------------------------------------------------------------
--�Լ�
--(3)������ �Լ�
----1)�����Լ�:
-------1.MOD(m,n) : m�� n���� ���� ������ ��� �Լ�
SELECT mod(10,3)
  FROM emp
;
--��� : 1�� emp ���̺��� �� �� ��ŭ �ݺ� ���
SELECT mod(10,3)
  FROM dept
;
--��� : 1�� dept ���̺��� �� ���� 4�� ���

--���� : emp ���̺��� �� ����� �޿��� 3���� ���� ������

SELECT mod(e.sal,3)
  FROM emp e
;

--���� : emp ���̺��� �� ����� �޿��� 3���� ���� �������� ����� �Բ� ��ȸ�Ͻÿ�
--      ����� ���� ��ȸ�ǵ��� �Ͻÿ�

SELECT e.empno
      ,mod(e.sal,3)
  FROM emp e
;

--------2. ROUND(m,n) : �Ǽ� m�� �Ҽ��� n+1 �ڸ����� �ݿø� �� ��� ���
SELECT ROUND(1234.56, 1)
  FROM dual
;

SELECT ROUND(1234.56, 0)
  FROM dual
;
--           ROUND(m) : n���� �����ϸ� n = 0�� ������ ������ ����� ������
SELECT ROUND(1234.56)
  FROM dual
;
--------3. TRUNC(m,n) : �Ǽ� m�� n���� ������ �ڸ� ���� �Ҽ��� ����
--                      �� �Ҽ������� ����
SELECT TRUNC(1234.56,1)
  FROM dual
;
SELECT TRUNC(1234.56,0)
  FROM dual
;
--------4. CEIL(n) : �Էµ� �Ǽ� n ���� ���ų� ���� ����� ū ����
SELECT CEIL(1234.56)
  FROM dual
;
SELECT CEIL(1234.0001)
  FROM dual
;
--------5. FLOOR(n) : �Էµ� �Ǽ� n ���� ���ų� ���� ����� ���� ����
SELECT FLOOR(1234.56)
  FROM dual
;
SELECT FLOOR(1235.56)
  FROM dual
;
--------6. WIDTH_BUCKET(expr,min,max,buckets)
--min~max �� ���̸� buckets ������ŭ���� ������ expr�� ����ϴ� ���� ��� buckets�� ��ġ�ϴ��� ���ڷ� �˷���
--�޿��� ������ 0~5000 ���� ���, �� bucket�� 1000 ������ ������ �� 5���� bucket�� ������ �� �� �����Ƿ�
--�� ������ �޿��� ��� bucket�� ��ġ�ϴ��� ���غ���
SELECT e.empno
      ,e.ename
      ,e.sal
      ,WIDTH_BUCKET(e.sal, 0, 5000, 5) as "�޿� ����"
  FROM emp e 
 ORDER BY "�޿� ����"
;