#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------
if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi
source ~/.airenv/airflow/bin/activate

alias rb='. ~/.bash_profile'

hl() {
hdfs dfs -ls $1
}
hm() {
hdfs dfs -mv $1 $2
}
hmdir() {
hdfs dfs -mkdir $1 
}
cph() {
hdfs dfs -copyFromLocal $1 $2
}
export SHELL=/bin/zsh
[ -z "$ZSH_VERSION" ] && exec /bin/zsh -l
