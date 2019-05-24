--day06
----2)문자함수
-------- 1. INITCAP(str) : str 의 첫 글자를 대문자화(영문)
SELECT initcap('the watch')
  FROM dual
;
SELECT initcap('안녕하세요')
  FROM dual
;
-------- 2. LOWER(str) : str의 모든 글자를 소문자화(영문)
SELECT lower('MR. SOCTT MCMILLAN')
  FROM dual
;
-------- 3. UPPER(str) : str의 모든 글자를 대문자화(영문)
SELECT upper('lee')
  FROM dual
;
--smith 를 찾는데 입력이 소문자로 된 경우에
--SMITH 와 다른 글자로 인신되므로 찾을 수 없다.
SELECT e.empno
      ,e.ename
  FROM emp e
 WHERE e.ename = 'smith'
;
--인출된 행 0개 
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
--          str의 글자길이, 글자의 byte를 계산하여 숫자로 출력
SELECT LENGTH('hello, sql') as"글자 길이"
  FROM dual
;
SELECT 'hello, sql의 글자 길이는 ' || LENGTH('hello, sql') 
                                   ||'입니다' as"글자 길이"
  FROM dual
;

----orcle 에서 한글을 3byte 로 계산
SELECT LENGTHB('hello, sql') as"글자 byte"
  FROM dual
;

SELECT LENGTHB('오라클') as"글자 byte"
  FROM dual
;
-------- 5. CONCAT(str1,str2) : str1 과 str2 를 문자열 접합 || 연산자와 동일한 결과

SELECT concat('hi','sql!')
  FROM dual
;
SELECT 'hi' || 'sql'
  FROM dual
;
-------- 6. SUMSTR(str, i, n) : str에서 i 번째 위치에서부터 n개의 글자를 추출 
--                              SQL 에서 문자열의 엔덕스(순서)는 1부터 시작

SELECT substr('SQL is cooooooooooool', 3, 4)
  FROM dual
;
-- 문제 : SQL is cooooooooool~~!! 에서 SQL만 추출해보자
SELECT substr('SQL is cooooooooooool~~!!', 1, 3)
  FROM dual
;
-- 문제 : SQL is cooooooooool~~!! 에서 is만 추출해보자
SELECT substr('SQL is cooooooooooool~~!!', 5, 2)
  FROM dual
;
-- 문제 : SQL is cooooooooool~~!! 에서 ~~!!만 추출해보자
SELECT substr('SQL is cooooooooooool~~!!', 22, 4)
  FROM dual
;
--문제 : emp 테이블에서 직원의 이름을 앞 두글자 까지만 추출하여 사번과 함께 조회하시오
SELECT substr(e.ename,1,2)
      ,e.empno
  FROM emp e
;
-------- 7. INSTR(str1,str2): 두번쨰 문자열인 str2가 첫번째 문자열인 str1의 어디에 위치하는지 등장하는 위치를 계산하여 숫자로 출력
SELECT instr('SQL is cooooooooooool~~!!','is') "is위치"
  FROM dual
;

-------- 8. LPAD,RPAD(str, n, c)
--          입력된 str 에 대해서 전체글자가 차지할 자릿수를 n 으로 잡고 전체 글자수 대비 왼쪽 오른쪽에 남는 자릿수에 c 의문자를 채워넣는다
SELECT lpad('SQL is cool!',20,'*')
  FROM dual
;
SELECT rpad('SQL is cool!',20,'*')
  FROM dual
;

-------- 9. LTRIM, RTRIM , TRIM : 입력된 문자열의 왼쪽 오른쪽 양쪽 공백을 제거
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
--문제 : 비교값이 '  smith ' 일떄 SMITH의 정보를 조회하시오
SELECT *
  FROM emp e
 WHERE e.ename = trim(UPPER('  smith '))
;

-------- 10. NVL(expr1,expr2)
--           NVL2(expr1,expr2,expr3)
--           NULLIF(expr1,expr2)

--NVL(expr1,expr2): 첫번쨰 식의 값이 NULL 이면 두번쨰 식으로 대체하여 출력
--매니저가 배정되지 않은 직원의 경우 0으로 대체하여 출력

SELECT e.empno
      ,e.ename
      ,nvl(e.mgr,'매니저없음')
  FROM emp e
;
--매니저없음은 문자이기떄문에 오류남
SELECT e.empno
      ,e.ename
      ,nvl(e.mgr||'','매니저없음')
  FROM emp e
;
-- || 결합연산자로 mgr에 빈문자를 붙여서 문자타임으로 변경

--문제 : || 연산자 대신 concat() 함수를 사용하여 같은 결과를 내시오
SELECT e.empno
      ,e.ename
      ,nvl(concat(e.mgr,''),'매니저없음')
  FROM emp e
;

--오라클에서는 빈 문자열('') 를 NULL로 취급

--NVL2(expr1,expr2,expr3):
--    첫번째 식의 값이 NOT NULL 이면 두번째 식의 값으로 출력 NULL이면 세번째 식의 값으로 출력

--매니저(mgr)가 배정된 경우에는 '매니저 있음' 으로 매니저가 배정되지 않은 경우에는 '매니저 없음' 으로 출력
SELECT e.ename
      ,e.empno
      ,nvl2(e.mgr,'매니저 있음','매니저 없음')
  FROM emp e
;
--오라클에서 빈문자열('')은 NULL로 취급
SELECT nvl2('','IS NOT NULL','IS NULL')
  FROM dual
;
--입력이 공백 1칸짜리 문자
SELECT nvl2(' ','IS NOT NULL','IS NULL')
  FROM dual
;

--NULLIF(expr1,expr2):
--첫번째 식, 두 번째의 식이 같으면 NULL 출력

SELECT nullif('AAA','AAA')
  FROM dual
;


--각 직원의 근속 개월수를 구하되 소수점 1의 자리 까지만 출력하시오
-- 이떄 소수점 2의 자리에서 반올림
SELECT e.empno
      ,e.ename
      ,ROUND(MONTHS_BETWEEN(SYSDATE,e.hiredate),1)
  FROM emp e
;

--문제 : 현재 시간에서 반올림 된 날짜를 시/분/초 까지 출력
--힌트 : to_char()시분초 까지 출력할 수 있는 날짜/시간 패턴을 조합

SELECT TO_CHAR(sysdate,'YYYY-MM-DD-HH24-MI-SS')
  FROM dual
;