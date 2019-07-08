### leaflet : map을 그릴 수 있게 지원하는 자바스크립트 라이브러리

애플리케이션 - 앱, 웹앱

### HTML5 API

Active-X와 같은 추가(플러그인, 확장) 프로그램을 활용하여 해결할 수 밖에 없었던 웹앱 개발에서 표준적인 방법을 제시하기 위해 W3C 주도로 만들어진 JavaScript API이다.

Canvas, Web Storage, Web Socket, 

- Ajax
  1. 다양한 형식의 응답 가능
  2. 발생 이벤트가 다양
  3. CORS 스펙 지원
- geolocation API : 웹앱이 수행되는 클라이언트의 위치 정보(위도, 경도)를 추출
  - navigator.geolcation.getCurrentPosition(함수, 함수)



### Opne API

1. 비상용화된 API
   - 자바: 클래스
   - 자바스크립트: 함수, 객체
   - 파이썬: 모듈....
2. 데이터를 요청할 때 사용하는 URL 문자열과 Query 문자열 규격







Enum orders_status {
  created
  running
  done
  failure
 }

Table Login {
  id int [pk]
  user_id varchar2 [not null, unique]
  passwd int [not null]
}

Table Training_Log {
  id int [pk]
  write_date date [not null]
  exercise varchar2 [not null]
  weight int
  reps int
  sets int
  memo varchar
}

Table Share_Log {
  id int [pk]
  post_number int [not null]
  user_id varchar2 [not null, unique]
  title varchar2 [not null]
  location varchar2 [not null]
  contents varchar2 [not null]
  write_date date [not null]
}

Table party {
  post_number int [not null]
  party_size int [not null]
  party_member varchar2 
  location varchar
}


Ref: "Login"."id" < "Training_Log"."id"

Ref: "Login"."id" < "Share_Log"."id"

Ref: "Share_Log"."post_number" < "party"."post_number"