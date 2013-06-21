# Semi-automatic Text Editor

## Installation

**write later**

## Usage

```sh
semi-automatic-text-editor FILE LINE_INDICATOR INSERT_TEXT
```

`INSERT_TEXT` will be inserted at the line that `LINE_INDICATOR` exists in `FILE`.

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

## TODO

* Write Tests

## License

[MIT](http://opensource.org/licenses/MIT)
