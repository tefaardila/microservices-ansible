#setup auth-api
pwd
cd /home/vagrant/microservice-app-example/auth-api
pwd
sudo echo 'export GO111MODULE=on' >> /$HOME/.profile
sudo go mod init github.com/tefaardila/microservice-app-example/tree/master/auth-api
sudo go mod tidy
sudo go build