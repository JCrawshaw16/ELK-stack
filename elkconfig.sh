##Install Elastic search##

sudo wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get update -y

sudo echo "deb http://packages.elastic.co/elasticsearch/1.7/debian stable main" | sudo tee -a /etc/$
sudo apt-get update -y

sudo apt-get install -y elasticsearch

sudo service elasticsearch restart

##Test to see it works##
curl localhost:9200


##Install logstash##

sudo echo "deb http://packages.elasticsearch.org/logstash/1.5/debian stable main" | sudo tee -a /et$
sudo apt-get update -y

sudo apt-get install -y logstash
sudo update-rc.d logstash defaults 97 8
sudo service logstash start

##Test to see if it runs##

sudo service logstash status

##Redirect System logs to Logstash##

sudo touch /etc/logstash/conf.d/10-syslog.conf
sudo echo "input {" > /etc/logstash/conf.d/10-syslog.conf
sudo echo "file {" >> /etc/logstash/conf.d/10-syslog.conf
sudo echo "type => "syslog"" >> /etc/logstash/conf.d/10-syslog.conf
sudo echo "path => [ "/var/log/messages", "/var/log/*.log" ]" >> /etc/logstash/conf.d/10-syslog.conf
sudo echo "}" >> /etc/logstash/conf.d/10-syslog.conf
sudo echo "}" >> /etc/logstash/conf.d/10-syslog.conf
sudo echo "output {" >> /etc/logstash/conf.d/10-syslog.conf
sudo echo "stdout {" >> /etc/logstash/conf.d/10-syslog.conf
sudo echo "codec => rubydebug" >> /etc/logstash/conf.d/10-syslog.conf
sudo echo "}" >> /etc/logstash/conf.d/10-syslog.conf
sudo echo "elasticsearch {" >> /etc/logstash/conf.d/10-syslog.conf
sudo echo "host => "http://52.212.120.173"" >> /etc/logstash/conf.d/10-syslog.conf
sudo echo "}\n}" >> /etc/logstash/conf.d/10-syslog.conf