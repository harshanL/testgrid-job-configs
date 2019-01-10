#!/bin/bash

strindex() {
  x="${1%%$2*}"
  [[ "$x" = "$1" ]] && echo -1 || echo "${#x}"
}

PARAM_PP_FILE=""

for param in "$@"
do
	idx=$(strindex $param =)
	paramName=${param:0:$idx}
	if [[ $paramName == "params-file" ]]; then
  		PARAM_PP_FILE=${param:$idx+1}
      break
	fi
done

for param in "$@"
do
    idx=$(strindex $param =)
    paramName=${param:0:$idx}
    paramValue=${param:$idx+1}
    sed -i "s|${paramName}\s=\s.*|${paramName} = '${paramValue}'|g" params.pp
done
