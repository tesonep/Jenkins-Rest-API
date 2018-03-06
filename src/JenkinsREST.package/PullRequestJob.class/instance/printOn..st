printing
printOn: aStream
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		print: name;
		nextPut: $)