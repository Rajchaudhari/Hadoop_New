RED='\033[0;31m'
NC='\033[0m' 
if dpkg -S /bin/ls >/dev/null 2>&1
then
  sudo apt-get update -y
  sudo apt-get install default-jdk -y
  cd
  wget http://apachemirror.wuchna.com/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz
  wget http://apachemirror.wuchna.com/hadoop/common/hadoop-2.7.7/hadoop-2.7.7-src.tar.gz
  sudo tar -zxvf hadoop-2.7.7.tar.gz -C /opt
  sed -i 's/export JAVA_HOME/#/g' /opt/hadoop-2.7.7/etc/hadoop/hadoop-env.sh
  echo "export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")" >> /opt/hadoop-2.7.7/etc/hadoop/hadoop-env.sh
  echo "export PATH=/opt/hadoop-2.7.7/bin:$PATH" | sudo tee -a /etc/profile
  source /etc/profile 
  mkdir ~/source
  sudo cp /opt/hadoop-2.7.7/etc/hadoop/*.xml ~/source
  hadoop jar /opt/hadoop-2.7.7/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.7.jar grep ~/source ~/output 'principal[.]*'
  cat ~/output/*
  printf "${RED}HADOOP INSTALLATION COMPLETED !${NC} \n Verify by: hadoop version \n"
  hadoop version
