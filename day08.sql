--sql ���� : ������

--16)
SELECT e.empno
      ,e.ename
      ,e.job
      ,CASE e.job WHEN 'CLERK'      THEN 300
                  WHEN 'SALESMAN'   THEN 450
                  WHEN 'MANAGER'    THEN 600
                  WHEN 'ANALYST'    THEN 800
                  WHEN 'PRESIDENT'  THEN 1000
        END AS "�ڱ� ��ߺ�"
  FROM emp e
;d