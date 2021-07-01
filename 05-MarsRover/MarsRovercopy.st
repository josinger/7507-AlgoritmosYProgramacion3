!classDefinition: #MarsRoverInvalidCardinalPointError category: 'MarsRover'!
Error subclass: #MarsRoverInvalidCardinalPointError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!


!classDefinition: #MarsRoverInvalidCommandError category: 'MarsRover'!
Error subclass: #MarsRoverInvalidCommandError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!


!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'shared' stamp: 'JS 6/29/2021 20:43:44'!
assertThatAMarsRoverAtOriginFacing: startingCardinalPoint evaluating: aCommandSequence endsAt: endingPoint facing: endingCardinalPoint

	| marsRover |

	marsRover := MarsRover at: 0@0 facing: startingCardinalPoint.
	marsRover evaluateCommandSequence: aCommandSequence.
	self assert: (marsRover isAt: endingPoint facing: endingCardinalPoint).! !


!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 20:45:47'!
test01DoesNotMoveOrRotatewhenNoCommandIsGiven

	self  assertThatAMarsRoverAtOriginFacing: $N 
		evaluating: '' 
		endsAt: 0@0 facing: $N! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 20:46:22'!
test02whenFacingNorthMovigForwardGoesNorth

	self  assertThatAMarsRoverAtOriginFacing: $N 
		evaluating: 'f' 
		endsAt: 0@1 facing: $N! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 20:48:17'!
test03whenFacingNorthMovigBackwardsGoesSouth

	self  assertThatAMarsRoverAtOriginFacing: $N 
		evaluating: 'b' 
		endsAt: 0@-1 facing: $N! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 20:48:55'!
test04whenFacingNorthRotatingLeftPointsWest

	self  assertThatAMarsRoverAtOriginFacing: $N 
		evaluating: 'l' 
		endsAt: 0@0 facing: $O! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 20:49:22'!
test05whenFacingNorthRotatingLeftPointsEast

	self  assertThatAMarsRoverAtOriginFacing: $N 
		evaluating: 'r' 
		endsAt: 0@0 facing: $E! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 20:49:50'!
test06whenFacingSouthMovigForwardGoesSouth

	self  assertThatAMarsRoverAtOriginFacing: $S
		evaluating: 'f' 
		endsAt: 0@-1 facing: $S! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 20:50:18'!
test07whenFacingSouthMovigBackwardsGoesNorth

	self  assertThatAMarsRoverAtOriginFacing: $S
		evaluating: 'b' 
		endsAt: 0@1 facing: $S! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 20:51:22'!
test08whenFacingSouthRotatingLeftPointsEast

	self  assertThatAMarsRoverAtOriginFacing: $S 
		evaluating: 'l' 
		endsAt: 0@0 facing: $E! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 20:55:06'!
test09whenFacingSouthRotatingLeftPointsWest

	self  assertThatAMarsRoverAtOriginFacing: $S 
		evaluating: 'r' 
		endsAt: 0@0 facing: $O! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 21:01:17'!
test10whenFacingEastMovigForwardGoesRight

	self  assertThatAMarsRoverAtOriginFacing: $E
		evaluating: 'f' 
		endsAt: 1@0 facing: $E! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 21:01:45'!
test11whenFacingEastMovigBackwardsGoesLeft

	self  assertThatAMarsRoverAtOriginFacing: $E
		evaluating: 'b' 
		endsAt: -1@0 facing: $E! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 21:02:26'!
test12whenFacingEastRotatingLeftPointsNorth

	self  assertThatAMarsRoverAtOriginFacing: $E
		evaluating: 'l' 
		endsAt: 0@0 facing: $N! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 21:02:47'!
test13whenFacingEastRotatingLeftPointsSouth

	self  assertThatAMarsRoverAtOriginFacing: $E
		evaluating: 'r' 
		endsAt: 0@0 facing: $S! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 21:04:02'!
test14whenFacingWestMovigForwardGoesLeft

	self  assertThatAMarsRoverAtOriginFacing: $O
		evaluating: 'f' 
		endsAt: -1@0 facing: $O! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 21:04:23'!
test15whenFacingWestMovigBackwardsGoesRight

	self  assertThatAMarsRoverAtOriginFacing: $O
		evaluating: 'b' 
		endsAt: 1@0 facing: $O! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 21:04:52'!
test16whenFacingWestRotatingLeftPointsSouth

	self  assertThatAMarsRoverAtOriginFacing: $O
		evaluating: 'l' 
		endsAt: 0@0 facing: $S! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 21:05:05'!
test17whenFacingWestRotatingLeftPointsNorth

	self  assertThatAMarsRoverAtOriginFacing: $O
		evaluating: 'r' 
		endsAt: 0@0 facing: $N! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 6/29/2021 21:08:13'!
test18CanEvaluateMultipleCommands

	self  assertThatAMarsRoverAtOriginFacing: $N
		evaluating: 'ff' 
		endsAt: 0@2 facing: $N! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LT 7/1/2021 13:09:35'!
test19StopsExecutingCommandsWhenAnInvalidCommandKeyIsEvaluated

	| marsRover |

	marsRover := MarsRover at: 0@0 facing: $N.
	
	self  should: [marsRover evaluateCommandSequence: 'fflbpf']
		raise: MarsRoverInvalidCommandError
		withExceptionDo: [:anError | self assert: anError messageText equals: (MarsRoverCommand invalidCommandErrorDescription: $p).
							    self assert: (marsRover isAt: 1@2 facing: $O) ]
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'JS 7/1/2021 01:43:26'!
test20CanNotInstantiateWithInvalidCardinalPoint

	self  should: [MarsRover at: 0@0 facing: $P]
		raise: MarsRoverInvalidCardinalPointError
		withExceptionDo: [:anError | self assert: anError messageText equals: (MarsRoverDirection invalidCardinalPointErrorDescription: $P)]
	! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'command evaluations' stamp: 'JS 6/29/2021 18:43:48'!
evaluateCommandSequence: aCommandSequence

	aCommandSequence do: [ :aCommandKey | (MarsRoverCommand of: aCommandKey) beExecutedBy: self ].! !


!MarsRover methodsFor: 'initialization' stamp: 'LT 6/29/2021 23:14:58'!
initializeAt: aPoint facing: aDirection 

	position := aPoint.
	direction := aDirection.! !


!MarsRover methodsFor: 'movement' stamp: 'LT 6/29/2021 23:10:31'!
moveBackwards

	self moveBy: direction backwards.! !

!MarsRover methodsFor: 'movement' stamp: 'JS 6/29/2021 00:11:48'!
moveBy: aPoint

	position := position + aPoint.! !

!MarsRover methodsFor: 'movement' stamp: 'LT 6/29/2021 23:10:53'!
moveForward

	self moveBy: direction forward.! !

!MarsRover methodsFor: 'movement' stamp: 'LT 6/29/2021 23:11:00'!
rotateLeft

	self rotateTo: direction left.! !

!MarsRover methodsFor: 'movement' stamp: 'LT 6/29/2021 23:11:06'!
rotateRight

	self rotateTo: direction right.! !

!MarsRover methodsFor: 'movement' stamp: 'JS 6/29/2021 00:17:34'!
rotateTo: aCardinalPoint

	direction := aCardinalPoint.! !


!MarsRover methodsFor: 'testing' stamp: 'JS 6/29/2021 20:37:47'!
isAt: aPoint

	^aPoint = position! !

!MarsRover methodsFor: 'testing' stamp: 'JS 7/1/2021 01:39:54'!
isAt: aPoint facing: aCardinalPoint

	^(self isAt: aPoint) and: [self isFacing: aCardinalPoint]! !

!MarsRover methodsFor: 'testing' stamp: 'JS 6/29/2021 21:56:55'!
isFacing: aCardinalPoint

	^(MarsRoverDirection of: aCardinalPoint) = direction! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LT 6/29/2021 23:15:21'!
at: aPoint facing: aCardinalPoint

	^self new initializeAt: aPoint facing: (MarsRoverDirection of: aCardinalPoint) ! !


!classDefinition: #MarsRoverCommand category: 'MarsRover'!
Object subclass: #MarsRoverCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverCommand methodsFor: 'execution' stamp: 'JS 7/1/2021 01:40:02'!
beExecutedBy: aMarsRover

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommand class' category: 'MarsRover'!
MarsRoverCommand class
	instanceVariableNames: ''!

!MarsRoverCommand class methodsFor: 'error descriptions' stamp: 'JS 7/1/2021 01:43:48'!
invalidCommandErrorDescription: aCommand

	^aCommand asString,' is not a valid command'! !


!MarsRoverCommand class methodsFor: 'testing' stamp: 'JS 7/1/2021 01:43:43'!
correspondsTo: aCommandKey

	self subclassResponsibility.! !


!MarsRoverCommand class methodsFor: 'instance creation' stamp: 'JS 7/1/2021 01:44:16'!
of: aCommandKey

	| commandClass |

	commandClass := self subclasses 
				     detect: [ :aSubclass | aSubclass correspondsTo: aCommandKey ] 
				     ifNone: [MarsRoverInvalidCommandError signal: (self invalidCommandErrorDescription: aCommandKey)].
	
	^commandClass new! !


!classDefinition: #MoveBackwards category: 'MarsRover'!
MarsRoverCommand subclass: #MoveBackwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MoveBackwards methodsFor: 'execution' stamp: 'JS 7/1/2021 01:40:07'!
beExecutedBy: aMarsRover

	aMarsRover moveBackwards.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveBackwards class' category: 'MarsRover'!
MoveBackwards class
	instanceVariableNames: ''!

!MoveBackwards class methodsFor: 'testing' stamp: 'JS 6/29/2021 18:37:48'!
correspondsTo: aCommandKey

	^aCommandKey=$b! !


!classDefinition: #MoveForward category: 'MarsRover'!
MarsRoverCommand subclass: #MoveForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MoveForward methodsFor: 'execution' stamp: 'JS 7/1/2021 01:40:10'!
beExecutedBy: aMarsRover

	aMarsRover moveForward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveForward class' category: 'MarsRover'!
MoveForward class
	instanceVariableNames: ''!

!MoveForward class methodsFor: 'testing' stamp: 'JS 6/29/2021 18:37:57'!
correspondsTo: aCommandKey

	^aCommandKey=$f! !


!classDefinition: #RotateLeft category: 'MarsRover'!
MarsRoverCommand subclass: #RotateLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!RotateLeft methodsFor: 'execution' stamp: 'JS 7/1/2021 01:40:16'!
beExecutedBy: aMarsRover

	aMarsRover rotateLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateLeft class' category: 'MarsRover'!
RotateLeft class
	instanceVariableNames: ''!

!RotateLeft class methodsFor: 'testing' stamp: 'JS 6/29/2021 18:38:04'!
correspondsTo: aCommandKey

	^aCommandKey=$l! !


!classDefinition: #RotateRight category: 'MarsRover'!
MarsRoverCommand subclass: #RotateRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!RotateRight methodsFor: 'execution' stamp: 'JS 7/1/2021 01:40:19'!
beExecutedBy: aMarsRover

	aMarsRover rotateRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateRight class' category: 'MarsRover'!
RotateRight class
	instanceVariableNames: ''!

!RotateRight class methodsFor: 'testing' stamp: 'JS 6/29/2021 18:38:09'!
correspondsTo: aCommandKey

	^aCommandKey=$r! !


!classDefinition: #MarsRoverDirection category: 'MarsRover'!
Object subclass: #MarsRoverDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverDirection methodsFor: 'relative directions' stamp: 'JS 7/1/2021 01:40:53'!
left

	self subclassResponsibility.! !

!MarsRoverDirection methodsFor: 'relative directions' stamp: 'JS 7/1/2021 01:40:58'!
right

	self subclassResponsibility.! !


!MarsRoverDirection methodsFor: 'movement directions' stamp: 'JS 6/29/2021 21:24:14'!
backwards

	^(self forward)*(-1)! !

!MarsRoverDirection methodsFor: 'movement directions' stamp: 'JS 7/1/2021 01:41:04'!
forward

	self subclassResponsibility.! !


!MarsRoverDirection methodsFor: 'comparing' stamp: 'JS 7/1/2021 01:41:08'!
= aMarsRoverDirection

	^aMarsRoverDirection isMemberOf: self class

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDirection class' category: 'MarsRover'!
MarsRoverDirection class
	instanceVariableNames: ''!

!MarsRoverDirection class methodsFor: 'instance creation' stamp: 'JS 6/29/2021 21:40:07'!
of: aCardinalPoint

	| directionClass |

	directionClass := self subclasses 
				     detect: [ :aSubclass | aSubclass correspondsTo: aCardinalPoint ] 
				     ifNone: [MarsRoverInvalidCardinalPointError signal: (self invalidCardinalPointErrorDescription: aCardinalPoint)].
	
	^directionClass new! !


!MarsRoverDirection class methodsFor: 'error descriptions' stamp: 'JS 7/1/2021 01:44:57'!
invalidCardinalPointErrorDescription: aCardinalPoint

	^aCardinalPoint asString,' is not a valid cardinal point'! !


!MarsRoverDirection class methodsFor: 'testing' stamp: 'JS 6/29/2021 21:41:43'!
correspondsTo: aCardinalPoint

	self subclassResponsibility.! !


!classDefinition: #EastDirection category: 'MarsRover'!
MarsRoverDirection subclass: #EastDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!EastDirection methodsFor: 'movement directions' stamp: 'JS 6/29/2021 21:46:26'!
forward

	^1@0! !


!EastDirection methodsFor: 'relative directions' stamp: 'JS 6/29/2021 21:49:28'!
left

	^NorthDirection new! !

!EastDirection methodsFor: 'relative directions' stamp: 'JS 6/29/2021 21:51:06'!
right

	^SouthDirection new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EastDirection class' category: 'MarsRover'!
EastDirection class
	instanceVariableNames: ''!

!EastDirection class methodsFor: 'testing' stamp: 'JS 6/29/2021 21:58:30'!
correspondsTo: aCardinalPoint

	^aCardinalPoint = $E! !


!classDefinition: #NorthDirection category: 'MarsRover'!
MarsRoverDirection subclass: #NorthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!NorthDirection methodsFor: 'movement directions' stamp: 'JS 6/29/2021 21:48:15'!
forward

	^0@1! !


!NorthDirection methodsFor: 'relative directions' stamp: 'JS 6/29/2021 21:50:18'!
left

	^WestDirection new! !

!NorthDirection methodsFor: 'relative directions' stamp: 'JS 6/29/2021 21:51:23'!
right

	^EastDirection new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NorthDirection class' category: 'MarsRover'!
NorthDirection class
	instanceVariableNames: ''!

!NorthDirection class methodsFor: 'testing' stamp: 'JS 6/29/2021 21:58:25'!
correspondsTo: aCardinalPoint

	^aCardinalPoint = $N! !


!classDefinition: #SouthDirection category: 'MarsRover'!
MarsRoverDirection subclass: #SouthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!SouthDirection methodsFor: 'movement directions' stamp: 'JS 6/29/2021 21:48:25'!
forward

	^0@-1! !


!SouthDirection methodsFor: 'relative directions' stamp: 'JS 6/29/2021 21:50:27'!
left

	^EastDirection new! !

!SouthDirection methodsFor: 'relative directions' stamp: 'JS 6/29/2021 21:51:37'!
right

	^WestDirection new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SouthDirection class' category: 'MarsRover'!
SouthDirection class
	instanceVariableNames: ''!

!SouthDirection class methodsFor: 'testing' stamp: 'JS 6/29/2021 21:58:36'!
correspondsTo: aCardinalPoint

	^aCardinalPoint = $S! !


!classDefinition: #WestDirection category: 'MarsRover'!
MarsRoverDirection subclass: #WestDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!WestDirection methodsFor: 'movement directions' stamp: 'JS 6/29/2021 21:48:32'!
forward

	^-1@0! !


!WestDirection methodsFor: 'relative directions' stamp: 'JS 6/29/2021 21:50:37'!
left

	^SouthDirection new! !

!WestDirection methodsFor: 'relative directions' stamp: 'JS 6/29/2021 21:51:46'!
right

	^NorthDirection new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WestDirection class' category: 'MarsRover'!
WestDirection class
	instanceVariableNames: ''!

!WestDirection class methodsFor: 'testing' stamp: 'JS 6/29/2021 21:58:41'!
correspondsTo: aCardinalPoint

	^aCardinalPoint = $O! !
