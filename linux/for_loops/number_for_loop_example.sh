#!/bin/bash

for num in {0..5}
do
    if [ $num = 1 ] || [ $num = 4 ]
    then
      echo $num
    fi
done

