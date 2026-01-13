#!/bin/bash

sudo pacman -Syu --noconfirm

sudo rm /boot/loader/entries/linux.conf

sudo echo -e "default linux-cachyos\ntimeout 2\nconsole-mode keep" > /boot/loader/loader.conf
