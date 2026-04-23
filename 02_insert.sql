-- INSERT 문
-- DML 중 하나로 신규 데이터를 저장하기 위해 사용하는 쿼리
INSERT INTO employees (
	`name`
	,birth
	,gender
	,hire_at
	,fire_at
	,sup_id
	,created_at
	,updated_at
)
VALUES (
	'성희주'
	,'1998-06-09'
	,'M'
	,NOW()
	,NULL
	,NULL
	,NOW()
	,NOW()),
(
	'이안대군'
	,'1990-02-09'
	,'M'
	,NOW()
	,NULL
	,NULL
	,NOW()
	,NOW()
);

SELECT 
*
FROM employees
ORDER BY emp_id DESC
LIMIT 10;