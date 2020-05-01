#!/bin/bash
set -ex

echo "xcresult_file_path: ${xcresult_file_path}"
echo "report_path: ${report_path}"
echo "scheme: ${scheme}"

echo 'Checking xcov availability...'
if ! [ -x "$(command -v xcov)" ]; then
  echo 'xcov is not installed, trying to install...'
  gem install xcov --no-document
fi
echo "xcov installed in $(command -v xcov), generating report..."

COMMAND="xcov -f ${xcresult_file_path} -o ${report_path}"
#echo "initial command: $COMMAND"
FLAGS=""
if [ "$scheme" ]; then
  FLAGS="-s $scheme $FLAGS"
#  echo "setting flags to: $FLAGS"
fi
#echo "flags to apply: $FLAGS"
COMMAND="$COMMAND $FLAGS"
#echo "final command: $COMMAND"

$COMMAND

filename="${report_path}/index.html"
envman add --key XCOV_REPORT_PATH --value "$filename"

exit 0
