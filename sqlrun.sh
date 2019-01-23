#!/bin/bash
# Reason for this Script is it, to provide a common Interface for all Database Operations to an MySQL Server

# Given Parameters
targetdatabase=$1
configfilepath=$2
sqloptions=$3
sqlparameters="--defaults-extra-file=$configfilepath $sqloptions $targetdatabase"
sqlcommand="$4"

output=$(/usr/bin/mysql $sqlparameters <<-EOF
       $sqlcommand;
       exit
EOF
) 

echo "$output"
