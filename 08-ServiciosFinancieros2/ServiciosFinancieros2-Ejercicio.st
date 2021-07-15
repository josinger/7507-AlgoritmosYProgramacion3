!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

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


!classDefinition: #ReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportTest methodsFor: 'tests' stamp: 'JS 7/14/2021 05:11:48'!
test01AccountSumaryOfEmptyAccountHasNoTransactions

	| emptyAccount report |
	
	emptyAccount := ReceptiveAccount new.
	report := (AccountSummaryReport for: emptyAccount) build.

	self assert: #('Balance = 0 pesos') asOrderedCollection equals: report.! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/14/2021 05:12:03'!
test02AccountSumaryWithSingleDeposit

	| depositAccount report |
	
	depositAccount := ReceptiveAccount new.
	
	Deposit register: 10 * peso on: depositAccount.
	
	report := (AccountSummaryReport for: depositAccount) build.

	self assert: #('Depósito por 10 pesos' 'Balance = 10 pesos') asOrderedCollection equals: report.
	
	
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/14/2021 05:12:11'!
test03AccountSumaryWithSingleWithdraw

	| depositAccount report |
	
	depositAccount := ReceptiveAccount new.
	
	Withdraw register: 10 * peso on: depositAccount.
	
	report := (AccountSummaryReport for: depositAccount) build.

	self assert: #('Extracción por 10 pesos' 'Balance = -10 pesos') asOrderedCollection equals: report.
	
	
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/14/2021 05:12:18'!
test04AccountSumaryWithTransferDeposit

	| depositAccount withdrawAccount report |
	
	depositAccount := ReceptiveAccount new.
	withdrawAccount := ReceptiveAccount new.
	
	Transfer amount: 10 * peso from: withdrawAccount to: depositAccount.
	
	report := (AccountSummaryReport for: depositAccount) build.

	self assert: #('Entrada por transferencia de 10 pesos' 'Balance = 10 pesos') asOrderedCollection equals: report.
	
	
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/14/2021 05:12:27'!
test05AccountSumaryWithTransferWithdraw

	| depositAccount withdrawAccount report |
	
	depositAccount := ReceptiveAccount new.
	withdrawAccount := ReceptiveAccount new.
	
	Transfer amount: 10 * peso from: withdrawAccount to: depositAccount.
	
	report := (AccountSummaryReport for: withdrawAccount) build.

	self assert: #('Salida por transferencia de 10 pesos' 'Balance = -10 pesos') asOrderedCollection equals: report.
	
	
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/14/2021 05:12:34'!
test06AccountSumaryWithWithMultipleTransactions

	| account report |
	
	account := ReceptiveAccount new.
	
	Deposit register: 15 * peso on: account.
	Withdraw register: 10 * peso on: account.
	
	report := (AccountSummaryReport for: account) build.

	self assert: #('Depósito por 15 pesos' 'Extracción por 10 pesos' 'Balance = 5 pesos') asOrderedCollection equals: report.
	
	
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/14/2021 05:12:41'!
test07AccountSumaryOfComposedAccounts

	| portfolio depositAccount report |
	
	portfolio := Portfolio new.
	depositAccount := ReceptiveAccount new.
	
	portfolio add: depositAccount.
	
	Deposit register: 10 * peso on: depositAccount.
	
	report := (AccountSummaryReport for: portfolio) build.

	self assert: #('Depósito por 10 pesos' 'Balance = 10 pesos') asOrderedCollection equals: report.
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/14/2021 05:12:48'!
test08NetTransferOfEmptyAccountIsZeroPesos

	| emptyAccount report |
	
	emptyAccount := ReceptiveAccount new.
	
	report := (NetTransferReport for: emptyAccount) build.

	self assert: 0*peso equals: report.! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/14/2021 05:12:57'!
test09NetTransferWithTransferDeposit

	| depositAccount withdrawAccount report |
	
	depositAccount := ReceptiveAccount new.
	withdrawAccount := ReceptiveAccount new.
	
	Transfer amount: 10 * peso from: withdrawAccount to: depositAccount.
	
	report := (NetTransferReport for: depositAccount) build.

	self assert: 10*peso equals: report.
	
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/14/2021 05:13:04'!
test10NetTransferWithNoTransferTransaction

	| depositAccount report |
	
	depositAccount := ReceptiveAccount new.
	
	Deposit register: 15 * peso on: depositAccount.
	Withdraw register: 10 * peso on: depositAccount.

	report := (NetTransferReport for: depositAccount) build.

	self assert: 0*peso equals: report.
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/14/2021 05:13:10'!
test11NetTransferWithTransferWithdraw

	| depositAccount withdrawAccount report |
	
	depositAccount := ReceptiveAccount new.
	withdrawAccount := ReceptiveAccount new.
	
	Transfer amount: 10 * peso from: withdrawAccount to: depositAccount.
	
	report := (NetTransferReport for: withdrawAccount) build.

	self assert: -10*peso equals: report.
	
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/14/2021 05:13:16'!
test12NetTransferOfComposedAccounts

	| portfolio withdrawAccount depositAccount report |
	
	portfolio := Portfolio new.
	depositAccount := ReceptiveAccount new.
	withdrawAccount := ReceptiveAccount new.
	
	portfolio add: depositAccount.
	
	Transfer amount: 10 * peso from: withdrawAccount to: depositAccount.
	
	report := (NetTransferReport for: portfolio) build.

	self assert: 10*peso equals: report.
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/13/2021 21:12:02'!
test13SimpleTreeOfEmptyPortfolio

	| portfolio tree |
	
	portfolio := Portfolio new.
	
	tree := (PortfolioSimpleTreePrinter for: portfolio) print.

	self assert: #('unnamed portfolio') asOrderedCollection equals: tree.
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/13/2021 21:12:22'!
test14SimpleTreeOfEmptyNamedPortfolio

	| portfolio tree |
	
	portfolio := Portfolio named: 'Portfolio 001'.
	
	tree := (PortfolioSimpleTreePrinter for: portfolio) print.

	self assert: #('Portfolio 001') asOrderedCollection equals: tree.
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/15/2021 04:26:00'!
test15SimpleTreeWithAccount

	| portfolio childAccount tree |
	
	childAccount := ReceptiveAccount new.
	portfolio := Portfolio named: 'Portfolio 001' with: childAccount.
	
	tree := (PortfolioSimpleTreePrinter for: portfolio) print.

	self assert: {'Portfolio 001' . 
				self indent , 'unnamed account'} asOrderedCollection equals: tree.
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/15/2021 04:26:14'!
test16SimpleTreeWithComposedAccounts

	| portfolio childPortfolio grandChildAccount tree |
	
	grandChildAccount := ReceptiveAccount named: 'Account 001'.
	childPortfolio := Portfolio named: 'Portfolio 002' with: grandChildAccount.
	portfolio := Portfolio named: 'Portfolio 001' with: childPortfolio.
	
	tree := (PortfolioSimpleTreePrinter for: portfolio) print.

	self assert: {'Portfolio 001' . 
				self indent , 'Portfolio 002' . 
				self indent , self indent , 'Account 001'} asOrderedCollection equals: tree.
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/15/2021 04:26:38'!
test17DetailedTreeOfEmptyPortfolio

	| portfolio tree |
	
	portfolio := Portfolio new.
	
	tree := (PortfolioDetailedTreePrinter for: portfolio) print.

	self assert: {'unnamed portfolio'. 
				self indent, 'Balance = 0 pesos'} asOrderedCollection equals: tree.
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/15/2021 04:26:29'!
test18DetailedTreeWithAccount

	| portfolio childAccount tree |
	
	childAccount := ReceptiveAccount new.
	portfolio := Portfolio named: 'Portfolio 001' with: childAccount.
	
	tree := (PortfolioDetailedTreePrinter for: portfolio) print.

	self assert: {'Portfolio 001' . 
				self indent , 'unnamed account' . 
				self indent , self indent , 'Balance = 0 pesos'. 
				self indent , 'Balance = 0 pesos'} asOrderedCollection equals: tree.
	! !

!ReportTest methodsFor: 'tests' stamp: 'JS 7/13/2021 21:14:23'!
test19DetailedTreeWithAccountWithTransaction

	| portfolio childAccount tree |
	
	childAccount := ReceptiveAccount new.
	portfolio := Portfolio named: 'Portfolio 001' with: childAccount.
	
	Deposit register: 10 * peso on: childAccount.
	
	tree := (PortfolioDetailedTreePrinter for: portfolio) print.

	self assert: {'Portfolio 001' . 
				self indent , 'unnamed account' . 
				self indent , self indent , 'Depósito por 10 pesos'.
				self indent , self indent , 'Balance = 10 pesos'. 
				self indent , 'Balance = 10 pesos'} asOrderedCollection equals: tree.
	! !


!ReportTest methodsFor: 'indentations' stamp: 'JS 7/13/2021 18:47:33'!
indent

	^'    '! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'JS 7/14/2021 05:14:53'!
balance

	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'JS 7/14/2021 05:14:56'!
hasRegistered: aTransaction

	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'JS 7/14/2021 05:15:00'!
transactions

	self subclassResponsibility.! !


!Account methodsFor: 'composition' stamp: 'JS 7/14/2021 05:15:05'!
addedTo: aPortfolio

	self subclassResponsibility.! !

!Account methodsFor: 'composition' stamp: 'JS 7/14/2021 05:15:08'!
isComposedBy: anAccount

	self subclassResponsibility.! !


!Account methodsFor: 'private' stamp: 'JS 7/14/2021 05:15:13'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility.! !

!Account methodsFor: 'private' stamp: 'JS 7/13/2021 18:19:28'!
defaultName

	self subclassResponsibility.! !


!Account methodsFor: 'initialization' stamp: 'JS 7/14/2021 05:15:22'!
initialize

	name := self defaultName.! !

!Account methodsFor: 'initialization' stamp: 'JS 7/14/2021 05:15:28'!
initializeNamed: aName

	self initialize.
	name := aName.! !


!Account methodsFor: 'accesing' stamp: 'JS 7/13/2021 18:00:47'!
name

	^name! !


!Account methodsFor: 'double dispatch - reports' stamp: 'JS 7/13/2021 19:03:57'!
accept: aVisitor

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'instance creation' stamp: 'JS 7/14/2021 05:29:54'!
named: aName 

	^self new initializeNamed: aName ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'JS 7/13/2021 18:18:39'!
initialize

	super initialize.
	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'JS 7/13/2021 19:28:46'!
accept: aVisitor

	aVisitor visitPortfolio: self.! !

!Portfolio methodsFor: 'main protocol' stamp: 'JS 7/13/2021 21:01:52'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'JS 7/14/2021 05:17:28'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self.
	! !


!Portfolio methodsFor: 'private' stamp: 'JS 7/14/2021 05:17:34'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ].! !

!Portfolio methodsFor: 'private' stamp: 'JS 7/13/2021 18:19:49'!
defaultName

	^'unnamed portfolio'! !


!Portfolio methodsFor: 'composition' stamp: 'JS 7/14/2021 05:17:44'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]].! !

!Portfolio methodsFor: 'composition' stamp: 'JS 7/14/2021 05:17:48'!
addedTo: aPortfolio 
	
	parents add: aPortfolio.! !

!Portfolio methodsFor: 'composition' stamp: 'JS 7/14/2021 05:17:58'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd ]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'JS 7/14/2021 05:18:12'!
isComposedBy: anAccount

	^self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'JS 7/14/2021 05:18:19'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'JS 7/14/2021 05:18:23'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage.! !


!Portfolio methodsFor: 'visitor accesing' stamp: 'JS 7/14/2021 05:18:38'!
accounts

	^accounts! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error descriptions' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'JS 7/14/2021 05:30:45'!
named: aName with: aReceptiveAccount 
		
	^(self named: aName) add: aReceptiveAccount; yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'JS 7/13/2021 18:18:31'!
initialize

	super initialize.
	transactions := OrderedCollection new.
	! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JS 7/13/2021 19:06:36'!
accept: aVisitor

	aVisitor visitReceptiveAccount: self.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JS 7/14/2021 05:19:31'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JS 7/14/2021 05:19:35'!
hasRegistered: aTransaction

	^transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JS 7/14/2021 05:19:41'!
register: aTransaction

	transactions add: aTransaction.
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JS 7/14/2021 05:19:44'!
transactions 

	^transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'JS 7/14/2021 05:19:20'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions.! !

!ReceptiveAccount methodsFor: 'private' stamp: 'JS 7/13/2021 18:20:02'!
defaultName

	^'unnamed account'! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'JS 7/14/2021 05:22:03'!
value 

	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'balance' stamp: 'JS 7/14/2021 05:20:06'!
affectBalance: aBalance

	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'double dispatch - reports' stamp: 'JS 7/13/2021 21:16:58'!
accept: aReport

	self subclassResponsibility.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'JS 7/14/2021 05:21:58'!
initializeFor: aValue

	value := aValue.! !


!Deposit methodsFor: 'value' stamp: 'JS 7/14/2021 05:22:21'!
value

	^value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'double dispatch - reports' stamp: 'JS 7/15/2021 16:03:06'!
accept: aReport

	aReport visitDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'JS 7/14/2021 05:22:37'!
initializeWith: aTransfer

	transfer := aTransfer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'double dispatch - reports' stamp: 'JS 7/15/2021 16:03:24'!
accept: aReport

	aReport visitDepositLeg: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'double dispatch - reports' stamp: 'JS 7/15/2021 16:03:18'!
accept: aReport

	aReport visitWithdrawLeg: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'JS 7/14/2021 05:23:02'!
initializeFor: aValue

	value := aValue.! !


!Withdraw methodsFor: 'value' stamp: 'JS 7/14/2021 05:23:07'!
value

	^value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'double dispatch - reports' stamp: 'JS 7/15/2021 16:03:30'!
accept: aReport

	aReport visitWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
Object subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolio entries indentation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'JS 7/14/2021 05:23:21'!
initializeFor: aPortfolio 

	portfolio := aPortfolio.
	entries := OrderedCollection new.
	indentation := ''.! !


!PortfolioTreePrinter methodsFor: 'indentation' stamp: 'JS 7/13/2021 20:41:00'!
defaultIndentation

	^'    '! !

!PortfolioTreePrinter methodsFor: 'indentation' stamp: 'JS 7/13/2021 20:48:39'!
indent

	indentation := indentation append: self defaultIndentation.! !

!PortfolioTreePrinter methodsFor: 'indentation' stamp: 'JS 7/13/2021 20:50:51'!
unindent

	indentation := indentation withoutPrefix: self defaultIndentation.! !


!PortfolioTreePrinter methodsFor: 'double dispatch - accounts' stamp: 'JS 7/13/2021 20:40:18'!
visitPortfolio: aPortfolio

	self subclassResponsibility.! !

!PortfolioTreePrinter methodsFor: 'double dispatch - accounts' stamp: 'JS 7/14/2021 05:25:32'!
visitReceptiveAccount: anAccount

	self subclassResponsibility.! !


!PortfolioTreePrinter methodsFor: 'evaluating' stamp: 'JS 7/13/2021 20:39:45'!
print

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'JS 7/13/2021 20:38:44'!
for: aPortfolio 
	
	^self new initializeFor: aPortfolio ! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'evaluating' stamp: 'JS 7/14/2021 05:27:14'!
print

	portfolio accept: self.
	
	^entries! !


!PortfolioDetailedTreePrinter methodsFor: 'double dispatch - accounts' stamp: 'JS 7/13/2021 21:00:10'!
visitPortfolio: aPortfolio
	
	entries add: (indentation, aPortfolio name). 
	
	self indent.
	aPortfolio accounts do: [ :account | account accept: self ].
	entries add: indentation, 'Balance = ', aPortfolio balance asString.
	self unindent.! !

!PortfolioDetailedTreePrinter methodsFor: 'double dispatch - accounts' stamp: 'JS 7/14/2021 05:27:30'!
visitReceptiveAccount: anAccount

	entries add: indentation, anAccount name. 
	
	self indent.
	(AccountSummaryReport for: anAccount) build do: [ :entry | entries add: indentation, entry ].
	self unindent.! !


!classDefinition: #PortfolioSimpleTreePrinter category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter subclass: #PortfolioSimpleTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioSimpleTreePrinter methodsFor: 'evaluating' stamp: 'JS 7/14/2021 05:27:56'!
print

	portfolio accept: self.
	
	^entries! !


!PortfolioSimpleTreePrinter methodsFor: 'double dispatch - accounts' stamp: 'JS 7/13/2021 20:51:16'!
visitPortfolio: aPortfolio
	
	entries add: (indentation, aPortfolio name). 
	
	self indent.
	aPortfolio accounts do: [ :account | account accept: self ].
	self unindent.! !

!PortfolioSimpleTreePrinter methodsFor: 'double dispatch - accounts' stamp: 'JS 7/13/2021 20:51:20'!
visitReceptiveAccount: anAccount

	entries add: (indentation, anAccount name) asString. ! !


!classDefinition: #TransactionsReport category: 'ServiciosFinancieros-Solucion'!
Object subclass: #TransactionsReport
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransactionsReport methodsFor: 'private' stamp: 'JS 7/13/2021 21:16:59'!
addTransactions

	account transactions do: [ :transaction | transaction accept: self ].! !


!TransactionsReport methodsFor: 'double dispatch - transactions' stamp: 'JS 7/15/2021 16:04:42'!
visitDeposit: aDeposit

	self subclassResponsibility.! !

!TransactionsReport methodsFor: 'double dispatch - transactions' stamp: 'JS 7/15/2021 16:04:51'!
visitDepositLeg: aDepositLeg

	self subclassResponsibility.! !

!TransactionsReport methodsFor: 'double dispatch - transactions' stamp: 'JS 7/15/2021 16:05:02'!
visitWithdraw: aWithdraw

	self subclassResponsibility.! !

!TransactionsReport methodsFor: 'double dispatch - transactions' stamp: 'JS 7/15/2021 16:05:13'!
visitWithdrawLeg: aWithdrawLeg

	self subclassResponsibility.! !


!TransactionsReport methodsFor: 'evaluating' stamp: 'JS 7/12/2021 21:08:38'!
build

	self subclassResponsibility.! !


!TransactionsReport methodsFor: 'initialization' stamp: 'JS 7/14/2021 05:28:07'!
initializeFor: anAccount

	account := anAccount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransactionsReport class' category: 'ServiciosFinancieros-Solucion'!
TransactionsReport class
	instanceVariableNames: ''!

!TransactionsReport class methodsFor: 'instance creation' stamp: 'JS 7/14/2021 05:32:27'!
for: anAccount

	^self new initializeFor: anAccount! !


!classDefinition: #AccountSummaryReport category: 'ServiciosFinancieros-Solucion'!
TransactionsReport subclass: #AccountSummaryReport
	instanceVariableNames: 'entries'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryReport methodsFor: 'initialization' stamp: 'JS 7/14/2021 05:28:24'!
initializeFor: anAccount

	super initializeFor: anAccount.
	entries := OrderedCollection new.! !


!AccountSummaryReport methodsFor: 'evaluating' stamp: 'JS 7/12/2021 21:28:31'!
build

	self addTransactions.

	entries add: 'Balance = ', account balance asString.

	^entries
	
! !


!AccountSummaryReport methodsFor: 'double dispatch - transactions' stamp: 'JS 7/15/2021 16:12:06'!
visitDeposit: aDeposit

	entries add: 'Depósito por ', aDeposit value asString.! !

!AccountSummaryReport methodsFor: 'double dispatch - transactions' stamp: 'JS 7/15/2021 16:12:09'!
visitDepositLeg: aDepositLeg

	entries add: 'Entrada por transferencia de ', aDepositLeg value asString.! !

!AccountSummaryReport methodsFor: 'double dispatch - transactions' stamp: 'JS 7/15/2021 16:12:13'!
visitWithdraw: aWithdraw

	entries add: 'Extracción por ', aWithdraw value asString.! !

!AccountSummaryReport methodsFor: 'double dispatch - transactions' stamp: 'JS 7/15/2021 16:12:16'!
visitWithdrawLeg: aWithdrawLeg

	entries add: 'Salida por transferencia de ', aWithdrawLeg value asString.! !


!classDefinition: #NetTransferReport category: 'ServiciosFinancieros-Solucion'!
TransactionsReport subclass: #NetTransferReport
	instanceVariableNames: 'netTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!NetTransferReport methodsFor: 'double dispatch - transactions' stamp: 'JS 7/15/2021 16:06:35'!
visitDeposit: aDeposit! !

!NetTransferReport methodsFor: 'double dispatch - transactions' stamp: 'JS 7/15/2021 16:12:56'!
visitDepositLeg: aDepositLeg

	netTransfer := netTransfer + aDepositLeg value.! !

!NetTransferReport methodsFor: 'double dispatch - transactions' stamp: 'JS 7/15/2021 16:06:59'!
visitWithdraw: aWithdraw! !

!NetTransferReport methodsFor: 'double dispatch - transactions' stamp: 'JS 7/15/2021 16:12:53'!
visitWithdrawLeg: aWithdrawLeg

	netTransfer := netTransfer - aWithdrawLeg value.! !


!NetTransferReport methodsFor: 'initialization' stamp: 'JS 7/14/2021 05:29:00'!
initializeFor: anAccount

	super initializeFor: anAccount.
	netTransfer := 0 * peso.! !


!NetTransferReport methodsFor: 'evaluating' stamp: 'JS 7/12/2021 21:28:41'!
build

	self addTransactions.
	
	^netTransfer! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'JS 7/14/2021 05:29:23'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'signals' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'signals' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'error descriptions' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'error descriptions' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
