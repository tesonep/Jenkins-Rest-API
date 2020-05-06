accessing
pullRequests

	^ pullRequests
		ifNil: [ pullRequests := (self entity at: #jobs)
				collect:
					[ :entry | PullRequestJob fromEntry: entry withConnection: connection ] ]