#!/bin/bash

# TODO: expose CLI
# TODO: rename blackfire -> blackfire-agent
# TODO: rename cli -> blackfire
# TODO: documentation for blackfire run/curl -> download the binary directly if no need of the agent/probe
# docker build -t blackfire_test .

set -e
set -x

curl -o blackfire.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/agent/linux/amd64
tar zxpf blackfire.tar.gz
mv agent blackfire-agent

#curl -o blackfire.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/client/linux/i386
curl -o blackfire.tar.gz -D - -L -s http://packages.blackfire.io/binaries/blackfire-agent/0.19.1/blackfire-cli-linux_amd64.tar.gz
tar zxpf blackfire.tar.gz
mv cli blackfire

rm blackfire.tar.gz agent.sha1 cli.sha1
