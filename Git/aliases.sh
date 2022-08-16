## Useful git aliases we use at FormaServe

## one line git status
git config --global alias.st 'status -sb'

## one liner git log
git config --global alias.ll 'log --oneline'

## last commit
git config --global alias.last 'log -1 HEAD --stat'

## git commit with message flag
git config --global alias.cm 'commit -m'

## shorten git remote
git config --global alias.rv 'remote -v'

## git diff shortener
git config --global alias.d 'diff'

## search a commit
git config --global alias.se '!git rev-list --all | xargs git grep -F'

## shorten status
git config --global alias.s 'status'

##  shorten checkout
git config --global alias.co 'checkout'

## create branch & move into it
git config --global alias.cob 'checkout -b'

## Delete a branch
git config --global alias.del 'branch -D'

## list all branches by commit date
## git config --global alias.br 'branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate'

## Rollback changes
git config --global alias.undo 'reset HEAD~1 --mixed'

## git log
git config --global alias.undo 'reset HEAD~1 --mixed'

## list all git aliases
git config --global --list