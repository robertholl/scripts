#!/bin/bash

RPATH="/practice"
RSOURCE="/source"
ARCHIVE_FILE="archive.tar.gz"

if [ ! -d $HOME"$RPATH" ]; then
	mkdir $HOME"$RPATH"
	mkdir $HOME"$RPATH"/newlocation
	echo "Created folder"
else
	echo "Folder already exists"
fi

tar -czf $HOME"$RPATH"/$ARCHIVE_FILE --directory=$HOME"$RSOURCE/" .

mv $HOME"$RPATH"/$ARCHIVE_FILE $HOME"$RPATH/newlocation/"
echo "Before untar"
tar -xvf $HOME"$RPATH"/newlocation/$ARCHIVE_FILE


