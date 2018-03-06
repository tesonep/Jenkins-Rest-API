scripts
deleteMergedPullRequests
	"self deleteMergedPullRequests"

	| changeRequests mergedPRs |
	JenkinsObject username: 'yourUsername'.
	JenkinsObject token: 'YOUR TOKEN'.

	changeRequests := ChangeRequests new projectName: 'Test%20pending%20pull%20request%20and%20branch%20Pipeline'.

	mergedPRs := changeRequests pullRequests select: #isMerged.
	mergedPRs do: #delete