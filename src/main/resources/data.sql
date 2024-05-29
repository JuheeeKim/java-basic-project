INSERT INTO article(title, content) VALUES ('가가가가', '1111');
INSERT INTO article(title, content) VALUES ('나나나나', '2222');
INSERT INTO article(title, content) VALUES ('다다다다', '3333');

-- article 더미 데이터
INSERT INTO article(title, content) VALUES ('인생 영화?', '댓글 ㄱ');
INSERT INTO article(title, content) VALUES ('소울 푸드?', '댓글 ㄱㄱ');
INSERT INTO article(title, content) VALUES ('취미?', '댓글 ㄱㄱㄱ');

-- comment 더미 데이터
---- 4번 게시글의 댓글들
INSERT INTO comment(article_id, nickname, body) VALUES (4, 'Park', '굿 윌 헌팅');
INSERT INTO comment(article_id, nickname, body) VALUES (4, 'Kim', '타이타닉');
INSERT INTO comment(article_id, nickname, body) VALUES (4, 'Lee', '범죄도시');

---- 5번 게시글의 댓글들
INSERT INTO comment(article_id, nickname, body) VALUES (5, 'Park', '치킨');
INSERT INTO comment(article_id, nickname, body) VALUES (5, 'Kim', '샌드위치');
INSERT INTO comment(article_id, nickname, body) VALUES (5, 'Lee', '초밥');

---- 6번 게시글의 댓글들
INSERT INTO comment(id, article_id, nickname, body) VALUES (7, 6, 'Park', '놀기');
INSERT INTO comment(id, article_id, nickname, body) VALUES (8, 6, 'Kim', '코딩');
INSERT INTO comment(id, article_id, nickname, body) VALUES (9, 6, 'Lee', '자기');