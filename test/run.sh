#! /bin/sh

TEST_DIR=`dirname $0`
TOOL=../semi-automatic-text-editor

setUp()
{
  PREV_DIR=$PWD
  cd $TEST_DIR
  cp a.txt a.txt.bk
  cp b.txt b.txt.bk
  cp a/a.txt a/a.txt.bk
}

tearDown()
{
  if [ -f a.txt.bk ]; then
    mv a.txt.bk a.txt
  fi
  if [ -f b.txt.bk ]; then
    mv b.txt.bk b.txt
  fi
  if [ -f a/a.txt.bk ]; then
    mv a/a.txt.bk a/a.txt
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

testExample7()
{
  $TOOL b.txt '[bcd]' abc > /dev/null 2>&1
  diff b.txt 7-expected.txt
  assertEquals 0 $?
}

testExample8()
{
  $TOOL b.txt def '[efg]' > /dev/null 2>&1
  diff b.txt 8-expected.txt
  assertEquals 0 $?
}

testExample9()
{
  $TOOL a/a.txt abc def > /dev/null 2>&1
  diff a/a.txt 9-expected.txt
  assertEquals 0 $?
}

# load shunit2
. $TEST_DIR/shunit2
