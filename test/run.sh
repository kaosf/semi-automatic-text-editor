#! /bin/sh

TOOL=../semi-automatic-text-editor
cd test

# try
(
  set -e

  # Example 1
  cp a.txt a.txt.bk
  $TOOL a.txt abc def
  diff a.txt 1-expected.txt

  # Example 5
  cp a.txt.bk a.txt
  $TOOL a.txt abc def 2
  diff a.txt 5-expected.txt

  # Example 6
  cp a.txt.bk a.txt
  $TOOL a.txt cde def -2
  diff a.txt 6-expected.txt
)
# catch
[ $? -eq 0 ] || (
  RET=$?
  echo 'error!' 2>&1
  exit $RET
)
# finally
{
  RET=$?

  mv a.txt.bk a.txt

  exit $RET
}
