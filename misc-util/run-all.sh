#!/bin/bash

#DS="ms treiber lcrq hc-ts-interval-stack us-kfifo kstack dq-1random-ms dq-1random-treiber"
#DS="ll-dyn-dq-ms ll-dyn-dq-treiber ll-dq-ms ll-dq-treiber"
#DS="ll-us-kfifo ll-kstack"
#DS="dq-1random-ms dq-1random-treiber ll-dq-ms ll-dq-treiber"
#DS="us-kfifo kstack ll-us-kfifo ll-kstack"

#DS="ll-dq-ms ll-dyn-dq-ms"
#DS="dq-1random-ms dq-1random-treiber"
#DS="us-kfifo hc-ts-interval-stack ms treiber lcrq kstack"
#DS="ll-dyn-dq-treiber"
#DS="ll-dq-ms ll-dq-treiber"
DS="dq-partrr-ms"


declare -A configs=(
  ["hc-ts-interval-stack"]="-delay 5500"
  ["us-kfifo"]="-k 80"
  ["ll-us-kfifo"]="-k 80"
  ["kstack"]="-k 80"
  ["ll-kstack"]="-k 80"
  ["ms"]=""
  ["lcrq"]=""
  ["treiber"]=""
  ["ll-dq-ms"]="-p 40 -ll_balancer_seed 19"
  ["ll-dq-treiber"]="-p 40 -ll_balancer_seed 19"
  ["dq-1random-ms"]="-p 80"
  ["dq-1random-treiber"]="-p 80"
  ["ll-dyn-dq-ms"]=""
  ["ll-dyn-dq-treiber"]=""
  ["dq-partrr-ms"]="-p 80 -partitions 1"
)

for d in $DS; do
  #echo "$d ${configs["$d"]}"
  ./tools/run-benchmark.sh $d "${configs["$d"]}"
done

