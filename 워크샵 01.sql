use workshop;

select DEPARTMENT_NAME as '학과명', CATEGORY as '계열'
from tb_department;

SELECT CONCAT(DEPARTMENT_NAME, '의 정원은 ', CAPACITY, '명 입니다.')
from tb_department;