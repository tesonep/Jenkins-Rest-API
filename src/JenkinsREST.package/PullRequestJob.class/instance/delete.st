submorphs-add/remove
delete
	self canBeDeleted ifFalse: [ self error: 'Could not delete not merged PR' ].
	
	self client
	 post: self url , '/doDelete'
	 contents: ''.