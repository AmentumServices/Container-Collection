#!/bin/bash
ROOTDIR="Container-Collector"
DEST="$ROOTDIR/$SRC"

if [ -d $ROOTDIR ];then
  echo "Directory exists.  Deleting."
  rm -rf $ROOTDIR
fi

mkdir $ROOTDIR

while read SRC
do
  REPO="JacobsFederal/$SRC"
  echo -e "\nWorking with github repo $REPO"
  echo -e "Listing releases\n"
  gh release list -R $REPO
  echo -e "\nDownloading Latest to $DEST\n"
  gh release download -p "*" -D $DEST -R $REPO
  
  if [ $? ];then
    echo -e "\nDownload Complete!"
  else
    echo "ERROR!"
  fi

  ls -Alht $DEST

done < RepoList.txt