#!/bin/bash

input=instances.txt
cmd=checkstatus.sh

while read line
do
	name=$(echo $line | cut -d' ' -f1)
	host=$(echo $line | cut -d' ' -f2)
	echo "instance: $name  hostname: $host"
	echo "echo -n '$name '; grep Compl /mnt/nohup.out | wc -l" | ssh -i ~/Dropbox/keystore/dissertation.pem ec2-user@$host 'bash -s'
done < "$input"