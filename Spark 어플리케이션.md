### Spark 어플리케이션 작성하기

1. Hadoop DFS와 Hadoop YARN을 기동시킨다.
2. scalaexam을 maven 프로젝트로 변환한다.
3.  pom.xml 에 spark core 라이브러리에 대한 <dependency> 태그를 추가한다. - https://mvnrepository.com/ 사이트를 방문한다.
4. myspark 폴더에서 실행
5. spark-submit --master local --class com.example.chapter5.WordCount --name WordCount wc111.jar file///root/sampledata/simple-words.txt
6. spark-submit --master local --class com.example.chapter5.WordCount --name WordCount wc111.jar file///root/sampledata/simple-words.txt
7. spark-shell --master local

