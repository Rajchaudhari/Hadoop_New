sudo yum install epel-release -y
sudo yum update -y
sudo yum install -y java-1.8.0-openjdk
cd
yum install wget -y
wget http://apachemirror.wuchna.com/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz
wget http://apachemirror.wuchna.com/hadoop/common/hadoop-2.7.7/hadoop-2.7.7-src.tar.gz
sudo yum install perl-Digest-SHA
sudo tar -zxvf hadoop-2.7.7.tar.gz -C /opt
sed -i 's/export JAVA_HOME/#/g' /opt/hadoop-2.7.7/etc/hadoop/hadoop-env.sh
echo "export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")" >> /opt/hadoop-2.7.7/etc/hadoop/hadoop-env.sh
echo "export PATH=/opt/hadoop-2.7.7/bin:$PATH" | sudo tee -a /etc/profile
source /etc/profile
mkdir ~/source
cp /opt/hadoop-2.7.7/etc/hadoop/*.xml ~/source
hadoop jar /opt/hadoop-2.7.7/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.7.jar grep ~/source ~/output 'principal[.]*'
cat ~/output/*
echo "------------------------------------HADOOP INSTALLED--------------------------------------------"
hadoop version
echo "------------------------------------------------------------------------------------------------"
