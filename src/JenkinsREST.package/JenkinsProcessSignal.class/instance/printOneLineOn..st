printing
printOneLineOn: stream
	stream 
		nextPutAll: self timestamp asString;
		space;
		nextPutAll: process name;
		space.
	self printOneLineContentsOn: stream