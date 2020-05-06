executing
doExecute

	| changeRequests mergedPRs|
	changeRequests := (ChangeRequests withConnection: connection)
		projectName: jenkinsProjectName.

	self log: 'Deleting Merged PRs for project: ' , jenkinsProjectName.
	
	self log: '{1} PR found in total' 
		with: { changeRequests pullRequests size printString }.	
	
	mergedPRs := changeRequests pullRequests withIndexSelect: [:e :i | 
		self 
			log: 'Checking {1} ({2}/{3})' 
			with: { e printString. i printString. 
			changeRequests pullRequests size printString }.
		e canBeDeleted ].
	
	self log: '{1} merged PRs to delete.' with: { mergedPRs size printString }.

	mergedPRs withIndexDo: [ :each :index | 
			self 
				log: 'Deleting {1} ({2}/{3})' 
				with: { each printString. index printString. mergedPRs size printString }.
			each delete.
		].
