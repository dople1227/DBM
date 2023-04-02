-- SELECT rnum, no,title,content,writer,hits
--         FROM (
--         	SELECT @ROWNUM := @ROWNUM+1 as rnum, no, title, content, writer,hits
--         	FROM	TBL_BOARD_1, (SELECT @ROWNUM :=0) A
--         	ORDER BY no DESC
--         ) RESULT
-- tbl_board_1        WHERE rnum > 10
--         LIMIT 10
        
 -- select * from tbl_board_1
--  where title=''
 
 -- SET SQL_SAFE_UPDATES = 0; 0-끄기 / 1-켜기
 
 -- update tbl_board_1
--  set title='text테스트12'
--  where title like ''
-- 테이블 삭제            
-- drop table dbm.tbl_board_1
-- 테이블 생성
-- CREATE TABLE `tbl_board_1` (
--   `NO` int NOT NULL AUTO_INCREMENT COMMENT '번호',
--   `TITLE` varchar(50) DEFAULT NULL  COMMENT '제목',
--   `CONTENT` varchar(2000) DEFAULT NULL  COMMENT '내용',
--   `WRITER` varchar(20) DEFAULT NULL COMMENT '작성자',
--   `INS_TIME` datetime DEFAULT now() COMMENT tbl_board_1'입력일',
--   `UPD_TIME` datetime DEFAULT now() COMMENT '수정일',
--   `HITS` int DEFAULT NULL COMMENT '게시글의 조회수',
--   PRIMARY KEY (`_NO`)
-- ) DEFAULT CHARSET=utf8 COMMENT '게시판1';

-- 데이터추가
-- INSERT INTO dbm.tbl_board_1 (
-- title, 
--     content, 
--     writer
-- ) VALUES (
-- 	'제목15',
--     '내용내용15',
--     'soronprfbs'
-- );

-- 컬럼변경
-- ALTER TABLE tbl_board_1 CHANGE upd_time udt_time datetime;

-- SELECT rnum as no,table_schema,table_name,table_rows,create_time,ifnull(update_time,create_time) as update_time,table_comment
-- 	FROM (
-- 		SELECT	@rownum := @rownum + 5 AS rnum,
-- 				table_schema,
-- 				table_name,
-- 				table_rows,
-- 				create_time,
-- 				update_time,
-- 				table_comment
-- 		FROM INFORMATION_SCHEMA.TABLES,(select @rownum :=0) as r
-- 		WHERE TABLE_SCHEMA ='dbm' AND TABLE_TYPE NOT LIKE 'SYSTEM VIEW' 
-- 		ORDER BY TABLE_NAME DESC		
-- 	) RESULT
-- 	WHERE rnum > (1 - 1) * 10
-- 	LIMIT 10
ALTER TABLE 'tbl_board_1' CHANGE 'NO' 'NO2' int;

        SELECT	*
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME ='tbl_member'     
		ORDER BY ORDINAL_POSITION   

-- select * from INFORMATION_SCHEMA.COLUMNS
-- order by table_name

