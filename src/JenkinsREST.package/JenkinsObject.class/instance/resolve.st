navigating
resolve

	^ entity := NeoJSONReader
		fromString: (self connection client get: self url , '/api/json') contents