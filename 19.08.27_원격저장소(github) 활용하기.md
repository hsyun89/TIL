## 원격저장소(github) 활용하기

1. 원격 저장소 설정

   ``` bash
   $ git push origin master
   ```

   

2. 원격 저장소 복제

   ```bash
   $ git clone {url}
   ```



## 충돌 해결하기(Merge conflict)

> 기본적으로 push - pull하는 과정에서 동일한 파일의 다른 이력이 기록될 경우 충돌이 발생한다!
>
> 다른 파일이 수정되는 경우 fast-fowarding을 통해 자동으로 metge가 되기도함! 
>
> 이러한 오류를 발생시키지 않으려면, 항상 작업 하기전에 pull을 확인하고, 작업 및 커밋을 한 이후에 push를 하는것을 습관화 하자!

1. Local A에서 a.txt 작성 후 커밋

2. Local A에서 원격저장소(Origin)로 push

3. Local B에서 pull하지 않은 상태에서 a.txt동일한 라인 작성 후 커밋

4. Local B에서 원격저장소로(Origin)로 push -> push 되지 않음!

5. 해결(원격저장소 변경사항 Local B에서 반영)

   ```bash
   $ git pull origin master
   ```

6. 충돌 발생(동일 파일 수정시)

   - 어떤 파일에서 충돌되었는지 확인하는 명령어

   ```bash
   $ git log --online --left-right --p
   ```

   - Git에서 직접 충돌 파일에 기록을 남겨줌

   ``` 
   <<<<<<<<HEAD
   집 수정 내용
   ========
   멀캠 수정 내용
   >>>>>>>> 12dfas12sadf234asdf
   ```

   - HEAD : 현재 작업하고 있는곳(Local B)
   - 해시값 : PUll을 통해 받아온 변경사항(origin)
   - 해당 하는 위치를 찾아서 직접 수정을 진행함!

7. merge conflict 해결 commit 남기기

   ```bash
   $ git status
   $ git add .
   $ git commit -m 'merge conflict 해결'
   ```

8. 원격 저장소로 push

   ```bash
   $ git push origin master
   ```

   [ff](google.com)

