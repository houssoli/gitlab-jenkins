#!/usr/bin/env bash

sudo mkdir -p /opt/automation
sudo chown -R $(whoami):$(whoami) /opt/automation

mkdir -p /opt/automation/gitlab/{config,logs,data}
mkdir -p /opt/automation/jenkins-master/
mkdir -p /opt/automation/jenkins-worker
chmod -R 775 /opt/automation
