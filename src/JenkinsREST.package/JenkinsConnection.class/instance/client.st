navigating
client
	| client |
	client := ZnClient new.
	
	self jenkinsUsername
		ifNotNil: [ client
				setBasicAuthenticationUsername: self jenkinsUsername
				password: self jenkinsToken ].
	
	^ client