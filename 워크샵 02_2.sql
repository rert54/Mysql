use workshop;

select STUDENT_NO as'학번', STUDENT_NAME as'이름', ENTRANCE_DATE '입학년도'
from tb_student
where DEPARTMENT_NO = '002'
ORDER BY ENTRANCE_DATE ;

SELECT 
    PROFESSOR_NAME,
    PROFESSOR_SSN
FROM tb_professor
WHERE CHAR_LENGTH(PROFESSOR_NAME) <> 3;
-- ============================워크샵2번
SELECT 
    PROFESSOR_NAME as '교수이름',
TIMESTAMPDIFF(
	YEAR,
    STR_TO_DATE(CONCAT(19,SUBSTR(PROFESSOR_SSN,1,6)),'%Y%m%d'),
    CURDATE()) AS '나이'
FROM tb_professor
WHERE SUBSTR(PROFESSOR_SSN,8,1) IN ('1')
ORDER BY '나이' desc;
-- ============================워크샵3번
