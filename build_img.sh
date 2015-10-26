#!/bin/bash
OP='-crop 1920x1080+0+0'
for i in `ls img_raw/*.png`; do
  echo $i
  out=$(echo $i | sed s/.raw// | sed s/img_raw\\//img\\//)
  echo $out
  if [[ ! -e $out ]]; then
    convert $i $OP $out
  fi
done
