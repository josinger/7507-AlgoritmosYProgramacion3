!classDefinition: #InvalidStackError category: 'Stack-Exercise'!
Error subclass: #InvalidStackError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #InvalidWordError category: 'Stack-Exercise'!
Error subclass: #InvalidWordError
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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackTest class' category: 'Stack-Exercise'!
OOStackTest class
	instanceVariableNames: ''!

!OOStackTest class methodsFor: 'profiling' stamp: 'JS 6/10/2021 16:28:23'!
timeToOperateAStack: aStack withElements: amountOfElements withSizeAcceses: amountOfSizeAcceses

	^[amountOfElements timesRepeat: [aStack push: nil].
	amountOfSizeAcceses timesRepeat: [aStack size].
	] timeToRun.
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'sentenceFinderByPrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'failures' stamp: 'LT 6/9/2021 23:04:30'!
test01FailsToFindIfStackArgumentIsNotAStack
	
	self
		should: [ sentenceFinderByPrefix find: 'test' in: nil]
		raise: InvalidStackError 
		withExceptionDo: [ :anError |
			self assert: anError messageText =  SentenceFinderByPrefix notAStackErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'failures' stamp: 'JS 6/10/2021 16:22:35'!
test02FailsToFindIfWordArgumentIsNotAWord

	| stack|
	
	stack :=  self newOOStackWithElements: #('test').
	
	self
		should: [ sentenceFinderByPrefix find: nil in: stack]
		raise: InvalidWordError 
		withExceptionDo: [ :anError |
			self assert: anError messageText =  SentenceFinderByPrefix notAWordErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'failures' stamp: 'LT 6/9/2021 23:41:02'!
test03FailsToFindIfNotAllElementsOfStackAreString

	| stack|
	
	stack :=  self newOOStackWithElements: #('test' nil).
	
	self
		should: [ sentenceFinderByPrefix find: 'test' in: stack]
		raise: InvalidStackError 
		withExceptionDo: [ :anError |
			self assert: anError messageText =  SentenceFinderByPrefix notAllElementsOfStackAreStringErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'failures' stamp: 'LT 6/9/2021 23:06:55'!
test04FailsToFindIfPrefixContainsSpaces

	| stack|
	
	stack :=  self newOOStackWithElements: #('test').
	
	self
		should: [ sentenceFinderByPrefix find: 'one two' in: stack]
		raise: InvalidWordError
		withExceptionDo: [ :anError |
			self assert: anError messageText =  SentenceFinderByPrefix moreThanOneWordErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'failures' stamp: 'LT 6/9/2021 23:42:09'!
test05FailsToFindIfWordIsEmpty

	| stack|
	
	stack :=  self newOOStackWithElements: #('test').
	
	self
		should: [ sentenceFinderByPrefix find: '' in: stack]
		raise: InvalidWordError
		withExceptionDo: [ :anError |
			self assert: anError messageText =  SentenceFinderByPrefix emptyWordErrorDescription ]! !


!SentenceFinderByPrefixTest methodsFor: 'functionality' stamp: 'LT 6/9/2021 23:42:44'!
test06DoesNotFindMatchesIfGivenStackIsEmpty

	self assert: (sentenceFinderByPrefix find: 'test' in: OOStack new) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'functionality' stamp: 'LT 6/9/2021 23:42:51'!
test07DoesNotFindMatchesIfItNoWordContainsThePrefix

	| stack |
	
	stack := self newOOStackWithElements: #('test' 'cucu' 'pepe').
	
	self assert: (sentenceFinderByPrefix find: 'hola' in: stack) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'functionality' stamp: 'LT 6/9/2021 23:43:22'!
test08DoesNotFindMatchesIfItNoWordStartsWithThePrefix

	| stack |
	
	stack := self newOOStackWithElements: #('testahola' 'cuaholacu' 'bholaa').
	
	self assert: (sentenceFinderByPrefix find: 'hola' in: stack) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'functionality' stamp: 'LT 6/9/2021 23:43:30'!
test09FindsASentenceWithMatchingPrefix

	| stack filteredStack|
	
	stack := self newOOStackWithElements: #('test').
	filteredStack := (sentenceFinderByPrefix find: 'te' in: stack).
	
	self assert: filteredStack size = 1.
	self assert: filteredStack top = 'test'.! !

!SentenceFinderByPrefixTest methodsFor: 'functionality' stamp: 'LT 6/9/2021 23:43:38'!
test10FindsManySentencesWithMatchingPrefix

	| stack filteredStack|
	
	stack := self newOOStackWithElements: #('test' 'testardo').
	filteredStack := (sentenceFinderByPrefix find: 'te' in: stack).
	
	self assert: filteredStack size = 2.
	self assert: filteredStack pop = 'testardo'.
	self assert: filteredStack top = 'test'.! !

!SentenceFinderByPrefixTest methodsFor: 'functionality' stamp: 'LT 6/9/2021 23:43:44'!
test11OriginalStackRemainsTheSame

	| stack |
	
	stack := self newOOStackWithElements: #('test' 'testardo1' 'pichulin' 'testardo4').
	(sentenceFinderByPrefix find: 'te' in: stack).
	
	self assert: stack size = 4.
	self assert: stack pop = 'testardo4'.
	self assert: stack pop = 'pichulin'.
	self assert: stack pop = 'testardo1'.
	self assert: stack pop = 'test'.
	! !


!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'LT 6/9/2021 23:01:12'!
setUp
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new.! !


!SentenceFinderByPrefixTest methodsFor: 'shared' stamp: 'LT 6/9/2021 23:04:12'!
newOOStackWithElements: aListOfElements
	
	| aStack |
	
	aStack := OOStack new.
	aListOfElements do: [:element | aStack push: element].
	^aStack.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topObject size capacity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'JS 6/7/2021 05:05:07'!
isEmpty

	^self topObject isNullStackObject! !


!OOStack methodsFor: 'accessing' stamp: 'LT 6/10/2021 00:51:13'!
size

	^size! !

!OOStack methodsFor: 'accessing' stamp: 'JS 6/7/2021 05:05:17'!
top

	^self topObject element! !


!OOStack methodsFor: 'private' stamp: 'JS 6/7/2021 05:04:14'!
decrementSize

	self size: self size - 1.! !

!OOStack methodsFor: 'private' stamp: 'JS 6/7/2021 05:04:19'!
incrementSize

	self size: self size + 1.! !

!OOStack methodsFor: 'private' stamp: 'JS 6/7/2021 05:04:43'!
nextObject

	^self topObject nextObject! !

!OOStack methodsFor: 'private' stamp: 'JS 6/7/2021 05:04:38'!
size: newSize

	size := newSize.! !

!OOStack methodsFor: 'private' stamp: 'JS 6/7/2021 05:04:28'!
topObject

	^topObject ! !

!OOStack methodsFor: 'private' stamp: 'JS 6/7/2021 05:04:31'!
topObject: newStackObject

	topObject := newStackObject.! !


!OOStack methodsFor: 'operations' stamp: 'LT 6/7/2021 20:54:47'!
pop

	| poppedElement |
	
	poppedElement  := self top.
	self topObject: self nextObject.
	self decrementSize.
	^poppedElement 
	! !

!OOStack methodsFor: 'operations' stamp: 'JS 6/7/2021 05:05:44'!
push: anElement 

	| newStackObject |
	
	newStackObject := FilledStackObject with: anElement linkedTo: self topObject.
	self topObject: newStackObject.
	self incrementSize.
	
	^anElement! !


!OOStack methodsFor: 'initialization' stamp: 'JS 6/10/2021 16:19:59'!
initialize

	self topObject: NullStackObject new.
	self size: 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackProfiling category: 'Stack-Exercise'!
Object subclass: #OOStackProfiling
	instanceVariableNames: 'topObject capacity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackProfiling methodsFor: 'testing' stamp: 'LT 6/10/2021 00:49:49'!
isEmpty

	^self topObject isNullStackObject! !


!OOStackProfiling methodsFor: 'accessing' stamp: 'LT 6/10/2021 00:49:49'!
size

	^self calculateSize ! !

!OOStackProfiling methodsFor: 'accessing' stamp: 'LT 6/10/2021 00:49:49'!
top

	^self topObject element! !


!OOStackProfiling methodsFor: 'private' stamp: 'LT 6/10/2021 00:50:47'!
calculateSize

	| currentSize currentObject |
	
	currentObject := self topObject.
	currentSize := 0.
	[
		currentObject := currentObject nextObject.
		] whileNotNil: [currentSize := currentSize + 1].
	^currentSize! !

!OOStackProfiling methodsFor: 'private' stamp: 'LT 6/10/2021 00:49:49'!
decrementSize

	self size: self size - 1.! !

!OOStackProfiling methodsFor: 'private' stamp: 'LT 6/10/2021 00:49:49'!
incrementSize

	self size: self size + 1.! !

!OOStackProfiling methodsFor: 'private' stamp: 'LT 6/10/2021 00:49:49'!
nextObject

	^self topObject nextObject! !

!OOStackProfiling methodsFor: 'private' stamp: 'LT 6/10/2021 00:49:49'!
topObject

	^topObject ! !

!OOStackProfiling methodsFor: 'private' stamp: 'LT 6/10/2021 00:49:49'!
topObject: newStackObject

	topObject := newStackObject.! !


!OOStackProfiling methodsFor: 'operations' stamp: 'LT 6/10/2021 00:49:57'!
pop

	| poppedElement |
	
	poppedElement  := self top.
	self topObject: self nextObject.
	^poppedElement 
	! !

!OOStackProfiling methodsFor: 'operations' stamp: 'LT 6/10/2021 00:50:01'!
push: anElement 

	| newStackObject |
	
	newStackObject := FilledStackObject with: anElement linkedTo: self topObject.
	self topObject: newStackObject.
	
	^anElement! !


!OOStackProfiling methodsFor: 'initialization' stamp: 'JS 6/10/2021 16:20:32'!
initialize

	self topObject: NullStackObject new.
	self size: 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackProfiling class' category: 'Stack-Exercise'!
OOStackProfiling class
	instanceVariableNames: ''!

!OOStackProfiling class methodsFor: 'error descriptions' stamp: 'LT 6/10/2021 00:49:49'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'helpers - private' stamp: 'LT 6/7/2021 23:29:43'!
filter: aStack by: filterCondition
	| filteredStack auxStack |
	
	auxStack := OOStack new.
	filteredStack := OOStack new.
	
	self pour: aStack  into: auxStack.
	
	self pour: auxStack into: aStack doForEachElement: [
			:currentElement |
			(filterCondition value: currentElement) ifTrue: [
					filteredStack push: currentElement.
				].
		].
	
	^filteredStack
	
	! !

!SentenceFinderByPrefix methodsFor: 'helpers - private' stamp: 'LT 6/7/2021 23:31:22'!
pour: aStack into: anotherStack
	self pour: aStack into: anotherStack doForEachElement: [:element | nil]. 
	^anotherStack
	! !

!SentenceFinderByPrefix methodsFor: 'helpers - private' stamp: 'LT 6/7/2021 23:25:31'!
pour: aStack into: anotherStack doForEachElement: aBlock
	| currentElement |

	(aStack size) timesRepeat: [
			currentElement := aStack pop.
			aBlock value: currentElement.
			anotherStack push: currentElement.
		].

	^anotherStack
	! !


!SentenceFinderByPrefix methodsFor: 'actions' stamp: 'LT 6/9/2021 23:52:14'!
find: aWord in: aStack
	"para sacarnos los if de las validaciones podriamos  crear una clase Prefix con subclases NullPrefix, EmptyPrefix, InvalidPrefix"
	"luego, hacer igual que hicimos en el tp de numeros, instanciar la correcta dependiendo de como sea aWord, usando detect:"
	"sin embargo,  nos parece rebuscado, algo así como crear la clase 0 o 1. Sería irse por la rama implementativa extremista en vez de focalizarse en"
	"un modelo 1 a 1 con la realidad, con lo cual no nos parece que valga la pena hacer eso."
	
	self throwErrorOnInvalidStack: aStack.
	self throwErrorOnInvalidWord: aWord.
	
	
	^self filter: aStack by: [:element | element beginsWith: aWord].
	
	
	! !


!SentenceFinderByPrefix methodsFor: 'validations - private' stamp: 'JS 6/10/2021 16:27:18'!
allElementsOfStackAreStrings: aStack

	| auxStack elementsAreValid |
	
	elementsAreValid := true. 
	auxStack := OOStack new.
	
	self pour: aStack into: auxStack.
	self pour: auxStack into: aStack doForEachElement: [
		:element | 
		(element isMemberOf: String) ifFalse: [elementsAreValid := false]
		].
	
	^elementsAreValid! !

!SentenceFinderByPrefix methodsFor: 'validations - private' stamp: 'LT 6/9/2021 23:35:09'!
throwErrorOnInvalidStack: aStack

	(aStack isMemberOf: OOStack) ifFalse: [
		^InvalidStackError signal: SentenceFinderByPrefix notAStackErrorDescription].
	
	(self allElementsOfStackAreStrings: aStack) ifFalse: [
		^InvalidStackError signal: SentenceFinderByPrefix notAllElementsOfStackAreStringErrorDescription].! !

!SentenceFinderByPrefix methodsFor: 'validations - private' stamp: 'JS 6/10/2021 16:27:37'!
throwErrorOnInvalidWord: aWord

	(aWord isMemberOf: String) ifFalse: [
		 InvalidWordError signal: SentenceFinderByPrefix notAWordErrorDescription ].
	
	aWord isEmpty ifTrue: [
		InvalidWordError signal: SentenceFinderByPrefix emptyWordErrorDescription ].
	
	(aWord findString: ' ') = 0 ifFalse: [
		InvalidWordError signal: SentenceFinderByPrefix moreThanOneWordErrorDescription ].
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'JS 6/7/2021 05:11:29'!
emptyWordErrorDescription

	^ 'Word is empty'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'JS 6/7/2021 05:11:31'!
moreThanOneWordErrorDescription

	^ 'More than one word was given'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'LT 6/7/2021 20:06:27'!
notAStackErrorDescription

	^ 'Argument is not an OOStack'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'LT 6/7/2021 20:13:14'!
notAWordErrorDescription

	^ 'Argument is not a word'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'LT 6/9/2021 23:31:32'!
notAllElementsOfStackAreStringErrorDescription

	^ 'There is at least one element of the stack which is not a string'! !


!classDefinition: #StackObject category: 'Stack-Exercise'!
Object subclass: #StackObject
	instanceVariableNames: 'element nextObject'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackObject methodsFor: 'accessing' stamp: 'JS 6/10/2021 16:25:12'!
element

	self subclassResponsibility ! !

!StackObject methodsFor: 'accessing' stamp: 'JS 6/10/2021 16:25:16'!
isNullStackObject

	self subclassResponsibility! !

!StackObject methodsFor: 'accessing' stamp: 'LT 6/10/2021 00:44:57'!
nextObject

	^nextObject! !


!classDefinition: #FilledStackObject category: 'Stack-Exercise'!
StackObject subclass: #FilledStackObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledStackObject methodsFor: 'intialization' stamp: 'JS 6/10/2021 16:26:25'!
initializeWith: anElement linkedTo: nextStackObject

	element := anElement.
	nextObject := nextStackObject.! !


!FilledStackObject methodsFor: 'accessing' stamp: 'JS 6/7/2021 05:10:34'!
element

	^element! !

!FilledStackObject methodsFor: 'accessing' stamp: 'JS 6/7/2021 05:07:55'!
isNullStackObject

	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FilledStackObject class' category: 'Stack-Exercise'!
FilledStackObject class
	instanceVariableNames: ''!

!FilledStackObject class methodsFor: 'instance creation' stamp: 'JS 6/7/2021 05:11:54'!
with: anElement linkedTo: nextStackObject

	^self new initializeWith: anElement linkedTo: nextStackObject.! !


!classDefinition: #NullStackObject category: 'Stack-Exercise'!
StackObject subclass: #NullStackObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullStackObject methodsFor: 'initialization' stamp: 'JS 6/10/2021 16:25:33'!
initialize

	element := nil.
	nextObject := nil.! !


!NullStackObject methodsFor: 'accessing' stamp: 'JS 6/7/2021 05:10:54'!
element

	StackEmptyError signal: OOStack stackEmptyErrorDescription.! !

!NullStackObject methodsFor: 'accessing' stamp: 'JS 6/7/2021 05:11:00'!
isNullStackObject

	^true! !
