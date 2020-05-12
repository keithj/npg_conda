#!/bin/bash

conda install -y avro=1.7.7
conda install -y aws-sdk-cpp=1.4.87
conda install -y boost=1.60.0
conda install -y catch2=2.6.1
conda install -y cppzmq=4.2.1
conda install -y fmt=6.1.2
conda install -y imagemagick=7.0.6 # This brings a lot of crap with it
conda install -y jansson=2.7	
conda install -y libarchive=3.3.2
conda install -y redis=4.0.8
conda install -y zeromq=4.2.1-1 # Forced update from zeromq=4.1.3 by cppzmq

# TODO;
# elasticlient 0.1.0
# libs3 a30e55e8
# mungefs 1.0.2
