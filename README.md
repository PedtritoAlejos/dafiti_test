# dafiti_test
Dafiti Test 

1. Supongamos que en un repositorio GIT hiciste un commit y olvidaste un archivo.
Explica cómo se soluciona si hiciste push, y cómo si aún no hiciste. De ser posible,
que quede solo un commit con los cambios.

#### Respuesta : En el caso de no haber realizado un push, ocuparía el comando "git commit --amend --no-edit"


```
pealejosb@MacBook-Pro-de-pealejosb dafiti_test % git add archivo_olvidado.js 
pealejosb@MacBook-Pro-de-pealejosb dafiti_test % git commit --amend --no-edit
[main 66d8043] commit inicial

```

En el caso de haber realizado un push, ocuparía el el comando mencionado + un push forzado 
```
pealejosb@MacBook-Pro-de-pealejosb dafiti_test % git push -f origin main       
Enumerando objetos: 7, listo.
Contando objetos: 100% (7/7), listo.
Compresión delta usando hasta 16 hilos
Comprimiendo objetos: 100% (4/4), listo.
Escribiendo objetos: 100% (5/5), 893 bytes | 893.00 KiB/s, listo.
Total 5 (delta 0), reusado 0 (delta 0), pack-reusado 0
To https://github.com/PedtritoAlejos/dafiti_test.git
   9b98fcf..66d8043  main -> main
pealejosb@MacBook-Pro-de-pealejosb dafiti_test % 

```

