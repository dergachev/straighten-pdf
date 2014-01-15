#!/usr/bin/env bash

function die(){
  echo "Usage: run.sh INPUTFILE.pdf"
  echo "  Respects these ENV variables: PDFTOPPM_ARGS, UPNPAPER_ARGS, CONVERT_ARGS"
  exit 1
}

PDFTOPPM_ARGS_DEFAULT="-gray -r 300"
UNPAPER_ARGS_DEFAULT=""
CONVERT_ARGS_DEFAULT="-verbose -limit memory 400m -limit map 400m"

# read these from env variables, else set default
PDFTOPPM_ARGS=${PDFTOPPM_ARGS:-$PDFTOPPM_ARGS_DEFAULT}
UNPAPER_ARGS=${UNPAPER_ARGS:-$UNPAPER_ARGS_DEFAULT}
CONVERT_ARGS=${CONVERT_ARGS:-$CONVERT_ARGS_DEFAULT}

test -e "$1" || die
INPUT_PATH=$1
INPUT_FILE=$(basename $1)
OUTPUT_PATH=build/$INPUT_FILE

cp $INPUT_PATH build/in.pdf
docker run -i -t -v $(pwd):/src \
  -e PDFTOPPM_ARGS="$PDFTOPPM_ARGS" -e "UNPAPER_ARGS=$UNPAPER_ARGS" -e "CONVERT_ARGS=$CONVERT_ARGS"\
  dergachev/straighten-pdf make all
cp build/out.pdf $OUTPUT_PATH
echo "Created $OUTPUT_PATH"
