# DB 실기 시험

---
> **제출 방법**: 해당 문제지의 파일명을 `이름_exam.md`로 하여 Slack DM으로 제출

> **합격 기준: 60점 이상 / 총 100점**

---

## 답 작성 방법

각 문제의 코드 블록 안에 SQL을 작성하세요.

**작성 예시**

> 예) 모든 직원의 이름을 조회하세요.

```sql
SELECT name FROM employees;
```

---

**문제 1.** `[8점]`  
직원(퇴사자 포함)의 이름과 입사일을 조회하세요.

```sql
SELECT 
	`name`
	,hire_at
FROM employees;
```

---

**문제 2.** `[5점]`  
`d005` 부서에 속한 현재 재직 중인 직원의 직원 ID를 조회하세요.

```sql
SELECT
	emp_id
FROM
	department_emps 
WHERE dept_code = 'd005'
    AND end_at IS NULL;
```

---

**문제 3.** `[5점]`  
1995년 1월 1일 이후에 입사한 직원(퇴사자 포함)의 정보를 입사일 순서대로 정렬하여 조회하세요.

```sql
SELECT
	*
FROM 
	employees
WHERE 
	hire_at > '1995.01.01'
ORDER BY 
	hire_at ASC;
```

---

**문제 4.** `[3점]`  
현재 각 부서별로 몇 명의 직원이 있는지 계산하고, 직원 수가 많은 부서부터 순서대로 조회하세요.

```sql

```

---

**문제 5.** `[5점]`  
재직 중인 각 직원의 현재 연봉 정보를 조회하세요.

```sql

```

---

**문제 6.** `[5점]`  
재직 중인 각 직원의 이름과 해당 직원의 현재 부서 이름을 함께 조회하세요.

```sql

```

---

**문제 7.** `[3점]`  
`마케팅부` 부서의 현재 매니저의 이름을 조회하세요.

```sql

```

---

**문제 8.** `[3점]`  
현재 재직 중인 각 직원의 이름, 성별, 직책(title)을 조회하세요.

```sql

```

---

**문제 9.** `[3점]`  
현재 가장 높은 연봉을 받는 상위 5명의 직원 ID와 연봉을 조회하세요.

```sql

```

---

**문제 10.** `[2점]`  
각 부서의 현재 평균 연봉을 계산하고, 평균 연봉이 43,500,000 이상인 부서만 조회하세요.

```sql

```

---

**문제 11.** `[8점]`  
아래 구조의 테이블을 생성하는 SQL을 작성하세요.

**Table Name**: `users`

| Column Name | Data Type | Note |
|---|---|---|
| `user_id` | `INT` | PRIMARY KEY, AUTO INCREMENT, UNSIGNED |
| `user_name` | `VARCHAR(30)` | NOT NULL |
| `auth_flg` | `CHAR(1)` | DEFAULT `'0'` |
| `birthday` | `DATE` | NOT NULL |
| `created_at` | `DATETIME` | DEFAULT 현재 날짜·시각 |

```sql
CREATE TABLE users(
user_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT 
,user_name VARCHAR(30) NOT NULL
,auth_flg CHAR(1) DEFAULT 0
,birthday DATE NOT NULL 
,created_at DATETIME DEFAULT '2026-04-30');
```

---

**문제 12.** `[8점]`  
[문제 11]에서 만든 테이블에 아래 데이터를 입력하는 SQL을 작성하세요.

| 항목 | 값 |
|---|---|
| user_id | 자동 증가 |
| user_name | `'그린'` |
| auth_flg | `'0'` |
| birthday | `2024-01-26` |
| created_at | 오늘 날짜 |

```sql
INSERT INTO users (user_name,auth_flg,birthday,created_at)
VALUES ('그린', '0', '2024-01-26','20260430'); 

```

---

**문제 13.** `[8점]`  
[문제 12]에서 입력한 레코드를 아래 데이터로 갱신하는 SQL을 작성하세요.

| 항목 | 값 |
|---|---|
| user_name | `'테스터'` |
| auth_flg | `'1'` |
| birthday | `2007-03-01` |

```sql
UPDATE users
SET user_name = '테스터',
	auth_flg = '1',
	birthday = '2007-03-01'
WHERE
	user_name = '그린'
	AND auth_flg = '0'
	AND birthday ='2024-01-26';

```

---

**문제 14.** `[10점]`  
[문제 12]에서 입력한 레코드를 삭제하는 SQL을 작성하세요.

```sql
DELETE FROM users
WHERE 
	user_id = 1
    AND user_name = '그린'
    AND auth_flg = '0'
 	AND birthday = '2024-01-26'
  	AND created_at = '2026-04-30';
```

---

**문제 15.** `[8점]`  
[문제 11]에서 만든 테이블에 아래 컬럼을 추가하는 SQL을 작성하세요.

| Column Name | Data Type | Note |
|---|---|---|
| `addr` | `VARCHAR(100)` | NOT NULL, DEFAULT `'-'` |

```sql
ALTER TABLE users ADD COLUMN addr VARCHAR(100) NOT NULL DEFAULT '-';

```

---

**문제 16.** `[10점]`  
[문제 11]에서 만든 테이블을 삭제하는 SQL을 작성하세요.

```sql
DROP TABLE users;
```

---

**문제 17.** `[6점]`  
아래 두 테이블에서 **유저명(username), 생일(birthday), 랭크명(rankname)** 을 조회하는 SQL을 작성하세요.

- `rankmanagement`의 FK인 `userid`는 `users`의 `userid`를 참조

**Table: users**

| userid (PK) | username | authflg | birthday | createdat |
|---|---|---|---|---|
| 1 | green | 0 | 2024-01-26 | 2024-01-26 10:51:27 |

**Table: rankmanagement**

| rankid (PK) | userid (FK) | rankname |
|---|---|---|
| 1 | 1 | manager |

```sql
SELECT
	us.username
	,us.birthday
	,rm.rankname
FROM users us
	JOIN rankmanagement rm
		us.userid = rm.userid;


```
