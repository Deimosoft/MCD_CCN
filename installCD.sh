#Download and install pi_video_looper
echo "Let's get started!"
echo "~~~~~~~~~~~~~~~~~~"
echo "Installing the loopersystem."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
sudo chmod +x install.sh
sudo ./install.sh #Installs the looper

#Build CCD folder system
echo "Making the CCD file system"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
sudo mkdir /home/pi/CCD
sudo mkdir /home/pi/CCD/Videos
sudo mkdir /home/pi/CCD/Temp
sudo mkdir /home/pi/CCD/Ready
sudo mkdir /home/pi/CCD/Scripts
sudo mkdir /home/pi/CCD/Scripts/Commands

#Make scripts executable
echo "Make the scripts executeable."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
sudo chmod +x StartC
sudo chmod +x StopC

#Move scripts into the sripts drive
echo "Move pre-made scripts over"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
cp StartC /home/pi/CCD/Scripts/Commands
cp StopC /home/pi/CCD/Scripts/Commands

#Move scripts into /bin
echo "Moving the scripts into the /bin folder."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
sudo cp StartC /bin
sudo cp StopC /bin

#Create new scripts
#echo "Creating new scripts"
#echo "~~~~~~~~~~~~~~~~~~~~"
#sudo ./CreateUD #Create UpdateC
#sudo ./CreateUC #Create Upcode

#Modify Crontab
echo "Modifying the crontab"
echo "~~~~~~~~~~~~~~~~~~~~~"
crontab -l > mycron
#echo new cron into cron file
echo "Video will update every hour and the hour.\nUpdate script will be checked every fifteen.\nYou can change these settings at any time.\n\n\nPress any key to continue."
pause
echo "00 * * * * UpdateC" >> mycron
echo "14,29,44,59 * * * * Upcode" >> mycron 
#install new cron file
crontab mycron
rm mycron


#Edit MOTD
sudo rm -r /etc/motd
sudo cp motd /etc

echo "Trying to copy over the video-ini"
cp ./assets/video_looper.ini /boot

#Finish
echo "Enjoy!"
echo "++++++"

