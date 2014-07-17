#!/bin/bash

ec2-run-instances ami-e752418e --region us-east-1 -n 6 --key ~/Dropbox/keystore/dissertation.pem --instance-type c3.xlarge 
