echo "Make sure you have docker installed!"
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
sleep 20
echo "Downloading and installing EarnApp"
wget -qO- https://brightdata.com/static/earnapp/install.sh > /tmp/earnapp.sh && sudo bash /tmp/earnapp.sh
echo "Pulling Honeygain docker image"
docker pull honeygain/honeygain
echo "Pulling binfmt docker image"
docker pull tonistiigi/binfmt
echo "Running binfmt"
sudo docker run --privileged --rm tonistiigi/binfmt
echo "Pulling Peer2Profit docker image"
docker pull peer2profit/peer2profit_linux
