## Count lines from .lua files
This terminal program will read the length of any lua files in the given directory (and child directories), echoing it back to you and summing it together in a nice total. Here are how many lines my Isondo project currently fullfills: <br>
<img width="322" alt="Screen Shot 2021-06-21 at 10 54 10 pm" src="https://user-images.githubusercontent.com/61964090/123012218-7696b000-d3f4-11eb-8555-2cbff6a57586.png">

### Building
- Download the nim programming language `brew install nim` (macos brew command)
- Download the source for this project and compile it with `nim c -r main.nim` (c == compile, -r == run, main.nim == target)

### Usage
On macos, simply placing the executable in your target folder and double clicking to execute it *not work;* you must:
- Place it in your target folder
- Locate your taget folder within it's parent directory
- Right click said containing folder and under Services, select "New terminal at folder"
- run `./main`, and it should work as intended! Behold, you source code has had it's length measured.

**I have not tested this application on other operating systems, but there is no reason as to why it wouldn't work as intended** <br>
**This application will not read the length of a file if it is contained within a hidden directory (ei `.git` files)**
