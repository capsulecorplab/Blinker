Class {
	#name : #BaselineOfBlinker,
	#superclass : #BaselineOf,
	#category : #BaselineOfBlinker
}

{ #category : #baselines }
BaselineOfBlinker >> baseline: spec [
	"baseline"

	<baseline>
	spec for: #common do: [ "Packages" spec package: 'Blinker' ]
]
