executing
execute
	
	self log: 'Starting Process'.
	^ [ self doExecute ]
		ensure: [ self log: 'Process Ended' ]