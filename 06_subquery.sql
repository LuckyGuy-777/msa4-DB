-- SubQuery

-- -------------------
-- 1. 단일 행 서브쿼리'
--  D001 부서장의 사번과 이름을 출력

SELECT 
	employees.emp_id
	,employees. `name`
FROM employees
WHERE 
	employees.emp_id = (
		SELECT
			department_managers.emp_id
		FROM department_managers
		WHERE
			department_managers.dept_code = 'D001'
			AND department_managers.end_at IS NULL
	);
	
	
	
-- 다중 행 서브쿼리
-- 서브쿼리가 2건 이상을 반환할 경우 
-- 반드시 다중 행 비교연산자(IN, ALL, ANY, SOME, EXISTS 등) 을 사용함
-- 현재 부서장인 사원의 사번과 이름을 출력 

SELECT
	employees.emp_id
	,employees.`name`
FROM employees
WHERE
	employees.emp_id IN (
		SELECT
			department_managers.emp_id
		FROM department_managers
		WHERE 
			department_managers.end_at IS NULL
	)
;




-- 다중 열 서브쿼리
-- 현재 D002의 부서장이 해당 부서에 소속된 날짜를 출력
-- 주의점(다중열 서브쿼리)
-- 1. 항상 IN 연산자를 써야하고
-- 2. 괄호안의 순서와 , SELECT 문의 순서가 같아야한다
SELECT
	department_emps.start_at
FROM department_emps
WHERE
	(department_emps.emp_id, department_emps.dept_code) IN (
		SELECT
			department_managers.emp_id
			,department_managers.dept_code
		FROM department_managers
		WHERE
			department_managers.dept_code = 'D002'
			AND department_managers.end_at IS NULL
	) 
;



-- 연관 서브쿼리
-- 서브쿼리 내에서 메인쿼리의 컬럼이 사용된 서브쿼리
-- 부서장직을 지냈던 경력이 있는 사원의 정보를 출력
SELECT
	employees.*
FROM employees
WHERE 
	employees.emp_id IN (
		SELECT department_managers.emp_id
		FROM department_managers
		WHERE
			department_managers.emp_id = employees.emp_id
	)
;



-- ---------------
-- SELECT 절에서  서브쿼리 사용함
-- 빠른 성능을 요구할땐 안써야함(느림)
-- ---------------
-- 사원별 역대 전체 급여 평균
-- 서브쿼리를 사용해서 평균을 구함
-- AS(알리아스) 는 생략할수 도 있음
-- 한 레코드를 평균을 내는것 마다, select 절을 계속 실행
-- grouby 로 평균을 구하고, emp 테이블과 조인하는게 속도가
-- 더 빠르다고 함.
SELECT
	emp.emp_id
	,(
		SELECT AVG(sal.salary)
		FROM salaries sal
		WHERE sal.emp_id = emp.emp_id
	) avg_sal
FROM employees emp
;





-- -------------------------
-- FROM 절에서 서브쿼리 사용
--  ------------------------
-- FROM 절에서는, 적어도 하나의 별칭을 주어야함
-- 드라이빙 테이블 = 주로 사용하는 테이블
-- 간간히 사용하는 방식

SELECT
	tmp.*	
FROM (
	SELECT
		emp.emp_id
		,emp.`name`
	FROM employees emp
) tmp
;


-- -------------------------
-- INSERT 절에서 서브쿼리 사용
-- -------------------------
-- VALUES 에서, 서브쿼리를 사용할 수 있다

INSERT INTO title_emps (
	emp_id
	,title_code
	,start_at
)
VALUES(
	(SELECT MAX(emp_id) FROM employees)
	,'T001'
	,DATE(NOW())
)
;



-- ---------------------------
-- UPDATE 절 에서도, 서브쿼리 사용가능
-- --------------------------
UPDATE title_emps
SET
	title_emps.end_at = (
		SELECT employees.fire_at
		FROM employees
		WHERE
			employees.emp_id = 100000
	)
WHERE
	title_emps.emp_id = 100000
	AND title_emps.end_at IS NULL
;