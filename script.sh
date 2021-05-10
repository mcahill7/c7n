#!/bin/bash
timestamp=`date +%Y/%m/%d-%H:%M:%S`
echo "System path is $PATH at $timestamp"
export PATH=$:PATH:/usr/local/bin/
custodian -h