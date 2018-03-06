navigating
client
	| client |
	client := ZnClient new.
	self class username
		ifNotNil: [ client setBasicAuthenticationUsername: self class username password: self class token ].
	^ client