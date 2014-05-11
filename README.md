# Semi-automatic Text Editor

## Installation

```bash
./configure
# or
#./configure --prefix=$HOME/local
make install
```

## Usage

```sh
semi-automatic-text-editor FILE LINE_INDICATOR INSERT_TEXT [OFFSET = 0]
```

`INSERT_TEXT` will be inserted at the line that `LINE_INDICATOR` exists in `FILE`.

If `OFFSET` is specified, `INSERT_TEXT` will be inserted at `(the line that LINE_INDICATOR exists) + OFFSET`.

## Example

Create `a.txt` as;

```text
abc
bcd
cde
```

### Example 1

```bash
semi-automatic-text-editor a.txt abc def
```

`a.txt` will be;

```text
def
abc
bcd
cde
```

`def` is inserted into the line that `abc` existed.

### Example 2

```sh
semi-automatic-text-editor b.txt abc def
#=> 1 # return code
#=> ERROR: "b.txt" dosen't exist!
```

### Example 3

```sh
semi-automatic-text-editor a.txt abb def
#=> 2 # return code
#=> ERROR: "abb" line dosen't exist!
```

### Example 4

```sh
semi-automatic-text-editor a.txt abc bcd
#=> 3 # return code
#=> ERROR: "bcd" is already inserted!
```

### Example 5

You can specify **OFFSET** at 4th argument. It will be **0** defaultly.

```sh
semi-automatic-text-editor a.txt abc def 2
```

`a.txt` will be;

```text
abc
bcd
def
cde
```

`def` is inserted into after 2 lines that `abc` exists.

### Example 6

```sh
semi-automatic-text-editor a.txt cde def -2
```

`a.txt` will be;

```text
def
abc
bcd
cde
```

`cde` was at line **3**. Therefore `def` is inserted into line **1** (3 + (-2)).

## Test

`make check`

### About shUnit2

[shUnit2](http://code.google.com/p/shunit2/) is a xUnit for ShellScript.

Download it from [here](http://sourceforge.net/projects/shunit2/?source=dlp) (I downloaded version 2.1.3) and extract it. Then, run `make build` to generate `build/shunit2`. Use it as a library (I copied it into `test` directory).

An official documentation is [here](http://shunit2.googlecode.com/svn/trunk/source/2.1/doc/shunit2.html). Refer it to know how to use shUnit2 more.

## TODO

* Write Tests for Example 2, 3 and 4

## References

* [shUnit2 を使ってシェルスクリプトのユニットテストをやってみた - ablog](http://d.hatena.ne.jp/yohei-a/20100202/1265094899)

## License

[MIT](http://opensource.org/licenses/MIT)

Copyright &copy; 2014 ka
