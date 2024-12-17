-- student 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS student;

-- user 계정 생성 및 패스워드 설정
CREATE USER 'user'@'%' IDENTIFIED BY 'user';

-- user에게 모든 권한 부여
GRANT ALL PRIVILEGES ON student.* TO 'user'@'%';

-- 권한 적용
FLUSH PRIVILEGES;