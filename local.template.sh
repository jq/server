# put all your local settings here
SHELLHOME=~/etc/server
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export UBER_HOME=~

#. $SHELLHOME/git.sh
. $SHELLHOME/linux.sh
. $SHELLHOME/z.sh
#source ~/.airenv/airflow/bin/activate

#yarn logs -applicationId application_1465055519316_137219 -containerId container_e10_1465055519316_137219_01_000001 -nodeAddress i-0e17c3ed879ae9cc2.inst.aws.airbnb.com:8041 > s1 2>&1  
slog() {
	yarn logs -applicationId $1  > $2 2>&1
}

# read strategy model eval result
function cl() {
 grep 'Eval Data Query' -A 12 $1 > result; grep 'posCount' -A 1 $1 >> result
}

cpl () {
	rsync -avzh $USER@gw${3:-$FAVOR_SPARK_MACHINE}.${4:-spark}.musta.ch:~/$1 $2
}

alias t1='tmux a # 0'

ff() {
	find . -name "$1"
}

hl() {
hdfs dfs -ls $1
}

hlm() {
	hdfs dfs -ls hdfs://airfs-silver/pricing/edgar/model/pricing_edgar_${1}_additive.model_with_dsnight
}

hlcm() {
	hdfs dfs -ls hdfs://airfs-silver/pricing/edgar/calibrated_model/pricing_edgar_${1}_additive.model_with_dsnight
}

# copy model to production for eval 
hpd() {
	hdfs dfs -mkdir hdfs://airfs-silver/pricing_edgar/calibrated_model/production/pricing_edgar_${1}_additive.model_with_dsnight/
	hdfs dfs -cp hdfs://airfs-silver/pricing/edgar/calibrated_model/pricing_edgar_${1}_additive.model_with_dsnight/ds_night=2016-05-09 hdfs://airfs-silver/pricing_edgar/calibrated_model/production/pricing_edgar_${1}_additive.model_with_dsnight/ds_night=2016-05-09
}

hm() {
hdfs dfs -mv $1 $2
}
hdcp() {
hadoop distcp $1 $2
}
hcp() {
hdfs dfs -cp $1 $2
}

hmdir() {
hdfs dfs -mkdir $1 
}
cph() {
hdfs dfs -copyFromLocal $1 $2
}

cphl() {
	hdfs dfs -copyToLocal $1 $2
}
hrm() {
	hdfs dfs -rm -r $1
}

als() {
	aws s3 ls $1
}

acp() {
	aws s3 cp $1 $2 
}
#aws s3 ls or rm  need to swap s3a to s3 --recursive