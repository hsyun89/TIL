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