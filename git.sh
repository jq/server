
alias grt='git reset --soft HEAD~1'
alias gb='git branch'
alias gr='git pull --rebase'
alias grm='git rebase master'
alias gclean='git branch --merged master | grep -v 'master$' | xargs git branch -d'
alias grh='git reset --hard'

#http://gitready.com/advanced/2009/02/10/squashing-commits-with-rebase.html
gsh() {
git rebase -i HEAD~${1:-2}
}
# need to install hub
#eval "$(hub alias -s)"

# Aliases for GitHub features (via hub, to which git has been aliased)
# git rev-parse --abbrev-ref HEAD is current checkout branch
function gpra() {
  git pull-request -b airbnb:${1:-master} -h airbnb:$(git rev-parse --abbrev-ref HEAD)
}

# You can also supply a path to only search commits that affected that path.
# Here, we find out who added the line "verify :method => [:put, :post], :only => [:create]" to UsersController
# git log -p -G'verify.*put.*create' app/controllers/users_controller.rb
# Find out who added the line 'makeMultiscoreDataRDDWithJoinedRDD'
gal() {
	git log -S %1
}

# `git add -p` to add little changes one at a time.
gcm() {
	git add .
	git commit -m $1
	git push
}

# git add all and push
ga(){
	git add .
	git commit --amend --no-edit
	git push --force
}

gd() {
	git branch -D $1
}

gs() {
	bundle exec cane
	git pull --rebase
}
gn() {
	git checkout -t origin/master -b $1
	git pull --rebase
}
function pr_for_sha {
  git log --merges --ancestry-path --oneline $1..origin/master | grep 'pull request' | tail -n1 | awk '{print $5}' | cut -c2- | xargs -I % open https://git.musta.ch/airbnb/$(basename $(pwd -P))/pull/%
}
