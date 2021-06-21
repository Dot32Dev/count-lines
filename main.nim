#? replace(sub = "\t", by = " ")
import os
import strutils 

const printLength = 35
# echo currentSourcePath.parentDir()
# echo getCurrentDir()

if getCurrentDir() & "/" == getHomeDir():
	echo "\e[31m" & "\nCannot run this program from home directory, aborting\n" & "\e[0m"
	echo "Executing this program from your home directory will have it scan your entire system."
	echo "If you did not intend to execute it from your home folder, you may be using MacOS, in which case it is incorectly setting the working directory."
	echo "To fix this, you should run the executable with a terminal, as it does not have the same problem."
	quit(1)

var totalLines = 0 

echo "Counting lines from " & replace(getCurrentDir(), parentDir(getCurrentDir()) & "/", "") & ":"

for file in walkDirRec getCurrentDir():
	let fileSplit = splitFile(file)
	let localDir = replace(fileSplit.dir, getCurrentDir(), "") & "/"
	var lineCount = 0

	var str = localDir & fileSplit.name & fileSplit.ext
	str.delete(0, 0)

	if fileSplit.ext != "" and not contains(fileSplit.dir, '.') and fileSplit.ext == ".lua":
		var i = 1
		for line in lines str:
			inc(i)
		lineCount = i
	else:
		continue

	let distance = printLength - str.len
	# echo str & " ... " & $lineCount
	stdout.write "\n" & str & " "
	for i in 1..distance:
		stdout.write "."
	stdout.write " " & $lineCount #& "\n"

	totalLines = totalLines + lineCount

let distance = printLength - "total".len
stdout.write "\n" & "total" & " "
for i in 1..distance:
	stdout.write "."
stdout.write " " & $totalLines & "\n"
echo ""