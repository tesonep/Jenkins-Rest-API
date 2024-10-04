Class {
	#name : 'BranchJobProperty',
	#superclass : 'Object',
	#instVars : [
		'branch'
	],
	#category : 'JenkinsREST',
	#package : 'JenkinsREST'
}

{ #category : 'instance creation' }
BranchJobProperty class >> fromEntry: anEntry [
	^ self new
		branch: ((anEntry at: #branch) at: #_class ifPresent: [:v | (v splitOn: '$') at: 2]);
		yourself
	
]

{ #category : 'accessing' }
BranchJobProperty >> branch: aString [ 
	branch := aString 
]

{ #category : 'testing' }
BranchJobProperty >> isDead [
	^ branch = #Dead
]
