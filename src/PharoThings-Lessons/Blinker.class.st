"
I represent a blinker object. I toggle on/off an led, connected to GPIO7 on a Raspberry Pi 3B, given a specified number of repeats and delay time.

Here is an example you can run in the Playground:

	|blinker|
	blinker := Blinker new. 
	blinker timesRepeat: 10 waitForSeconds: 1.

Internal Representation and Key Implementation Points.

    Instance Variables
	led:		<PotGPIO>


    Implementation Points
	Blinker example tested to work on PharoThings v0.3.1
"
Class {
	#name : #Blinker,
	#superclass : #Object,
	#instVars : [
		'led'
	],
	#category : #'PharoThings-Lessons'
}

{ #category : #initialization }
Blinker >> initialize [
	led := PotGPIO id: 4.
	led
		board: RpiBoard3B current;
		beDigitalOutput
]

{ #category : #operations }
Blinker >> timesRepeat: anInteger waitForSeconds: aNumber [
	[ anInteger
		timesRepeat: [ led toggleDigitalValue.
			(Delay forSeconds: aNumber) wait ] ] forkNamed: 'BlinkerProcess'
]
