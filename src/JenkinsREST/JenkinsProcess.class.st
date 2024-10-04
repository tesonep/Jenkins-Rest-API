Class {
	#name : 'JenkinsProcess',
	#superclass : 'Object',
	#instVars : [
		'connection'
	],
	#category : 'JenkinsREST',
	#package : 'JenkinsREST'
}

{ #category : 'as yet unclassified' }
JenkinsProcess class >> withConnection: aConnection [

	^ self new
		connection: aConnection;
		yourself
]

{ #category : 'accessing' }
JenkinsProcess >> connection: aConnection [

	connection := aConnection
]

{ #category : 'executing' }
JenkinsProcess >> doExecute [ 
	
	^ self subclassResponsibility 
]

{ #category : 'executing' }
JenkinsProcess >> execute [
	
	self log: 'Starting Process'.
	^ [ self doExecute ]
		ensure: [ self log: 'Process Ended' ]
]

{ #category : 'executing' }
JenkinsProcess >> log: aMessage [

	JenkinsProcessSignal emit: aMessage fromProcess: self.
]

{ #category : 'executing' }
JenkinsProcess >> log: aPattern with: arrayOfValues [
	
	| aDict |
	aDict := (arrayOfValues withIndexCollect: [ :e :i | i -> e ]) asDictionary.
	self log: (aPattern format: aDict )
]

{ #category : 'accessing' }
JenkinsProcess >> name [
	
	^ self subclassResponsibility 
]
