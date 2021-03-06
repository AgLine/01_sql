SELECT *
 FROM emp
 ;-- DAY 02
-- 주석 : 프로그램 실행에 영향이 없음
-- SESSION 설정
ALTER SESSION 
  SET "_ORACLE_SCRIPT"=true
;

--SCOTT 계정 생성 스크립트 실행
@C:\app\304\product\18.0.0\dbhomeXE\rdbms\admin\scott.sql
;

-- SCOTT 계정 EMP 테이블 조회
SELECT *
  FROM emp
;

-- SCOTT 계정 DEPT 테이블 조회
SELECT *
  FROM dept
;  
-- 2. DQL : SELECT 
-- 1) emp 테이블에서 job 컬럼을 조회
SELECT job
  FROM emp
;
/*
JOB
----------
CLERK
SALESMAN
SALESMAN
MANAGER
SALESMAN
MANAGER
MANAGER
PRESIDENT
SALESMAN
CLERK
ANALYST
CLERK
*/
-- 2) emp 테이블에서 중복을 제거하여
--    job 컬럼을 조회
SELECT DISTINCT job
  FROM emp
;
-- => 각 JOB 이 한번씩만 조회된 결과
--    를 얻을 수 있다.
--    이 결과로 회사에는 다섯 종류의
--    JOB 이 있음을 확인할 수 있다.

/* 다중 행 주석 
JOB
----------
CLERK
SALESMAN
ANALYST
MANAGER
PRESIDENT
*/

-- 3) emp 테이블에서 job과 deptno 를 조회
SELECT job 
     , deptno
  FROM emp
;
/*
CLERK	    20
SALESMAN	30
SALESMAN	30
MANAGER	    20
SALESMAN	30
MANAGER	    30
MANAGER	    10
PRESIDENT	10
SALESMAN	30
CLERK	    30
ANALYST	    20
CLERK	    10
*/

-- 4) emp 테이블에서 중복을 제거하여
--    job, deptno 를 조회
SELECT DISTINCT job
     , deptno
  FROM emp
;
/*
JOB,    DEPTNO
--------------
CLERK	    20
MANAGER	    20
MANAGER	    30
MANAGER	    10
SALESMAN	30
PRESIDENT	10
CLERK	    30
ANALYST	    20
CLERK	    10
*/

-- 5) emp 테이블에서 중복을 제거하여 
--    job 을 조회하고
--    결과를 job의 오름차순으로 정렬하시오.
SELECT DISTINCT job
  FROM emp
 ORDER BY job
; 
-- (2) 번 쿼리의 실행결과와 
--    정렬순서가 다른 것을 확인하고 넘어가자.

/*
JOB
--------
ANALYST
CLERK
MANAGER
PRESIDENT
SALESMAN
*/

-- 6) emp 테이블에서 중복을 제거하여
--    job 을 조회하고
--    job 을 내림차순으로 정렬하시오.
--    (5) 번의 실행결과와 비교
SELECT DISTINCT job
  FROM emp
 ORDER BY job DESC
;  
/*
JOB
---------
SALESMAN
PRESIDENT
MANAGER
CLERK
ANALYST
*/

-- 7) emp 테이블에서 empno(사번), ename(직원이름), job(직무) 
--    를 조회하시오.
SELECT empno
      ,ename
      ,job
  FROM emp
;
/*
EMPNO,  ENAME,  JOB
-------------------------
7369	SMITH	CLERK
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7566	JONES	MANAGER
7654	MARTIN	SALESMAN
7698	BLAKE	MANAGER
7782	CLARK	MANAGER
7839	KING	PRESIDENT
7844	TURNER	SALESMAN
7900	JAMES	CLERK
7902	FORD	ANALYST
7934	MILLER	CLERK
*/

-- 8) emp 테이블에서
--    empno, ename, job, hiredate(입사일) 
--    을 조회하시오.
SELECT empno
      ,ename
      ,job
      ,hiredate
  FROM emp
;
/*
EMPNO,  ENAME,  JOB,        HIREDATE
------------------------------------
7369	SMITH	CLERK	    80/12/17
7499	ALLEN	SALESMAN	81/02/20
7521	WARD	SALESMAN	81/02/22
7566	JONES	MANAGER	    81/04/02
7654	MARTIN	SALESMAN	81/09/28
7698	BLAKE	MANAGER	    81/05/01
7782	CLARK	MANAGER	    81/06/09
7839	KING	PRESIDENT	81/11/17
7844	TURNER	SALESMAN	81/09/08
7900	JAMES	CLERK	    81/12/03
7902	FORD	ANALYST	    81/12/03
7934	MILLER	CLERK	    82/01/23
*/

--ORDER BY : 정령
--9)emp테이블에서 comm을 가장 많이 받는 순서대로
--  empno,ename,job,hiredate,comm 컬럼을 조회하시오.
SELECT empno
      ,ename
      ,job
      ,hiredate
      ,comm
    FRom emp
    ORDER BY comm DESC
;
-- ==>null데이터는 항상 큰값으로 취급한다.
-- 따라서 DESC정령에서 가장 위쪽에 정렬된다.
/*
empno,  ename,  job,    hiredate,    comm   
7369	SMITH	CLERK	80/12/17	
7698	BLAKE	MANAGER	81/05/01	
7902	FORD	ANALYST	81/12/03	
7900	JAMES	CLERK	81/12/03	
7839	KING	PRESIDENT	81/11/17	
7566	JONES	MANAGER	81/04/02	
7934	MILLER	CLERK	82/01/23	
7782	CLARK	MANAGER	81/06/09	
7654	MARTIN	SALESMAN	81/09/28	1400
7521	WARD	SALESMAN	81/02/22	500
7499	ALLEN	SALESMAN	81/02/20	300
7844	TURNER	SALESMAN	81/09/08	0
*/

-- 10)cmp 테이블에서 
--    comm은 적은 순서대로 , job은 오름차순(영문), ename 오름차순(영문)
--    정령하여
--     empno,ename,job,hiredate,comm 컬럼을 조회하시오.
SELECT empno
      ,ename
      ,job
      ,hiredate
      ,comm
  FROM emp
 ORDER BY comm, job, ename
 ;
 /*
 empno,  ename,  job,    hiredate,    comm 
 7844	TURNER	SALESMAN	81/09/08	0
7499	ALLEN	SALESMAN	81/02/20	300
7521	WARD	SALESMAN	81/02/22	500
7654	MARTIN	SALESMAN	81/09/28	1400
7902	FORD	ANALYST	    81/12/03	
7900	JAMES	CLERK	    81/12/03	
7934	MILLER	CLERK	    82/01/23	
7369	SMITH	CLERK	    80/12/17	
7698	BLAKE	MANAGER 	81/05/01	
7782	CLARK	MANAGER 	81/06/09	
7566	JONES	MANAGER	    81/04/02	
7839	KING	PRESIDENT	81/11/17	
*/

 --emp테이블에서
 --comm 이 적은 순서대로, job 오른차순,ename 내림차순 으로 정렬하여
-- empno,ename,job,hiredate,comm 컬럼을 조회하시오.
SELECT empno
      ,ename
      ,job
      ,hiredate
      ,comm
  FROM emp
 ORDER BY comm, job, ename DESC
 ;
 
/*
 empno,  ename,  job,       hiredate,   comm
7844	TURNER	SALESMAN	81/09/08	0
7499	ALLEN	SALESMAN	81/02/20	300
7521	WARD	SALESMAN	81/02/22	500
7654	MARTIN	SALESMAN	81/09/28	1400
7902	FORD	ANALYST	    81/12/03	
7369	SMITH	CLERK	    80/12/17	
7934	MILLER	CLERK	    82/01/23	
7900	JAMES	CLERK	    81/12/03	
7566	JONES	MANAGER	    81/04/02	
7782	CLARK	MANAGER	    81/06/09	
7698	BLAKE	MANAGER	    81/05/01	
7839	KING	PRESIDENT	81/11/17	
*/

--Alias : 별칭
--11)emp 테이블에서
--   empno=> Employee No.
--   enmae=> Employee Name
--   job  => Job Name
--   세 컬럼의 이름을 별칭으로 바꾸어서 조회

SELECT empno AS "Employee No."
      ,ename AS "Employee Name" --AS키워드는 생략가능
      ,job AS "Job Name"
 FROM emp
 ;
 
 /*
Employee No., Employee Name, Job Name
7369	    SMITH	    CLERK
7499	    ALLEN	    SALESMAN
7521	    WARD	    SALESMAN
7566	    JONES	    MANAGER
7654	    MARTIN	    SALESMAN
7698	    BLAKE	    MANAGER
7782	    CLARK	    MANAGER
7839	    KING	    PRESIDENT
7844	    TURNER	    SALESMAN
7900	    JAMES	    CLERK
7902	    FORD	    ANALYST
7934	    MILLER	    CLERK
 */
 
 --12)한글 별칭을 사용
 --   emp 테이블에서 각 컬럼에 한글 별칭을 사용
 --   empno=>사번
 --   enmae=> 이 름
 --   job  =>wlran
 
 SELECT empno 사번
      ,ename AS "이 름" 
      ,job AS 직무
 FROM emp
 ;
 
 /*
사번,    이 름,  직무
7369	SMITH	CLERK
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7566	JONES	MANAGER
7654	MARTIN	SALESMAN
7698	BLAKE	MANAGER
7782	CLARK	MANAGER
7839	KING	PRESIDENT
7844	TURNER	SALESMAN
7900	JAMES	CLERK
7902	FORD	ANALYST
7934	MILLER	CLERK
 */
 
 --13)테이블에 별칭 설정
 --   emp 테이블에 empno,enmae 를 조회하시오
--    1.별칭없이 구문작성
SELECT empno
      ,enmae
  FROM emp
;
-- 2.SELECT 절에 컬럼 나열할 떄 앞에 테이블이름을 붙일 수 있음
--   테이블ㅇ 이름을 붙여서 컬럼을 조회
SELECT emp.empno
      ,emp.ename
  FROM emp
;
-- 3.FROM 절의 emp 테이블에 e라는 별칭을 주고 
--   SELECT 절의 컬럼 앞에 테이블 별칭 e를 붙여서 조회
SELECT e.empno --테이블 별칭이 사용되는 위치 : 컬럼 이름 앞
      ,e.ename
  FROM emp e--테이블 별칭 사용 위치
;

--14)영문 별칭을 사용할 떄, 쌍따옴표를 사용하지 않으면
--  =>결과 출력시 별칭이 모두 대문자화 되어 조화됨.
--  emp테이블에서
--  emp