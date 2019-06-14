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

































