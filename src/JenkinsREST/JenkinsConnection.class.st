Class {
	#name : 'JenkinsConnection',
	#superclass : 'Object',
	#instVars : [
		'jenkinsUrl',
		'githubClient',
		'githubOwner',
		'githubRepo',
		'jenkinsToken',
		'jenkinsUsername'
	],
	#category : 'JenkinsREST',
	#package : 'JenkinsREST'
}

{ #category : 'navigating' }
JenkinsConnection >> client [
	| client |
	client := ZnClient new.
	
	self jenkinsUsername
		ifNotNil: [ client
				setBasicAuthenticationUsername: self jenkinsUsername
				password: self jenkinsToken ].
	
	^ client
]

{ #category : 'accessing' }
JenkinsConnection >> githubClient [
	^ githubClient
]

{ #category : 'accessing' }
JenkinsConnection >> githubClient: anObject [
	githubClient := anObject
]

{ #category : 'accessing' }
JenkinsConnection >> githubOwner [
	^ githubOwner
]

{ #category : 'accessing' }
JenkinsConnection >> githubOwner: anObject [
	githubOwner := anObject
]

{ #category : 'accessing' }
JenkinsConnection >> githubRepo [
	^ githubRepo
]

{ #category : 'accessing' }
JenkinsConnection >> githubRepo: anObject [
	githubRepo := anObject
]

{ #category : 'accessing' }
JenkinsConnection >> jenkinsToken [
	^ jenkinsToken
]

{ #category : 'accessing' }
JenkinsConnection >> jenkinsToken: anObject [
	jenkinsToken := anObject
]

{ #category : 'accessing' }
JenkinsConnection >> jenkinsUrl [
	^ jenkinsUrl
]

{ #category : 'accessing' }
JenkinsConnection >> jenkinsUrl: anObject [
	jenkinsUrl := anObject
]

{ #category : 'accessing' }
JenkinsConnection >> jenkinsUsername [
	^ jenkinsUsername
]

{ #category : 'accessing' }
JenkinsConnection >> jenkinsUsername: anObject [
	jenkinsUsername := anObject
]

{ #category : 'as yet unclassified' }
JenkinsConnection >> readFromEnvironment [

	jenkinsUsername := Smalltalk platform environment at: 'JENKINS_USERNAME'.
	jenkinsToken := Smalltalk platform environment at: 'JENKINS_TOKEN'.
	githubClient := Github new.
	githubClient loginToken: (Smalltalk platform environment at: 'GITHUB_TOKEN').	
]
