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
