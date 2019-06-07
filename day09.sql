--문제) 회사에 매니저가 배정된 직원이 몇명인가 별칭: 상사가 있는 직원의 수

SELECT COUNT(e.mgr) "상사가 있는 직원의 수"
  FROM emp e
;  

--문제)매니저 직을 맡고있는 직원이 몇명인가?
--1.emp 테이블의 mgr컬럼의 데이터 형태를 파악
--2.mgr컬럼의 중복데이터를 제거
--3.중복데이터가 제거된 결과를 카운트

SELECT COUNT(DISTINCT e.mgr) "매니저 직을 맡고있는 직원"
  FROM emp e
;

--문제)부서에 배정된 직원이 몇명이나 있는가
SELECT COUNT(e.deptno) "부서"
  FROM emp e
;

--문제) 전체인원, 부서 배정인원, 부서 미배정 인원을 구하시오.
SELECT COUNT(*) 전체인원
      ,COUNT(e.deptno)
      ,COUNT(*) - COUNT(e.deptno)
  FROM emp e
;


--SALESMAN의 수당 평균을 구해보자
--수당평균 결과에 숫자출력 패턴$, 세자리 끊어 읽기적용

SELECT to_char(AVG(e.comm),'$9,999') 
  FROM emp e
;

----3. GROUP BY
--문제) 각 부서별로 급여의 총합, 평균, 최대, 최소를 조회

--1.각 부서별로 급여의 총합을 조회하려면 SUM()을 사용
-- 그룹화 기준을 부서번호를 사용

SELECT e.deptno 부서번호
      ,SUM(e.sal) "부서 급여 총합"
      ,AVG(e.sal) "부서 급여 평균"
      ,MAX(e.sal) "부서 급여 최대"
      ,MIN(e.sal) "부서 급여 최소"
  FROM emp e
 GROUP BY e.deptno
 ORDER By e.deptno
;

SELECT SUM(e.sal) "부서 급여 총합"
      ,TO_CHAR(AVG(e.sal),'$9,999') "부서 급여 평균"
      ,TO_CHAR(MAX(e.sal),'$9,999') "부서 급여 최대"
      ,TO_CHAR(MIN(e.sal),'$9,999') "부서 급여 최소"
  FROM emp e
 GROUP BY e.deptno
 ORDER By e.deptno
;

SELECT e.deptno 부서번호
      ,SUM(e.sal) "부서 급여 총합"
      ,AVG(e.sal) "부서 급여 평균"
      ,MAX(e.sal) "부서 급여 최대"
      ,MIN(e.sal) "부서 급여 최소"
  FROM emp e
-- GROUP BY e.deptno
 ORDER By e.deptno
;

--문제) 직무별 급여의 총합, 평균, 최대, 최소 를 구해보자
--별칭:직무, 급여총합, 급여평균, 최대급여, 최소급여
SELECT NVL(e.job,'직무 미배정') 직무
      ,SUM(e.sal) 급여총합
      ,AVG(e.sal) 급여평균
      ,MAX(e.sal) 최대급여
      ,MIN(e.sal) 최소급여
  FROM emp e
 GROUP BY e.job
 ORDER By e.job
;

--직무가 미배정인 사람들은 직무명 대신 '직무미배정'으로 출력

/*
GROUP BY 결과에 조건을 걸어서 그 결과를 제한할 목적으로 사용되는 절
HAVING 절은 WHERE 절과 비슷하지만
SELECT 구문의 실행순서 떄문에 
GROUP BY의 결과를 제한할 수 없다.

따라서 GROUP BY 다음 수행순서를 가지는 HAVING에서 제한한다
*/

--문제) 부서별 급여 평균이 2000이상인 부서를 조회하여라

--a) 우선 부서별 급여 평균을 구한다
SELECT e.deptno 부서번호
      ,AVG(e.sal) 급여평균
  FROM emp e
 GROUP BY e.deptno
;
--b) a의 결과에서 급여평균이 2000이상인 값만 남긴다 
SELECT e.deptno 부서번호
      ,AVG(e.sal) 급여평균
  FROM emp e
 GROUP BY e.deptno
HAVING AVG(e.sal) >= 2000
;

--HAVING 절의 존재하는경우 SELECT구문의 실행 순서 정리
/*
1. FROM     절의 테이블 각 행 모두를 대상으로 
2. WHERE    절의 조건에 맍는 행만 선택하고
3. GROUP BY 절에 나온 컬럼, 식으로 그룹화 진행
4. HAVING   절의 조건을 만족시키는 그룹행만 선택 4 까지 선택된 그룹 정보를 가진 행에 대해서
5. SELECT   절에 명시된 컬럼, 식만 출력
7. ORDER BY 가 있다면 정렬 조건에 맞추어 최종 정령하여 결과 출력
*/

-- 수업중 실습

-- 1. 매니저별, 부하직원의 수를 구하고, 많은 순으로 정렬
--   : mgr 컬럼이 그룹화 기준 컬럼
SELECT e.mgr
      ,COUNT(*) "부하직원 수"
  FROM emp e 
 GROUP BY e.mgr
 ORDER BY "부하직원 수" DESC
;
/*
MGR, 부하직원 수
7698	5
(null)  3
7839	3
7566	1
7782	1
7902	1
*/
-- 2.1 부서별 인원을 구하고, 인원수 많은 순으로 정렬
--    : deptno 컬럼이 그룹화 기준 컬럼
SELECT e.deptno 부서번호
      ,COUNT(e.empno) 인원
  FROM emp e
 GROUP BY e.deptno
 ORDER BY 인원 DESC
;
/*
부서번호, 인원
30	    6
20	    3
10	    3
        2
*/
-- 2.2 부서 배치 미배정 인원 처리
SELECT NVL(TO_CHAR(e.deptno),'직무 미배정') 부서배치
  FROM emp e
 GROUP BY e.deptno
;
/*
부서배치
30
직무 미배정
10
20
*/

-- 3.1 직무별 급여 평균 구하고, 급여평균 높은 순으로 정렬
--   : job 이 그룹화 기준 컬럼
SELECT TO_CHAR(AVG(e.sal),'$9,999.99') 평균
  FROM emp e
 GROUP BY e.job
 ORDER BY  평균 DESC
;
/*
평균

 $5,000.00
 $3,000.00
 $2,758.33
 $1,400.00
 $1,016.67
*/
-- 3.2 job 이 null 인 데이터 처리
SELECT NVL(e.job,'직무 미배정') 직무
  FROM emp e
 GROUP BY e.job
;
/*
직무
CLERK
SALESMAN
ANALYST
MANAGER
직무 미배정
PRESIDENT
*/

-- 4. 직무별 급여 총합 구하고, 총합 높은 순으로 정렬
--   : job 이 그룹화 기준 컬럼
SELECT SUM(e.sal) 총합
  FROM emp e
 GROUP BY e.job
 ORDER BY 총합 DESC
;
/*
총합

8275
5600
5000
3050
3000
*/
-- 5. 급여의 앞단위가 1000미만, 1000, 2000, 3000, 5000 별로 인원수를 구하시오
--    급여 단위 오름차순으로 정렬
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
-- 6. 직무별 급여 합의 단위를 구하고, 급여 합의 단위가 큰 순으로 정렬
SELECT *
  FROM emp e
 GROUP BY SUBSTR((SELECT SUM(e.sal)
                    FROM emp e
                   GROUP BY e.job),1,2)
;

-- 7. 직무별 급여 평균이 2000이하인 경우를 구하고 평균이 높은 순으로 정렬
SELECT e.job "직무"
      ,AVG(e.sal) "급여 평균"
  FROM emp e
 GROUP BY e.job
 HAVING AVG(e.sal) <= 2000
 ORDER BY "급여 평균" DESC
;
/*
직무,      급여 평균
SALESMAN	1400
CLERK	    1016.666666666666666666666666666666666667
*/

-- 8. 년도별 입사 인원을 구하시오
SELECT SUBSTR(e.hiredate,1,2) "입사년도"
      ,COUNT (*) 인원
  FROM emp e
 GROUP BY SUBSTR(e.hiredate,1,2)
;
/*
입사년도, 인원
82	        1
            2
80      	1
81	       10
*/