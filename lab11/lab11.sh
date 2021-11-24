#!/usr/bin/env bash

check=$(rpm -qa | grep net-tools)

if [[ -n $check ]]; then
    echo "Package has already been installed"
    exit 77
else
    number=$(sudo dnf install net-tools | rpm -ql net-tools | grep bin | xargs ls -i | 
    head -1 | netstat --statistics --raw | grep requests | awk {'print $1'})


    result=$(echo $number | rev)
    output=""

    for i in `seq 1 ${#number}`
        do
            last_digit=$(($result % 10))
            if [ $(($last_digit%2)) -eq 0 ]; then
                output="${output}e"
            else    
                output="${output}o"
            fi
            result=$(($result / 10))
        done
    echo $output
fi
