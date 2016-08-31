sudo apt-get install mercurial libpcap-dev iw
hg clone https://bitbucket.org/befi/wifibroadcast
hg clone https://bitbucket.org/befi/wifibroadcast_fpv_scripts
git clone https://github.com/Dronecode/MAVProxy.git
git clone https://github.com/MyPiDrone/MyPiModule
sudo cp wifibroadcast/patches/AR9271/firmware/htc_9271.fw /lib/firmware
cd wifibroadcast
make
sudo ifconfig wlan0 down
sudo ifconfig wlan0 up
sudo iwconfig wlan0 channel 13
sudo iw dev wlan0 set monitor otherbss fcsfail
cd MAVProxy
python setup.py build install
cd wifibroadcast_fpv_scripts

