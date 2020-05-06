testing
isMerged
	| prGithub json |
	prGithub := self connection githubClient 
		getPullRequestFromRepo: self connection githubRepo 
		owner: self connection githubOwner number: number.
		
	json := prGithub parseJSON.
	^ json at: #merged