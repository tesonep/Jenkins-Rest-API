baselines
baseline: spec
	<baseline>
	
	spec for: #common do: [

		spec 
			baseline: 'NeoJSON' 
			with: [ 
				spec
					repository: 'github://svenvc/NeoJSON';
	  				loads: 'default' ].

		spec 
			baseline: 'GithubAPI' 
			with: [ 
				spec
					repository: 'github://tesonep/github-api';
	  				loads: 'default' ].

		spec
			package: 'JenkinsREST' with: [ spec requires: #('NeoJSON' 'GithubAPI') ] ]