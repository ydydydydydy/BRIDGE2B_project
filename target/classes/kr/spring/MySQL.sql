select * from tb_user;
select * from tb_news;
select * from tb_article;
-- show full processlist;
-- kill 13480;
show tables;

-- url : jdbc:mysql://project-db-stu3.smhrd.com:3307/Insa4_Spring_final_1
-- id : Insa4_Spring_final_1
-- pw : aischool1

-- select * from company;

select
        company0_.business_number as business1_1_,
        company0_.addr as addr2_1_,
        company0_.company_name as company_3_1_,
        company0_.industry as industry4_1_,
        company0_.open_date as open_dat5_1_,
        company0_.representative_name as represen6_1_ 
    from
        company company0_

SHOW TABLES;

select * from tb_request;
select * from tb_solution;
ALTER TABLE tb_request ADD COLUMN req_satisfaction BOOLEAN DEFAULT false;
ALTER TABLE tb_solution ADD COLUMN company3 varchar(100);
ALTER TABLE tb_solution DROP COLUMN pred_score;
ALTER TABLE tb_request DROP COLUMN req_satisfaction;

SELECT MAX(p.req_num) FROM tb_request p WHERE p.username = 'admin@naver.com';
delete from tb_request where req_num between 35 and 52;


UPDATE tb_user
SET com_name = '인공지능사관학교'
WHERE username = 'admin@naver.com';

UPDATE tb_solution
SET reco_industry='화장품'
WHERE sol_num=1;


UPDATE tb_request
SET is_paid=false
WHERE req_num  between 66 and 146;


describe tb_request;
commit;