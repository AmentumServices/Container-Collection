#!/bin/bash

if [ $1 ]; then
  if [ -f $1 ]; then
    ROOTDIR=${1/.txt/}
    echo -e "\n$ROOTDIR"
  else
    echo "File $1 does not exist"
    exit 2
  fi
else
  echo -e "\nUsage Instructions:"
  echo -e "\t $0 ListFile.txt"
  exit 1
fi

if [ -d $ROOTDIR ];then
  echo "Directory exists.  Deleting."
  rm -rf $ROOTDIR
fi

echo -e "\nCollecting:\n$(cat $1)"
mkdir $ROOTDIR

while read SRC
do
  DEST="$ROOTDIR/$SRC"
  REPO="amentumservices/$SRC"
  echo -e "\nWorking with github repo $REPO"
  echo -e "Listing last 3 releases\n"
  gh release list -R $REPO | head -n3
  echo -e "\nDownloading Latest to $DEST"
  gh release download -p "*" -D $DEST -R $REPO
  
  if [ $? ];then
    echo -e "\nDownload Complete!"
  else
    echo -e "\n\n************************ ERROR! ************************\n\n"
  fi

  echo -e "\nDirectory Contents"
  ls -AlhtS $DEST/*
done < $1

if [ $(command -v tree) ]; then
  echo -e "\n\nDirectory Tree" 
  tree $ROOTDIR
else
  echo -e "\nTree not installed"
fi

echo -e "\nDirectory $ROOTDIR Size"
du -hd1 $ROOTDIR
echo -e "\nSubdirectory Sizes"
du -hd2 $ROOTDIR/*