CREATE DATABASE mydb;
USE mydb;

-- ------------
-- 테이블 생성
-- ------------
-- UNSIGNED 는, 양수 만 들어가게끔 할떄 사용함.

-- 유저 테이블
-- id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT
-- ,이름 name VARCHAR(50) NOT NULL
-- ,성별 gender CHAR(1) NOT NULL 
-- , 작성일DATE()
-- , 수정일DATE()
-- , 삭제일DATE()

-- 유저테이블 
CREATE TABLE users (
-- 컬럼  데이터타입  제약조건들  순으로 작성함.
	id				BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT
	,`name`		VARCHAR(50) NOT NULL
	
-- 	COMMENT "M: 남자, F: 여자" 는, 부가적인 설명 방법이라고 함
	,gender		CHAR(1) NOT NULL COMMENT "M: 남자, F: 여자"
	
-- 	now() 는 쿼리가 실행됬을때의 시점을 가지고옴.
--    current_timestamp() 는, 실제 레코드가 삽입된 시간을 반환함.
	,created_at	DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP()
	,updated_at	DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP()
	,deleted_at DATETIME
);


-- 위의, 테이블을 만드는 코드를 쓰는 과정들이, 물리적 모델링이라 함.



-- 게시글 테이블
-- pk, 유저번호, 제목, 내용, 작성일, 수정일, 삭제일
CREATE TABLE posts(
	id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT
	,user_id BIGINT UNSIGNED NOT NULL
	,title VARCHAR(50) NOT NULL
	,content VARCHAR(1000) NOT NULL
	,created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP()
	,updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP()
	,deleted_at DATETIME
);



-- ----------------------
-- 테이블 수정
-- ----------------------
-- # 컬럼 추가
-- ALTER TABLE [테이블명] ADD COLUMN [컬럼명] [타입] [제약조건]; 
ALTER TABLE users ADD COLUMN age INT UNSIGNED NOT NULL;


-- # 컬럼의 데이터 타입의 수정
-- ALTER TABLE [테이블명] MODIFY COLUMN [컬럼명] [타입] [제약조건];
ALTER TABLE users MODIFY COLUMN age BIGINT UNSIGNED NOT NULL;


-- # 컬럼 삭제
-- ALTER TABLE [테이블명] DROP COLUMN [컬럼명];
ALTER TABLE users DROP COLUMN age;


-- 외부키는, 상위테이블에서, 하위 테이블에 주는것임. user 테이블이 post 테이블의
--  상위테이블. user테이블이 post 테이블을 참조함

-- 제약조건 ( Constraint ) 추가 /
ALTER TABLE posts
ADD CONSTRAINT fk_posts_user_id
FOREIGN KEY (user_id) REFERENCES users(id);

-- 제약조건 ( Constraint )/ 삭제
ALTER TABLE posts DROP CONSTRAINT fk_posts_user_id;



-- -----------------------
-- AUTO_INCREAMENT 값 변경
-- -----------------------
ALTER TABLE users AUTO_INCREMENT = 1;
INSERT INTO users(`name`, gender) VALUES('HONG', 'F');


-- ---------------------------------------------
-- 테이블의 모든 데이터를 깨끗하게 제거하는 문법
-- Truncate . 삭제 이력을 남기지 않는다. (속도가 delete 보다 빠름)
-- ---------------------------------------------
TRUNCATE TABLE users;








-- -----------------------------------
-- 테이블 삭제

-- 외부키로, 참조되어있는 테이블은, 하위테이블 부터 삭제한다
-- -----------------------------------
DROP TABLE users;
DROP TABLE posts;


-- 테이블 여러개를 한번에 삭제
DROP TABLE users, posts;




-- ---------------------------------------

눈물의 부르스

오~색등 네온불이~ 속삭이듯 나를 유혹 하는밤~
가슴을 휘젓듯이 흐느끼는 색소폰소리
아~~ 나를 울리네
이 순간이 지나고 나면,  떠날 당신 이기에~
그대 품에 얼굴을 묻고 젖은 눈을 감추네~
아아 블루스 블루스~ 블루스 연주자여 그 음악~ 을 멈추지 말아요~

오~색등 오~오색등  오~색등 네온불이~ 
속삭이듯 나를 유혹 하는밤~ 





사랑인걸 - 모세

하루가 가는 소릴 들어, 너없는 세 상속에
달이 저물고 해가 뜨는 서러움.
한 날도, 한 시도, 못 살것 같더니,
그저 이렇게 그리워하며 살아

어디서





