#? replace(sub = "\t", by = " ")
import os
import strutils 

# echo getCurrentDir()

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