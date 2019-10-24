1.branch 생성

```bash
(master) $ git branch {branch 이름}

(master) $ git branch

*master
```

{branch 이름}

2. branch 이동

   ```bash
   $git checkout {branch 이름}
   ```

   - 위 두 명령어를 동시에 실행하려면 아래와 같이 한다.

     ```bash
     $ git checkout -b {branch 이름}
     ```

3. branch 삭제

   $git branch -d {브랜치이름}

4. branch 병합

   (master) $ git merge feature/main

   master 브랜치에 feature/main  을 병합한다.

   항상 병합을 하고 싶은 대상의 브랜치로 옮겨서 진행해야 한다.

### git merge

1. Fast-forwarding

   브랜치를 나눈 이후에 master 브랜치에 커밋이 발생하지 않았고, 단순히 커밋만 옮기면 되는 경우, merge 커밋이 발생하지는 않음

2. Auto merge

   브랜치를 나눈 이후에 master 브랜치에 커밋이 발생하였으나, 동일한 파일이 수정되지 않아서 자동으로 병함이 되는 경우, merge 커밋이 발생함.

3.  merge conflict 발생

   브랜치를 나눈 이후에 master 브랜치에 커밋이 발생하였고, 동일한 파일이 각자 다른 브랜치에서 수정된 경우 자동으로 merge가 되지 않는다. 따라서 merge conflict가 발생하고, 직접 수정 후 커밋을 해야한다.

   git은 충돌이 발생한 파일에 아래와 같이 표기를 해준다. 해당 부분을 찾아서 수동으로 해결해야한다. 충돌 위치를 파악하기 위해서 git status 를 통해 확인하자!

   ```bash
   $ git add .
   $ git commit
   ```

   커밋을 하게 되면, merge 커밋이 발생하다.

### git stash

현재 변경 사항을 담아 둘 수 있는 임시 공간이 존재한다.

1. 현재 변경사항 담기

   ```bash
   $ git stash
   $ git stash list
   ```

2. 임시 저장사항 불러오기

   ```bash
   $ git stash pop
   ```

   위의 명령어는 apply + drop 과 동일하다.