-- SELECT 문
-- 현재쿼리 실행: 실행하고자 하는 쿼리문의 세미콜론으로
-- 커서를 이동시키고,  컨트롤+쉬프트+F9

SELECT
 `name`
 ,gender
 ,emp_id
FROM employees;

-- 테이블 전체 컬럼 조회하기 : * (Asterisk)

SELECT *
FROM employees;




-- WHERE 절 : 특정 컬럼의 값이 일치한 데이터만 조회
SELECT *
FROM employees
WHERE emp_id = 10009;


SELECT *
FROM employees
WHERE `name` = '조은혜';



SELECT *
FROM employees
WHERE birth >= '1990-01-01';


-- IS
-- fire_at 이 null 인것만 가져오는것.
SELECT *
FROM employees
WHERE fire_at IS NULL;


-- IS NOT 
-- fire_at 이 null 인게 아닌것만 가져오는것
SELECT *
FROM employees
WHERE fire_at IS NOT NULL;