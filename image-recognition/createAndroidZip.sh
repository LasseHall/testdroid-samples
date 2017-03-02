#!/bin/bash
#
# Create zip ready to be uploaded to Testdroid Cloud.
#

OUT_ZIP="android-test.zip"

cp run-tests_android.sh run-tests.sh
if [ -f "${OUT_ZIP}" ]; then
    rm -f "${OUT_ZIP}"
fi
STASH=$(git stash create)
git archive -o "${OUT_ZIP}" --format=zip $STASH pom.xml run-tests.sh src lib/linux queryimages
echo "${OUT_ZIP}"
