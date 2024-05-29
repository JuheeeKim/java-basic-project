INSERT INTO article(id, title, content) VALUES (1, '가가가가', '1111');
INSERT INTO article(id, title, content) VALUES (2, '나나나나', '2222');
INSERT INTO article(id, title, content) VALUES (3, '다다다다', '3333');

-- article 더미 데이터
INSERT INTO article(id, title, content) VALUES (4, '인생 영화?', '댓글 ㄱ');
INSERT INTO article(id, title, content) VALUES (5, '소울 푸드?', '댓글 ㄱㄱ');
INSERT INTO article(id, title, content) VALUES (6, '취미?', '댓글 ㄱㄱㄱ');

-- comment 더미 데이터
---- 4번 게시글의 댓글들
INSERT INTO article(id, article_id, nickname, body) VALUES (1, 4, 'Park', '굿 윌 헌팅');
INSERT INTO article(id, article_id, nickname, body) VALUES (2, 4, 'Kim', '타이타닉');
INSERT INTO article(id, article_id, nickname, body) VALUES (3, 4, 'Lee', '범죄도시');

---- 5번 게시글의 댓글들
INSERT INTO article(id, article_id, nickname, body) VALUES (4, 5, 'Park', '치킨');
INSERT INTO article(id, article_id, nickname, body) VALUES (5, 5, 'Kim', '샌드위치');
INSERT INTO article(id, article_id, nickname, body) VALUES (6, 5, 'Lee', '초밥');

---- 6번 게시글의 댓글들
INSERT INTO article(id, article_id, nickname, body) VALUES (7, 6, 'Park', '놀기');
INSERT INTO article(id, article_id, nickname, body) VALUES (8, 6, 'Kim', '코딩');
INSERT INTO article(id, article_id, nickname, body) VALUES (9, 6, 'Lee', '자기');