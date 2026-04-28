-- JOIN 문
-- 2개이상의 테이블을 묶어서 하나의 결과 집합으로 출력하는
-- 문법이다.


-- ----------------------------
-- INNER JOIN (교집합)
-- 복수의 테이블이 공통적으로 만족하는 레코드를 출력
-- ----------------------------
-- 모든 사원의 사번, 이름 현재급여를 출력해주세요
-- AND sal.end_at IS null 으로 인해서, 현재급여를 가져올수 있음
-- 과거의 데이터는, end_at 값이 설정되어 있음.
-- 그리하여, 현재 급여 1개만 출력됨
-- 조인 할때의 조건을 ON 에 기재함.
-- 아래에서는 emp 테이블과 sal 테이블을 연결할때의
-- 조인조건임


-- INNER JOIN 에서, 보통 앞에서의 INNER 는 생략됨
-- 현대의 조인 방식으로 많이 사용됨

-- 드라이빙 테이블이란? 메인테이블 을 말한다. (조인하기 위해서
-- 가장 먼저 액세스 되는 테이블을 말하고)
-- 그 이후에 접근되는 테이블을 ("드리븐 테이블"이라고 한다)


-- 드리븐 테이블 이란?  드라이빙 테이블과 조인되기 위해 후속적으로
-- 나타나는 테이블이다
-- 

SELECT
	emp.emp_id
	,emp.`name`
	,sal.salary
FROM employees emp
	INNER JOIN salaries sal
		ON emp.emp_id = sal.emp_id
		   AND sal.end_at IS NULL
;




-- 재직중인 사원의 사번, 이름, 생일, 부서명
-- 3개의 테이블을 걸쳐서 조인을 함
SELECT
	emp.emp_id
	,emp.`name`
	,emp.birth
	,dept.dept_name
FROM employees emp
	JOIN department_emps dee
		ON emp.emp_id = dee.emp_id
			AND dee.end_at IS NULL
	JOIN departments dept
		ON dee.dept_code = dept.dept_code
	;


-- -----------------------
--  LEFT JOIN
--  ---------------------

-- 왼쪽에 있는 테이블만 모두 출력하고
-- 오른쪽에 있는 테이블에서, 왼쪽에 없는 데이터는
-- 모두 NULL 로 표현한다.

-- LEFT JOIN 은, emp 테이블이 기준이 된다
-- emp를 기준으로 모두 출력하고,
-- sal 부분에서 출력할 부분이 없다 -> 그럼 null 로 표현함

SELECT
	*
FROM employees emp
	LEFT JOIN salaries sal
		ON emp.emp_id = sal.emp_id
			AND sal.end_at IS NULL
;

-- 만약 right join 일 경우, sal 테이블이 기준이 된다.




-- ---------------------------------
-- UNION
-- 두개 이상의 쿼리의 결과를 합쳐서 출력함
-- 중복되는 결과가 하나만 나옴 (중복 레코드 제거)

-- UNION ( 중복레코드 제거)
-- UNION ALL ( 중복 레코드 제거 안함 )
-- ---------------------------------
SELECT * FROM employees WHERE emp_id IN (1, 3)
UNION
SELECT * FROM employees WHERE emp_id IN (1, 5);



-- -------------------------------------
-- SELF JOIN
-- 같은 테이블끼리 join
-- -------------------------------------
SELECT
	emp.emp_id
	,emp.`name`
	,supe.*
FROM employees emp
	JOIN employees supe
		ON emp.sup_id = supe.emp_id
			AND emp.sup_id IS NOT NULL
;			
			
			
SELECT
	emp.*
FROM employees emp

