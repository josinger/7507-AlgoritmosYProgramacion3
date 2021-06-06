!classDefinition: #InvalidWordError category: 'Stack-Exercise'!
Error subclass: #InvalidWordError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #NullStackError category: 'Stack-Exercise'!
Error subclass: #NullStackError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #NullWordError category: 'Stack-Exercise'!
Error subclass: #NullWordError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StackEmptyError category: 'Stack-Exercise'!
Error subclass: #StackEmptyError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'LT 6/4/2021 19:11:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject pruebi |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	pruebi := stack pop.
	self assert: pruebi = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LT 6/4/2021 20:58:35'!
test01CantFindIfHasNoStack
	| sentenceFinder |
	
	sentenceFinder := SentenceFinderByPrefix new.
	
	self
		should: [ sentenceFinder find: 'test' in: nil]
		raise: NullStackError 
		withExceptionDo: [ :anError |
			self assert: anError messageText =  SentenceFinderByPrefix nullStackErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LT 6/4/2021 21:11:59'!
test02CantFindIfHasEmptyStack
	| sentenceFinder |
	
	sentenceFinder := SentenceFinderByPrefix new.
	
	self
		should: [ sentenceFinder find: 'test' in: OOStack new]
		raise: StackEmptyError 
		withExceptionDo: [ :anError |
			self assert: anError messageText =  OOStack stackEmptyErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LT 6/4/2021 21:19:12'!
test03CantFindIfWordIsNull
	| sentenceFinder stack|
	
	sentenceFinder := SentenceFinderByPrefix new.
	stack := OOStack new.
	stack push: 'test'.
	
	self
		should: [ sentenceFinder find: nil in: stack]
		raise: NullWordError 
		withExceptionDo: [ :anError |
			self assert: anError messageText =  SentenceFinderByPrefix nullWordErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LT 6/4/2021 21:19:54'!
test04CantFindIfWordIsEmpty
	| sentenceFinder stack|
	
	sentenceFinder := SentenceFinderByPrefix new.
	stack := OOStack new.
	stack push: 'test'.
	
	self
		should: [ sentenceFinder find: '' in: stack]
		raise: InvalidWordError
		withExceptionDo: [ :anError |
			self assert: anError messageText =  SentenceFinderByPrefix emptyWordErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'lt 6/6/2021 17:37:44'!
test05CantFindIfPrefixContainsSpaces
	| sentenceFinder stack|
	
	sentenceFinder := SentenceFinderByPrefix new.
	stack := OOStack new.
	stack push: 'test'.
	
	self
		should: [ sentenceFinder find: 'one two' in: stack]
		raise: InvalidWordError
		withExceptionDo: [ :anError |
			self assert: anError messageText =  SentenceFinderByPrefix moreThanOneWordErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'lt 6/6/2021 17:35:35'!
test05DoesNotFindMatchesIfItNoWordContainsThePrefix
	| sentenceFinder stack |
	
	sentenceFinder := SentenceFinderByPrefix new.
	stack := OOStack new.
	stack push: 'test'.
	stack push: 'cucu'.
	stack push: 'pepe'.
	
	self assert: (sentenceFinder find: 'hola' in: stack) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'lt 6/6/2021 17:35:55'!
test06DoesNotFindMatchesIfItNoWordStartsWithThePrefix
	| sentenceFinder stack |
	
	sentenceFinder := SentenceFinderByPrefix new.
	stack := OOStack new.
	stack push: 'testahola'.
	stack push: 'cuaholacu'.
	stack push: 'bholaa'.
	
	self assert: (sentenceFinder find: 'hola' in: stack) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LT 6/4/2021 21:53:43'!
test06FoundAWordWithMatchingPrefix
	| sentenceFinder stack filteredStack|
	
	sentenceFinder := SentenceFinderByPrefix new.
	stack := OOStack new.
	stack push: 'test'.
	
	filteredStack := (sentenceFinder find: 'te' in: stack).
	
	self assert: filteredStack size = 1.
	self assert: filteredStack top = 'test'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'lt 6/6/2021 17:31:51'!
test07FoundManyWordsWithMatchingPrefix
	| sentenceFinder stack filteredStack|
	
	sentenceFinder := SentenceFinderByPrefix new.
	stack := OOStack new.
	stack push: 'test'.
	stack push: 'testardo'.
	
	filteredStack := (sentenceFinder find: 'te' in: stack).
	self assert: filteredStack size = 2.
	self assert: filteredStack pop = 'testardo'.
	self assert: filteredStack top = 'test'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LT 6/4/2021 21:57:18'!
test08OriginalStackRemainsTheSame
	| sentenceFinder stack |
	
	sentenceFinder := SentenceFinderByPrefix new.
	stack := OOStack new.
	stack push: 'test'.
	stack push: 'testardo1'.
	stack push: 'pichulin'.
	stack push: 'testardo4'.
	
	(sentenceFinder find: 'te' in: stack).
	self assert: stack size = 4.
	
	self assert: stack pop = 'testardo4'.
	self assert: stack pop = 'pichulin'.
	self assert: stack pop = 'testardo1'.
	self assert: stack pop = 'test'.
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topObject size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'LT 6/4/2021 20:11:19'!
isEmpty
	^self topObject isNullStackObject.! !


!OOStack methodsFor: 'accessing' stamp: 'LT 6/4/2021 18:55:05'!
size
	^size.! !

!OOStack methodsFor: 'accessing' stamp: 'lt 6/6/2021 17:17:59'!
top
	^self topObject element.! !


!OOStack methodsFor: 'private' stamp: 'LT 6/4/2021 18:51:45'!
decrementSize
	self size: self size - 1.! !

!OOStack methodsFor: 'private' stamp: 'LT 6/4/2021 18:52:50'!
incrementSize
	self size: self size + 1.! !

!OOStack methodsFor: 'private' stamp: 'LT 6/4/2021 18:46:39'!
nextObject
	^self topObject nextObject.! !

!OOStack methodsFor: 'private' stamp: 'LT 6/4/2021 18:52:22'!
size: newSize
	size := newSize! !

!OOStack methodsFor: 'private' stamp: 'LT 6/4/2021 18:27:41'!
topObject
	^topObject ! !

!OOStack methodsFor: 'private' stamp: 'LT 6/4/2021 18:30:02'!
topObject: newStackObject
	topObject := newStackObject.! !


!OOStack methodsFor: 'operations' stamp: 'LT 6/4/2021 18:54:19'!
pop
	| popedElement |
	
	popedElement  := self top.
	self topObject: self nextObject.
	self decrementSize.
	^popedElement 
	! !

!OOStack methodsFor: 'operations' stamp: 'LT 6/4/2021 20:01:44'!
push: anElement 
	| newStackObject |
	newStackObject := FilledStackObject with: anElement linkedTo: self topObject.
	self topObject: newStackObject.
	self incrementSize.
	^anElement.! !


!OOStack methodsFor: 'initialization' stamp: 'LT 6/4/2021 20:05:05'!
initialize
	super initialize.
	self topObject: NullStackObject new.
	self size: 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'lt 6/6/2021 17:47:01'!
find: aWord in: aStack
	| filteredStack auxStack currentElement |
	aStack ifNil: [ NullStackError signal: SentenceFinderByPrefix nullStackErrorDescription ].
	aStack isEmpty ifTrue: [StackEmptyError  signal: OOStack stackEmptyErrorDescription]. "esto podriamos sacarlo"
	
	"para sacarnos estos if de encima podriamos  crear una clase Prefix con subclases NullPrefix, EmptyPrefix, InvalidPrefix"
	"luego, hacer igual que hicimos en el tp de numeros, instanciar la correcta dependiendo de como sea aWord, usando detect:"
	"sin embargo, me parece medio al pepe, algo así como crear la clase 0 o 1. Seria mas un truquito implementativo que algo que demuestre-"
	"-un modelo 1 a 1 con la realidad, con lo cual no me parece que valga la pena hacer eso."
	"Lo que si podríamos hacer es hacer estas validaciones en otro metodo asi queda mas limpio, y tmb hacer mas prolijo la logica"
	
	"nota extra: no me parece mal que reciba el stack por parametro, lo hace mas flexible al objeto SentenceFinder".
	
	aWord ifNil: [ NullWordError signal: SentenceFinderByPrefix nullWordErrorDescription ].
	aWord isEmpty ifTrue: [InvalidWordError signal: SentenceFinderByPrefix emptyWordErrorDescription ].
	(aWord findString: ' ') = 0 ifFalse: [InvalidWordError signal: SentenceFinderByPrefix moreThanOneWordErrorDescription ].
	
	auxStack := OOStack new.
	filteredStack := OOStack new.
	
	(aStack size) timesRepeat: [
			currentElement := aStack pop.
			auxStack push: currentElement.
		].
	
	(auxStack size) timesRepeat: [
			currentElement := auxStack pop.
			(currentElement beginsWith: aWord) ifTrue: [
					filteredStack push: currentElement.
				].
			aStack push: currentElement.
		].
	
	^filteredStack
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'LT 6/4/2021 21:16:05'!
emptyWordErrorDescription
	^ 'Word is empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'LT 6/4/2021 21:17:22'!
moreThanOneWordErrorDescription
	^ 'More than one word was given'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'LT 6/4/2021 20:57:49'!
nullStackErrorDescription
	^ 'Stack is nil'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'LT 6/4/2021 21:11:11'!
nullWordErrorDescription
	^ 'Word is nil'! !


!classDefinition: #StackObject category: 'Stack-Exercise'!
Object subclass: #StackObject
	instanceVariableNames: 'element nextObject'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackObject methodsFor: 'as yet unclassified' stamp: 'LT 6/4/2021 20:08:14'!
element
	self subclassResponsibility ! !

!StackObject methodsFor: 'as yet unclassified' stamp: 'LT 6/4/2021 20:11:29'!
isNullStackObject
	self subclassResponsibility ! !


!classDefinition: #FilledStackObject category: 'Stack-Exercise'!
StackObject subclass: #FilledStackObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledStackObject methodsFor: 'intialization' stamp: 'LT 6/4/2021 19:28:30'!
initializeWith: anElement linkedTo: nextStackObject
	element := anElement.
	nextObject := nextStackObject.! !


!FilledStackObject methodsFor: 'accessing' stamp: 'LT 6/4/2021 19:57:50'!
element
	^element! !

!FilledStackObject methodsFor: 'accessing' stamp: 'LT 6/4/2021 18:28:48'!
nextObject
	^nextObject! !


!FilledStackObject methodsFor: 'as yet unclassified' stamp: 'LT 6/4/2021 20:12:51'!
isNullStackObject
	^false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FilledStackObject class' category: 'Stack-Exercise'!
FilledStackObject class
	instanceVariableNames: ''!

!FilledStackObject class methodsFor: 'instance creation' stamp: 'LT 6/4/2021 18:33:58'!
with: anElement 
	^self new initializeWith: anElement ! !

!FilledStackObject class methodsFor: 'instance creation' stamp: 'LT 6/4/2021 19:27:54'!
with: anElement linkedTo: nextStackObject
	^self new initializeWith: anElement linkedTo: nextStackObject.! !


!classDefinition: #NullStackObject category: 'Stack-Exercise'!
StackObject subclass: #NullStackObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullStackObject methodsFor: 'as yet unclassified' stamp: 'LT 6/4/2021 20:52:50'!
element
	StackEmptyError signal: OOStack stackEmptyErrorDescription.! !

!NullStackObject methodsFor: 'as yet unclassified' stamp: 'LT 6/4/2021 20:11:50'!
isNullStackObject
	^true.! !
