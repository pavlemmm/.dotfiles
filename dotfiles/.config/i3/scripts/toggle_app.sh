#!/bin/bash

if pgrep -x $1; then
    killall $1
else
    $1 &
fi
