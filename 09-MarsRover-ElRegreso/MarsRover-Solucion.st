!classDefinition: #TestMarsRover category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #TestMarsRoverTracking category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRoverTracking
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'JS 7/21/2021 23:05:54'!
test01

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow trackingPositionOf: marsRover.
	
	marsRover processCommands: 'f'.
	self assert: '<0,1>' equals: window position.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'JS 7/21/2021 23:06:33'!
test02

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow trackingPositionOf: marsRover.
	
	marsRover processCommands: 'ff'.
	self assert: '<0,2>' equals: window position.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'JS 7/21/2021 23:10:06'!
test03

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow trackingHeadOf: marsRover.
	
	marsRover processCommands: 'l'.
	self assert: 'Oeste' equals: window heading.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'JS 7/21/2021 23:10:12'!
test04

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow trackingHeadOf: marsRover.
	
	marsRover processCommands: 'll'.
	self assert: 'Sur' equals: window heading.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 18:39:04'!
test05

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog trackingPositionOf: marsRover.
	
	self assert: 0 equals: log size.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 18:50:01'!
test06

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog trackingPositionOf: marsRover.
	marsRover processCommands: 'f'.
	self assert: 1 equals: log size. 
	self assert: '0@1' equals: log first.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 20:26:06'!
test07

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog trackingHeadOf: marsRover.
	self assert: 0 equals: log size. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 21:50:46'!
test08

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog trackingHeadOf: marsRover.
	marsRover processCommands: 'l'.
	self assert: 1 equals: log size.
	self assert: 'West' equals: log first. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 21:52:59'!
test09

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog trackingPositionAndHeadOf: marsRover.
	marsRover processCommands: 'fl'.
	self assert: '0@1' equals: log first. 
	self assert: 'West' equals: log second. 
! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 22:12:04'!
test10

	| log window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog trackingPositionOf: marsRover.
	window := MarsRoverWindow trackingPositionOf: marsRover.
	marsRover processCommands: 'f'.
	self assert:  '0@1' equals: log first. 
	self assert: '<0,1>' equals: window position. ! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'initialization' stamp: 'LT 7/21/2021 22:31:24'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := ObservablePosition from: aPosition.
	head := ObservableMarsRoverHead of: self from: aCardinalPoint.
	! !


!MarsRover methodsFor: 'process commands' stamp: 'LT 7/16/2021 18:40:50'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'LT 7/21/2021 21:33:12'!
isAt: aPosition heading: aCardinalPoint
	^true.
	"^ position = aPosition and: [ head isHeading: aCardinalPoint ]"! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 19:48:47'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/21/2021 21:40:12'!
moveBy: aPoint

	position moveBy: aPoint! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/21/2021 18:26:26'!
moveDown
	position moveBy:  (0@-1).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/21/2021 18:26:31'!
moveLeft

	position moveBy:  (-1@0).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/21/2021 18:26:35'!
moveRight

	position moveBy:  (1@0).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/21/2021 18:26:39'!
moveUp

	position moveBy:  (0@1).! !


!MarsRover methodsFor: 'tracking' stamp: 'LT 7/21/2021 20:34:38'!
addHeadObserver: anObserver

	head addObserver: anObserver.! !

!MarsRover methodsFor: 'tracking' stamp: 'LT 7/21/2021 18:30:53'!
addPositionObserver: anObserver

	position addObserver: anObserver.! !

!MarsRover methodsFor: 'tracking' stamp: 'LT 7/21/2021 17:44:59'!
heading

	^head ! !

!MarsRover methodsFor: 'tracking' stamp: 'LT 7/16/2021 17:43:25'!
position

	^position ! !


!MarsRover methodsFor: 'dd - heading' stamp: 'JS 7/21/2021 23:19:35'!
headEast
	head heading: (MarsRoverHeadFacingEast of: self).
	! !

!MarsRover methodsFor: 'dd - heading' stamp: 'JS 7/21/2021 23:19:39'!
headNorth
	head heading: (MarsRoverHeadFacingNorth of: self).
! !

!MarsRover methodsFor: 'dd - heading' stamp: 'JS 7/21/2021 23:19:43'!
headSouth
	head heading: (MarsRoverHeadFacingSouth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'JS 7/21/2021 23:19:48'!
headWest

	head heading: (MarsRoverHeadFacingWest of: self).
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Solucion'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LT 7/19/2021 21:37:02'!
cardinalPoint: anObserver

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 21:45:29'!
formatForTracker: aTracker

	self subclassResponsibility ! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 21:45:05'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-Solucion'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LT 7/19/2021 21:37:42'!
cardinalPoint: anObserver

	^anObserver cardinalPointOfEast.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 21:50:08'!
formatForTracker: aTracker

	^aTracker formatForHeadFacingEast.! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LT 7/19/2021 21:36:49'!
rotateRight

	^marsRover headSouth.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 21:50:11'!
formatForTracker: aTracker

	^aTracker formatForHeadFacingNorth.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 21:50:17'!
formatForTracker: aTracker

	^aTracker formatForHeadFacingSouth.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 21:50:21'!
formatForTracker: aTracker

	^aTracker formatForHeadFacingWest.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverObserver category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverObserver
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverObserver methodsFor: 'as yet unclassified' stamp: 'LT 7/19/2021 21:24:21'!
update

	self subclassResponsibility ! !


!classDefinition: #MarsRoverLog category: 'MarsRover-Solucion'!
MarsRoverObserver subclass: #MarsRoverLog
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLog methodsFor: 'initialization' stamp: 'JS 7/21/2021 22:58:24'!
initialize 
	log := OrderedCollection new.! !

!MarsRoverLog methodsFor: 'initialization' stamp: 'JS 7/21/2021 22:58:24'!
initializeTrackingHeadOf: aMarsRover 
	aMarsRover addHeadObserver: self.
	self initialize! !

!MarsRoverLog methodsFor: 'initialization' stamp: 'JS 7/21/2021 22:58:24'!
initializeTrackingPositionAndHeadOf: aMarsRover 
	aMarsRover addPositionObserver: self.
	aMarsRover addHeadObserver: self.
	self initialize! !

!MarsRoverLog methodsFor: 'initialization' stamp: 'JS 7/21/2021 22:58:24'!
initializeTrackingPositionOf: aMarsRover 
	aMarsRover addPositionObserver: self.
	self initialize! !


!MarsRoverLog methodsFor: 'logging' stamp: 'JS 7/21/2021 23:29:13'!
updateHead: aHead
	log add: (aHead formatForTracker: self).
	
	! !

!MarsRoverLog methodsFor: 'logging' stamp: 'LT 7/21/2021 22:26:05'!
updatePosition: aPosition
	log add: aPosition asString.
	
	! !


!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 21:04:04'!
first
	^log first! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 22:05:01'!
formatForHeadFacingEast

	^'East'! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 22:05:05'!
formatForHeadFacingNorth

	^'North'! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 22:05:10'!
formatForHeadFacingSouth

	^'South'! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 22:05:13'!
formatForHeadFacingWest

	^'West'! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 21:53:11'!
second
	^log second! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 21:03:46'!
size
	^log size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverLog class' category: 'MarsRover-Solucion'!
MarsRoverLog class
	instanceVariableNames: ''!

!MarsRoverLog class methodsFor: 'instance creation' stamp: 'LT 7/21/2021 22:06:05'!
trackingHeadOf: aMarsRover 
	^self new initializeTrackingHeadOf: aMarsRover ! !

!MarsRoverLog class methodsFor: 'instance creation' stamp: 'LT 7/21/2021 22:06:09'!
trackingPositionAndHeadOf: aMarsRover 
	^self new initializeTrackingPositionAndHeadOf: aMarsRover ! !

!MarsRoverLog class methodsFor: 'instance creation' stamp: 'LT 7/21/2021 22:06:13'!
trackingPositionOf: aMarsRover 
	^self new initializeTrackingPositionOf: aMarsRover ! !


!classDefinition: #MarsRoverWindow category: 'MarsRover-Solucion'!
MarsRoverObserver subclass: #MarsRoverWindow
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverWindow methodsFor: 'initialization' stamp: 'JS 7/21/2021 22:58:24'!
initialize 
	position := nil.
	heading := nil.! !

!MarsRoverWindow methodsFor: 'initialization' stamp: 'JS 7/21/2021 23:02:54'!
initializeTrackingHeadOf: aMarsRover 
	aMarsRover addHeadObserver: self.
	self initialize! !

!MarsRoverWindow methodsFor: 'initialization' stamp: 'JS 7/21/2021 23:03:13'!
initializeTrackingPositionAndHeadOf: aMarsRover 
	aMarsRover addPositionObserver: self.
	aMarsRover addHeadObserver: self.
	self initialize! !

!MarsRoverWindow methodsFor: 'initialization' stamp: 'JS 7/21/2021 22:58:24'!
initializeTrackingPositionOf: aMarsRover 
	aMarsRover addPositionObserver: self.
	self initialize! !


!MarsRoverWindow methodsFor: 'reporting' stamp: 'LT 7/16/2021 19:27:38'!
reportHeading: aHeading
	heading := aHeading.
	
	
	! !

!MarsRoverWindow methodsFor: 'reporting' stamp: 'LT 7/16/2021 19:27:50'!
reportPosition: aPosition
	position := aPosition.
	
	! !

!MarsRoverWindow methodsFor: 'reporting' stamp: 'LT 7/19/2021 21:24:21'!
update
	self reportPosition: marsRover position.
	self reportHeading: marsRover heading.
	
	! !


!MarsRoverWindow methodsFor: 'accessing' stamp: 'LT 7/21/2021 22:42:30'!
formatForHeadFacingEast

	^'Este'! !

!MarsRoverWindow methodsFor: 'accessing' stamp: 'LT 7/21/2021 22:42:43'!
formatForHeadFacingNorth

	^'Norte'! !

!MarsRoverWindow methodsFor: 'accessing' stamp: 'LT 7/21/2021 22:43:04'!
formatForHeadFacingSouth

	^'Sur'! !

!MarsRoverWindow methodsFor: 'accessing' stamp: 'LT 7/21/2021 22:43:15'!
formatForHeadFacingWest

	^'Oeste'! !

!MarsRoverWindow methodsFor: 'accessing' stamp: 'LT 7/21/2021 22:41:33'!
heading
	
	^heading ! !

!MarsRoverWindow methodsFor: 'accessing' stamp: 'LT 7/21/2021 22:41:19'!
position
	
	^position ! !

!MarsRoverWindow methodsFor: 'accessing' stamp: 'JS 7/21/2021 23:26:41'!
updateHead: aHead
	heading := aHead formatForTracker: self.
	Transcript log: 'aaaa'
	! !

!MarsRoverWindow methodsFor: 'accessing' stamp: 'JS 7/21/2021 23:28:17'!
updatePosition: aPosition
	position := '<', aPosition x asString, ',', aPosition y asString, '>'.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverWindow class' category: 'MarsRover-Solucion'!
MarsRoverWindow class
	instanceVariableNames: ''!

!MarsRoverWindow class methodsFor: 'instance creation' stamp: 'JS 7/21/2021 23:31:43'!
trackingHeadOf: aMarsRover 
	^self new initializeTrackingHeadOf: aMarsRover ! !

!MarsRoverWindow class methodsFor: 'instance creation' stamp: 'JS 7/21/2021 23:05:33'!
trackingPositionAndHeadOf: aMarsRover 
	^self new initializeTrackingPositionAndHeadOf: aMarsRover ! !

!MarsRoverWindow class methodsFor: 'instance creation' stamp: 'LT 7/21/2021 22:37:01'!
trackingPositionOf: aMarsRover 
	^self new initializeTrackingPositionOf: aMarsRover ! !


!classDefinition: #ObservableMarsRoverHead category: 'MarsRover-Solucion'!
Object subclass: #ObservableMarsRoverHead
	instanceVariableNames: 'heading observers headTurns head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!ObservableMarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 20:40:42'!
addObserver: anObserver

	observers add: anObserver! !

!ObservableMarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 22:33:48'!
doesNotUnderstand: aMessage

	^aMessage sendTo: head.! !

!ObservableMarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 21:43:45'!
heading: aHead

	head := aHead.
	self notify.

	! !

!ObservableMarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 20:40:19'!
initializeOf: aMarsRover from: aCardinalPoint

	head := MarsRoverHead of: aMarsRover facing: aCardinalPoint.
	observers := OrderedCollection new.! !

!ObservableMarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 22:07:37'!
notify
	
	observers do: [:observer | observer updateHead: head]. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ObservableMarsRoverHead class' category: 'MarsRover-Solucion'!
ObservableMarsRoverHead class
	instanceVariableNames: ''!

!ObservableMarsRoverHead class methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 20:38:57'!
of: aMarsRover from: aCardinalPoint

	^self new initializeOf: aMarsRover from: aCardinalPoint.
	


	! !


!classDefinition: #ObservablePosition category: 'MarsRover-Solucion'!
Object subclass: #ObservablePosition
	instanceVariableNames: 'position observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!ObservablePosition methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 18:31:13'!
addObserver: anObserver

	observers add: anObserver! !

!ObservablePosition methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 18:24:50'!
initializeFrom: aPosition

	position := aPosition.
	observers := OrderedCollection new.! !

!ObservablePosition methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 18:27:34'!
moveBy: aPoint
	position := position + aPoint.
	self notify.! !

!ObservablePosition methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 22:03:23'!
notify
	
	observers do: [:observer | observer updatePosition: position].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ObservablePosition class' category: 'MarsRover-Solucion'!
ObservablePosition class
	instanceVariableNames: ''!

!ObservablePosition class methodsFor: 'as yet unclassified' stamp: 'LT 7/21/2021 18:25:14'!
from: aPosition

	^self new initializeFrom: aPosition! !
