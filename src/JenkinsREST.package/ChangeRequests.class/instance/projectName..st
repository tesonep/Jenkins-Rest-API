accessing
projectName: anObject
	projectName := anObject.
	url := self class defaultJenkins , 'job/' , projectName , '/view/change-requests'