#!/bin/bash
startTime=$(date +"%T %F")
read -p "What will you be doing? " task
read -p "How many minutes? " originalMin
clear
echo "==========================="
echo "CURRENT TASK: " $task
min=$((originalMin - 1))
secs=$((60))
while [ $min -gt 0 ]; do
while [ $secs -gt 0 ]; do
   echo -ne "$min minutes $secs seconds \033[0K\r"
   sleep 1
   : $((secs--))
done
min=$((min - 1))
secs=$((60))
done
if [ $secs -gt 0 ]; then
  while [ $secs -gt 0 ]; do
    echo -ne "0 minutes $secs seconds \033[0K\r"
    sleep 1
    : $((secs--))
  done
fi
#endTime=$(date +"%T %F")
echo "$task : $originalMin minutes" >> ~/dailylog.txt
echo "$startTime" >> ~/dailylog.txt
#echo "$endTime" >> ~/dailylog.txt
cat ~/dailylog.txt
exec notify-send "Time's up!" &
exec mpv ~/audio/other/sound-effects/tibetian-singing-bowl.wav

