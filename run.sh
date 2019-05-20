#!/bin/bash

python2 ./scripts/speak.py -l ar -s sham -o ./test/wav/"$(date +"%Y_%m_%d_%I_%M_%p").wav" naive_01_nn ./test/txt/ar.txt
