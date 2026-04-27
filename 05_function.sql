-- 내장 함수


-- 데이터 타입 변환 함수
SELECT CAST(1234 AS CHAR(4));
SELECT CONVERT(1234, CHAR(4));


-- 제어 흐름 함수
SELECT 
	'name'
	,gender
	,IF(gender = 'M', '남자', '여자') AS ko_gender
FROM employees
;



-- IFNULL(수식1, 수식2)
-- 수식1이 NULL이면 수식2를 반환, 아니면 수식1을 반환
SELECT
	IFNULL(fire_at, '재직중')
FROM employees
;


-- NULLIF(수식1, 수식2)
-- 수식1과 수식2를 비교해서, 같으면 NULL 반환
-- 다르면 수식1을 반환함
SELECT
	NULLIF(gender, 'M')
FROM employees;


-- CASE ~WHEN ~ ELSE ~ END
-- 다중분기를 위해서 사용함.
-- 케이스 뒤에 END를 적어줘서 마무리를함.
SELECT 
	CASE gender
		WHEN 'M' THEN '남자'
		WHEN 'Z' THEN '선택안함'
		ELSE '여자'
	END
		
		

-- 문자열 함수
-- 문자열 타입만 올바르게 작동한다.

-- 문자열 연결 함수 CONCAT
SELECT CONCAT('안녕', ' ', '하세요.');
SELECT CONCAT(`name`,gender)FROM employees;


-- 구분자로 연결
-- 제일 처음의 ', ' 가 구분자 인듯함.
SELECT CONCAT_WS('a ', '안녕', '하세요', '.');
SELECT CONCAT_WS('b ', `name`, gender) FROM employees;



-- 숫자의 자릿수(,) 및 소수점 자리수 표시
-- 숫자, 자릿수. 
-- 문자열을 반환함.
SELECT FORMAT(salary, 1) FROM salaries;



-- 문자열의 왼쪽부터 길이만큼 잘라서 반환
-- LEFT('문자열', 잘라줄 길이)
-- 아래는 12 가 반환됨
SELECT LEFT('123456',2); 
-- 56 반환 (오른쪽부터)
SELECT RIGHT('123456',2);


-- 영어를 대/소문자로 변경
SELECT UPPER('asdfs'), LOWER('asdfs');


-- 문자열 좌/우에 문자열 길이만큼 채울 문자열을 삽입
-- 문자열이 반환됨

-- 왼쪽에 0으로 10개만큼 채워주겠다
SELECT LPAD(emp_id, 10, '0') FROM employees;
-- 오른쪽에 0으로 10개만큼 채워주겠다
SELECT RPAD(emp_id, 10, '0') FROM employees;



-- 좌/우 공백 제거
SELECT ' sdsd ', TRIM('  sdsd ');
-- 순서대로  각각, 왼쪽, 오른쪽 공백을 제거해줌
SELECT LTRIM('  sdsd  '), RTRIM('  sdsd ');



-- 'abcdab'
-- 앞의 시작부분 'ab'를 제거한다.
SELECT TRIM(LEADING 'ab' FROM 'abcdab');
-- 뒷부분의 'ab'를 제거한다.
SELECT TRIM(TRAILING 'ab' FROM 'abcdab');
-- 양쪽(앞쪽 뒤쪽) 부분에서 ab를 제거
SELECT TRIM(BOTH 'ab' FROM 'abcdab');



-- 문자열을 시작위치에서 길이만큼 잘라서 반환
-- 3번쨰것 부터 2개를 잘라옴
SELECT SUBSTRING('abcdef', 3, 2);



-- 왼쪽부터 구분자가 횟수번째 만큼 나오면, 그 이후 버림
-- 첫번째 인수는, 검증하고싶은 문자열, 
-- 그다음에 검증하고자 하는 구분자
-- 그리고 숫자(양수 는 왼쪽부터 ) (음수는 오른쪽 부터)
SELECT SUBSTRING_INDEX('qwer.ta.sd.fz.xv','.',1) AS txt;







-- 수학함수

-- 올림 반올림 버림
SELECT CEILING(1.4), ROUND(1.5), FLOOR(1.6);


-- 소수점을 기준으로 특정 자리수 까지 구하고 나머지는 버림
-- 반환값은 숫자
SELECT TRUNCATE(1.19, 1);






-- ---------------------
-- 날짜 및 시간 관련 함수
-- ---------------------

-- 현재 날짜/시간 반환
-- 데이터베이스가 설치된 컴퓨터의 시간 기준으로 표시됨
SELECT NOW();


-- 데이트 타입의 값을 `YYYY-MM-DD` 양식으로 변환
-- 아래는 연 월 일 까지만 출력됨
SELECT DATE(NOW());


-- 날짜1에 변경단위기간에 따라 더한 날짜/시간을 변환
-- 특정날자만큼 더하고 뺴고 하는게 가능함
SELECT ADDDATE(NOW(), INTERVAL 1 YEAR);
SELECT ADDDATE(NOW(), INTERVAL -1 YEAR);
SELECT ADDDATE(NOW(), INTERVAL 1 HOUR);
SELECT ADDDATE(NOW(), INTERVAL 1 MINUTE);
SELECT ADDDATE(NOW(), INTERVAL 1 SECOND);
SELECT ADDDATE(NOW(), INTERVAL 1 MICROSECOND);




-- ----------------
--  순위함수
--  -----------------
-- 등수 매겨주는 함수. RANK() OVER( ORDER BY 절) SELECT 절에서 쓰이는거같음
-- 지정한 컬럼을 기준으로 순위를 매겨 반환
-- 동일한 값이 있는 경우 동일한 순위를 부여함
SELECT
	emp_id
	,salary
	,RANK() OVER(ORDER BY salary DESC) AS `rank`
FROM salaries
WHERE
	end_at IS NULL
ORDER BY salary desc
LIMIT 10
;


-- ROW_NUMBER() OVER(ORDER BY 속성명 DESC/ASC)
-- 레코드에 순위를 매겨서 반환함
-- 동일한 값이 있는 경우에도, 각행에 고유한 번호를 부여함

SELECT
	emp_id
	,salary
	,ROW_NUMBER() OVER(ORDER BY salary DESC) AS `ROW_NUM`
FROM salaries
WHERE
	end_at IS NULL
ORDER BY salary desc
LIMIT 10
;


