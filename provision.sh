#!/bin/bash
useradd sonar
yum install -y epel-release wget unzip java-11-openjdk java-11-openjdk-devel
export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which javac)))))
source /etc/bashrc
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.0.zip
unzip sonarqube-8.0.zip -d /opt
mv /opt/sonarqube-8.0 /opt/sonarqube
chown -R sonar:sonar /opt/sonarqube
rm -rf sonarqube-8.0.zip
touch /etc/systemd/system/sonar.service
echo "" > /etc/systemd/system/sonar.service
cat <<EOT >> /etc/systemd/system/sonar.service
[Unit]
Description=Sonarqube Service
After=syslog.target network.target
[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always
[Install]
WantedBy=multi-user.target
EOT
systemctl daemon-reload
systemctl start sonar.service
systemctl enable sonar.service
