as yet unclassified
runForGithubRepo: githubRepo GithubOwner: githubOwner jenkinsProjectName: jenkinsProjectName

	| conn |
	conn := JenkinsConnection new.
	conn readFromEnvironment.

	conn jenkinsUrl: 'https://ci.inria.fr/pharo-ci-jenkins2/'.
	conn githubRepo: githubRepo.
	conn githubOwner: githubOwner.

	(JenkinsDeleteMergedPR withConnection: conn)
		jenkinsProjectName: jenkinsProjectName;
		execute.