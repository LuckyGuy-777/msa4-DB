-- 부서별 현재 연봉 평균 구하자
-- # 연습요망

CREATE VIEW view_avg_salary_by_dept
AS
	SELECT
		dept.dept_name
		,CEILING(AVG(sal.salary)) avg_sal	
	FROM departments dept
		JOIN department_emps depe
			ON dept.dept_code = depe.dept_code
				AND dept.end_at IS NULL
				AND depe.end_at IS NULL
		JOIN salaries sal
			ON depe.emp_id = sal.emp_id
				AND sal.end_at IS NULL
	GROUP BY  dept.dept_name
	ORDER BY dept.dept_name;
	
	
-- 뷰 조회하기 ( 뷰는 가상 테이블이라고 함)
SELECT
	*
FROM view_avg_salary_by_dept
WHERE
	AVG_sal >= 44000000
;


-- VIEW 삭제
DROP VIEW view_avg_salary_by_dept;