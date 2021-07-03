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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LT 7/3/2021 15:16:37'!
test08ReceptiveAccountCanTransferToAnotherReceptiveAccount

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: account1.
	Transfer for: 50 * peso from: account1 to: account2.
		
	self assert: 50 * peso equals: account2 balance.
	self assert: 0 * peso equals: account1 balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LT 7/3/2021 15:17:24'!
test09ATransferKnowsItsValue

	| account1 account2 transfer |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: account1.
	transfer := Transfer for: 50 * peso from: account1 to: account2.
		
	self assert: 50 * peso equals: transfer value.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LT 7/3/2021 15:18:51'!
test10EachPartOfTheTransferKnowsItsCounterPart

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
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'LT 7/3/2021 15:08:47'!
operationValue

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'LT 7/3/2021 15:23:25'!
value

	value ifNil: [^transfer value].
	^value.! !


!AccountTransaction methodsFor: 'instance creation' stamp: 'LT 7/3/2021 14:52:13'!
counterPart

	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'initialization' stamp: 'LT 7/2/2021 17:19:17'!
initializeFor: aValue

	value := aValue ! !

!AccountTransaction methodsFor: 'initialization' stamp: 'LT 7/3/2021 15:27:40'!
initializeOf: aTransfer

	transfer := aTransfer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'LT 7/3/2021 14:47:22'!
for: aValue

	^ self new initializeFor: aValue ! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'LT 7/3/2021 15:11:36'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self ofTransfer: aTransfer.
	anAccount register: transaction.
		
	^ transaction! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'LT 7/3/2021 15:27:40'!
ofTransfer: aTransfer

	^self new initializeOf: aTransfer! !

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


!Deposit methodsFor: 'value' stamp: 'LT 7/3/2021 14:52:41'!
counterPart

	^ transfer withdrawal! !

!Deposit methodsFor: 'value' stamp: 'LT 7/3/2021 15:23:53'!
operationValue

	^self value! !



!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!Withdraw methodsFor: 'value' stamp: 'LT 7/3/2021 14:52:52'!
counterPart

	^ transfer deposit! !

!Withdraw methodsFor: 'value' stamp: 'LT 7/3/2021 15:23:48'!
operationValue

	^self value * (-1)! !



!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LT 7/3/2021 15:08:22'!
balance

	^transactions sum: [ :aTransaction | aTransaction operationValue ] ifEmpty: [ 0 ]! !

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

!Transfer methodsFor: 'as yet unclassified' stamp: 'LT 7/2/2021 17:05:47'!
deposit

	^ deposit ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'LT 7/3/2021 15:15:05'!
initializeFor: aValue from: aWithdrawalAccount to: aDepositAccount
	value := aValue.
	withdrawal := Withdraw of: self on: aWithdrawalAccount.
	deposit := Deposit of: self on: aDepositAccount.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'LT 7/2/2021 17:05:07'!
value

	^ value! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'LT 7/2/2021 17:05:43'!
withdrawal

	^ withdrawal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'LT 7/3/2021 15:14:52'!
for: aValue from: withdrawalAccount to: depositAccount

	^ self new initializeFor: aValue from: withdrawalAccount to: depositAccount! !
