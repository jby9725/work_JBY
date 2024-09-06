###(INIT 시작)#########
# DB 세팅
DROP DATABASE IF EXISTS `Exam_web_JBY`;
CREATE DATABASE `Exam_web_JBY`;

USE `Exam_web_JBY`;


# 게시글 테이블 생성
CREATE TABLE article (
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `regDate` DATETIME NOT NULL,
    `updateDate` DATETIME NOT NULL,
    `memberId` INT(10) NOT NULL, 
    boardId INT(10) UNSIGNED NOT NULL,
    `title` VARCHAR(50) NOT NULL,
    `body` TEXT NOT NULL
);

# 회원 테이블 생성
CREATE TABLE `member`(
      id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      regDate DATETIME NOT NULL,
      updateDate DATETIME NOT NULL,
      loginId CHAR(30) NOT NULL,
      loginPw CHAR(100) NOT NULL,
      `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자)',
      `name` CHAR(20) NOT NULL,
      nickname CHAR(20) NOT NULL,
      cellphoneNum CHAR(20) NOT NULL,
      email CHAR(50) NOT NULL,
      delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
      delDate DATETIME COMMENT '탈퇴 날짜'
);


# 게시판(board) 테이블 생성
CREATE TABLE board (
      id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      regDate DATETIME NOT NULL,
      updateDate DATETIME NOT NULL,
      `code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice(공지사항) free(자유) QnA(질의응답) ...',
      `name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
      delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
      delDate DATETIME COMMENT '삭제 날짜'
);

CREATE TABLE FAQ (
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `regDate` DATETIME NOT NULL,
    `updateDate` DATETIME NOT NULL,
    `memberId` INT(10) NOT NULL, 
    `title` VARCHAR(50) NOT NULL,
    `body` TEXT NOT NULL
);

## 게시판(board) 테스트 데이터 생성
INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'FREE',
`name` = '자유';


-- 문자열 붙이기 + 랜덤 수 출력
INSERT INTO article
SET regDate = NOW(),
    updateDate = NOW(),
    memberId = 2,
    boardId = 1,
    title = CONCAT('제목', SUBSTRING(RAND() * 1000 FROM 1 FOR 2)),
    `body` = CONCAT('내용', SUBSTRING(RAND() * 1000 FROM 1 FOR 2));

INSERT INTO article
SET regDate = NOW(),
    updateDate = NOW(),
    memberId = 2,
    boardId = 1,
    title = CONCAT('제목', SUBSTRING(RAND() * 1000 FROM 1 FOR 2)),
    `body` = CONCAT('내용', SUBSTRING(RAND() * 1000 FROM 1 FOR 2));

INSERT INTO article
SET regDate = NOW(),
    updateDate = NOW(),
    memberId = 2,
    boardId = 1,
    title = CONCAT('제목', SUBSTRING(RAND() * 1000 FROM 1 FOR 2)),
    `body` = CONCAT('내용', SUBSTRING(RAND() * 1000 FROM 1 FOR 2));


## FAQ 테스트 데이터 생성

INSERT INTO FAQ
SET regDate = NOW(),
    updateDate = NOW(),
    memberId = 2,
    title = CONCAT('답변', SUBSTRING(RAND() * 1000 FROM 1 FOR 2)),
    `body` = CONCAT('답변 내용', SUBSTRING(RAND() * 1000 FROM 1 FOR 2));

INSERT INTO FAQ
SET regDate = NOW(),
    updateDate = NOW(),
    memberId = 2,
    title = CONCAT('답변', SUBSTRING(RAND() * 1000 FROM 1 FOR 2)),
    `body` = CONCAT('답변 내용', SUBSTRING(RAND() * 1000 FROM 1 FOR 2));

INSERT INTO FAQ
SET regDate = NOW(),
    updateDate = NOW(),
    memberId = 2,
    title = CONCAT('답변', SUBSTRING(RAND() * 1000 FROM 1 FOR 2)),
    `body` = CONCAT('답변 내용', SUBSTRING(RAND() * 1000 FROM 1 FOR 2));



## 회원 테스트 데이터 생성
## (관리자)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`authLevel` = 7,
`name` = '관리자',
nickname = '관리자',
cellphoneNum = '01012341234',
email = 'abc@gmail.com';

## (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test1',
loginPw = 'test1',
`name` = '회원1_이름',
nickname = '회원1_닉네임',
cellphoneNum = '01043214321',
email = 'abcd@gmail.com';

## (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test2',
loginPw = 'test2',
`name` = '회원2_이름',
nickname = '회원2_닉네임',
cellphoneNum = '01056785678',
email = 'abcde@gmail.com';

## (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test3',
loginPw = 'test3',
`name` = '회원3_이름',
nickname = '회원3_닉네임',
cellphoneNum = '01065656565',
email = 'goast@gmail.com';

###(INIT 끝)
##########################################
## 게시글 테스트 데이터 대량 생성
INSERT INTO article
(
    regDate, updateDate, memberId, boardId, title, `body`
)
SELECT NOW(), NOW(), FLOOR(RAND() * 2) + 2, 1, CONCAT('제목__', RAND()), CONCAT('내용__', RAND())
FROM article;

##########################################

SELECT *
FROM article
ORDER BY id DESC;

SELECT *
FROM `member`;

SELECT *
FROM `board`;

SELECT *
FROM FAQ;

-- 코멘트 포함해서 `member` 테이블의 정보 보기
SHOW FULL COLUMNS FROM `member`;
