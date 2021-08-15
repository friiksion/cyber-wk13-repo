#!/bin/bash

states=('arkansas' 'texas' 'california' 'indiana' 'hawaii')

for state in ${states[@]}
do
  if [ $state = 'hawaii' ]
  then
    echo "I love $state!"
  else
    echo "Im not fond of $state."
  fi
done
