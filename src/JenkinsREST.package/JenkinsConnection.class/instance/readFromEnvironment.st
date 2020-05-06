as yet unclassified
readFromEnvironment

	jenkinsUsername := Smalltalk platform environment at: 'JENKINS_USERNAME'.
	jenkinsToken := Smalltalk platform environment at: 'JENKINS_TOKEN'.
	githubClient := Github new.
	githubClient loginToken: (Smalltalk platform environment at: 'GITHUB_TOKEN').	