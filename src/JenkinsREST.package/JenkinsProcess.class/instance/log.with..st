executing
log: aPattern with: arrayOfValues
	
	| aDict |
	aDict := (arrayOfValues withIndexCollect: [ :e :i | i -> e ]) asDictionary.
	self log: (aPattern format: aDict )