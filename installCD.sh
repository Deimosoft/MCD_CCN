#Download and install pi_video_looper
echo "Let's get started!"
echo "~~~~~~~~~~~~~~~~~~"
echo "Installing the loopersystem."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
sudo git clone https://github.com/adafruit/pi_video_looper.git
sudo ./pi_video_looper/install.sh #Installs the looper
sudo rm -r /boot/video_looper.ini
sudo cp video_looper.ini /boot

#Build CCD folder system
echo "Making the CCD file system"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
sudo mkdir /home/pi/CCD
sudo mkdir /home/pi/CCD/Videos
sudo mkdir /home/pi/CCD/Temp
sudo mkdir /home/pi/CCD/Ready
sudo mkdir /home/pi/CCD/Scripts
sudo mkdir /home/pi/CCD/Scripts/Commands
sleep 15

#Make scripts executable
echo "Making scripts executeable."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
sudo chmod +x StartC
sudo chmod +x StopC
sleep 10

#Move scripts into the sripts drive
echo "Move pre-made scripts over"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
cp StartC /home/pi/CCD/Scripts/Commands
cp StopC /home/pi/CCD/Scripts/Commands
sleep 10

#Move scripts into /bin
echo "Moving the scripts into the /bin folder."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
sudo cp StartC /bin
sudo cp StopC /bin
sleep 10

#Create new scripts
#echo "Creating new scripts"
#echo "~~~~~~~~~~~~~~~~~~~~"
#sudo ./CreateUD #Create UpdateC
#sudo ./CreateUC #Create Upcode

#Modify Crontab
clear
echo "Modifying the crontab"
echo "~~~~~~~~~~~~~~~~~~~~~"
crontab -l > mycron
#echo new cron into cron file
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo $'Video will update every hour on the hour.\nUpdated scripts will be checked every fifteen minutes.\nYou can change these settings at any time.\n\n\nPress any key to continue.'
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
read test
echo "0 * * * * UpdateC" >> mycron
echo "14,29,44,59 * * * * Upcode" >> mycron 
#install new cron file
crontab mycron
rm mycron

#Edit MOTD
sudo rm -r /etc/motd
sudo cp motd /etc

#Finish
echo "Enjoy!"
echo "++++++"

