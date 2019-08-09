start-dfs.sh

ps -ef --> jps (JVM Process Status)

- 4개 머신

  a. master : NameNode

  b. slave1 : SecondaryNameNode, DateNode

  c. slave2 : DateNode

  d. slave3 : DateNode

- 데몬(daemon)프로세스 : 백그라운드에서 수행중인 프로그램

​											xxxxxxd

​											httpd, pop3d





## HDFS : 저장소



- sampledata 폴더에 강사가 제공한 데이터 파일 3 개를 복사한다.

  hdfs  dfs  -ls  /
  hdfs  dfs  -mkdir  /edudata
  hdfs  dfs  -ls  /
  hdfs  dfs  -chmod  777  /edudata
  hdfs  dfs  -put  /root/sampledata/파일명   /edudata   --> 3번
  hdfs  dfs  -ls  /edudata





- master 머신에서 작업 

  (1) tools 폴더에 리눅스용 eclipse 를 복사한다.
  (2) 압축을 풀고 압축해제된 eclipse 폴더를 홈디렉토리로 옮긴다.
  (3) eclipse를 기동한다.
  (4) hdoopexam 이라는 JavaProject을 생성한다.
  (5) 내이름을 출력하는 FirstApp.java 소스를 만들어 실행까지 시켜본다.



## hdfs 명령어

- 하위 디렉토리 생성

  ```
  hdfs dfs -mkdir /edudata
  ```

- edudata의 item 조회

  ```
  hdfs dfs -ls /edudata
  ```

- edudata의 product_click.log 삭제

  ```
  hdfs dfs -rm /edudata/product_click.log
  ```

- edudata에 2008.csv 삽입

  ```
   hdfs dfs -put /root/2008.csv /edudata
  ```

- edudata의 파일의 모드(drwxrwxrwx)를 변경

  ```
  htfs dfs -chmod 777/edudata
  ```

  

  

## 자바와 Hadoop연동

- pom.xml에 dependency 태그 추가

- run파일 지정

  : Run > Run Configurations > Main Class

- 파일 복사

  ```
  Configuration config = new Configuration();
  FileSystemhdfs=FileSystem.get(config);
  Path srcPath = new Path(srcFile);
  Path dstPath = new Path(dstFile);
  hdfs.copyFromLocalFile(srcPath,dstPath);
  ```

- 파일생성

  ```
  Configuration config = new Configuration();
  FileSystem hdfs=FileSystem.get(config);
  Path path = new Path(fileName);
  FSDataOutputStream outputStream = hdfs.create(path);
  outputStream.write(buff, 0,buff.length);
  ```

- 파일명 수정

  ```
  Configuration config = new Configuration();
  FileSystem hdfs = FileSystem.get(config);
  Path fromPath = new Path(fromFileName);
  Path toPath = new Path(toFileName);
  boolean isRenamed = hdfs.rename(fromPath,toPath);
  ```

- 파일 삭제

  ```
  Configuration config = new Configuration();
  FileSystem hdfs = FileSystem.get(config);
  Path path = new Path(fileName);
  boolean isDeleted = hdfs.delete(path, false);
  ```

- 리스트 출력

  ```
    Configuration config = new Configuration();
    FileSystem fs = FileSystem.get(URI.create(uri), config);
    Path[] paths = new Path[args.length];
     for (int i = 0; i < paths.length; i++) {
         paths[i] = new Path(args[i]);
    }   
  
    FileStatus[] status = fs.listStatus(paths);
    Path[] listedPaths = FileUtil.stat2Paths(status);
    for (Path p : listedPaths) {
      System.out.println(p);
    }
  ```





## Window에서 hadoop연동

- pom.xml에 dependency 태그 추가
- servlet-context.xml에 bean태그 추가

- 실습 : 

  로컬 "C:\\Users\\student\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\logs"의 로그 파일을 하나의 파일로 생성해 hdfs의 "/edudata/tomcat_access_log.txt"에 저장하자.



## 하둡 MapReduce

a. mapreduce :

b. yarn : 효과적인 분산처리 시스템

- Mapreduce 관련설정

  - mapred-site.xml 수정
  - yarn-site.xml 수정

- yarn에서 mapreduce동작

  - yarn 클러스터 기동 
    - yarn start-yarn.sh

  - 디렉토리 이동
    - cd /root/hadoop-2.7.7/share/hadoop/mapreduce

  - president_moon.txt의 wordcount처리
    - yarn jar hadoop-mapreduce-examples-2.7.7.jar wordcount /edudata/president-moon.txt /output/test1

  - 결과 조회
    - hdfs dfs -ls /output/test1

- Application Master
  - 파이어폭스에서 "master:8088"
  - 작업 수행 중 Application master
  - job ID >> total 로 수행상황 체크 가능
  
- 실습

  - exercise1

    : 단어 count가 5이상인 결과만 출력되도록 수정

    - Mapper클래스에서  ReduceMapper 결과가 5 이상인 경우만 write

  - exercise2

    :  단어의 길이가 3자 이상이고 5자 이하의 경우에만 결과를 만들어내도록 수정

    - MapReduce 클래스에서 단어의 길이가 조건에 맞는 경우만 set

  - exercise3

    : product_click.log 파일을 읽고 상품 ID 별로 갯수를 출력한다. (ex) p015	7

    - Mapper클래스에서 날짜 정보는 건너 뛰고 set

  **WHERE절? -> O : Mapper 클래스** 

  **HAVING절 -> O : MapReduce 클래스**

  