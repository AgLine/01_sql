--day06
----2)�����Լ�
-------- 1. INITCAP(str) : str �� ù ���ڸ� �빮��ȭ(����)
SELECT initcap('the watch')
  FROM dual
;
SELECT initcap('�ȳ��ϼ���')
  FROM dual
;
-------- 2. LOWER(str) : str�� ��� ���ڸ� �ҹ���ȭ(����)
SELECT lower('MR. SOCTT MCMILLAN')
  FROM dual
;
-------- 3. UPPER(str) : str�� ��� ���ڸ� �빮��ȭ(����)
SELECT upper('lee')
  FROM dual
;
--smith �� ã�µ� �Է��� �ҹ��ڷ� �� ��쿡
--SMITH �� �ٸ� ���ڷ� �νŵǹǷ� ã�� �� ����.
SELECT e.empno
      ,e.ename
  FROM emp e
 WHERE e.ename = 'smith'
;
--����� �� 0�� 
SELECT e.empno
      ,e.ename
  FROM emp e
 WHERE e.ename = 'SMITH'
;
SELECT e.empno
      ,e.ename
  FROM emp e
 WHERE e.ename = upper('smith')
;
-------- 4. LENGTH(str), LENGTHB(str)
--          str�� ���ڱ���, ������ byte�� ����Ͽ� ���ڷ� ���
SELECT LENGTH('hello, sql') as"���� ����"
  FROM dual
;
SELECT 'hello, sql�� ���� ���̴� ' || LENGTH('hello, sql') 
                                   ||'�Դϴ�' as"���� ����"
  FROM dual
;

----orcle ���� �ѱ��� 3byte �� ���
SELECT LENGTHB('hello, sql') as"���� byte"
  FROM dual
;

SELECT LENGTHB('����Ŭ') as"���� byte"
  FROM dual
;
-------- 5. CONCAT(str1,str2) : str1 �� str2 �� ���ڿ� ���� || �����ڿ� ������ ���

SELECT concat('hi','sql!')
  FROM dual
;
SELECT 'hi' || 'sql'
  FROM dual
;
-------- 6. SUMSTR(str, i, n) : str���� i ��° ��ġ�������� n���� ���ڸ� ���� 
--                              SQL ���� ���ڿ��� ������(����)�� 1���� ����

SELECT substr('SQL is cooooooooooool', 3, 4)
  FROM dual
;
-- ���� : SQL is cooooooooool~~!! ���� SQL�� �����غ���
SELECT substr('SQL is cooooooooooool~~!!', 1, 3)
  FROM dual
;
-- ���� : SQL is cooooooooool~~!! ���� is�� �����غ���
SELECT substr('SQL is cooooooooooool~~!!', 5, 2)
  FROM dual
;
-- ���� : SQL is cooooooooool~~!! ���� ~~!!�� �����غ���
SELECT substr('SQL is cooooooooooool~~!!', 22, 4)
  FROM dual
;
--���� : emp ���̺��� ������ �̸��� �� �α��� ������ �����Ͽ� ����� �Բ� ��ȸ�Ͻÿ�
SELECT substr(e.ename,1,2)
      ,e.empno
  FROM emp e
;
-------- 7. INSTR(str1,str2): �ι��� ���ڿ��� str2�� ù��° ���ڿ��� str1�� ��� ��ġ�ϴ��� �����ϴ� ��ġ�� ����Ͽ� ���ڷ� ���
SELECT instr('SQL is cooooooooooool~~!!','is') "is��ġ"
  FROM dual
;

-------- 8. LPAD,RPAD(str, n, c)
--          �Էµ� str �� ���ؼ� ��ü���ڰ� ������ �ڸ����� n ���� ��� ��ü ���ڼ� ��� ���� �����ʿ� ���� �ڸ����� c �ǹ��ڸ� ä���ִ´�
SELECT lpad('SQL is cool!',20,'*')
  FROM dual
;
SELECT rpad('SQL is cool!',20,'*')
  FROM dual
;

-------- 9. LTRIM, RTRIM , TRIM : �Էµ� ���ڿ��� ���� ������ ���� ������ ����
SELECT '>'|| '     sql is coll     '||'<'
  FROM dual
;
SELECT '>'|| ltrim('     sql is coll     ')||'<'
  FROM dual
;
SELECT '>'|| rtrim('     sql is coll     ')||'<'
  FROM dual
;
SELECT '>'|| trim('     sql is coll     ')||'<'
  FROM dual
;
--���� : �񱳰��� '  smith ' �ϋ� SMITH�� ������ ��ȸ�Ͻÿ�
SELECT *
  FROM emp e
 WHERE e.ename = trim(UPPER('  smith '))
;

-------- 10. NVL(expr1,expr2)
--           NVL2(expr1,expr2,expr3)
--           NULLIF(expr1,expr2)

--NVL(expr1,expr2): ù���� ���� ���� NULL �̸� �ι��� ������ ��ü�Ͽ� ���
--�Ŵ����� �������� ���� ������ ��� 0���� ��ü�Ͽ� ���

SELECT e.empno
      ,e.ename
      ,nvl(e.mgr,'�Ŵ�������')
  FROM emp e
;
--�Ŵ��������� �����̱⋚���� ������
SELECT e.empno
      ,e.ename
      ,nvl(e.mgr||'','�Ŵ�������')
  FROM emp e
;
-- || ���տ����ڷ� mgr�� ���ڸ� �ٿ��� ����Ÿ������ ����

--���� : || ������ ��� concat() �Լ��� ����Ͽ� ���� ����� ���ÿ�
SELECT e.empno
      ,e.ename
      ,nvl(concat(e.mgr,''),'�Ŵ�������')
  FROM emp e
;

--����Ŭ������ �� ���ڿ�('') �� NULL�� ���

--NVL2(expr1,expr2,expr3):
--    ù��° ���� ���� NOT NULL �̸� �ι�° ���� ������ ��� NULL�̸� ����° ���� ������ ���

--�Ŵ���(mgr)�� ������ ��쿡�� '�Ŵ��� ����' ���� �Ŵ����� �������� ���� ��쿡�� '�Ŵ��� ����' ���� ���
SELECT e.ename
      ,e.empno
      ,nvl2(e.mgr,'�Ŵ��� ����','�Ŵ��� ����')
  FROM emp e
;
--����Ŭ���� ���ڿ�('')�� NULL�� ���
SELECT nvl2('','IS NOT NULL','IS NULL')
  FROM dual
;
--�Է��� ���� 1ĭ¥�� ����
SELECT nvl2(' ','IS NOT NULL','IS NULL')
  FROM dual
;

--NULLIF(expr1,expr2):
--ù��° ��, �� ��°�� ���� ������ NULL ���

SELECT nullif('AAA','AAA')
  FROM dual
;


--�� ������ �ټ� �������� ���ϵ� �Ҽ��� 1�� �ڸ� ������ ����Ͻÿ�
-- �̋� �Ҽ��� 2�� �ڸ����� �ݿø�
SELECT e.empno
      ,e.ename
      ,ROUND(MONTHS_BETWEEN(SYSDATE,e.hiredate),1)
  FROM emp e
;

--���� : ���� �ð����� �ݿø� �� ��¥�� ��/��/�� ���� ���
--��Ʈ : to_char()�ú��� ���� ����� �� �ִ� ��¥/�ð� ������ ����

SELECT TO_CHAR(sysdate,'YYYY-MM-DD-HH24-MI-SS')
  FROM dual
;