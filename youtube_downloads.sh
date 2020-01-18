#!/bin/sh

#****************************************
# Installation Instructions
#
# 1. Install youtube-dl either from repository or from https://ytdl-org.github.io/youtube-dl/index.html
#    Script written using current youtube-dl version: 2020.01.15
# 2. Copy youtube_downloads.sh to desired directory
# 3. Modify DPTH and FILE for:
#    DPTH is the desired final destination of downloaded videos and corresponding cover photo if available.
#    FILE is the desired file in the local directory to be created and used for listing videos to be downloaded.
# 4. Set executable permission on youtube_downloads.sh
# 5. Execute youtube_downloads.sh to create FILE file
# 6. Copy desired youtube video URL(s) and paste into FILE
# 7. Execute youtube_downloads.sh to download videos
#****************************************

DPTH='/mnt/media_disk/plex_media/youtube/'
FILE='downloadlist.txt'

# Create downloadlist file if it doesn't already exist
if [ -f "$FILE" ]; then

	if [ -s "$FILE" ]; then

    		echo "Start download of videos"
	    	youtube-dl -f 18 --write-thumbnail -a ./$FILE

            	echo "Start move of videos and artwork"

	    	# Move videos to Plex Media Ligrary for Youtube
	    	mv ./*.mp4 $DPTH
	    	mv ./*.jpg $DPTH

	    	echo "Start cleanup of download file"
	    	# Clean up list of videos to be downloaded after videos have been odwnloaded and moved
	    	> ./$FILE
	else
	    	echo "Add URLs to $FILE to be downloaded."
      	fi
else 
	touch ./$FILE
fi

