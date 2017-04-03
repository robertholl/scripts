#!/bin/bash

#Will add 7 day retention and auto delete 8th day backup

RPATH="/practice"
RSOURCE="/source"
ARCHIVE_FILE="archive-`date +"%Y%m%d"`.tar.gz"

if [ ! -d $HOME"$RPATH" ]; then
	mkdir $HOME"$RPATH"
	mkdir $HOME"$RPATH"/newlocation
	echo "Created folder"
else
	echo "Folder already exists"
fi

tar -czf $HOME"$RPATH"/newlocation/$ARCHIVE_FILE --directory=$HOME"$RSOURCE/" .