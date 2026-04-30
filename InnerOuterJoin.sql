-- 이너조인 (교집합)
-- a테이블이 있고 b테이블이 있을떄,
-- 공통적으로 연결된것들만 가져오는것
-- 기본적으로 교집합만 가져옴



-- 아우터 조인
-- 레프트에 해당하는 테이블의 정보를 모두 가져오고, 공통적인 정보는
-- b테이블에 있는 정보와 함께 가져오고
-- 없는정보는 




-- 전 사원의 사번, 이름 현재 급여를 출력
-- 어디 테이블 것을 쓸지, 명확하게 명시해야한다. # 별칭을 주어야한다.
SELECT
	employees.emp_id
	,employees.`name`
	,salaries.salary
-- 	,employees.fire_at
FROM employees
	LEFT JOIN salaries
		ON employees.emp_id = salaries.emp_id
-- 바로 아래 라인은, 현재 급여를 출력하는 문장
			AND salaries.end_at IS NULL
-- 바로 아래 라인은, 퇴사자 급여정보는, join 절 말고, where 절로 따로 뺴서 명시해줌
WHERE
	employees.fire_at IS NULL

ORDER BY
	employees.emp_id DESC
;


-- COUNT(*) 는, 레코드 단위로 봄. 어떤컬럼에 null 이있더라도 세아림
-- COUNT(fire_at) 과 같이, 컬럼이 들어가 있으면, null 값이 있는것은 세아리지 않음
SELECT
	COUNT(fire_at)
	,COUNT(*)
FROM employees
;