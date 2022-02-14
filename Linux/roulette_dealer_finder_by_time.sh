#!/bin/bash

find *$1*
awk '{print $1, $2, $5, $6}' $1_Dealer* | grep "$2"  


