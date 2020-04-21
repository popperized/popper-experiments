#!/bin/bash
set -e

# fetch timestamp
timestamp=$(date "+%Y%m%d-%H%M%S")

# start timing
start=$(date +%s)
start_fmt=$(date +%Y-%m-%d\ %r)
echo "STARTING TIMING RUN AT $start_fmt"

# start training
if [[ -z "$CUDA_ENABLED" ]]
then
python ./scripts/run_training.py --no-cuda --epochs $EPOCHS 
else
python ./scripts/run_training.py --epochs $EPOCHS
fi

# end timing
end=$(date +%s)
end_fmt=$(date +%Y-%m-%d\ %r)
echo "ENDING TIMING RUN AT $end_fmt"

# report result
result=$(( $end - $start ))
result_name="mnist"

# display results
echo "RESULT: (Experiment ran on $timestamp)"
echo "Sample name: $result_name"
echo "Start Time: $start_fmt"
echo "End Time: $end_fmt"
echo "Duration: $result"

