--day07
------(4) 데이터 타입 변환 함수
/*
가장 기본적인 타입
1. 문자: 반드시 ''따옴표로 감싸서 사용
2. 숫자: 산술 연산이 되는 값
3. 날짜: 세기, 년도, 달, 일, 시, 분, 초 까지 값이 있는 타입


TO_CHAR() : 다른 타입에서 문자 타입으로 변환 해주는 함수 숫자, 날짜 ==>문자

TO_DATE() : 다른 타입에서 날짜 타입으로 변환 해주는 함수 날짜 형식의 문자 (날짜 패턴에 맞는 문자) ==> 날짜

TO_NUMBER() : 다른 타입에서 숫자 타입으로 변환 해주는 함수 숫자로만 구성된 문자 데이터 ==> 숫자

*/

----1. to_char() : 숫자패턴 적용
SELECT to_char(12345,'9999')
  FROM dual
;
SELECT to_char(12345,'99999')
  FROM dual
;
--숫자가 문자화되어 출력되면 왼쪽 정렬로 바뀐다
--문자화된  급여는 왼쪽으로 정령되어있고 숫자 자체인 급여는 오른쪽으로 정렬되어 있음을 확인한다.

--숫자를 문자화 하되 총 8칸을 채우도록 만든다.
SELECT to_char(12345,'99999999') as 데이터
  FROM dual
;
--앞 빈칸을 0으로 채우기
SELECT to_char(12345,'9999999') as 데이터
  FROM dual
;
--소수점 이하 표현
SELECT to_char(12345,'9999999.99') as 데이터
  FROM dual
;
--숫자 패턴에서3자리씩 끊어 읽기 +소수점
SELECT to_char(12345,'9,999,999.99') as 데이터
  FROM dual
;

----2. to_date(): 날짜 패턴에 맞는 문자 값을 날짜 연산이 가능한 날짜 타입으로 변경
SELECT to_date('2019-05-28','YYYY-MM-DD') today
      ,'2019-05-28' "today 문자"
  FROM dual
;
--10일 후의 날짜 연산
SELECT to_date('2019-05-28','YYYY-MM-DD') + 10 "today + 10일"
  FROM dual
;

--날짜 처럼 생긴 문자와는 날짜 연산이 안됨을 확인해보자
SELECT '2019-05-28' + 10 "today 문자"
  FROM dual
;

----3. to_number() : 오라클이 자동형변환을 해주므로 자주 사용되지 않음
SELECT '1000' + 10 계산결과
  FROM dual
;
SELECT to_number('1000') + 10 계산결과
  FROM dual
;

---- (5) DECODE(expr, serch, result [, serch ,result] ... [,default])
-- 만약 default 가 설정되어 있지 않고 expr과 일치하는 serch 도 없는경우 DECODE 문의 결과는 NULL이 된다

SELECT DECODE ('YES', 'YES', '입력값이 YES 입니다.'
                    , 'NO' , '입력값이 NO 입니다.') AS 입력결과
  FROM dual
;
SELECT DECODE ('NO', 'YES', '입력값이 YES 입니다.'
                   , 'NO' , '입력값이 NO 입니다.') AS 입력결과
  FROM dual
;
SELECT DECODE ('예', 'YES', '입력값이 YES 입니다.'
                   , 'NO' , '입력값이 NO 입니다.') AS 입력결과
  FROM dual
;
SELECT DECODE ('예', 'YES', '입력값이 YES 입니다.'
                   , 'NO' , '입력값이 NO 입니다.'
                   , '입력값이 YES/NO 어느 것도 아닙니다.') AS 입력결과
                   --default
  FROM dual
;

--emp 테이블에서 job(직무)별로 경조사비를 급여대비 일정비율로 직브하기로 했다
-- 지급 비율이 다음과 같다로 할떄 각 직원들의 경조사비 지원금을 구해보자
--사번,이름,직무 와 함꼐 구해보자
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
                   , 'PRESIDENT', e.sal * 0.15)  "경조사 지원금"
  FROM emp e
;



