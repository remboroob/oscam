sudo su
cd
cd..
sudo apt update

sudo apt-get update

sudo apt install python3 python3-pip
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyring

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo apt-cache madison docker-ce

sudo apt-get install docker-ce=5:20.10.17~3-0~ubuntu-focal docker-ce-cli=5:20.10.17~3-0~ubuntu-focal containerd.io docker-compose-plugin

sudo docker run hello-world

git clone https://github.com/remboroob/mirror-leech-telegram-bot
cd mirror-leech-telegram-bot
pip3 install -r requirements-cli.txt
cp config_sample.env config.env
pip3 install google-api-python-client google-auth-httplib2 google-auth-oauthlib
python3 generate_drive_token.py
sudo dockerd
sudo docker build . -t mirror-bot3
sudo docker run -p 80:80 mirror-bot3
