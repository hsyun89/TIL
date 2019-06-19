Web Client : HTML, CSS, JavaScript, Ajax, Jquery

Web Server : Servlet, JSP, MVC패턴, MyBatis, Spring IoC, Spring MVC



# Servlet 프로그래밍

- Java 언어로 구현하는 웹 서버 프로그래밍 기술
  - 웹 서버 프로그래밍 표준 기술 - CGI(C, VisualBasic, Perl, ....) - > ASP, PHP
    - CGI에는 치명적인 단점 2가지가 있다!!
      1. 멀티프로세스 방식
         - FastCGI / 
         - 그에 반해 Servlet은 멀티스레드(1998, 9)

| CGI, FastCGI |        Servlet         |
| :----------: | :--------------------: |
|              | Servlet 엔진(컨테이너) |
|  Web Server  |       Web Server       |

Tomcat : Web Server + Servlet Container : WAS



서버프로그래밍 학습 웹 프로젝트 : sedu



### 서블릿 프로그래밍 정리

1. HttpServlet 클래스를 상속

   Tomcat(Web Server(코요테) + Application Server(카탈리나) : WAS)

   GET : doGet()

   POST : doPost()

   둘다 : doGet(), doPost(), service()

   HttpServletRequest : 요청 정보를 추출하고자 할 때(쿼리 문자열)

   HttpServletResponse : 응답과 관련하여 

   ​									     응답스트림객체, 컨탠트 타입 설정

2. 서블릿의 수행상의 특징

   - 서블릿은 한 번 메모리 할당(객체생성)되면 할당된 상태를 계속 유지한다.
   - 여러 클라이언트 요청에 대해서 하나의 서블릿 객체를 공유해서 수행한다.
   - 각 시점마다 호출되는 메서드가 정해져 있다.
     - 객체 생성 후 init()
     - 요청이 올 때마다 - service() -doGet(), doPost()
     - 객체 해제전 - destroy()

3. 쿼리 문자열 추출 방법

   name = value&name = value&name = value......

   HttpServletRequest 객체의 getParameter()

   String getParameter(String) : value 값 또는 null 또는 ""

   String[] getParameterValues(String) : value 값들의 배열 또는 null	

   

   GET 방식의 경우에는  Query 문자열 추출시 한글이 깨지지 않는다.

   POST 방식은 깨짐 : 추출하기 전에 

   ​			requesst.setCharacterEncoding("UTF-8")을 호출한 후에 추출



- Dynamic Web Project : Eclipse
- Context : WAS
- Web Application : Developer

### 세션 : HttpSession 객체

HttpSession 객체는 요청을 보내온 클라이언트 단위로 객체가 한 개만 생성되는 객체로서 한 번 생성되면 해당 클라이언트가 종료될 때까지 객체가 유지된다. 클라이언트별로 어떤 정보를 원하는 시각까지 유지하고 싶을 때 사용한다.

- Scope : 메모리에 저장장소가 만들어진 후 언제까지 유지되는가?

  > page scope : 요청된 서버 프로그램이 수행하는 동안 - 지역변수
  >
  > request scope : 요청된 서버 프로그램이 수행하고 응답하기 전까지 - 
  >
  > ​							HttpServletRequest 객체에 저장된 객체
  >
  > session scope : 세션이 유지되는 동안 - 
  >
  > ​							HttpSession 객체에 저장된 객체
  >
  > application scope : 서버가 기동되고 나서 종료될 때까지
  >
  > ​							멤버변수, ServletContext 객체에 저장된 객체

- 지역변수 : 수행하는 동안, 클라이언트별로 각가 메모리 할당

- 멤버변수 : 서버 종료될 때까지, 모든 클라이언트에 의해 공유

클라이언트 별로 개별적 저장, 원할 때까지 유지 -> HttpSession 객체에 보관

HttpSession 객체는 언제까지 유지되는가?

1. 브라우저가 기동되어 있는 동안
2. invalidate() 메서드가 호출되기 전까지
3. inactive interval 시간이 적용되기 전까지 - 30분

- 객체로 만든가.(배열 객체)
- 저장 : session.setAttribute("이름",객체)
- 삭제 : session.removeAttribute("이름")
- 추출 : session.getAttribute("이름")  --- 강제 형변환은 필수

### 파일 업로드

클라이언트에서 서버에게 요청을 보낼 때 name=value로 구성된 쿼리 문자열을 전달할 수 있다.(영문, 숫자, 일부 특수문자는 그대로 전달, 나머지는 인코딩)

-> name=value&name=value....

​	application/x-www-form-urlencoded



서버에게 전달하는 데이터에 클라이언트에 존재하는 파일을 첨부해서 요청하려는 경우에는 다른 형식으로 전달해야 한다.

​	multipart/form-data



























