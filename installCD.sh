#Download and install pi_video_looper
echo "Let's get started!"
echo "~~~~~~~~~~~~~~~~~~"
echo "Downloading the loopersystem."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
cd
git clone #
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

#Move scripts into the sripts drive
echo "Move pre-made scripts over"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
cd
cd MCD_CCN/Scripts
cp StartC ../CCD/Scripts
cp StopC ../CCD/Scripts

#Make scripts executable
echo "Make the scripts executeable."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
sudo chmod +x StartC
sudo chmod +x StopC

#Move scripts into /bin
echo "Moving the scripts into the /bin folder."
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
sudo cp StartC /bin
sudo cp StopC /bin

#Create new scripts
echo "Creating new scripts"
echo "~~~~~~~~~~~~~~~~~~~~"
#sudo ./CreateUD #Create UpdateC
#sudo ./CreateUC #Create Upcode

#Modify Crontab
echo "Modifying the crontab"
echo "~~~~~~~~~~~~~~~~~~~~~"
#sudo ./EDcron #Launch the edit crontab program

#Edit MOTD
sudo rm -r /etc/motd
cd
sudo cp CCD/motd /etc

#Finish
echo "Enjoy!"
echo "++++++"

