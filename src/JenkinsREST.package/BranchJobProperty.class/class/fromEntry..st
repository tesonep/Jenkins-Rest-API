instance creation
fromEntry: anEntry
	^ self new
		branch: ((anEntry at: #branch) at: #_class ifPresent: [:v | (v splitOn: '$') at: 2]);
		yourself
	