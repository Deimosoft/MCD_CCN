#Download and install pi_video_looper
echo "Let's get started!"
echo "~~~~~~~~~~~~~~~~~~"
echo "Downloading the loopersystem."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
cd
sudo git clone https://github.com/adafruit/pi_video_looper.git
cd pi_video_looper
rm -r assests/video_looper.ini #Deletes the configuration file included.
cp ../MCD_CCN/video_looper.ini assets/video_looper.ini #Installs a new configuration file set with new file paths and suggested settings.
sudo ./install.sh #Installs the looper

#Build CCD folder system
echo "Making the CCD file system"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
cd
sudo mkdir CCD
sudo mkdir CCD/Videos
sudo mkdir CCD/Videos/Temp
sudo mkdir CCD/Videos/Ready
sudo mkdir CCD/Scripts
sudo mkdir CCD/Scripts/Commands

#Move scripts into the sripts drive
echo "Move pre-made scripts over"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
cd
cd MCD_CCN
cp StartC ~/CCD/Scripts/Commands
cp StopC ~/CCD/Scripts/Commands

#Make scripts executable
echo "Make the scripts executeable."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
cd
cd CCD/Scripts/Commands
sudo chmod +x StartC
sudo chmod +x StopC

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
#echo "Modifying the crontab"
#echo "~~~~~~~~~~~~~~~~~~~~~"
#sudo ./EDcron #Launch the edit crontab program

#Edit MOTD
sudo rm -r /etc/motd
cd
sudo cp MCD_CCN/motd /etc

#Finish
echo "Enjoy!"
echo "++++++"

