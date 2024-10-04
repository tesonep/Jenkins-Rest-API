Class {
	#name : 'JenkinsDeleteMergedPR',
	#superclass : 'JenkinsProcess',
	#instVars : [
		'jenkinsProjectName'
	],
	#category : 'JenkinsREST',
	#package : 'JenkinsREST'
}

{ #category : 'as yet unclassified' }
JenkinsDeleteMergedPR class >> runForGithubRepo: githubRepo GithubOwner: githubOwner jenkinsProjectName: jenkinsProjectName [

	| conn |
	conn := JenkinsConnection new.
	conn readFromEnvironment.

	conn jenkinsUrl: 'https://ci.inria.fr/pharo-ci-jenkins2/'.
	conn githubRepo: githubRepo.
	conn githubOwner: githubOwner.

	(JenkinsDeleteMergedPR withConnection: conn)
		jenkinsProjectName: jenkinsProjectName;
		execute.
]

{ #category : 'as yet unclassified' }
JenkinsDeleteMergedPR class >> runForImageRepository [

	self
		runForGithubRepo: 'pharo'
		GithubOwner: 'pharo-project'
		jenkinsProjectName: 'Test%20pending%20pull%20request%20and%20branch%20Pipeline'
]

{ #category : 'as yet unclassified' }
JenkinsDeleteMergedPR class >> runForVMRepository [

	self
		runForGithubRepo: 'opensmalltalk-vm'
		GithubOwner: 'pharo-project'
		jenkinsProjectName: 'pharo-vm'
]

{ #category : 'executing' }
JenkinsDeleteMergedPR >> doExecute [

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

]

{ #category : 'accessing' }
JenkinsDeleteMergedPR >> jenkinsProjectName [
	^ jenkinsProjectName
]

{ #category : 'accessing' }
JenkinsDeleteMergedPR >> jenkinsProjectName: anObject [
	jenkinsProjectName := anObject
]

{ #category : 'accessing' }
JenkinsDeleteMergedPR >> name [
	
	^ 'DeleteMergedPR'
]
