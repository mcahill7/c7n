#!/bin/bash
export PATH=$:PATH:/usr/local/bin/
custodian run --log-group=/cloud-custodian/dev/us-east-1 -s / /policy.yml --region us-east-1
