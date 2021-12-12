#!/bin/bash

var1=$1

if [[ "$var1" == "SETUP" ]]
then
  docker-compose up -d --build
elif [[ "$var1" == "STATUS" ]]
then
   subst_a=$(docker inspect container_a | awk 'FNR == 11 {print $2}')
   subst_b=$(docker inspect container_b | awk 'FNR == 11 {print $2}')
   subst_c=$(docker inspect container_c | awk 'FNR == 11 {print $2}')

   ## Container A ##
   if [[ "$subst_a" == *"run"* ]]
   then
     status_a=running
   else
     status_a=stopped
   fi

    ## Container B ##
   if [[ "$subst_b" == *"run"* ]]
   then
     status_b=running
   else
     status_b=stopped
   fi

    ## Container C ##
   if [[ "$subst_c" == *"run"* ]]
   then
     status_c=running
   else
     status_c=stopped
   fi

    ## Container Status ##
    echo ContainerA : $status_a
    echo ContainerB : $status_b
    echo ContainerC : $status_c

elif [[ "$var1" == "PID" ]]
then

    pid_a=$(docker inspect container_a | awk 'FNR == 17 {print $2}')
    pid_b=$(docker inspect container_b | awk 'FNR == 17 {print $2}')
    pid_c=$(docker inspect container_c | awk 'FNR == 17 {print $2}')

    ## Container Pid ##
    echo ContainerA : $pid_a
    echo ContainerB : $pid_b
    echo ContainerC : $pid_c

elif [[ "$var1" == "STOP" ]]
then
   docker stop $(docker ps -a -q)

elif [[ "$var1" == "DESTROY" ]]
then
	  docker container prune -f
fi


   

    
