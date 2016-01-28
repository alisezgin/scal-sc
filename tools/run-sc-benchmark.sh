#!/bin/bash

if [[ $# -ne 2 ]]; then
  echo "usage: ./run-benchmark <data structure> <data structure config>"
  exit 1
fi

DS=$1
DS_CONFIG=$2
CFG="-c 4000 -operations 1000000"
#CFG="-c 4000 -elements 1000000"
REPS=10
#REPS=2
PRUNE="yes"
ADJUST_PREALLOC_SIZE="no"
BENCHMARK="prodcon"
BINARY_PREFIX="./out/Release/$BENCHMARK-"

DATA_DIR=data
RAW_FILE=$DATA_DIR/$BENCHMARK-$DS-raw.dat
AVG_FILE=$DATA_DIR/$BENCHMARK-$DS.dat

preamble="# $BENCHMARK: $DS
# configuration: $DS_CONFIG $CFG
# recorded at: $(date)"

if [[ "$PRUNE" = "yes" ]]; then
  echo "$preamble" > $RAW_FILE
  echo "$preamble" > $AVG_FILE
fi

for i in 1 5 10 15 20 25 30 35 40; do
#for i in 2 10 20 30 40 50 60 70 80; do
  for r in $(seq 1 $REPS); do
    prealloc_size=$(( 80/(2*$i) ))
    prealloc_size=$(echo "scale=1; 80/(2*$i)" | bc)
    cfg_prealloc="-prealloc_size=${prealloc_size}G"
    if [[ "$ADJUST_PREALLOC_SIZE" != "yes" ]]; then
      cfg_prealloc=""
    fi
    binary=${BINARY_PREFIX}${DS}
    set -o xtrace
    $binary $DS_CONFIG $CFG $cfg_prealloc -producers $i -consumers $i
    #$binary $DS_CONFIG $CFG $cfg_prealloc -threads $i
    set +o xtrace
  #done | tee -a $RAW_FILE | awk '{idx[NR]=$2; val[NR]=$10; sum+=$10} END {
  done | tee -a $RAW_FILE | awk '{idx[NR]=$2; val[NR]=$14; sum+=$14} END {
    mean = sum/NR
    sq_sum = 0
    for(i=1;i<=NR;i++) {
      sq_sum += (val[i] - mean)^2
    }
    unbiased_var = sq_sum/(NR-1)
    unbiased_stddev = sqrt(unbiased_var)
    print idx[1],mean,unbiased_stddev
  }' | tee -a $AVG_FILE
done

