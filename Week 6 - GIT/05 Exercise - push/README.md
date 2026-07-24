## Objectives

Explain how to clean up and push back to remote Git

In this hands-on lab, you will learn how to:
Execute steps involving clean up and push back to remote Git.

- Verify if master is in clean state.

<img src="clean.png">

- List out all the available branches.

<img src="branches.png">

- Pull the remote git repository to the master

<img src="pull.png">

- Push the changes to the remote repository. (already up to date, so not needed). otherwise run `git push origin main`
- Observe if the changes are reflected in the remote repository.

<img src="decorate-terminal-check.png">

<img src="remote-repo.png">

##Complete command list
```
git switch main
git status

git branch -a

git pull origin main

git push origin main

git log --oneline --graph --decorate --all
```