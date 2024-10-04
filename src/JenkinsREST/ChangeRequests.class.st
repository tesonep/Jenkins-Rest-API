Class {
	#name : 'ChangeRequests',
	#superclass : 'JenkinsObject',
	#instVars : [
		'projectName',
		'pullRequests'
	],
	#category : 'JenkinsREST',
	#package : 'JenkinsREST'
}

{ #category : 'printing' }
ChangeRequests >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		print: projectName;
		nextPut: $)
]

{ #category : 'accessing' }
ChangeRequests >> projectName [
	^ projectName
]

{ #category : 'accessing' }
ChangeRequests >> projectName: anObject [
	projectName := anObject.

]

{ #category : 'accessing' }
ChangeRequests >> pullRequests [

	^ pullRequests
		ifNil: [ pullRequests := (self entity at: #jobs)
				collect:
					[ :entry | PullRequestJob fromEntry: entry withConnection: connection ] ]
]

{ #category : 'accessing' }
ChangeRequests >> url [ 

	^ self connection jenkinsUrl , 'job/' , projectName , '/view/change-requests'
]
