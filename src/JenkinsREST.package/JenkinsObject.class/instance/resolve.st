navigating
resolve
	^ entity := NeoJSONReader fromString: (self client get: self url , '/api/json') contents