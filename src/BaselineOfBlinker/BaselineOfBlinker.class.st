Class {
	#name : #BaselineOfBlinker,
	#superclass : #BaselineOf,
	#category : #BaselineOfBlinker
}

{ #category : #baselines }
BaselineOfBlinker >> baseline: spec [
	"baseline"

	<baseline>
	spec for: #common do: ["Dependencies" self pharothings: spec. "Packages" spec package: 'Blinker' ].
	
]

{ #category : #actions }
BaselineOfBlinker >> pharothings: spec [
	spec
		baseline: 'PharoThings'
		with: [ spec
				loads: #('default');
				repository: 'github://pharo-iot/PharoThings:v0.3.2/src' ]
]
