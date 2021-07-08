!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'JS 7/8/2021 01:48:43'!
test01PortfolioWithNoComponentsHasZeroPesos

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 * peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'JS 7/8/2021 01:48:54'!
test02PortfolioWithOneAccountKnowsItsBalance

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	portfolio add: account.
	
	self assert: 100 * peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'JS 7/8/2021 01:59:28'!
test03PortfolioWithManyAccountsKnowsItsBalance

	| portfolio1 portfolio2 account1 account2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	Deposit register: 200 * peso on: account2.
	portfolio1 add: account1.
	portfolio2 add: account2.
	portfolio1 add: portfolio2.

	self assert: 300 * peso equals: portfolio1 balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'JS 7/8/2021 01:58:52'!
test04PortfolioKnowsRegisteredTransactions

	| portfolio account deposit |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.
	portfolio add: account.
	
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'JS 7/8/2021 01:58:58'!
test05PortfolioDoesNotKnowNotRegisteredTransactions

	| portfolio account deposit |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.
	
	self deny: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/8/2021 18:32:50'!
test06PortfolioWithNoComponentsHasNoTransactions

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: (portfolio transactions isEmpty).! !

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/8/2021 18:41:27'!
test07PortfolioWithNoComponentsHasNoTransactions

	| portfolio1 portfolio2 account1 account2 transfer |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer := Transfer for: 50 * peso from: account1 to: account2.
	
	portfolio1 add: account1.
	portfolio2 add: account2.
	portfolio1 add: portfolio2.
	
	self assert: (portfolio1 transactions hasEqualElements: {transfer withdrawal. transfer deposit}).! !

!PortfolioTest methodsFor: 'tests' stamp: 'JS 7/8/2021 17:39:25'!
test08PortfolioCannotAddSameAccountTwice

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 10 * peso on: account.
	portfolio add: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error |
				self assert: 10 * peso equals: portfolio balance. 
				self assert: PortfolioComponent cannotAddAComponentAlreadyPresentInHierarchyErrorDescription equals: error messageText ].
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'JS 7/8/2021 17:39:40'!
test09PortfolioCannotAddAccountWhenADirectChildPortfolioAlreadyContainsIt

	| portfolio1 portfolio2 account |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 10 * peso on: account.
	portfolio2 add: account.
	portfolio1 add: portfolio2.
	
	self 
		should: [ portfolio1 add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error |
				self assert: 10 * peso equals: portfolio1 balance. 
				self assert: PortfolioComponent cannotAddAComponentAlreadyPresentInHierarchyErrorDescription equals: error messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'JS 7/8/2021 17:39:50'!
test10PortfolioCannotAddAccountWhenANestedChildPortfolioAlreadyContainsIt

	| portfolio1 portfolio2 portfolio3 account |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3  := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 10 * peso on: account.
	portfolio3 add: account.
	portfolio2 add: portfolio3.
	portfolio1 add: portfolio2.
	
	self 
		should: [ portfolio1 add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error |
				self assert: 10 * peso equals: portfolio1 balance. 
				self assert: PortfolioComponent cannotAddAComponentAlreadyPresentInHierarchyErrorDescription equals: error messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'JS 7/8/2021 17:40:00'!
test11PortfolioCannotAddItself

	| portfolio |
	
	portfolio := Portfolio new.
	
	self 
		should: [ portfolio add: portfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error | self assert: PortfolioComponent cannotAddAComponentAlreadyPresentInHierarchyErrorDescription equals: error messageText ].
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'JS 7/8/2021 17:40:09'!
test12PortfolioCannotAddAccountWhenDirectParentAlreadyContainsIt

	| portfolio1 portfolio2 account |

	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 10 * peso on: account.
	portfolio1 add: account.
	portfolio1 add: portfolio2.
	
	self 
		should: [ portfolio2 add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error |
				self assert: 10 * peso equals: portfolio1 balance. 
				self assert: PortfolioComponent cannotAddAComponentAlreadyPresentInHierarchyErrorDescription equals: error messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'JS 7/8/2021 17:40:18'!
test13PortfolioCannotAddPortfolioWhenBothContainSameAccount

	| portfolio1 portfolio2 account |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 10 * peso on: account.
	portfolio1 add: account.
	portfolio2 add: account.
	
	self 
		should: [ portfolio1 add: portfolio2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error |
				self assert: 10 * peso equals: portfolio1 balance. 
				self assert: PortfolioComponent cannotAddAComponentAlreadyPresentInHierarchyErrorDescription equals: error messageText ].
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'JS 7/8/2021 17:40:27'!
test14PortfolioCannotAddPortfolioWhenBothContainSamePortfolio

	| portfolio1 portfolio2 portfolio3 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	portfolio1 add: portfolio3.
	portfolio2 add: portfolio3.
	
	self 
		should: [ portfolio1 add: portfolio2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error | self assert: PortfolioComponent cannotAddAComponentAlreadyPresentInHierarchyErrorDescription equals: error messageText ]. 
	
	! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JS 7/8/2021 02:10:31'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JS 7/8/2021 02:10:34'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JS 7/8/2021 02:10:38'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JS 7/8/2021 02:10:41'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'LT 7/6/2021 16:58:47'!
test01ReceptiveAccountCanTransferToAnotherReceptiveAccount

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: account1.
	Transfer for: 50 * peso from: account1 to: account2.
		
	self assert: 50 * peso equals: account2 balance.
	self assert: 0 * peso equals: account1 balance.
! !

!TransferTest methodsFor: 'tests' stamp: 'LT 7/6/2021 16:58:53'!
test02ATransferKnowsTheValueOfTheTransaction

	| account1 account2 transfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: account1.
	transfer := Transfer for: 50 * peso from: account1 to: account2.
		
	self assert: 50 * peso equals: transfer value.
! !

!TransferTest methodsFor: 'tests' stamp: 'LT 7/6/2021 16:58:59'!
test03EachPartOfTheTransferKnowsItsCounterPart

	| account1 account2 transfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: account1.
	transfer := Transfer for: 50 * peso from: account1 to: account2.
		
	self assert: transfer withdrawal counterPart equals: transfer deposit.
	self assert: transfer deposit counterPart equals: transfer withdrawal.
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'balance effects' stamp: 'JS 7/8/2021 01:26:33'!
effectOn: balance

	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'main protocol' stamp: 'JS 7/8/2021 01:24:47'!
value

	^value! !


!AccountTransaction methodsFor: 'initialization' stamp: 'LT 7/2/2021 17:19:17'!
initializeFor: aValue

	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'JS 7/8/2021 01:46:47'!
for: aValue

	^self new initializeFor: aValue ! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'JS 7/8/2021 01:46:52'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'balance effects' stamp: 'JS 7/8/2021 01:24:58'!
effectOn: balance

	^balance + self value! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'balance effects' stamp: 'JS 7/8/2021 01:25:03'!
effectOn: balance

	^balance - self value! !


!classDefinition: #PortfolioComponent category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #PortfolioComponent
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioComponent methodsFor: 'main protocol' stamp: 'JS 7/8/2021 01:25:12'!
balance

	self subclassResponsibility.! !

!PortfolioComponent methodsFor: 'main protocol' stamp: 'JS 7/8/2021 01:25:17'!
hasRegistered: aTransaction

	self subclassResponsibility.
! !

!PortfolioComponent methodsFor: 'main protocol' stamp: 'LT 7/8/2021 18:55:27'!
transactions

	self subclassResponsibility.
! !


!PortfolioComponent methodsFor: 'private - hierarchy manipulation' stamp: 'LT 7/8/2021 18:44:05'!
addItAndItsComponentsTo: aComponentCollection

	^aComponentCollection add: self
! !

!PortfolioComponent methodsFor: 'private - hierarchy manipulation' stamp: 'LT 7/8/2021 18:49:16'!
itAndItsComponents

	| componentsBeneathComponent |
	
	componentsBeneathComponent := Set new.
	self addItAndItsComponentsTo: componentsBeneathComponent.
	
	^componentsBeneathComponent ! !


!PortfolioComponent methodsFor: 'private - validations' stamp: 'JS 7/8/2021 17:50:48'!
throwErrorIfItOrAnyOfItsComponentsAreIncludedIn: aComponentList

	(aComponentList includes: self) ifTrue: [ Error signal: self class cannotAddAComponentAlreadyPresentInHierarchyErrorDescription ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioComponent class' category: 'ServiciosFinancieros-Ejercicio'!
PortfolioComponent class
	instanceVariableNames: ''!

!PortfolioComponent class methodsFor: 'error descriptions' stamp: 'JS 7/8/2021 17:41:26'!
cannotAddAComponentAlreadyPresentInHierarchyErrorDescription

	^'component is already present in hierarchy'! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
PortfolioComponent subclass: #Portfolio
	instanceVariableNames: 'components portfolioParents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'private - validations' stamp: 'LT 7/8/2021 18:49:16'!
throwErrorIfCantAdd: aComponent 

	self rootPortfoliosContainingIt do: [ :rootPorfolio | 
		rootPorfolio throwErrorIfItOrAnyOfItsComponentsAreIncludedIn: (aComponent itAndItsComponents) ].! !

!Portfolio methodsFor: 'private - validations' stamp: 'JS 7/8/2021 17:41:52'!
throwErrorIfItOrAnyOfItsComponentsAreIncludedIn: aComponentList 

	super throwErrorIfItOrAnyOfItsComponentsAreIncludedIn: aComponentList.
	components do: [ :component | component throwErrorIfItOrAnyOfItsComponentsAreIncludedIn: aComponentList ].
		
	
	! !


!Portfolio methodsFor: 'private - hierarchy manipulation' stamp: 'LT 7/8/2021 18:44:05'!
addItAndItsComponentsTo: componentCollection

	super addItAndItsComponentsTo: componentCollection.
	components do: [ :component | component addItAndItsComponentsTo: componentCollection].
		
	! !

!Portfolio methodsFor: 'private - hierarchy manipulation' stamp: 'JS 7/8/2021 01:39:32'!
addRootPortfoliosTo: rootCollection

	(portfolioParents isEmpty) 
		ifTrue: [ rootCollection add: self ] 
		ifFalse: [ portfolioParents do: [ :portfolioParent | portfolioParent addRootPortfoliosTo: rootCollection ]].
	! !

!Portfolio methodsFor: 'private - hierarchy manipulation' stamp: 'JS 7/8/2021 17:46:14'!
becomeAChildOf: aPortfolio 
	
	portfolioParents add: aPortfolio.! !

!Portfolio methodsFor: 'private - hierarchy manipulation' stamp: 'JS 7/8/2021 17:46:00'!
becomeAParentOf: aComponent

	(aComponent isMemberOf: Portfolio) ifTrue: [ aComponent becomeAChildOf: self ].! !

!Portfolio methodsFor: 'private - hierarchy manipulation' stamp: 'LT 7/8/2021 10:26:59'!
rootPortfoliosContainingIt  

	| portfolioRoots |
	
	portfolioRoots := Set new.
	self addRootPortfoliosTo: portfolioRoots.
	^portfolioRoots! !


!Portfolio methodsFor: 'initialization' stamp: 'JS 7/8/2021 17:52:36'!
initialize

	components := OrderedCollection new.
	portfolioParents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'LT 7/7/2021 23:05:07'!
add: aComponent 

	self throwErrorIfCantAdd: aComponent.
	components add: aComponent.
	self becomeAParentOf: aComponent.! !

!Portfolio methodsFor: 'main protocol' stamp: 'JS 7/8/2021 01:42:41'!
balance

	^components sum: [ :component | component balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'JS 7/8/2021 01:42:31'!
hasRegistered: aDeposit 

	^components anySatisfy: [ :component | component hasRegistered: aDeposit ]
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'LT 7/8/2021 18:42:12'!
transactions

	| transactionList |
	
	transactionList := OrderedCollection new.
	
	components do: [:component | transactionList addAll: component transactions].
	
	^transactionList ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
PortfolioComponent subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'LT 7/8/2021 10:09:22'!
initialize

	transactions := OrderedCollection new.
	super initialize.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JS 7/8/2021 01:42:57'!
balance

	^transactions  inject: 0 * peso into: [:balance :aTransaction | aTransaction effectOn: balance]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JS 7/8/2021 01:43:04'!
hasRegistered: aTransaction

	^transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JS 7/8/2021 01:43:10'!
register: aTransaction

	transactions add: aTransaction.
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JS 7/8/2021 01:43:14'!
transactions 

	^transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'withdrawal deposit value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'JS 7/8/2021 01:43:45'!
initializeFor: aValue from: aWithdrawalAccount to: aDepositAccount

	value := aValue.
	withdrawal := TransferWithdraw of: self on: aWithdrawalAccount.
	deposit := TransferDeposit of: self on: aDepositAccount.! !


!Transfer methodsFor: 'main protocol' stamp: 'JS 7/8/2021 01:43:40'!
value

	^value! !


!Transfer methodsFor: 'parts' stamp: 'JS 7/8/2021 01:43:31'!
deposit

	^deposit ! !

!Transfer methodsFor: 'parts' stamp: 'JS 7/8/2021 01:43:35'!
withdrawal

	^withdrawal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'JS 7/8/2021 01:47:51'!
for: aValue from: withdrawalAccount to: depositAccount

	^self new initializeFor: aValue from: withdrawalAccount to: depositAccount! !


!classDefinition: #TransferTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferTransaction
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTransaction methodsFor: 'initialization' stamp: 'LT 7/6/2021 17:31:51'!
initializeOf: aTransfer

	transfer := aTransfer.! !


!TransferTransaction methodsFor: 'balance effects' stamp: 'JS 7/8/2021 01:44:02'!
effectOn: balance

	self subclassResponsibility.! !


!TransferTransaction methodsFor: 'main protocol' stamp: 'JS 7/8/2021 01:44:06'!
counterPart

	self subclassResponsibility.! !

!TransferTransaction methodsFor: 'main protocol' stamp: 'JS 7/8/2021 01:44:12'!
value

	^transfer value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction class
	instanceVariableNames: ''!

!TransferTransaction class methodsFor: 'instance creation' stamp: 'JS 7/8/2021 01:48:10'!
of: aTransfer on: aDepositAccount

	| transaction |
	
	transaction := self ofTransfer: aTransfer.
	aDepositAccount register: transaction.
		
	^transaction
	! !

!TransferTransaction class methodsFor: 'instance creation' stamp: 'LT 7/6/2021 17:33:04'!
ofTransfer: aTransfer

	^self new initializeOf: aTransfer! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'main protocol' stamp: 'LT 7/6/2021 17:28:11'!
counterPart

	^transfer withdrawal! !


!TransferDeposit methodsFor: 'balance effects' stamp: 'JS 7/8/2021 01:44:24'!
effectOn: balance

	^balance + self value! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'main protocol' stamp: 'LT 7/6/2021 17:34:56'!
counterPart

	^transfer deposit ! !


!TransferWithdraw methodsFor: 'balance effects' stamp: 'JS 7/8/2021 01:44:30'!
effectOn: balance

	^balance - self value! !
