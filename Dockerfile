
# 1. 컨테이너를 구동할 소스 이미지가 필요하다.
# FROM BASE IMAGE
FROM node

# 2. 컨테이너 내부에서 수행할 명령을 정의한다.
# 2-1. 컨테이너 내에서 쉘 스크립트가 실행될 워크 디렉터리 설정.
# WORKDIR /경로 
WORKDIR /app

# 2-2. 컨테이너를 생성할때, 호스트에서 컨테이너로 전달할 파일을 정의해야 한다.
# COPY "호스트 파일 경로" "컨테이너 경로"
COPY app.js package.json /app/
# COPY .    //Dockerfile이 있는 경로의 모든 폴더 및 파일을 복사한다.
# /app/     //컨테이너의 /app/ 디렉터리 (이 부분에 대해서는 이미 워크 디렉터리가 /app/ 이라서 그냥 .만 입력해도 되긴 하지만, 코드 가독성을 위해 일반적으로 절대 경로를 사용한다.)

# 2-3. 컨테이너 내부에서 환경 설정을 위해 수행할 쉘 스크립트를 작성
# RUN은 컨테이너 내부에서 실행할 명령어를 작성한다.
RUN npm install


# 3. 호스트에게 어플리케이션이 사용 중인 PORT를 명시한다. 
# EXPOSE는 어플리케이션이 컨테이너 내부의 3000번 포트를 사용한다는 것을 의미한다.
# 단, 컨테이너 내부는 호스트로부터 격리되어 있기 때문에 이 포트만 가지고는 접근할 수 없다.
# 즉, 컨테이너를 실행하기 위한 명령어 docker run -p "호스트포트":"컨테이너 포트" "이미지이름" 에서 
# 호스트의 포트와 컨테이너 포트를 EXPOSE한 포트를 매핑해줘야 최종적으로 컨테이너 내부의 어플리케이션 접근이 가능하다.
EXPOSE 3000
# 4. 컨테이너에서 최종적으로? 실행할 명령어와 인수들
CMD ["node","app.js"]


#--------------------------------도커 기본 명령어-----------------------------------#
# 도커는 기본 명령어 + 옵션을 이용해 세부적인 설정을 하기 때문에 명령어의 동작만 이해하고,
# 자주 사용하는 옵션 위주로 알아두기

# 1. Copy files/folders between a container and the local filesystem
# 호스트 <-> 컨테이너 간 파일 복사하기
# Usage:  docker cp [OPTIONS] "컨테이너명:경로" "호스트경로"
#         docker cp [OPTIONS] "호스트경로" "컨테이너명:경로"

# 2. Create and run a new container from an image
# 컨테이너를 이용할 때