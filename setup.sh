sudo apt-get install mercurial libpcap-dev iw
cd ~
git clone https://github.com/Dronecode/MAVProxy.git
hg clone https://bitbucket.org/befi/wifibroadcast
hg clone https://bitbucket.org/befi/wifibroadcast_fpv_scripts
cp wifibroadcast/patches/AR9271/firmware/htc_9271.fw /lib/firmware
cd MAVProxy
python setup.py build install
cd ~
cd wifibroadcast
make
cp files/net-blacklist.conf /etc/modprobe.d/
cp files/70-net.rules /etc/udev/rules.d/

sudo ifconfig wlan0 down
sudo iw dev wlan0 set monitor otherbss fcsfail
sudo ifconfig wlan0 up
sudo iwconfig wlan0 channel 13



cp files/arducopter.service /lib/systemd/system/
cp files/mavproxy.service /lib/systemd/system/
cp files/wbctxd.service /lib/systemd/system/
systemctl enable arducopter.service
systemctl enable mavproxy.service
systemctl enable wbctxd.service
systemctl daemon-reload
