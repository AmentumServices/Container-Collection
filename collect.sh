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
  echo -e "\nDownloading Latest to $DEST\n"
  gh release download -p "*" -D $DEST -R $REPO
  
  if [ $? ];then
    echo -e "Download Complete!"
  else
    echo "ERROR!"
  fi

  ls -Alht $DEST/*
done < $1

echo -e "\nDirectory Contents"
ls -lAhS $ROOTDIR/*
echo -e "\nDirectory Size"
du -hd2 $ROOTDIR/*

if [ $(command -v tree) ]; then
  echo -e "\nDirectory Tree" 
  tree $ROOTDIR
else
  echo -e "\nTree not installed"
fi 