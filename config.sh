#!/bin/bash
set -x

cp vimrc ~/.vimrc

ssh-keygen -t rsa

cat ~/.ssh/id_rsa.pub
