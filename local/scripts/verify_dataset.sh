#!/bin/sh
set -ex

if [ -f mnist.npz ]; then
ACTUAL_TEST=`cat mnist.npz | md5sum`
EXPECTED_TEST='8a61469f7ea1b51cbae51d4f78837e45  -'
if [[ "$ACTUAL_TEST" = "$EXPECTED_TEST" ]]; then
  echo "OK: correct mnist.npz"
else
  echo "ERROR: incorrect mnist.npz"
  echo "ERROR: expected $EXPECTED_TEST"
  echo "ERROR: found $ACTUAL_TEST"
fi
fi