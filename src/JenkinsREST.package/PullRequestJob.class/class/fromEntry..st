instance creation
fromEntry: aDictionary
	^ self new
		name: (aDictionary at: #name);
		url: (aDictionary at: #url);
		number: (((aDictionary at: #name) splitOn: '-') at: 2) asInteger;
		yourself