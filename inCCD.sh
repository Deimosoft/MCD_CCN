#Download and install pi_video_looper
echo "Let's get started!"
echo "~~~~~~~~~~~~~~~~~~"

#Build CCD folder system
echo "Making the CCD file system"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
sudo mkdir /home/pi/CCD
sudo mkdir /home/pi/CCD/Videos
sudo mkdir /home/pi/CCD/Videos/Temp
sudo mkdir /home/pi/CCD/Videos/Ready
sudo mkdir /home/pi/CCD/Scripts
sudo mkdir /home/pi/CCD/Scripts/Commands
sudo mkdir /home/pi/CCD/Scripts/ToRun
sudo chmod 777 /home/pi/CCD
sudo chmod 777 /home/pi/CCD/Videos
sudo chmod 777 /home/pi/CCD/Scripts
sudo chmod 777 /home/pi/CCD/Videos/Ready
sudo chmod 777 /home/pi/CCD/Scripts/Commands
sudo chmod 777 /home/pi/CCD/Scripts/ToRun
sleep 5

echo "Installing the loopersystem."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
sudo git clone https://github.com/adafruit/pi_video_looper.git
sudo cp video_looper.ini pi_video_looper/assets/video_looper.ini
sudo ./pi_video_looper/install.sh #Installs the looper

echo "Installing dependencies."
echo "~~~~~~~~~~~~~~~~~~~~~~~~"
sudo apt-get install sshpass

#Create new scripts
echo "Creating new scripts"
echo "~~~~~~~~~~~~~~~~~~~~"
sleep 3
sudo chmod +x CreateUD
sudo ./CreateUD #Create UpdateC

#Make scripts executable
echo "Making scripts executeable."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~"
sudo chmod +x StartC
sudo chmod +x StopC
sudo chmod +x UpdateC
sudo chmod +x Upcode
sleep 5

#Move scripts into the sripts drive
echo "Move pre-made scripts over"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
cp StartC /home/pi/CCD/Scripts/Commands
cp StopC /home/pi/CCD/Scripts/Commands
cp UpdateC /home/pi/CCD/Scripts/Commands
cp Upcode /home/pi/CCD/Scripts/Commands
sleep 5

#Move scripts into /bin
echo "Moving the scripts into the /bin folder."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
sudo cp StartC /bin
sudo cp StopC /bin
sudo cp UpdateC /bin
sudo cp Upcode /bin
sleep 5

#Modify Crontab
sudo chmod +x EDCron
sudo ./EDCron
sleep 2

#Edit MOTD
sudo rm -r /etc/motd
sudo cp motd /etc
sleep 2

#Display the motd
clear
cat motd
echo "Press any key to continue."
read test
clear

#Finish
echo "Enjoy!"
echo "++++++"
