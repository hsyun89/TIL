## HIVE 설치와 환경설정

**하둡보충자료 참조**

- tools 폴더에 HIVE 프로그램다운 받기
  - cd tools
  - wget http://apache.tt.co.kr/hive/hive-2.3.5/apache-hive-2.3.5-bin.tar.gz

- 압축 풀기
  - tar xvzf apache-hive-2.properties.template

- 홈 디렉토리로 복사하기(버전명 떼고)
  - mv apache-hive-2.3.5-bin ../apache-hive

- 홈디렉토리의 .bashrc을 열어c 수정하고 source명령어 수행

  - vi .bashrc -> 소스 추가
  - source .bashrc

- HIVE의 conf 디렉토리로 이동한 후 파일 2개 복사

  - cd $HIVE_HOME/conf
  - mv hive-env.sh.template hive-env.sh
  - mv  hive-default.xml.template hive-site.xml  

- hive-env.sh에 하둡의 홈디렉토리를 추가

  - vi hive-env.sh -> 수정

- hive-site.xml 파일 수정

  - vi hive-site.xml -> 명령어 모드에서 ":(행번호)"로 이동한 후 수정

  - 지정 행 cat하는 방법??????????????????

- HADOOP 의 HDFS 에 HIVE 에서 사용될 디렉토리들을 생성하고 사용자 허가모드를  777 로 수정

  - 자료 참조
  - -p : 폴더를 패스 구조로 만드는 명령어

- derby 데이터베이스를 포맷

  - schematool -initSchema -dbType derby

- HIVE 서버를 기동

  - hiveserver2  

- beeline 기동

  - 터미널 창을 하나 더 가동

  - beeline

  - 로그인 

    - !connect jdbd:hive2://192.18.111.120:10000/dedault

    - name---> root

    - password ----> password

- 현재 만들어져 있는 데이터 베이스 체크 후 나가기

  - show databases;

  - create database mydb; --> show databases;
  - !quit  : beeline 종료 명령어

- mydb 라는 데이터베이스로  하이브에 접속

  - !connect  jdbc:hive2://192.168.111.120:10000/mydb
  - username : mydb
  - password : password

- 테이블 생성 & 파일 로드 & 확인

  - 테이블 생성
    - create table clicklog(clickdate string, pid string) row format delimited fields terminated by ' ' lines terminated by '\n' stored as textfile;
- select * from clickolg
  - 생성된 테이블에 로컬 파일 시스템의 데이터 파일 로드
    - load data local inpath '/root/sampledata/product_click.log' into table clicklog;
- 새 터미널에서 ls
    - hdfs dfs -ls /user
    - hdfs dfs -ls /user/hive
    - hdfs dfs -ls /user/hive/warehouse
    - hdfs dfs -ls /user/hive/warehouse/mydb.db
    - hdfs dfs - ls /user/hive/warehouse/mydb.db/clicklog





## java 코드

**리눅스 eclipse에서 수행**

- 환경 설정
  - pom.xml 에 depencency 태그 추가
  - hadoopexam 프로젝트에 hiveexam 패키지를 import

if exist

HiveText4.java의 30행 ---> "root/sampledata/product_click.log"



**윈도우즈 eclipse에서 수행**

- hadoopPJ 프로젝트
  - pom.xml 에 depencency 태그 추가
  - hadoopPJ 프로젝트에 hiveexam 패키지를 import
  
- springedu 프로젝트
  
  - servlet-context.xml에 주석처리 & beans 태그 추가 
  
    (+ 컴파일 시 log4j 에러 났을 때 : log4j API version 2.8로 수정) 
  
  - pom.xml에 dependency 태그 추가
  
  - meetingDAO,  meetingController 주석처리
  
  - hive클래스들 import

- 실습 : subway

  - "select * from subway where line = 'line_"+number+"'"


- 실습 : oneperson
  - select * from oneperson order by num desc
  - select gu, sum(num) from oneperson group by gu
  - select gu, dong, num from oneperson order by num desc limit 1
  - select gu, sum(num) as sum1 from oneperson group by gu order by sum1 desc limit 1
  - "select * from oneperson where gu ='"+gu+"'"





## 파티션

**beeline에서 실행**

- 데이터 파일 

  - zipcode.csv -> m1의 sampledata로 복사

- 테이블

  - 테이블 생성
    - create table postinfo(postNum string, area1 string, area2 string, area3 string, area4 string, id int) row format delimited fields terminated by ',' lines terminated by '\n' stored as textfile;

  - 데이터로드
    - load data local inpath '/root/sampledata/zipcode.csv'into table postinfo;

  - 테이블 확인
    - select * from postinfo limit 3;
    - limit num : 위에서 num개 행만 출력

- 파티션

  - 동적 파티션 권한 부여
    - set hive.exec.dynamic.partition.mode=nonstrict;

  - 파티션 생성

    - area1 기준

    - create table postinfo3(postNum string, area2 string, area3 string, area4 string, id int)partitioned by (area1 string)row format delimited fields terminated by ',' lines terminated by '\n' stored as textfile;
    - insert into table postinfo3 partition(area1) select postNum, area2, area3, area4, id, area1 from postinfo;





