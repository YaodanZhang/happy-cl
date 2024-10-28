[user]
  name = Yaodan Zhang
  email = yaodan.zhang@gmail.com
#  signingkey = example-example-example
[alias]
  co = checkout
  st = status
  ctp = comtemplate
  nb = "!fn() { git stash push -m newbranch && git checkout main && git fetch --prune && git pull --rebase && git checkout -b $1 && stashed=$(git --no-pager stash list | grep newbranch | cut -d':' -f1) && if [ ! -z $stashed ] ; then git stash pop $stashed ; else echo 'No stash required' ; fi }; fn"
  pl = "!fn() { git stash push -m pullstash && stashed=$(git --no-pager stash list | grep pullstash | cut -d':' -f1) && git fetch --prune && git pull --rebase && if [ ! -z $stashed ] ; then git stash pop $stashed ; else echo 'No stash required' ; fi }; fn"
  lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cI) %C(bold blue)<%an>%Creset' --abbrev-commit"
[color]
  branch = auto
  diff = auto
  status = auto
[color "branch"]
  current = yellow reverse
  local = yellow
  remote = green
[color "diff"]
  meta = yellow bold
  frag = magenta bold
  old = red bold
  new = green bold
[color "status"]
  added = yellow
  changed = green
  untracked = cyan
[core]
  autocrlf = input
  filemode = true
[init]
  defaultBranch = main
[rebase]
  autoStash = false
# [includIf "gitdir:/path/to/project/"]
#   path = /path/to/project/gitconfig.inc
# [commit]
#   gpgsign = true
# [gpg]
#   program = /usr/local/bin/gpg
