as yet unclassified
emit: aString fromProcess: aProcess

	^ self new 
		message: aString;
		process: aProcess;
		emit