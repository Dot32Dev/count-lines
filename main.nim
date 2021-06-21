#? replace(sub = "\t", by = " ")
import os
import strutils 

echo currentSourcePath.parentDir()
echo getCurrentDir()

if getCurrentDir() & "/" == getHomeDir():
	echo "\e[31m" & "\nCannot run this program from home directory, aborting\n" & "\e[0m"
	echo "Executing this program from your home directory will have it scan your entire system."
	echo "If you did not intend to execute it from your home folder, you may be using MacOS, in which case it is incorectly setting the working directory."
	echo "To fix this, you should run the executable with a terminal, as it does not have the same problem."
	quit(1)

# assert getCurrentDir() & "/" != getHomeDir()

for file in walkDirRec getCurrentDir():
	let fileSplit = splitFile(file)
	let localDir = replace(fileSplit.dir, getCurrentDir(), "") & "/"
	var lineCount = "N/A"

	var str = localDir & fileSplit.name & fileSplit.ext
	str.delete(0, 0)

	if fileSplit.ext == ".lua":
		var i = 1
		for line in lines str:
			inc(i)
		lineCount = $ i
	echo str & " ... " & lineCount