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

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 10:48:57'!
test01UpdatedPositionOnWindowWhenMovingOneStep

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow new.
	marsRover addPositionObserver: window.
	
	marsRover processCommands: 'f'.
	self assert: '<0,1>' equals: window position.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 10:50:07'!
test02UpdatePositionOnWindowWhenMovingMultipleSteps

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow new.
	marsRover addPositionObserver: window.
	
	marsRover processCommands: 'frf'.
	self assert: '<1,1>' equals: window position.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 10:54:59'!
test03UpdatedHeadOnWindowWhenFacingWest

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow new.
	marsRover addHeadObserver: window.
	
	marsRover processCommands: 'l'.
	self assert: 'Oeste' equals: window heading.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 10:55:05'!
test04UpdatedHeadOnWindowWhenFacingSouth

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow new.
	marsRover addHeadObserver: window.
	
	marsRover processCommands: 'll'.
	self assert: 'Sur' equals: window heading.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 10:55:51'!
test05UpdatedHeadOnWindowWhenFacingEast

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow new.
	marsRover addHeadObserver: window.
	
	marsRover processCommands: 'r'.
	self assert: 'Este' equals: window heading.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 10:56:09'!
test06UpdatedHeadOnWindowWhenFacingNorth

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #South.
	window := MarsRoverWindow new.
	marsRover addHeadObserver: window.
	
	marsRover processCommands: 'rr'.
	self assert: 'Norte' equals: window heading.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 10:58:06'!
test07LogIsEmptyWhenMarsRoverDoesNotMove

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog new.
	marsRover addPositionObserver: log.
	
	self assert: 0 equals: log size.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 11:00:44'!
test08LogPositionWhenMovingOneStep

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog new.
	
	marsRover addPositionObserver: log.
	marsRover processCommands: 'f'.
	
	self assert: 1 equals: log size. 
	self assert: '0@1' equals: log first.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 11:01:41'!
test09LogPositionWhenMovingMultipleStep

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog new.
	
	marsRover addPositionObserver: log.
	marsRover processCommands: 'frf'.
	
	self assert: 2 equals: log size. 
	self assert: '0@1' equals: log first.
	self assert: '1@1' equals: log second.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 11:02:42'!
test10LogHeadWhenFacingWest

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog new.
	
	marsRover addHeadObserver: log.
	marsRover processCommands: 'l'.
	
	self assert: 1 equals: log size.
	self assert: 'West' equals: log first. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 11:04:23'!
test11LogHeadWhenFacingSouth

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #West.
	log := MarsRoverLog new.
	
	marsRover addHeadObserver: log.
	marsRover processCommands: 'l'.
	
	self assert: 1 equals: log size.
	self assert: 'South' equals: log first. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 11:04:44'!
test12LogHeadWhenFacingEast

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog new.
	
	marsRover addHeadObserver: log.
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: log size.
	self assert: 'East' equals: log first. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 11:04:58'!
test13LogHeadWhenFacingNorth

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #West.
	log := MarsRoverLog new.
	
	marsRover addHeadObserver: log.
	marsRover processCommands: 'r'.
	
	self assert: 1 equals: log size.
	self assert: 'North' equals: log first. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 11:06:11'!
test14LogHeadsWhenFacingDifferentDirections

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog new.
	
	marsRover addHeadObserver: log.
	marsRover processCommands: 'rr'.
	
	self assert: 2 equals: log size.
	self assert: 'East' equals: log first. 
	self assert: 'South' equals: log second. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 11:09:07'!
test15UpdatePositionAndHeadOnSameWindow

	| window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	window := MarsRoverWindow new.
	
	marsRover addHeadObserver: window.
	marsRover addPositionObserver: window.
	marsRover processCommands: 'frf'.
	
	self assert: '<1,1>' equals: window position.
	self assert: 'Este' equals: window heading.! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 11:10:50'!
test16UpdatePositionAndHeadOnSameLog

	| log marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog new.
	
	marsRover addHeadObserver: log.
	marsRover addPositionObserver: log.
	marsRover processCommands: 'frf'.
	
	self assert: 3 equals: log size.
	self assert: '0@1' equals: log first. 
	self assert: 'East' equals: log second. 
	self assert: '1@1' equals: log third. ! !

!TestMarsRoverTracking methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 11:13:14'!
test17UpdatePositionAndHeadOnLogAndWindow

	| log window marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	log := MarsRoverLog new.
	window := MarsRoverWindow new.
	
	marsRover addHeadObserver: log.
	marsRover addHeadObserver: window.
	marsRover addPositionObserver: log.
	marsRover addPositionObserver: window.
	marsRover processCommands: 'frf'.
	
	self assert: '<1,1>' equals: window position.
	self assert: 'Este' equals: window heading.
	
	self assert: 3 equals: log size.
	self assert: '0@1' equals: log first. 
	self assert: 'East' equals: log second. 
	self assert: '1@1' equals: log third. ! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'initialization' stamp: 'LT 7/22/2021 14:14:32'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := UpdateableObservableProxy for: aPosition onNotifySend: #updatePosition:.
	head := UpdateableObservableProxy for: (MarsRoverHead of: self facing: aCardinalPoint) onNotifySend: #updateHead:.! !


!MarsRover methodsFor: 'process commands' stamp: 'LT 7/16/2021 18:40:50'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'LT 7/22/2021 10:15:11'!
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


!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/22/2021 00:45:14'!
moveBy: aPoint

	position updateWith: position + aPoint.! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/22/2021 00:44:05'!
moveDown
	self moveBy:  (0@-1).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/22/2021 00:44:08'!
moveLeft

	self moveBy:  (-1@0).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/22/2021 00:44:11'!
moveRight

	self moveBy:  (1@0).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'LT 7/22/2021 00:44:14'!
moveUp

	self moveBy:  (0@1).! !


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


!MarsRover methodsFor: 'dd - heading' stamp: 'LT 7/22/2021 00:46:32'!
head: aHead

	head updateWith: aHead.
! !

!MarsRover methodsFor: 'dd - heading' stamp: 'LT 7/22/2021 00:46:32'!
headEast

	self head: (MarsRoverHeadFacingEast of: self).
	! !

!MarsRover methodsFor: 'dd - heading' stamp: 'LT 7/22/2021 00:46:32'!
headNorth

	self head: (MarsRoverHeadFacingNorth of: self).
! !

!MarsRover methodsFor: 'dd - heading' stamp: 'LT 7/22/2021 00:46:32'!
headSouth

	self head: (MarsRoverHeadFacingSouth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'LT 7/22/2021 00:46:32'!
headWest

	self head: (MarsRoverHeadFacingWest of: self).
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

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 01:08:48'!
representationFor: anObject
	"si se usa este método en cualquier objeto, este debe saber responder el mensaje específico de cada cabeza"
	self subclassResponsibility ! !

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

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 01:09:02'!
representationFor: anObject

	^anObject representationForHeadFacingEast.! !

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

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 01:09:12'!
representationFor: anObject

	^anObject representationForHeadFacingNorth.! !

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

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 01:09:20'!
representationFor: anObject

	^anObject representationForHeadFacingSouth.! !

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

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 01:09:30'!
representationFor: anObject

	^anObject representationForHeadFacingWest.! !

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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverObserver methodsFor: 'updating' stamp: 'LT 7/22/2021 10:40:02'!
updateHead: aHead
! !

!MarsRoverObserver methodsFor: 'updating' stamp: 'LT 7/22/2021 10:40:46'!
updatePosition: aHead
! !


!MarsRoverObserver methodsFor: 'DD - MarsRoverHead representation' stamp: 'LT 7/22/2021 11:30:16'!
representationForHeadFacingEast

	self subclassResponsibility! !

!MarsRoverObserver methodsFor: 'DD - MarsRoverHead representation' stamp: 'LT 7/22/2021 11:30:24'!
representationForHeadFacingNorth

	self subclassResponsibility! !

!MarsRoverObserver methodsFor: 'DD - MarsRoverHead representation' stamp: 'LT 7/22/2021 11:30:22'!
representationForHeadFacingSouth

	self subclassResponsibility! !

!MarsRoverObserver methodsFor: 'DD - MarsRoverHead representation' stamp: 'LT 7/22/2021 11:30:19'!
representationForHeadFacingWest

	self subclassResponsibility! !


!classDefinition: #MarsRoverLog category: 'MarsRover-Solucion'!
MarsRoverObserver subclass: #MarsRoverLog
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLog methodsFor: 'initialization' stamp: 'JS 7/21/2021 22:58:24'!
initialize 
	log := OrderedCollection new.! !


!MarsRoverLog methodsFor: 'logs' stamp: 'LT 7/21/2021 21:04:04'!
first
	^log first! !

!MarsRoverLog methodsFor: 'logs' stamp: 'LT 7/21/2021 21:53:11'!
second
	^log second! !

!MarsRoverLog methodsFor: 'logs' stamp: 'LT 7/21/2021 21:03:46'!
size
	^log size! !

!MarsRoverLog methodsFor: 'logs' stamp: 'LT 7/22/2021 11:10:33'!
third
	^log third! !


!MarsRoverLog methodsFor: 'DD - MarsRoverHead representation' stamp: 'LT 7/22/2021 01:05:12'!
representationForHeadFacingEast

	^'East'! !

!MarsRoverLog methodsFor: 'DD - MarsRoverHead representation' stamp: 'LT 7/22/2021 01:04:41'!
representationForHeadFacingNorth

	^'North'! !

!MarsRoverLog methodsFor: 'DD - MarsRoverHead representation' stamp: 'LT 7/22/2021 01:05:34'!
representationForHeadFacingSouth

	^'South'! !

!MarsRoverLog methodsFor: 'DD - MarsRoverHead representation' stamp: 'LT 7/22/2021 01:05:47'!
representationForHeadFacingWest

	^'West'! !


!MarsRoverLog methodsFor: 'updating' stamp: 'LT 7/22/2021 01:04:13'!
updateHead: aHead
	log add: (aHead representationFor: self).
	
	! !

!MarsRoverLog methodsFor: 'updating' stamp: 'LT 7/21/2021 22:26:05'!
updatePosition: aPosition
	log add: aPosition asString.
	
	! !


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


!MarsRoverWindow methodsFor: 'reporting' stamp: 'LT 7/21/2021 22:41:33'!
heading
	
	^heading ! !

!MarsRoverWindow methodsFor: 'reporting' stamp: 'LT 7/21/2021 22:41:19'!
position
	
	^position ! !


!MarsRoverWindow methodsFor: 'updating' stamp: 'LT 7/22/2021 10:40:26'!
updateHead: aHead
	heading := aHead representationFor: self.
	! !

!MarsRoverWindow methodsFor: 'updating' stamp: 'JS 7/21/2021 23:28:17'!
updatePosition: aPosition
	position := '<', aPosition x asString, ',', aPosition y asString, '>'.
	
	! !


!MarsRoverWindow methodsFor: 'DD - MarsRoverHead representation' stamp: 'LT 7/22/2021 01:05:12'!
representationForHeadFacingEast

	^'Este'! !

!MarsRoverWindow methodsFor: 'DD - MarsRoverHead representation' stamp: 'LT 7/22/2021 01:04:41'!
representationForHeadFacingNorth

	^'Norte'! !

!MarsRoverWindow methodsFor: 'DD - MarsRoverHead representation' stamp: 'LT 7/22/2021 01:05:34'!
representationForHeadFacingSouth

	^'Sur'! !

!MarsRoverWindow methodsFor: 'DD - MarsRoverHead representation' stamp: 'LT 7/22/2021 01:05:47'!
representationForHeadFacingWest

	^'Oeste'! !


!classDefinition: #UpdateableObservableProxy category: 'MarsRover-Solucion'!
ProtoObject subclass: #UpdateableObservableProxy
	instanceVariableNames: 'observers proxee notificationSelector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!UpdateableObservableProxy methodsFor: 'initialization' stamp: 'LT 7/22/2021 12:02:23'!
initializeFor: aProxee onNotifySend: aNotificationSelector

	proxee := aProxee.
	notificationSelector := aNotificationSelector.
	observers := Set new.
	! !


!UpdateableObservableProxy methodsFor: 'observing' stamp: 'LT 7/22/2021 00:36:56'!
addObserver: anObserver

	observers add: anObserver! !

!UpdateableObservableProxy methodsFor: 'observing' stamp: 'LT 7/22/2021 00:37:31'!
doesNotUnderstand: aMessage

	^aMessage sendTo: proxee.! !

!UpdateableObservableProxy methodsFor: 'observing' stamp: 'LT 7/22/2021 00:38:59'!
notify
	
	observers do: [:observer | notificationSelector sendTo: observer with: proxee]. ! !

!UpdateableObservableProxy methodsFor: 'observing' stamp: 'LT 7/22/2021 00:40:08'!
updateWith: aProxee

	proxee := aProxee.
	self notify.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UpdateableObservableProxy class' category: 'MarsRover-Solucion'!
UpdateableObservableProxy class
	instanceVariableNames: ''!

!UpdateableObservableProxy class methodsFor: 'as yet unclassified' stamp: 'LT 7/22/2021 11:38:14'!
for: proxee onNotifySend: aNotificationSelector

	^self new initializeFor: proxee onNotifySend: aNotificationSelector.! !
