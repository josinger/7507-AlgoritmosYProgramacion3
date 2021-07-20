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

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 19:29:32'!
test01

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow tracking: marsRover.
	
	marsRover processCommands: 'f'.
	self assert: 0@1 equals: window position.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 19:29:38'!
test02

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow tracking: marsRover.
	
	marsRover processCommands: 'ff'.
	self assert: 0@2 equals: window position.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 19:30:02'!
test03

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow tracking: marsRover.
	
	marsRover processCommands: 'l'.
	self assert: #West equals: window heading.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 19:29:52'!
test04

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow tracking: marsRover.
	
	marsRover processCommands: 'll'.
	self assert: #South equals: window heading.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 18:19:01'!
test05

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog tracking: marsRover.
	
	self assert: #() asOrderedCollection equals: log printPositions. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 18:18:37'!
test06

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog tracking: marsRover.
	marsRover processCommands: 'f'.
	self assert: {0@1} asOrderedCollection equals: log printPositions. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 18:20:44'!
test07

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog tracking: marsRover.
	self assert: #() asOrderedCollection equals: log printHeading. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 18:21:08'!
test08

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog tracking: marsRover.
	marsRover processCommands: 'l'.
	self assert: #(#West) asOrderedCollection equals: log printHeading. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 18:34:45'!
test09

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog tracking: marsRover.
	marsRover processCommands: 'f'.
	self assert: {0@1} asOrderedCollection equals: log printPositions. 
	self assert: #() asOrderedCollection equals: log printHeading. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 19:36:20'!
test10

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog tracking: marsRover.
	self assert: #() asOrderedCollection equals: log printPositionsAndHeadings. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 19:39:56'!
test11

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog tracking: marsRover.
	marsRover processCommands: 'flf'.
	self assert: {0@1. #West. -1@1} asOrderedCollection equals: log printPositionsAndHeadings. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 19:50:03'!
test12

	| log window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog tracking: marsRover.
	window := MarsRoverWindow tracking: marsRover.
	marsRover processCommands: 'f'.
	self assert: {0@1} asOrderedCollection equals: log printPositions. 
	self assert: 0@1 equals: window position. ! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'initialization' stamp: 'LT 7/19/2021 21:28:28'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	observers := OrderedCollection new.
	! !


!MarsRover methodsFor: 'process commands' stamp: 'LT 7/16/2021 18:40:50'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'LL 6/30/2021 19:47:14'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ]! !


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


!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/19/2021 21:29:46'!
moveBy: aPoint

	position := position + aPoint.
	self notify.! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/19/2021 19:57:14'!
moveDown
	self moveBy:  (0@-1).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/19/2021 19:57:26'!
moveLeft

	self moveBy:  (-1@0).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/19/2021 19:57:36'!
moveRight

	self moveBy:  (1@0).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/19/2021 19:57:43'!
moveUp

	self moveBy:  (0@1).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/19/2021 21:28:57'!
notify
	observers do: [:observer | observer update].! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/19/2021 21:29:19'!
reportPosition
	observers do: [:observer | observer reportPosition: position].! !


!MarsRover methodsFor: 'tracking' stamp: 'LT 7/19/2021 21:28:47'!
beTrackedBy: anObserver

	observers add: anObserver.! !

!MarsRover methodsFor: 'tracking' stamp: 'LT 7/16/2021 17:46:49'!
heading

	^head direction ! !

!MarsRover methodsFor: 'tracking' stamp: 'LT 7/16/2021 17:43:25'!
position

	^position ! !


!MarsRover methodsFor: 'dd - heading' stamp: 'LT 7/19/2021 21:32:17'!
headEast

	self heading: (MarsRoverHeadFacingEast of: self).
	! !

!MarsRover methodsFor: 'dd - heading' stamp: 'LT 7/19/2021 21:33:38'!
headNorth

	self heading: (MarsRoverHeadFacingNorth of: self).
! !

!MarsRover methodsFor: 'dd - heading' stamp: 'LT 7/19/2021 21:33:51'!
headSouth

	self heading: (MarsRoverHeadFacingSouth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'LT 7/19/2021 21:34:07'!
headWest

	self heading: (MarsRoverHeadFacingWest of: self).
! !

!MarsRover methodsFor: 'dd - heading' stamp: 'LT 7/19/2021 21:33:19'!
heading: aHead

	head := aHead.
	self notify.
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

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LT 7/19/2021 21:36:16'!
cardinalPoint

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LT 7/19/2021 21:37:02'!
cardinalPoint: anObserver

	self subclassResponsibility! !

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

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
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

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 17:48:11'!
direction

	^#East

	! !

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

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 17:48:31'!
direction

	^#North! !

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

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 17:48:37'!
direction

	^#South! !

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

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LT 7/16/2021 17:48:44'!
direction

	^#West! !

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
	instanceVariableNames: 'positions headings positionsAndHeadings'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLog methodsFor: 'initialization' stamp: 'LT 7/16/2021 19:37:01'!
initializeTracking: aMarsRover 
	aMarsRover beTrackedBy: self.
	positions := OrderedCollection new.
	headings := OrderedCollection new.
	positionsAndHeadings := OrderedCollection new.! !


!MarsRoverLog methodsFor: 'logging' stamp: 'LT 7/16/2021 18:22:43'!
printHeading
	^headings! !

!MarsRoverLog methodsFor: 'logging' stamp: 'LT 7/16/2021 18:10:51'!
printPositions
	^positions ! !

!MarsRoverLog methodsFor: 'logging' stamp: 'LT 7/16/2021 19:36:47'!
printPositionsAndHeadings
	^positionsAndHeadings.! !

!MarsRoverLog methodsFor: 'logging' stamp: 'LT 7/19/2021 21:36:07'!
reportHeading: aHead
	| cardinalPoint |
	cardinalPoint := aHead cardinalPoint.
	headings add: cardinalPoint.
	positionsAndHeadings add: cardinalPoint.

	
	! !

!MarsRoverLog methodsFor: 'logging' stamp: 'LT 7/16/2021 19:37:32'!
reportPosition: aPosition
	positions add: aPosition.
	positionsAndHeadings add: aPosition.
	
	! !

!MarsRoverLog methodsFor: 'logging' stamp: 'LT 7/19/2021 21:24:21'!
update
	(marsRover position  ~= positions last) ifTrue: [
		self reportPosition: marsRover position.
	].

	(marsRover heading  ~= headings last) ifTrue: [
		self reportHeading: marsRover heading.
	]
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverLog class' category: 'MarsRover-Solucion'!
MarsRoverLog class
	instanceVariableNames: ''!

!MarsRoverLog class methodsFor: 'instance creation' stamp: 'LT 7/16/2021 18:09:43'!
tracking: aMarsRover 
	^self new initializeTracking: aMarsRover ! !


!classDefinition: #MarsRoverWindow category: 'MarsRover-Solucion'!
MarsRoverObserver subclass: #MarsRoverWindow
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverWindow methodsFor: 'initialization' stamp: 'LT 7/16/2021 18:54:44'!
initializeTracking: aMarsRover 
	aMarsRover beTrackedBy: self.! !


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


!MarsRoverWindow methodsFor: 'accessing' stamp: 'LT 7/16/2021 19:27:59'!
heading
	^heading! !

!MarsRoverWindow methodsFor: 'accessing' stamp: 'LT 7/16/2021 19:27:55'!
position
	^position ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverWindow class' category: 'MarsRover-Solucion'!
MarsRoverWindow class
	instanceVariableNames: ''!

!MarsRoverWindow class methodsFor: 'instance creation' stamp: 'LT 7/16/2021 18:09:43'!
tracking: aMarsRover 
	^self new initializeTracking: aMarsRover ! !
