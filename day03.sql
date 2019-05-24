SELECT e.empno
      ,e.ename
      ,e.job
      ,e.hiredate
      ,e.sal
      ,e.deptno
  FROM emp e
 WHERE e.job='CLERK'
   AND e.deptno=20
;

