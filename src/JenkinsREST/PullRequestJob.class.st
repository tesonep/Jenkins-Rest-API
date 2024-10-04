Class {
	#name : 'PullRequestJob',
	#superclass : 'JenkinsObject',
	#instVars : [
		'name',
		'number',
		'branchProperties',
		'url'
	],
	#category : 'JenkinsREST',
	#package : 'JenkinsREST'
}

{ #category : 'instance creation' }
PullRequestJob class >> fromEntry: aDictionary withConnection: aConnection [

	^ (self withConnection: aConnection)
		name: (aDictionary at: #name);
		url: (aDictionary at: #url);
		number: (((aDictionary at: #name) splitOn: '-') at: 2) asInteger;
		yourself
]

{ #category : 'accessing' }
PullRequestJob >> branchJobProperties [
	^ branchProperties
		ifNil: [ branchProperties := (self entity at: #property)
				select: [ :e | (e at: '_class') = 'org.jenkinsci.plugins.workflow.multibranch.BranchJobProperty' ]
				thenCollect: [ :e | BranchJobProperty fromEntry: e ] ]
]

{ #category : 'testing' }
PullRequestJob >> canBeDeleted [
	^ self isDead or: [ self isMerged ]
]

{ #category : 'submorphs-add/remove' }
PullRequestJob >> delete [
	self canBeDeleted ifFalse: [ self error: 'Could not delete not merged PR' ].
	
	self connection client
	 post: self url , '/doDelete'
	 contents: ''.
]

{ #category : 'testing' }
PullRequestJob >> isDead [
	^ self branchJobProperties anySatisfy: #isDead
]

{ #category : 'testing' }
PullRequestJob >> isMerged [
	| prGithub json |
	prGithub := self connection githubClient 
		getPullRequestFromRepo: self connection githubRepo 
		owner: self connection githubOwner number: number.
		
	json := prGithub parseJSON.
	^ json at: #merged
]

{ #category : 'accessing' }
PullRequestJob >> name: aString [ 
	name := aString
]

{ #category : 'accessing' }
PullRequestJob >> number: anInteger [ 
	number := anInteger 
]

{ #category : 'printing' }
PullRequestJob >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		print: name;
		nextPut: $)
]

{ #category : 'accessing' }
PullRequestJob >> url [
	
	^ url
]

{ #category : 'accessing' }
PullRequestJob >> url: aValue [
	
	url := aValue
]
