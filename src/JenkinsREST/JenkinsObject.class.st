Class {
	#name : 'JenkinsObject',
	#superclass : 'Object',
	#instVars : [
		'connection',
		'entity'
	],
	#category : 'JenkinsREST',
	#package : 'JenkinsREST'
}

{ #category : 'as yet unclassified' }
JenkinsObject class >> withConnection: aConnection [

	^ self new
		connection: aConnection;
		yourself
]

{ #category : 'navigating' }
JenkinsObject >> connection [ 
	
	^ connection
]

{ #category : 'accessing' }
JenkinsObject >> connection: aJenkinsConnection [ 
	connection := aJenkinsConnection
]

{ #category : 'accessing' }
JenkinsObject >> entity [
	^ entity ifNil: [ self resolve ]
]

{ #category : 'navigating' }
JenkinsObject >> resolve [

	^ entity := NeoJSONReader
		fromString: (self connection client get: self url , '/api/json') contents
]

{ #category : 'accessing' }
JenkinsObject >> url [
	^ self subclassResponsibility
]
