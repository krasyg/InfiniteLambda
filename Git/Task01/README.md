# Task01

## Clone repo
```

$ git clone git@github.com:csuvikg/tap-git.git
```
## Create file and merge add-name branch
```

$ echo "Krasimir Gavrilov" >> name.txt
$ git add name.txt
$ git commit -m "adding file to new branch"

$ git merge add-name
```
## Push changes to new repo
```

$ git checkout -b krasys-branch
$ git push -u origin krasys-branch
```
