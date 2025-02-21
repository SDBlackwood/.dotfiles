#!/bin/bash

for file in ./base; do
    echo "installing $file"
    brew install  < "$file"
done
