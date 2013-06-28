#! /bin/sh

cp a.txt a.txt.bk
$PWD/semi-automatic-text-editor a.txt abc def
diff a.txt a-expected.txt
mv a.txt.bk a.txt
