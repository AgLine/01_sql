--sql 과제 : 김은선

--16)
SELECT e.empno
      ,e.ename
      ,e.job
      ,CASE e.job WHEN 'CLERK'      THEN 300
                  WHEN 'SALESMAN'   THEN 450
                  WHEN 'MANAGER'    THEN 600
                  WHEN 'ANALYST'    THEN 800
                  WHEN 'PRESIDENT'  THEN 1000
        END AS "자기 계발비"
  FROM emp e
;d