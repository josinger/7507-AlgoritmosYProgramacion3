!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/5/2021 21:32:37'!
test01PortfolioWithNoComponentsHasZeroPesos

	| portfolio |
	portfolio := Portfolio new.
	self assert: 0 * peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/6/2021 18:29:33'!
test02PortfolioWithOneAccountKnowsItsBalance

	| portfolio account |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio add: account.
	self assert: 100 * peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/7/2021 23:16:20'!
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

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/6/2021 18:31:41'!
test04PortfolioKnowsRegisteredTransactions

	| portfolio deposit account |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio add: account.
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/6/2021 18:37:52'!
test05PortfolioDoesNotKnowNotRegisteredTransactions

	| portfolio deposit account |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	self deny: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/6/2021 18:38:37'!
test06PortfolioKnowsTransactionsOfSpecificAccount

	| portfolio account  |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio add: account.
	self assert: ((portfolio transactionsOf: account) includesAllOf: account transactions).
	self assert: (account transactions includesAllOf: (portfolio transactionsOf: account)).! !

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/7/2021 12:41:04'!
test07PortfolioCannotAddSameAccountTwice

	| portfolio account |
	account := ReceptiveAccount new.
	Deposit register: 10 * peso on: account.
	portfolio := Portfolio new.
	portfolio add: account.
	
	self 
		should: [portfolio add: account]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error |
				self assert: 10 * peso equals: portfolio balance. 
				self assert: Portfolio accountAlreadyPresentInHierarchyErrorDescription equals: error messageText.
			] 
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/7/2021 12:43:49'!
test08PortfolioCannotAddAccountWhenADirectChildPortfolioAlreadyContainsIt

	| portfolio1 portfolio2 account |
	account := ReceptiveAccount new.
	Deposit register: 10 * peso on: account.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	portfolio2 add: account.
	portfolio1 add: portfolio2.
	self 
		should: [portfolio1 add: account]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error |
				self assert: 10 * peso equals: portfolio1 balance. 
				self assert: Portfolio accountAlreadyPresentInHierarchyErrorDescription equals: error messageText.
			] 
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/7/2021 12:43:35'!
test09PortfolioCannotAddAccountWhenANestedChildPortfolioAlreadyContainsIt

	| portfolio1 portfolio2 portfolio3 account |
	account := ReceptiveAccount new.
	Deposit register: 10 * peso on: account.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3  := Portfolio new.
	portfolio3 add: account.
	portfolio2 add: portfolio3.
	portfolio1 add: portfolio2.
	self 
		should: [portfolio1 add: account]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error |
				self assert: 10 * peso equals: portfolio1 balance. 
				self assert: Portfolio accountAlreadyPresentInHierarchyErrorDescription equals: error messageText.
			] 
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/7/2021 12:53:02'!
test10PortfolioCannotAddItself

	| portfolio |
	portfolio := Portfolio new.
	
	self 
		should: [portfolio add: portfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error |
				self assert: Portfolio cannotAddItselfErrorDescription equals: error messageText.
			] 
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/7/2021 12:44:43'!
test11PortfolioCannotAddAccountWhenDirectParentAlreadyContainsIt

	| portfolio1 portfolio2 account |
	account := ReceptiveAccount new.
	Deposit register: 10 * peso on: account.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	portfolio1 add: account.
	portfolio1 add: portfolio2.
	
	self 
		should: [portfolio2 add: account]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error |
				self assert: 10 * peso equals: portfolio1 balance. 
				self assert: Portfolio accountAlreadyPresentInHierarchyErrorDescription equals: error messageText.
			] 
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/7/2021 12:45:39'!
test12PortfolioCannotAddPortfolioWhenBothContainSameAccount

	| portfolio1 portfolio2 account |
	account := ReceptiveAccount new.
	Deposit register: 10 * peso on: account.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	portfolio1 add: account.
	portfolio2 add: account.
	
	self 
		should: [portfolio1 add: portfolio2.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error |
				self assert: 10 * peso equals: portfolio1 balance. 
				self assert: Portfolio accountAlreadyPresentInHierarchyErrorDescription equals: error messageText.
			] 
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/7/2021 22:06:07'!
test13PortfolioCannotAddPortfolioWhenBothContainSamePortfolio

	| portfolio1 portfolio2 portfolio3 |
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	portfolio1 add: portfolio3.
	portfolio2 add: portfolio3.
	self 
		should: [portfolio1 add: portfolio2.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error |
				self assert: Portfolio accountAlreadyPresentInHierarchyErrorDescription equals: error messageText.
			] 
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'LT 7/7/2021 23:52:22'!
test14PortfolioKnowsTransactionsOfNestedSpecificAccount

	| portfolio1 portfolio2 account  |
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	
	portfolio2 add: account.
	portfolio1 add: portfolio2.
	
	self assert: ((portfolio1 transactionsOf: account) includesAllOf: account transactions).
	self assert: (account transactions includesAllOf: (portfolio1 transactionsOf: account)).
	! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
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

!AccountTransaction methodsFor: 'balance effects' stamp: 'LT 7/7/2021 15:11:10'!
effectOn: balance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'main protocol' stamp: 'LT 7/6/2021 17:38:14'!
value

	^value.! !


!AccountTransaction methodsFor: 'initialization' stamp: 'LT 7/2/2021 17:19:17'!
initializeFor: aValue

	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'LT 7/3/2021 14:47:22'!
for: aValue

	^ self new initializeFor: aValue ! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'LT 7/2/2021 17:24:20'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'balance effects' stamp: 'LT 7/7/2021 15:11:10'!
effectOn: balance

	^balance + self value.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'balance effects' stamp: 'LT 7/7/2021 15:11:10'!
effectOn: balance

	^balance - self value.! !


!classDefinition: #PortfolioComponent category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #PortfolioComponent
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioComponent methodsFor: 'main protocol' stamp: 'LT 7/7/2021 23:20:48'!
balance

	self subclassResponsibility ! !

!PortfolioComponent methodsFor: 'main protocol' stamp: 'LT 7/7/2021 23:20:44'!
hasRegistered: aTransaction

	self subclassResponsibility 
! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
PortfolioComponent subclass: #Portfolio
	instanceVariableNames: 'components portfolioParents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'private - validations' stamp: 'LT 7/7/2021 14:44:06'!
throwErrorIfAlreadyIncludesAnyOf: aComponentList 

	aComponentList do: [:aComponent | 
			(components do: [:component |
				 (component isMemberOf: Portfolio) ifTrue: [component throwErrorIfAlreadyIncludesAnyOf: aComponentList ]]
			).
			^(components includes: aComponent) ifTrue: [Error signal: Portfolio accountAlreadyPresentInHierarchyErrorDescription].
		].
	
	! !

!Portfolio methodsFor: 'private - validations' stamp: 'LT 7/7/2021 23:43:24'!
throwErrorIfCantAdd: aComponent 

	self = aComponent ifTrue: [Error signal: self class cannotAddItselfErrorDescription ].
	self rootPortfoliosContainingIt do: [
			:rootPorfolio | 
			rootPorfolio throwErrorIfAlreadyIncludesAnyOf: (self componentsBeneath: aComponent) ].
	! !


!Portfolio methodsFor: 'private - hierarchy manipulation' stamp: 'LT 7/7/2021 23:42:40'!
addComponentsTo: leafCollection
	components do: [:component | 
		leafCollection add: component.
		(component isMemberOf: Portfolio) ifTrue: [component addComponentsTo: leafCollection].
		].
		
	! !

!Portfolio methodsFor: 'private - hierarchy manipulation' stamp: 'LT 7/7/2021 23:11:27'!
addRootPortfoliosTo: superParentCollection
	(portfolioParents isEmpty) ifTrue: [superParentCollection add: self] ifFalse: [
			portfolioParents do: [:portfolioParent | portfolioParent addRootPortfoliosTo: superParentCollection]
		]
	! !

!Portfolio methodsFor: 'private - hierarchy manipulation' stamp: 'LT 7/7/2021 23:04:37'!
becomeAChildOf: aPortfolio 
	
	portfolioParents add: aPortfolio.! !

!Portfolio methodsFor: 'private - hierarchy manipulation' stamp: 'LT 7/7/2021 23:04:37'!
becomeAParentOf: aComponent

	(aComponent isMemberOf: Portfolio) ifTrue: [aComponent becomeAChildOf: self]! !

!Portfolio methodsFor: 'private - hierarchy manipulation' stamp: 'LT 7/7/2021 23:43:24'!
componentsBeneath: aComponent
	| leafs |
	
	leafs := OrderedCollection new.
	(aComponent isMemberOf: ReceptiveAccount)
		ifTrue: [leafs add: aComponent ]
		ifFalse: [aComponent addComponentsTo: leafs].
	^leafs ! !

!Portfolio methodsFor: 'private - hierarchy manipulation' stamp: 'LT 7/8/2021 00:00:51'!
findTransactionsOf: aReceptiveAccount In: component

	(component isMemberOf: Portfolio)
			ifTrue: [^component transactionsOf: aReceptiveAccount]
			ifFalse: [(component = aReceptiveAccount) ifTrue: [^component transactions ]]
	
	! !

!Portfolio methodsFor: 'private - hierarchy manipulation' stamp: 'LT 7/7/2021 23:12:46'!
rootPortfoliosContainingIt  

	| rootPortfolios  |
	
	rootPortfolios := OrderedCollection new.
	self addRootPortfoliosTo: rootPortfolios.
	^rootPortfolios! !


!Portfolio methodsFor: 'initialization' stamp: 'LT 7/6/2021 19:52:11'!
initialize
	components := OrderedCollection new.
	portfolioParents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'LT 7/7/2021 23:05:07'!
add: aComponent 

	self throwErrorIfCantAdd: aComponent.
	components add: aComponent.
	self becomeAParentOf: aComponent.! !

!Portfolio methodsFor: 'main protocol' stamp: 'LT 7/6/2021 17:20:53'!
balance
	^components sum: [:component | component balance ] ifEmpty: [0 * peso].! !

!Portfolio methodsFor: 'main protocol' stamp: 'LT 7/6/2021 17:07:52'!
hasRegistered: aDeposit 
	^components anySatisfy: [:component | component hasRegistered: aDeposit]
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'LT 7/8/2021 00:01:52'!
transactionsOf: aReceptiveAccount 
	
	components do: [:component | ^self findTransactionsOf: aReceptiveAccount In: component].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error messages' stamp: 'LT 7/7/2021 12:47:55'!
accountAlreadyPresentInHierarchyErrorDescription
	^'account is already present in hierarchy'! !

!Portfolio class methodsFor: 'error messages' stamp: 'LT 7/7/2021 12:48:31'!
cannotAddItselfErrorDescription
	^'portfolio cannot add itself'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
PortfolioComponent subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LT 7/7/2021 15:11:10'!
balance

	^transactions  inject: 0 * peso into: [:balance :aTransaction | aTransaction effectOn: balance].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'withdrawal deposit value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'LT 7/6/2021 17:35:25'!
initializeFor: aValue from: aWithdrawalAccount to: aDepositAccount
	value := aValue.
	withdrawal := TransferWithdraw of: self on: aWithdrawalAccount.
	deposit := TransferDeposit of: self on: aDepositAccount.! !


!Transfer methodsFor: 'main protocol' stamp: 'LT 7/2/2021 17:05:07'!
value

	^ value! !


!Transfer methodsFor: 'parts' stamp: 'LT 7/2/2021 17:05:47'!
deposit

	^ deposit ! !

!Transfer methodsFor: 'parts' stamp: 'LT 7/2/2021 17:05:43'!
withdrawal

	^ withdrawal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'LT 7/3/2021 15:14:52'!
for: aValue from: withdrawalAccount to: depositAccount

	^ self new initializeFor: aValue from: withdrawalAccount to: depositAccount! !


!classDefinition: #TransferTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferTransaction
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTransaction methodsFor: 'initialization' stamp: 'LT 7/6/2021 17:31:51'!
initializeOf: aTransfer

	transfer := aTransfer.! !


!TransferTransaction methodsFor: 'balance effects' stamp: 'LT 7/7/2021 15:11:10'!
effectOn: balance

	self subclassResponsibility ! !


!TransferTransaction methodsFor: 'main protocol' stamp: 'LT 7/6/2021 17:32:08'!
counterPart

	self subclassResponsibility ! !

!TransferTransaction methodsFor: 'main protocol' stamp: 'LT 7/6/2021 17:31:29'!
value

	^transfer value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction class
	instanceVariableNames: ''!

!TransferTransaction class methodsFor: 'instance creation' stamp: 'LT 7/6/2021 17:32:55'!
of: aTransfer on: aDepositAccount

	| transaction |
	
	transaction := self ofTransfer: aTransfer.
	aDepositAccount register: transaction.
		
	^ transaction
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


!TransferDeposit methodsFor: 'balance effects' stamp: 'LT 7/7/2021 15:11:10'!
effectOn: balance

	^balance + self value.! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'main protocol' stamp: 'LT 7/6/2021 17:34:56'!
counterPart

	^transfer deposit ! !


!TransferWithdraw methodsFor: 'balance effects' stamp: 'LT 7/7/2021 15:11:10'!
effectOn: balance

	^balance - self value.! !
