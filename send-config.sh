#!/bin/bash

rm -f nvim.zip
zip nvim.zip -r .
scp nvim.zip krzys@victus:~/AppData/Local/nvim/
