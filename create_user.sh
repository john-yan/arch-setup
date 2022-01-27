#!/bin/bash

# create user
useradd -mG wheel $1
echo -e "$1\n$1" | passwd $1

