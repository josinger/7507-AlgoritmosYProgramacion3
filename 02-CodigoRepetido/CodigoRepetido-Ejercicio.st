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
	instanceVariableNames: 'johnLennon paulMcCartney ringoStar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'shared' stamp: 'LT 5/17/2021 22:29:12'!
assertThatExecutionOf: action takesLessThan: time
	
	^self assert: (action timeToRun) < (time convertTo: millisecond).
	
! !

!CustomerBookTest methodsFor: 'shared' stamp: 'LT 5/17/2021 23:43:30'!
assertThatExecutionOf: action throws: exceptionType andVerify: verification
	
	[ action value. self fail ]
		on: exceptionType 
		do: verification
! !

!CustomerBookTest methodsFor: 'shared' stamp: 'LT 5/17/2021 23:02:09'!
createCustomerBookWithCustomerNamed: aName

	| customerBook |
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: aName.
	^customerBook.! !

!CustomerBookTest methodsFor: 'shared' stamp: 'LT 5/17/2021 23:04:54'!
createCustomerBookWithSuspendedCustomerNamed: aName

	| customerBook |
	customerBook := self createCustomerBookWithCustomerNamed: aName.
	customerBook suspendCustomerNamed: aName.
	^customerBook.! !

!CustomerBookTest methodsFor: 'shared' stamp: 'JS 5/18/2021 23:44:21'!
isJohnLennonTheOnlyCustomerInside: customerBook

	^[:error | self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: johnLennon )]! !


!CustomerBookTest methodsFor: 'tests' stamp: 'LT 5/17/2021 22:57:44'!
setUp

	johnLennon := 'John Lennon'.
	paulMcCartney := 'Paul McCartney'.
	ringoStar := 'Ringo Star'.
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LT 5/17/2021 22:58:01'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook additionOfCustomer |
	
	customerBook := CustomerBook new.
	additionOfCustomer := [customerBook addCustomerNamed: johnLennon .].
	
	self assertThatExecutionOf: additionOfCustomer takesLessThan: 50 * millisecond.
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LT 5/17/2021 22:58:16'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| removalOfCustomer customerBook |
	
	customerBook := self createCustomerBookWithCustomerNamed: paulMcCartney .
	
	removalOfCustomer := [customerBook removeCustomerNamed: paulMcCartney .].
	
	self assertThatExecutionOf: removalOfCustomer takesLessThan: 100 * millisecond.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LT 5/17/2021 22:42:18'!
test03CanNotAddACustomerWithEmptyName 

	| customerWasNotAdded customerBook additionOfEmptyName |
			
	customerBook := CustomerBook new.
	additionOfEmptyName := [ customerBook addCustomerNamed: ''].
	customerWasNotAdded :=  [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].
	
	self assertThatExecutionOf: additionOfEmptyName throws: Error andVerify: customerWasNotAdded.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JS 5/18/2021 23:44:21'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook removalOfInvalidCustomer customerBookRemainsUnchanged |
	
	customerBook := self createCustomerBookWithCustomerNamed: johnLennon .
	
	removalOfInvalidCustomer := [ customerBook removeCustomerNamed: paulMcCartney .].
	customerBookRemainsUnchanged := self isJohnLennonTheOnlyCustomerInside: customerBook.
	
	self assertThatExecutionOf: removalOfInvalidCustomer throws: NotFound andVerify: customerBookRemainsUnchanged.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LT 5/17/2021 23:22:27'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	"Este test junto con el 06 tienen 3 asserts de las mismas características y se podrían 
	considerar código repetido, pero consideramos que son bastante descriptivos por sí solos
	y que la refactorización necesitaría un mensaje muy extenso en donde se pierde la claridad.
	
	Por ejemplo, pensamos algo como:
	assertThatCustomerBook:hasNumberOfActiveCustomers:andSuspendedCustomers:andTotalCustomers
	
	Una mejora que se le podría hacer es que la cantidad total se calcule con la suma de las otras 2 cantidades.
	Pero, nos parece poco escalable (ie. agregar un nuevo tipo de customer alargaría mucho mas el nombre).
	
	Otra cosa a tener en cuenta es que se podría usar como variable de instancia el customerBook para evitar
	tener que pasarlo como colaborador externo del mensaje."
	
	| customerBook |
	
	customerBook := self createCustomerBookWithSuspendedCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LT 5/17/2021 23:22:43'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	"Este test junto con el 05 tienen 3 asserts de las mismas características y se podrían 
	considerar código repetido, pero consideramos que son bastante descriptivos por sí solos
	y que la refactorización necesitaría un mensaje muy extenso en donde se pierde la claridad.
	
	Por ejemplo, pensamos algo como:
	assertThatCustomerBook:hasNumberOfActiveCustomers:andSuspendedCustomers:andTotalCustomers
	
	Una mejora que se le podría hacer es que la cantidad total se calcule con la suma de las otras 2 cantidades.
	Pero, nos parece poco escalable (ie. agregar un nuevo tipo de customer alargaría mucho mas el nombre).
	
	Otra cosa a tener en cuenta es que se podría usar como variable de instancia el customerBook para evitar
	tener que pasarlo como colaborador externo del mensaje."
	| customerBook |
	
	customerBook := self createCustomerBookWithSuspendedCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney .
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JS 5/18/2021 23:44:21'!
test07CanNotSuspendAnInvalidCustomer
	| customerBook  suspensionOfInexistent customerBookRemainsUnchanged |
			
	customerBook := self createCustomerBookWithCustomerNamed: johnLennon.
	
	suspensionOfInexistent := [ customerBook suspendCustomerNamed: ringoStar.].
	customerBookRemainsUnchanged := self isJohnLennonTheOnlyCustomerInside: customerBook.

	self assertThatExecutionOf: suspensionOfInexistent  throws: CantSuspend  andVerify: customerBookRemainsUnchanged.


! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JS 5/18/2021 23:44:21'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook suspensionOfSuspended customerBookRemainsUnchanged |
			
	customerBook := self createCustomerBookWithSuspendedCustomerNamed: johnLennon.
	
	suspensionOfSuspended := [ customerBook suspendCustomerNamed: johnLennon .].
	customerBookRemainsUnchanged := self isJohnLennonTheOnlyCustomerInside: customerBook.

	self assertThatExecutionOf: suspensionOfSuspended  throws: CantSuspend  andVerify: customerBookRemainsUnchanged.
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


!CustomerBook methodsFor: 'customer management' stamp: 'LT 5/16/2021 14:51:12'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'LT 5/17/2021 21:24:38'!
removeCustomerNamed: aName 

	active remove: aName ifAbsent: [
		suspended remove: aName ifAbsent: [^ NotFound signal.].
		].
	
	^aName.
 
! !

!CustomerBook methodsFor: 'customer management' stamp: 'LT 5/17/2021 23:52:48'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent: [^CantSuspend signal].
	suspended add: aName.
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'LT 5/16/2021 16:44:20'!
numberOfCustomers
	
	^(self numberOfActiveCustomers + self numberOfSuspendedCustomers).! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'LT 5/17/2021 21:22:41'!
isEmpty
	
	^self numberOfCustomers = 0.! !


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
