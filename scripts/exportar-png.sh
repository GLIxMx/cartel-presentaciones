#!/bin/bash
src=${1:-cartel.svg}
dst='cartel-web.png'

inkscape $src -w 640 -e $dst
