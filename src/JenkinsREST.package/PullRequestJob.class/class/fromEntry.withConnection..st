instance creation
fromEntry: aDictionary withConnection: aConnection

	^ (self withConnection: aConnection)
		name: (aDictionary at: #name);
		url: (aDictionary at: #url);
		number: (((aDictionary at: #name) splitOn: '-') at: 2) asInteger;
		yourself