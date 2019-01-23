#!/bin/bash
# Sinn dieses Skript ist es ein einheitliches Interface für alle Skripte zu einem MySQL Server bereitzustellen

# Uebergabeparamter
datenbankziel=$1
configfilepath=$2
sqloptionen=$3
sqlparameter="--defaults-extra-file=$configfilepath $sqloptionen $datenbankziel"
sqlcommand="$4"

output=$(/usr/bin/mysql $sqlparameter <<-EOF
       $sqlcommand;
       exit
EOF
) 


echo "$output"