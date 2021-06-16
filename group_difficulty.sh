#!/bin/bash

video_files=$(ls | grep -E '.mp4|.mov')

mkdir easy
mkdir medium
mkdir hard

for file in $video_files
do
	duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $file)
	echo ${file}, ${duration}
	
	if (( $(echo "$duration < 7.0" | bc -l) ));
	then
		echo 'hard'
		cp $file hard/$file
	elif (( $(echo "$duration < 10.0" | bc -l) ));
	then
		echo 'medium'
		cp $file medium/$file
	else
		echo 'easy'
		cp $file easy/$file
	fi
done

