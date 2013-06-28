#! /bin/sh

TEST_DIR=`dirname $0`
TOOL=../semi-automatic-text-editor

setUp()
{
  PREV_DIR=$PWD
  cd $TEST_DIR
  cp a.txt a.txt.bk
}

tearDown()
{
  if [ -f a.txt.bk ]; then
    mv a.txt.bk a.txt
  fi
  cd $PREV_DIR
}

testExample1()
{
  $TOOL a.txt abc def > /dev/null 2>&1
  diff a.txt 1-expected.txt
  assertEquals 0 $?
}

testExample5()
{
  $TOOL a.txt abc def 2 > /dev/null 2>&1
  diff a.txt 5-expected.txt
  assertEquals 0 $?
}

testExample6()
{
  $TOOL a.txt cde def -2 > /dev/null 2>&1
  diff a.txt 6-expected.txt
  assertEquals 0 $?
}

# load shunit2
. $TEST_DIR/shunit2
