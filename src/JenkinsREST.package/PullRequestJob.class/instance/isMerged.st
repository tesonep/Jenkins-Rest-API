testing
isMerged
	| prGithub json |
	prGithub := self class githubClient getPullRequestFromRepo: self class githubRepo owner: self class githubOwner number: number.
	json := prGithub parseJSON.
	^ json at: #merged