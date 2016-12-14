##Install Elastic search##

sudo wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get update -y

sudo echo "deb http://packages.elastic.co/elasticsearch/1.7/debian stable main" | sudo tee -a /etc/$
sudo apt-get update -y

sudo apt-get install -y elasticsearch

sudo service elasticsearch restart

sudo update-rc.d elasticsearch defaults 95 10
##Test to see it works##
#curl localhost:9200


##Install logstash##

sudo echo "deb http://packages.elasticsearch.org/logstash/1.5/debian stable main" | sudo tee -a /et$
sudo apt-get update -y

sudo apt-get install -y logstash
sudo update-rc.d logstash defaults 97 8
#sudo service logstash start

##Test to see if it runs##

#sudo service logstash status

##Redirect System logs to Logstash##

sudo cp ~/ELK-stack/10-syslog.conf /etc/logstash/conf.d
sudo service logstash restart

##Install kibana##

sudo wget https://download.elastic.co/kibana/kibana/kibana-4.1.1-linux-x64.tar.gz
sudo tar zxvf kibana-4.1.1-linux-x64.tar.gz

sudo mkdir -p kibana-4.1.1-linux-x64/* /opt/kibana
cd /etc/init.d && sudo wget https://raw.githubusercontent.com/akabdog/scripts/master/kibana4_init -O kibana4
sudo chmod +x /etc/init.d/kibana4
sudo update-rc.d kibana4 defaults 96 9
sudo service kibana4 start
