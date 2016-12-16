# ELK-stack
Steps to install:
  1. Download the elastic search key with wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
  2. Create the elastic search source list with echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
  3. Install elastic search either by downloading a tar file and extracting or using apt-get on your ubuntu instance
  4. Next you need to install logstash using similar methods
  5. After logstash is installed you need to navigate to the directory /etc/logstash/conf.d and make a new file called 10-syslog.conf        and add the following text into the file
    
    LOCAL_IP="localip"

     input {
     file {
     type => "syslog"
     path => [ "/var/log/messages", "/var/log/*.log" ]
        }
     }
     output {
     stdout {
     codec => rubydebug
        }
     elasticsearch {
     host => "${LOCAL_IP}"
        }
     }
  
  6. Finally install kibana by downloading the tar and extracting
  7. Make a directory /opt/kibana and move the extracted kibana folder there
  8. Change directory and use wget on https://raw.githubusercontent.com/akabdog/scripts/master/kibana4_init -O kibana4 to download a configuration file 









Contains a shell script which will automate the installation of a ELK stack on an AWS ubuntu instance.
To use simply clone this repository into your AWS instance and follow these steps:
  - Ensure you have java 7 or higher already installed on the instance
  - Go into the 10-syslog.conf file and change the local ip address to the IP of your instance
  - Change the modifications of the shellscript with "sudo chmod a+x elkconfig.sh"
  - Execute the shell script with ./elkconfig.sh
  - Navigate to localdomain:5601 and you should find the kibana homepage. You may need to load some data into elasticsearch in order to     play around with kibana
