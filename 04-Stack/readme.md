# Profiling

Después de lo charlado en clase sobre cómo implementar el mensaje size, seguimos la sugerencia de Luciano de realizar comparaciones entre las dos formas
para averiguar si realmente valía la pena sacrificar minimamente la declaratividad por el gran problema de performance que puede traer implementarlo de forma tal
que haya que calcular el tamaño cada vez que se utiliza el mensaje.

Tomamos valores a partir de 10k porque antes no hay mucha diferencia, todo ronda los 2 milisegundos.

Todas los tiempos está expresados en milisegundos.

| Elementos  | Accesos a size | stackWithVariable | stackWithCalculation | stackWithVariable-jit | stackWithCalculation-jit |
|------------|----------------|-------------------|----------------------|-----------------------|--------------------------|
| 10k        | 1              | ~4                | ~270                 | ~1                    | ~15                      |
| 10k        | 5              | ~4                | ~1500                | ~1                    | ~80                      |
| 50k        | 1              | ~20               | ~350                 | ~5                    | ~20                      |
| 50k        | 5              | ~20               | ~1750                | ~5                    | ~120                     |
| 100k       | 1              | ~35               | ~400                 | ~5                    | ~30                      |
| 100k       | 5              | ~35               | ~2400                | ~5                    | ~200                     |
| 500k       | 1              | ~200              | ~1900                | ~40                   | ~150                     |
| 500k       | 5              | ~200              | ~10000               | ~40                   | ~800                     |

Cómo se puede observar en la tabla, si se va a trabajar con una gran cantidad de inputs, realmente es conveniente implementar el mensaje size en la forma
en la que lo hicimos originalmente. Si la idea es trabajar con stacks chiquitos que no van a consultar mucho su tamaño, quizás sí conviene favorecer la declaratividad
e implementar size de la forma en la que lo hicimos en OOStackProfiling.

El código utilizado para probar esto es:

```
stackWithVariable := OOStack new.
stackWithCalculation := OOStackProfiling new.

"10k elementos"
OOStackTest timeToOperateAStack: stackWithVariable withElements: 10000 withSizeAcceses: 1.   
OOStackTest timeToOperateAStack: stackWithCalculation withElements: 10000  withSizeAcceses: 1.    

OOStackTest timeToOperateAStack: stackWithVariable withElements: 10000 withSizeAcceses: 5.    
OOStackTest timeToOperateAStack: stackWithCalculation withElements: 10000  withSizeAcceses: 5.    

"50k elementos"
OOStackTest timeToOperateAStack: stackWithVariable withElements: 50000 withSizeAcceses: 1.   
OOStackTest timeToOperateAStack: stackWithCalculation withElements: 50000  withSizeAcceses: 1.    

OOStackTest timeToOperateAStack: stackWithVariable withElements: 50000 withSizeAcceses: 5.    
OOStackTest timeToOperateAStack: stackWithCalculation withElements: 50000  withSizeAcceses: 5. 
  
"100k elementos"
OOStackTest timeToOperateAStack: stackWithVariable withElements: 100000 withSizeAcceses: 1.   
OOStackTest timeToOperateAStack: stackWithCalculation withElements: 100000  withSizeAcceses: 1. 

OOStackTest timeToOperateAStack: stackWithVariable withElements: 100000 withSizeAcceses: 5.   
OOStackTest timeToOperateAStack: stackWithCalculation withElements: 100000  withSizeAcceses: 5.  

"500k elementos"
OOStackTest timeToOperateAStack: stackWithVariable withElements: 500000 withSizeAcceses: 1. 
OOStackTest timeToOperateAStack: stackWithCalculation withElements: 500000  withSizeAcceses: 1.   

OOStackTest timeToOperateAStack: stackWithVariable withElements: 500000 withSizeAcceses: 5.    
OOStackTest timeToOperateAStack: stackWithCalculation withElements: 500000  withSizeAcceses: 5. 
```

# Parte extra

Cuando realizamos el análisis pedido para esta parte, nos dimos cuenta que el modelo con OrderedCollection es mucho más sencillo para extenederlo de esta forma, ya que a una OrderedCollection se la puede inicializar con initializeOfSize.

No lo realizamos ya que hubiese implicado rehacer el punto 1 del tp.
