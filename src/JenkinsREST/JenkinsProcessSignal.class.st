Class {
	#name : 'JenkinsProcessSignal',
	#superclass : 'StringSignal',
	#instVars : [
		'process'
	],
	#category : 'JenkinsREST',
	#package : 'JenkinsREST'
}

{ #category : 'as yet unclassified' }
JenkinsProcessSignal class >> emit: aString fromProcess: aProcess [

	^ self new 
		message: aString;
		process: aProcess;
		emit
]

{ #category : 'printing' }
JenkinsProcessSignal >> printOneLineOn: stream [
	stream 
		nextPutAll: self timestamp asString;
		space;
		nextPutAll: process name;
		space.
	self printOneLineContentsOn: stream
]

{ #category : 'accessing' }
JenkinsProcessSignal >> process [
	^ process
]

{ #category : 'accessing' }
JenkinsProcessSignal >> process: anObject [
	process := anObject
]
