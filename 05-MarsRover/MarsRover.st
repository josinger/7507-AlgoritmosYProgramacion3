!classDefinition: #XxxTest category: 'MarsRover'!
TestCase subclass: #XxxTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!XxxTest methodsFor: 'as yet unclassified' stamp: 'JS 6/28/2021 23:18:37'!
test01

	| marsRover |

	marsRover := MarsRover at: 0@0 facing: 'N'.
	marsRover evaluateCommandSequence: ''.
	self assert: 0@0 equals: marsRover position.! !

!XxxTest methodsFor: 'as yet unclassified' stamp: 'JS 6/28/2021 23:24:44'!
test02

	| marsRover |

	marsRover := MarsRover at: 0@0 facing: 'N'.
	marsRover evaluateCommandSequence: 'f'.
	self assert: 0@1 equals: marsRover position.! !

!XxxTest methodsFor: 'as yet unclassified' stamp: 'JS 6/28/2021 23:33:36'!
test03

	| marsRover |

	marsRover := MarsRover at: 0@0 facing: 'N'.
	marsRover evaluateCommandSequence: 'b'.
	self assert: 0@-1 equals: marsRover position.! !

!XxxTest methodsFor: 'as yet unclassified' stamp: 'JS 6/28/2021 23:42:03'!
test04

	| marsRover |

	marsRover := MarsRover at: 0@0 facing: 'N'.
	marsRover evaluateCommandSequence: 'l'.
	self assert: 'O' equals: marsRover direction.! !

!XxxTest methodsFor: 'as yet unclassified' stamp: 'JS 6/28/2021 23:44:47'!
test05

	| marsRover |

	marsRover := MarsRover at: 0@0 facing: 'N'.
	marsRover evaluateCommandSequence: 'r'.
	self assert: 'E' equals: marsRover direction.! !

!XxxTest methodsFor: 'as yet unclassified' stamp: 'JS 6/28/2021 23:50:43'!
test06

	| marsRover |

	marsRover := MarsRover at: 0@0 facing: 'S'.
	marsRover evaluateCommandSequence: 'f'.
	self assert: 0@-1 equals: marsRover position.! !

!XxxTest methodsFor: 'as yet unclassified' stamp: 'JS 6/28/2021 23:57:12'!
test07

	| marsRover |

	marsRover := MarsRover at: 0@0 facing: 'S'.
	marsRover evaluateCommandSequence: 'b'.
	self assert: 0@1 equals: marsRover position.! !

!XxxTest methodsFor: 'as yet unclassified' stamp: 'JS 6/28/2021 23:59:41'!
test08

	| marsRover |

	marsRover := MarsRover at: 0@0 facing: 'S'.
	marsRover evaluateCommandSequence: 'l'.
	self assert: 'E' equals: marsRover direction.! !

!XxxTest methodsFor: 'as yet unclassified' stamp: 'JS 6/29/2021 00:00:22'!
test09

	| marsRover |

	marsRover := MarsRover at: 0@0 facing: 'S'.
	marsRover evaluateCommandSequence: 'r'.
	self assert: 'O' equals: marsRover direction.! !

!XxxTest methodsFor: 'as yet unclassified' stamp: 'JS 6/29/2021 00:31:04'!
test10

	| marsRover |

	marsRover := MarsRover at: 0@0 facing: 'N'.
	marsRover evaluateCommandSequence: 'ff'.
	self assert: 0@2 equals: marsRover position.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'public' stamp: 'JS 6/28/2021 23:42:38'!
direction
	^direction! !

!MarsRover methodsFor: 'public' stamp: 'JS 6/29/2021 00:41:01'!
evaluateCommandSequence: aCommandSequence

	aCommandSequence do: [ :aCommand |
		aCommand = $f ifTrue: [self moveForward].
		aCommand = $b ifTrue: [self moveBackwards].
		aCommand = $l ifTrue: [self rotateLeft].
		aCommand = $r ifTrue: [self rotateRight]]
! !

!MarsRover methodsFor: 'public' stamp: 'JS 6/28/2021 23:29:51'!
position
	^position! !


!MarsRover methodsFor: 'initialization' stamp: 'JS 6/28/2021 23:23:19'!
initializeAt: aPoint facing: aCardinalPoint 
	position := aPoint.
	direction := aCardinalPoint.! !


!MarsRover methodsFor: 'movement' stamp: 'JS 6/29/2021 00:12:34'!
moveBackwards

	self direction = 'N' ifTrue: [
		self moveBy: (0@-1).
	].
	self direction = 'S' ifTrue: [
		self moveBy: (0@1).
	].
	self direction = 'E' ifTrue: [
		self moveBy: (-1@0).
	].
	self direction = 'O' ifTrue: [
		self moveBy: (1@0).
	].! !

!MarsRover methodsFor: 'movement' stamp: 'JS 6/29/2021 00:11:48'!
moveBy: aPoint

	position := position + aPoint.! !

!MarsRover methodsFor: 'movement' stamp: 'JS 6/29/2021 00:10:50'!
moveForward

	self direction = 'N' ifTrue: [
		self moveBy: (0@1).
	].
	self direction = 'S' ifTrue: [
		self moveBy: (0@-1).
	].
	self direction = 'E' ifTrue: [
		self moveBy: (1@0).
	].
	self direction = 'O' ifTrue: [
		self moveBy: (-1@0).
	].! !

!MarsRover methodsFor: 'movement' stamp: 'JS 6/29/2021 00:27:57'!
rotateLeft

	self direction = 'N' ifTrue: [
		self rotateTo: 'O'.
	] ifFalse: [ self direction = 'S' ifTrue: [
		self rotateTo: 'E'.
	] ifFalse: [ self direction = 'E' ifTrue: [
		self rotateTo: 'N'.
	] ifFalse: [ self direction = 'O' ifTrue: [
		self rotateTo: 'S'.
	]]]]! !

!MarsRover methodsFor: 'movement' stamp: 'JS 6/29/2021 00:28:34'!
rotateRight

	self direction = 'N' ifTrue: [
		self rotateTo: 'E'.
	] ifFalse: [ self direction = 'S' ifTrue: [
		self rotateTo: 'O'.
	] ifFalse: [ self direction = 'E' ifTrue: [
		self rotateTo: 'S'.
	] ifFalse: [ self direction = 'O' ifTrue: [
		self rotateTo: 'N'.
	]]]]! !

!MarsRover methodsFor: 'movement' stamp: 'JS 6/29/2021 00:17:34'!
rotateTo: aCardinalPoint

	direction := aCardinalPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'JS 6/28/2021 23:21:14'!
at: aPoint facing: aCardinalPoint 
	^self new initializeAt: aPoint facing: aCardinalPoint ! !
