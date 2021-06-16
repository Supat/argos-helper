#!/bin/bash

video_files=$(ls | grep -E '.mp4|.mov')

for file in $video_files
do
	duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $file)
	echo ${file}, ${duration}
done

