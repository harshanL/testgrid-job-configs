#!/bin/bash

strindex() {
  x="${1%%$2*}"
  [[ "$x" = "$1" ]] && echo -1 || echo "${#x}"
}

for param in "$@"
do
    idx=$(strindex $param =)
    paramName=${param:0:$idx}
    paramValue=${param:$idx+1}
    sed -i '' "s|${paramName}\s=\s.*|${paramName} = '${paramValue}'|g" params.pp
done
