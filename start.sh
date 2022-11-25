echo "Starting EarnApp"
earnapp start
echo "Starting Honeygain"
sudo docker run -d --restart always --platform linux/amd64 --name honeygain honeygain/honeygain -tou-accept -email $hg_email -pass $hg_pass -device raspberry_pi
echo "Starting Peer2Profit"
sudo docker stop watchtower; sudo docker rm watchtower; sudo docker rmi containrrr/watchtower; sudo docker stop psclient; sudo docker rm psclient; sudo docker rmi packetstream/psclient; sudo docker run -d --restart=always -e CID=$pkt_cid --name psclient --platform linux/amd64 packetstream/psclient:latest && sudo docker run -d --restart=always --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --cleanup --include-stopped --include-restarting --revive-stopped --interval 60 psclient --platform linux/amd64
