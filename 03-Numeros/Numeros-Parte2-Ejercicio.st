!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/27/2021 20:31:35'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'JS 5/29/2021 22:48:10'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !


!Numero methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 03:22:00'!
beAddedToAnEntero: anEnteroAugend

	^self subclassResponsibility ! !

!Numero methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 03:22:09'!
beMultipliedByAnEntero: anEnteroMultiplier

	^self subclassResponsibility ! !

!Numero methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 03:22:21'!
beSubstractedFromAnEntero: anEnteroMinuend

	^self subclassResponsibility ! !

!Numero methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 03:22:30'!
divideAnEntero: anEnteroDividend

	^self subclassResponsibility ! !


!Numero methodsFor: 'operations with fracciones' stamp: 'JS 5/30/2021 03:21:54'!
beAddedToAFraccion: aFraccionAugend

	^self subclassResponsibility ! !

!Numero methodsFor: 'operations with fracciones' stamp: 'JS 5/30/2021 03:22:04'!
beMultipliedByAFraccion: aFraccionMultiplier

	^self subclassResponsibility ! !

!Numero methodsFor: 'operations with fracciones' stamp: 'JS 5/30/2021 03:22:16'!
beSubstractedFromAFraccion: aFraccionMinuend

	^self subclassResponsibility ! !

!Numero methodsFor: 'operations with fracciones' stamp: 'JS 5/30/2021 03:22:25'!
divideAFraccion: aFraccionDividend

	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'JS 5/30/2021 03:23:21'!
invalidNumberTypeErrorDescription

	^ 'Tipo de N�mero Inv�lido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'JS 5/30/2021 03:59:04'!
* aMultiplicand

	^aMultiplicand beMultipliedByAnEntero: self
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JS 5/30/2021 03:59:08'!
+ anAdder

	^anAdder beAddedToAnEntero: self
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JS 5/30/2021 03:59:10'!
- aSubtrahend 

	^aSubtrahend beSubstractedFromAnEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JS 5/30/2021 03:59:13'!
/ aDivisor 

	^aDivisor divideAnEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JS 5/30/2021 17:56:23'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.

	^ (self - one) fibonacci + (self - two) fibonacci! !


!Entero methodsFor: 'comparing' stamp: 'JS 5/30/2021 18:03:23'!
= anObject

	^(anObject isKindOf: self class) and: [self integerValue = anObject integerValue]! !

!Entero methodsFor: 'comparing' stamp: 'JS 5/30/2021 18:04:43'!
hash

	^self integerValue hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'JS 5/30/2021 18:09:37'!
printOn: aStream

	aStream print: self integerValue ! !


!Entero methodsFor: 'testing' stamp: 'JS 5/30/2021 18:11:16'!
isNegative
	
	^false! !

!Entero methodsFor: 'testing' stamp: 'JS 5/30/2021 18:11:22'!
isOne
	
	^false! !

!Entero methodsFor: 'testing' stamp: 'JS 5/30/2021 18:11:27'!
isZero
	
	^false! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/30/2021 18:03:41'!
// aDivisor 
	
	^Entero with: self integerValue // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'JS 5/30/2021 18:04:00'!
greatestCommonDivisorWith: anEntero 
	
	^Entero with: (self integerValue gcd: anEntero integerValue)! !


!Entero methodsFor: 'operations with fracciones' stamp: 'JS 5/30/2021 03:59:55'!
beAddedToAFraccion: aFraccionAugend

	| newNumerator |

	newNumerator := aFraccionAugend numerator + (aFraccionAugend denominator * self).
	^newNumerator / aFraccionAugend denominator! !

!Entero methodsFor: 'operations with fracciones' stamp: 'JS 5/30/2021 04:00:06'!
beMultipliedByAFraccion: aFraccionMultiplier

	| newNumerator |

	newNumerator := aFraccionMultiplier numerator * self.
	^newNumerator / aFraccionMultiplier denominator! !

!Entero methodsFor: 'operations with fracciones' stamp: 'JS 5/30/2021 04:00:17'!
beSubstractedFromAFraccion: aFraccionMinuend

	^self negated beAddedToAFraccion: aFraccionMinuend! !

!Entero methodsFor: 'operations with fracciones' stamp: 'JS 5/30/2021 04:00:25'!
divideAFraccion: aFraccionDividend

	^(Entero with: 1)/self beMultipliedByAFraccion: aFraccionDividend! !


!Entero methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 04:00:02'!
beAddedToAnEntero: anEnteroAugend

	^Entero with: anEnteroAugend integerValue + self integerValue! !

!Entero methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 20:25:28'!
beDividedByAnEntero: AnEnteroDivisor

	| greatestCommonDivisor numerator denominator |
	
	greatestCommonDivisor := self greatestCommonDivisorWith: AnEnteroDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := AnEnteroDivisor // greatestCommonDivisor.

	^denominator divideAnEnteroCoprimo: numerator

! !

!Entero methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 04:00:13'!
beMultipliedByAnEntero: anEnteroMultiplier

	^Entero with: anEnteroMultiplier integerValue * self integerValue! !

!Entero methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 04:00:20'!
beSubstractedFromAnEntero: anEnteroMinuend

	^self negated beAddedToAnEntero: anEnteroMinuend! !

!Entero methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 20:02:45'!
divideAnEntero: AnEnteroDividend

	^AnEnteroDividend beDividedByAnEntero: self
! !

!Entero methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 20:27:26'!
divideAnEnteroCoprimo: aDividendCoprime

	^Fraccion new initializeWith: aDividendCoprime over: self! !


!Entero methodsFor: 'validations' stamp: 'JS 5/30/2021 17:49:27'!
throwErrorOnInvalidDenominator

	^nil! !

!Entero methodsFor: 'validations' stamp: 'JS 5/30/2021 17:47:46'!
throwErrorOnInvalidNumerator

	^nil! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'JS 5/30/2021 03:27:44'!
negativeFibonacciErrorDescription

	^ ' Fibonacci no est� definido aqu� para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'JS 5/30/2021 18:40:44'!
shouldInitialize: aValue

	self subclassResponsibility! !

!Entero class methodsFor: 'instance creation' stamp: 'JS 5/30/2021 18:48:06'!
with: aValue

	| valueClass valueInstance |

	valueClass := self subclasses detect: [:enteroSubclass | enteroSubclass shouldInitialize: aValue] 
						      ifNone: [self error: self invalidNumberTypeErrorDescription].
	valueInstance := valueClass new initalizeWith: aValue.
	^valueInstance! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'testing' stamp: 'JS 5/30/2021 18:11:42'!
isZero

	^true! !


!Cero methodsFor: 'validations' stamp: 'JS 5/30/2021 17:47:46'!
throwErrorOnInvalidNumerator

	self error: 'una fraccion no puede ser cero'! !


!Cero methodsFor: 'arithmetic operations' stamp: 'JS 5/30/2021 17:57:26'!
fibonacci

	^Entero with: 1! !


!Cero methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 20:04:54'!
beDividedByAnEntero: AnEnteroDivisor

	^self! !

!Cero methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 19:53:48'!
divideAnEntero: AnEnteroDividend

	self error: Fraccion canNotDivideByZeroErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'instance creation' stamp: 'JS 5/30/2021 18:40:44'!
shouldInitialize: aValue

	^aValue = 0! !


!classDefinition: #EnteroMayorAUno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroMayorAUno class' category: 'Numeros-Parte2-Ejercicio'!
EnteroMayorAUno class
	instanceVariableNames: ''!

!EnteroMayorAUno class methodsFor: 'instance creation' stamp: 'JS 5/30/2021 18:40:44'!
shouldInitialize: aValue

	^aValue > 1! !


!classDefinition: #EnteroNegativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroNegativo methodsFor: 'testing' stamp: 'JS 5/30/2021 18:12:08'!
isNegative

	^true! !


!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'JS 5/30/2021 17:58:36'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription! !


!EnteroNegativo methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 19:55:47'!
divideAnEntero: AnEnteroDividend
	
	^AnEnteroDividend negated / self negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNegativo class' category: 'Numeros-Parte2-Ejercicio'!
EnteroNegativo class
	instanceVariableNames: ''!

!EnteroNegativo class methodsFor: 'instance creation' stamp: 'JS 5/30/2021 18:40:44'!
shouldInitialize: aValue

	^aValue < 0! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'testing' stamp: 'JS 5/30/2021 18:11:55'!
isOne

	^true! !


!Uno methodsFor: 'arithmetic operations' stamp: 'JS 5/30/2021 17:57:34'!
fibonacci

	^Entero with: 1! !


!Uno methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 20:27:12'!
divideAnEnteroCoprimo: aDividendCoprime

	^aDividendCoprime! !


!Uno methodsFor: 'validations' stamp: 'JS 5/30/2021 17:49:14'!
throwErrorOnInvalidDenominator

	self error: 'una fraccion no puede tener denominador 1 porque sino es un entero'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'instance creation' stamp: 'JS 5/30/2021 18:40:44'!
shouldInitialize: aValue

	^aValue = 1! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JS 5/30/2021 03:39:34'!
* aMultiplier

	^aMultiplier beMultipliedByAFraccion: self
	
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JS 5/30/2021 03:39:40'!
+ anAdder

	^anAdder beAddedToAFraccion: self
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JS 5/30/2021 03:39:44'!
- aSubtrahend

	^aSubtrahend beSubstractedFromAFraccion: self
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JS 5/30/2021 03:39:49'!
/ aDivisor

	^aDivisor divideAFraccion: self
	! !


!Fraccion methodsFor: 'comparing' stamp: 'JS 5/30/2021 03:39:58'!
= anObject

	^(anObject isKindOf: self class) and: [(numerator * anObject denominator) = (denominator * anObject numerator)]! !

!Fraccion methodsFor: 'comparing' stamp: 'JS 5/30/2021 18:17:07'!
hash

	^(self numerator hash / self denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'JS 5/30/2021 17:50:14'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator throwErrorOnInvalidNumerator.
	aDenominator throwErrorOnInvalidDenominator.
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'JS 5/30/2021 18:18:11'!
isNegative
	
	^self numerator isNegative! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !



!Fraccion methodsFor: 'printing' stamp: 'JS 5/30/2021 18:18:29'!
printOn: aStream

	aStream 
		print: self numerator;
		nextPut: $/;
		print: self denominator ! !


!Fraccion methodsFor: 'operations with fracciones' stamp: 'JS 5/30/2021 04:01:34'!
beAddedToAFraccion: aFraccionAugend

	| newNumerator newDenominator |

	newNumerator := (aFraccionAugend numerator * self denominator) + 
				    (aFraccionAugend denominator * self numerator).
	newDenominator := aFraccionAugend denominator * self denominator.
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'operations with fracciones' stamp: 'JS 5/30/2021 04:01:41'!
beMultipliedByAFraccion: aFraccionMultiplier

	| newNumerator newDenominator |
	
	newNumerator := aFraccionMultiplier numerator * self numerator.
	newDenominator := aFraccionMultiplier denominator * self denominator.
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'operations with fracciones' stamp: 'JS 5/30/2021 04:01:47'!
beSubstractedFromAFraccion: aFraccionMinuend

	| newNumerator newDenominator |

	newNumerator := (aFraccionMinuend numerator * self denominator) - 
				    (aFraccionMinuend denominator * self numerator).
	newDenominator := aFraccionMinuend denominator * self denominator.
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'operations with fracciones' stamp: 'JS 5/30/2021 04:01:53'!
divideAFraccion: aFraccionDividend

	| newNumerator newDenominator |

	newNumerator := aFraccionDividend numerator * self denominator.
	newDenominator := aFraccionDividend denominator * self numerator.
	^newNumerator / newDenominator! !


!Fraccion methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 04:01:38'!
beAddedToAnEntero: anEnteroAugend

	^anEnteroAugend beAddedToAFraccion: self! !

!Fraccion methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 04:01:45'!
beMultipliedByAnEntero: anEnteroMultiplier

	^anEnteroMultiplier beMultipliedByAFraccion: self! !

!Fraccion methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 04:01:50'!
beSubstractedFromAnEntero: anEnteroMinuend

	^anEnteroMinuend beAddedToAFraccion: self negated! !

!Fraccion methodsFor: 'operations with enteros' stamp: 'JS 5/30/2021 04:01:56'!
divideAnEntero: anEnteroDividend

	^anEnteroDividend beMultipliedByAFraccion: (self denominator / self numerator)! !
