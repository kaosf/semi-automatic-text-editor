#! /bin/sh

cd `dirname $0`
TOOL=../semi-automatic-text-editor

testExample1()
{
  cp a.txt a.txt.bk
  $TOOL a.txt abc def > /dev/null 2>&1
  diff a.txt 1-expected.txt
  assertEquals 0 $?
  mv a.txt.bk a.txt
}

testExample5()
{
  cp a.txt a.txt.bk
  $TOOL a.txt abc def 2 > /dev/null 2>&1
  diff a.txt 5-expected.txt
  assertEquals 0 $?
  mv a.txt.bk a.txt
}

testExample6()
{
  cp a.txt a.txt.bk
  $TOOL a.txt cde def -2 > /dev/null 2>&1
  diff a.txt 6-expected.txt
  assertEquals 0 $?
  mv a.txt.bk a.txt
}

# load shunit2
. ./shunit2
