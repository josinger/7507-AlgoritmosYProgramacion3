!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'LT 5/15/2021 17:43:53'!
executionOf: action shouldThrow: exceptionType assertingThat: actionOnException
	
	[ action value. self fail ]
		on: exceptionType 
		do: [ actionOnException ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LT 5/15/2021 17:35:57'!
executionTimeOf: action isLessThan: time

	| timeInMiliseconds millisecondsBeforeRunning millisecondsAfterRunning |
	timeInMiliseconds := time convertTo: millisecond.
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	action value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^(millisecondsAfterRunning-millisecondsBeforeRunning) < (timeInMiliseconds)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LT 5/15/2021 17:38:18'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook additionOfCostumer |
	
	customerBook := CustomerBook new.
	additionOfCostumer := [customerBook addCustomerNamed: 'John Lennon'.].
	
	self assert: (self executionTimeOf: additionOfCostumer isLessThan: 50 * millisecond).
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LT 5/15/2021 17:37:48'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| removalOfCustomer customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	removalOfCustomer := [customerBook removeCustomerNamed: paulMcCartney.].
	
	self assert: (self executionTimeOf: removalOfCustomer isLessThan: 100 * millisecond).
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LT 5/15/2021 17:49:46'!
test03CanNotAddACustomerWithEmptyName 

	| addingAnEmptyCustomer additionOfCustomerDenied customerBook |
			
	customerBook := CustomerBook new.
	addingAnEmptyCustomer := [ customerBook addCustomerNamed: ''].
	additionOfCustomerDenied :=  [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].
	
	self executionOf: addingAnEmptyCustomer shouldThrow: Error assertingThat: additionOfCustomerDenied.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LT 5/15/2021 17:43:53'!
test04CanNotRemoveAnInvalidCustomer
	
	| action actionOnException customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	action := [ customerBook removeCustomerNamed: 'Paul McCartney'.].
	actionOnException := [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
	
	self executionOf: action shouldThrow: NotFound assertingThat: actionOnException.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NR 4/3/2019 10:50:25'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NR 4/3/2019 10:50:28'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LT 5/15/2021 17:43:53'!
test07CanNotSuspendAnInvalidCustomer
	
	| action actionOnException customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	action := [ customerBook suspendCustomerNamed: 'Ringo Starr'.].
	actionOnException := [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
	
	self executionOf: action  shouldThrow: CantSuspend  assertingThat: actionOnException.


! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LT 5/15/2021 17:43:53'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| action actionOnException customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	action := [ customerBook suspendCustomerNamed: johnLennon.].
	actionOnException := [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
		
	self executionOf: action  shouldThrow: CantSuspend  assertingThat: actionOnException.
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'LT 5/14/2021 22:17:16'!
removeCustomerNamed: aName 

	active remove: aName ifAbsent: [
		suspended remove: aName ifAbsent: [^ NotFound signal.].
		].
 
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
