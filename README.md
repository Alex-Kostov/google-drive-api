## MySQL database exporter that uploads the database in Google Drive
## Requirements
* NodeJs
* npm
## Features

The tool uses bash script which is made to be run with crontab, once ran the bash script create a database dump which gets uploaded to your Google Drive.
It can also be ran directly throught terminal without cron.
## Installation
##### Create Google Cloud API
To connect to Google API services you will need to set up a new API, this can be easily done following this steps https://developers.google.com/workspace/guides/create-project
Now that you have Google Cloud Project you need to add credentials you can see how [here](https://support.google.com/cloud/answer/6158849?hl=en#zippy=)
When you create the credentials download them as [JSON](https://i.imgur.com/MCDYZwV.png)

The next step is to activate Google drive API https://developers.google.com/drive/api/v3/enable-drive-api
You can do that by going into your project dashboard and clicking [Library](https://i.imgur.com/uU2L5Oq.png) from there you will need to find and enable Google Drive API for your project

You also need to set your OAuth credentials, to do this open the following [menu](https://i.imgur.com/yjjTAaD.png)

From here you need to select External and click Create, this will load a new screen in which you enter only the required fields and click continue.
Following the previous steps will lead you to this [page](https://i.imgur.com/3RtfpUo.png)

From here you need to Add Scopes, the scope we are looking for is named Google Drive API in scopes [../auth/drive](https://i.imgur.com/ZjpjSqg.png)

##### Setup and configure the project
Clone the repository:
```sh
git clone https://github.com/Alex-Kostov/google-drive-api.git
```
Open the directory and install the dependencies
```sh
cd google-drive-api/
npm install
cd src/
```
Now that you have the project localy you need to make db-export-import-to-drive executable by writing the following command executed from src/
```sh
chmod +x db-export-import-to-drive.sh
```
It's time to configure db-export-import-to-drive file so open it and enter the database name, change the user if you are not using root, add a password to your server databases, and most importantly set the SRC_PATH variable to your full path to src/ directory. You can see the full path by running pwd in the terminal.

Now we need to add the Google Drive OAuth json secret that you've downloaded earlier and we need to add it exactly in the file named credentials.json

 Make sure that src/ directory have all needed rights to write in and read files.

Once you have setuped the credentials.json you can try and run the bash script by the following command:

```sh
./db-export-import-to-drive.sh
```
This will load the bash script and will require you to authenticate by providing you with a URL from which you will get a key that the program requires to continue.
Once you've entered the key the application should add a new file into your src folder named token.js, if not check the folder permissions. Once the token is added the script will upload the database into your google drive.

##### Set up cron
The bash script can be added in crontab to automate the whole process.

Open crontab by running
```sh
sudo crontab -e
```
And add the needed command in the bottom.
Here is an example crontab command:
```sh
 * * * * * /home/alex/Desktop/code/challenges/google-drive-api/src/db-export-import-to-drive.sh >> /var/log/mycron.log
```
The above is an example command to use it you will need to change the path and the interval.
NOTE: Before adding the script to crontab you first need to run the above steps and have the token.json file generated.
