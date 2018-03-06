accessing
branchJobProperties
	^ branchProperties
		ifNil: [ branchProperties := (self entity at: #property)
				select: [ :e | (e at: '_class') = 'org.jenkinsci.plugins.workflow.multibranch.BranchJobProperty' ]
				thenCollect: [ :e | BranchJobProperty fromEntry: e ] ]