accessing
entity
	^ entity ifNil: [ self resolve ]