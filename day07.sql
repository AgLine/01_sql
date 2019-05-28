--day07
------(4) ������ Ÿ�� ��ȯ �Լ�
/*
���� �⺻���� Ÿ��
1. ����: �ݵ�� ''����ǥ�� ���μ� ���
2. ����: ��� ������ �Ǵ� ��
3. ��¥: ����, �⵵, ��, ��, ��, ��, �� ���� ���� �ִ� Ÿ��


TO_CHAR() : �ٸ� Ÿ�Կ��� ���� Ÿ������ ��ȯ ���ִ� �Լ� ����, ��¥ ==>����

TO_DATE() : �ٸ� Ÿ�Կ��� ��¥ Ÿ������ ��ȯ ���ִ� �Լ� ��¥ ������ ���� (��¥ ���Ͽ� �´� ����) ==> ��¥

TO_NUMBER() : �ٸ� Ÿ�Կ��� ���� Ÿ������ ��ȯ ���ִ� �Լ� ���ڷθ� ������ ���� ������ ==> ����

*/

----1. to_char() : �������� ����
SELECT to_char(12345,'9999')
  FROM dual
;
SELECT to_char(12345,'99999')
  FROM dual
;
--���ڰ� ����ȭ�Ǿ� ��µǸ� ���� ���ķ� �ٲ��
--����ȭ��  �޿��� �������� ���ɵǾ��ְ� ���� ��ü�� �޿��� ���������� ���ĵǾ� ������ Ȯ���Ѵ�.

--���ڸ� ����ȭ �ϵ� �� 8ĭ�� ä�쵵�� �����.
SELECT to_char(12345,'99999999') as ������
  FROM dual
;
--�� ��ĭ�� 0���� ä���
SELECT to_char(12345,'9999999') as ������
  FROM dual
;
--�Ҽ��� ���� ǥ��
SELECT to_char(12345,'9999999.99') as ������
  FROM dual
;
--���� ���Ͽ���3�ڸ��� ���� �б� +�Ҽ���
SELECT to_char(12345,'9,999,999.99') as ������
  FROM dual
;

----2. to_date(): ��¥ ���Ͽ� �´� ���� ���� ��¥ ������ ������ ��¥ Ÿ������ ����
SELECT to_date('2019-05-28','YYYY-MM-DD') today
      ,'2019-05-28' "today ����"
  FROM dual
;
--10�� ���� ��¥ ����
SELECT to_date('2019-05-28','YYYY-MM-DD') + 10 "today + 10��"
  FROM dual
;

--��¥ ó�� ���� ���ڿʹ� ��¥ ������ �ȵ��� Ȯ���غ���
SELECT '2019-05-28' + 10 "today ����"
  FROM dual
;

----3. to_number() : ����Ŭ�� �ڵ�����ȯ�� ���ֹǷ� ���� ������ ����
SELECT '1000' + 10 �����
  FROM dual
;
SELECT to_number('1000') + 10 �����
  FROM dual
;

---- (5) DECODE(expr, serch, result [, serch ,result] ... [,default])
-- ���� default �� �����Ǿ� ���� �ʰ� expr�� ��ġ�ϴ� serch �� ���°�� DECODE ���� ����� NULL�� �ȴ�

SELECT DECODE ('YES', 'YES', '�Է°��� YES �Դϴ�.'
                    , 'NO' , '�Է°��� NO �Դϴ�.') AS �Է°��
  FROM dual
;
SELECT DECODE ('NO', 'YES', '�Է°��� YES �Դϴ�.'
                   , 'NO' , '�Է°��� NO �Դϴ�.') AS �Է°��
  FROM dual
;
SELECT DECODE ('��', 'YES', '�Է°��� YES �Դϴ�.'
                   , 'NO' , '�Է°��� NO �Դϴ�.') AS �Է°��
  FROM dual
;
SELECT DECODE ('��', 'YES', '�Է°��� YES �Դϴ�.'
                   , 'NO' , '�Է°��� NO �Դϴ�.'
                   , '�Է°��� YES/NO ��� �͵� �ƴմϴ�.') AS �Է°��
                   --default
  FROM dual
;

--emp ���̺��� job(����)���� ������� �޿���� ���������� �����ϱ�� �ߴ�
-- ���� ������ ������ ���ٷ� �ҋ� �� �������� ������� �������� ���غ���
--���,�̸�,���� �� �Բ� ���غ���
/*
CLERK       :5%
SALESMAN    :4%
MANAGER     :3.7%
ANALYST     :3%
PRESIDENT   :1.5%
*/

SELECT e.empno
      ,e.ename
      ,e.job
      ,DECODE(e.job, 'CLERK'    , e.sal * 0.05
                   , 'SALESMAN' , e.sal * 0.04
                   , 'MANAGER'  , e.sal * 0.37
                   , 'ANALYST'  , e.sal * 0.03
                   , 'PRESIDENT', e.sal * 0.15)  "������ ������"
  FROM emp e
;



