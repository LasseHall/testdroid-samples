#!/bin/bash
#
# Create zip ready to be uploaded to Testdroid Cloud.
#

OUT_ZIP="ios-test.zip"

cp run-tests_ios.sh run-tests.sh
if [ -f "${OUT_ZIP}" ]; then
    rm -f "${OUT_ZIP}"
fi
STASH=$(git stash create)
git archive -o "${OUT_ZIP}" --format=zip ${STASH} pom.xml run-tests.sh src lib/mac queryimages
echo "${OUT_ZIP}"
