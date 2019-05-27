### [ 웹 프로그래밍 ]

- 웹 클라이언트

  >  HTML, CSS, JavaScript, Ajax, HTML5 주요 API

- 웹 서버

  > Servlet&JSP, Spring FW, MyBatis

- 웹기반 시각화

  > D3.js

- 오픈 API

  > 네이버 또는 구글

------------------------



웹서버 - Tomcat

웹클라이언트 - 크롬



### 설치

http://tomcat.apach.org/

HTTP/1.1 Connector Port -> 8000으로 바꾸기 8080은 오라클이 쥐고있음

마지막 run/readme 해제



1. Tomcat 서버를 eclipse에 등록

   new -> other -> server -> apach ->디렉토리 -> finish

2. edu 생성

   new -> other -> dynamic web project -> 프로젝트이름 -> generate 체크

   -> finish -> 프로젝트이름 오른쪽 클릭 properities -> utf-8로 변경

3. edu를 Tomcat 서버에 등록

   맨밑창 서버클릭 ->오른쪽클릭->add and remove 에서 add하기

4. first.html 파일을 생성

   webcontent - new - html file - first.html 생성

5. 브라우저(크롬)에서 first.html요청

   맨밑창 서버클릭 - >start

   http://localhost:8000/edu/first.html 에서 확인

   맨밑창 서버클릭 - >stop

   https://localhost:8000 ->서버

   /edu/first.html -> URI 문자열

   /edu -> 컨텍스트패스

6. 