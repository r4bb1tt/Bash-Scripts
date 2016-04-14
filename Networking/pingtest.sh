#!/bin/bash

if ping -c 1 -W 2 $1 >/dev/null; then
    echo "The Network Is Currently UP"
  else
    echo "You Do NOT Have A Connection To The Internet"
fi
