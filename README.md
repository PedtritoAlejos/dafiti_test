# dafiti_test
Dafiti Test 

1. Supongamos que en un repositorio GIT hiciste un commit y olvidaste un archivo.
Explica cómo se soluciona si hiciste push, y cómo si aún no hiciste. De ser posible,
que quede solo un commit con los cambios.

#### Respuesta : En el caso de no haber realizado un push, ocuparía el comando "git commit --amend --no-edit"


```bash
pealejosb@MacBook-Pro-de-pealejosb dafiti_test % git add archivo_olvidado.js 
pealejosb@MacBook-Pro-de-pealejosb dafiti_test % git commit --amend --no-edit
[main 66d8043] commit inicial

```

En el caso de haber realizado un push, ocuparía el el comando mencionado + un push forzado 

```bash
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

2. Si has trabajado con control de versiones ¿Cuál/es han sido los flujos con los que
has trabajado? ¿Cuál ha sido la situación más compleja que has tenido con esto?

#### Respuesta : He trabajado con el flujo llamado "GitHubFlow", no me he encontrado con situaciones complejas, los equipos eran de 2 a 3 personas, según mi experiencia lo recomiendo para equipos pequeños con features diarias.

3. ¿Qué experiencia has tenido con microservicios?

#### Respuesta: No tengo experiencia con microservicios

4. ¿Cuál es tu servicio favorito de AWS? ¿Por qué?
### Respuesta: No cuento con experiencia en AWS.

## Ejercicio (en el lenguaje que más te acomode)
Escribir una función que determine si un conjunto de cartas de una lista representan una
escalera de poker (5 cartas con valores consecutivos) o no.
Las cartas siempre tienen valores entre 2 y 14, donde 14 es el AS.
Tener en cuenta que el AS también cuenta como 1.
La cantidad de cartas puede variar, pero nunca es superior a 7.
Ejemplos:
escalera: 14-2-3-4-5
escalera: 9-10-11-12-13
escalera: 2-7-8-5-10-9-11
no es escalera: 7-8-12-13-14

```javascript
function getConsecutiveNumber (list) {

    return list.reduce( (acc,value,index,array) =>{

            acc['count'] = ( (acc['value'] + 1 ) === value  ) ? (acc['count'] + 1 ) : acc['count']
            acc['count'] = ( index === (array.length -1) && (value - 1) == acc['value']  ) ? (acc['count'] + 1 ) :  acc['count']
            
            acc['value'] = value
        
            return acc
            
        },{'count':0});
}
function isStraight (list) {

   if(list >7 || list <5){
       return false
   }

   list = list.map( (value) =>  (value === 14) ? 1 : value );
   list = list.sort( (a,b) => a -b );
   
   let listCard = getConsecutiveNumber(list);

   return ( listCard.count >= 5 )
    

}
module.exports = isStraight

```

El archivo de prueabas unitarias ( con el framework JEST)

```javascript
const isStraight = require("../src/poker");


describe('TEST_ESCALERA_POKER_VALIDO', () =>{
    
    test('14-2-3-4-5',() =>{
        expect(isStraight([14,2,3,4,5])).toBe(true)
    });
    test('9-10-11-12-13', ()=>{
        expect( isStraight([9,10,11,12,13])).toBe(true)
    })
    test('2-7-8-5-10-9-11', () =>{
        expect( isStraight([2,7,8,5,10,9,11]) ).toBe(true)
    })
    test('7-8-12-13-14', () =>{
        expect( isStraight([7,8,12,13,14]) ).toBe(false)
    })

    test('2,3,4,5,6', () =>{
        expect( isStraight([ 2,3,4,5,6 ])).toBe(true)
    })
    test('14,5,4,2,3', () =>{
        expect( isStraight([ 14,5,4,2,3 ])).toBe(true)
    })
    test('2,3,4,5,6', () =>{
        expect( isStraight([ 2,3,4,5,6 ])).toBe(true)
    })
    test('7,7,12,11,3,4,14', () =>{
        expect( isStraight([ 7,7,12,11,3,4,14 ])).toBe(false)
    })
    test('7,3,2', () =>{
        expect( isStraight([ 7,3,2 ])).toBe(false)
    })

});


```

Al ejecutar las pruebas con jest, el resultado es el deseado :

```bash
pealejosb@MacBook-Pro-de-pealejosb dafiti_test % npm test

> dafiti_test@1.0.0 test /Users/pealejosb/Documents/PERSONAL/REPOSITORIOS/dafiti_test
> jest

 PASS  __test__/poker.test.js
  TEST_ESCALERA_POKER_VALIDO
    ✓ 14-2-3-4-5 (2 ms)
    ✓ 9-10-11-12-13
    ✓ 2-7-8-5-10-9-11
    ✓ 7-8-12-13-14
    ✓ 2,3,4,5,6
    ✓ 14,5,4,2,3
    ✓ 2,3,4,5,6
    ✓ 7,7,12,11,3,4,14
    ✓ 7,3,2 (1 ms)

Test Suites: 1 passed, 1 total
Tests:       9 passed, 9 total
Snapshots:   0 total
Time:        0.337 s, estimated 1 s
Ran all test suites.
pealejosb@MacBook-Pro-de-pealejosb dafiti_test % 

```

## Escribir las queries para:
#### 1. ¿Cuál es el jugador más viejo de cada equipo?

```sql

/* JUGADOR MAS VIEJO DE CADA EQUIPO */


select  e.nombre as nombre_equipo ,j.nombre as nombre_jugador, j.fecha_nacimiento 
FROM EQUIPO.jugadores j 
INNER JOIN 
(
    SELECT  fk_equipos,  min(fecha_nacimiento) as oldDate
    FROM EQUIPO.jugadores 
    GROUP BY fk_equipos
)
j2 ON j2.fk_equipos  = j.fk_equipos AND j.fecha_nacimiento  = j2.oldDate
INNER JOIN EQUIPO.equipos e ON e.id_equipos  = j.fk_equipos 
ORDER BY j.id_jugadores 


```
Resultado :
```bash
nombre_equipo|nombre_jugador|fecha_nacimiento   |
-------------|--------------|-------------------|
colo-colo    |vegeta        |1990-08-31 00:00:00|
concepcion   |cooler        |1990-08-31 00:00:00|
```

    
#### 2. ¿Cuántos partidos jugó de visitante cada equipo? (nota: hay equipos no jugaron
ningún partido)

```sql

/* CUANTAS PARTIDOS JUGÓ DE VISITANTE CADA EQUIPO */

SELECT  e.id_equipos ,e.nombre ,IFNULL( p.cantidad_visitante,0) as cantidad_visitante
FROM EQUIPO.equipos e 
LEFT JOIN 
(
select  fk_equipo_visitante as id_equipo,
        count( p.fk_equipo_visitante ) as cantidad_visitante
from EQUIPO.partidos p 
group by p.fk_equipo_visitante 
) p ON e.id_equipos  = p.id_equipo

```
Resultado :
```
id_equipos|nombre    |cantidad_visitante|
----------|----------|------------------|
         1|colo-colo |                 2|
         2|concepcion|                 5|
         3|valdivia  |                 0|
         4|chacarita |                 1|
```

#### 3. ¿Qué equipos jugaron el 01/01/2016 y el 12/02/2016?

```sql
/*¿Qué equipos jugaron el 01/01/2016 y el 12/02/2016?*/

select p.fecha_partido, 
(select nombre from equipos e2 where e2.id_equipos = fk_equipo_local ) as nombre_equipo_local,
(select nombre from equipos e2 where e2.id_equipos = fk_equipo_visitante ) as nombre_equipo_visitante
from partidos p 
where p.fecha_partido  in ('2016-01-01','2016-02-12')

```

Resultado :
```bash
fecha_partido      |nombre_equipo_local|nombre_equipo_visitante|
-------------------|-------------------|-----------------------|
2016-01-01 00:00:00|valdivia           |concepcion             |
2016-02-12 00:00:00|colo-colo          |concepcion             |
```

#### 4. Diga el total de goles que hizo el equipo “Chacarita” en su historia (como local o visitante)

```sql

/* Diga el total de goles que hizo el equipo “Chacarita” en su historia (como local o
visitante)  */


select id_equipos, 
        nombre,
        (
        SELECT  sum(p.goles_local) as total_goles_local
        FROM EQUIPO.partidos p
        where p.fk_equipo_local  = id_equipos
        GROUP by p.fk_equipo_local
        
        )as total_goles_local,
        (
        SELECT  sum(p.goles_visitante) as total_goles_visitante
        FROM EQUIPO.partidos p
        where p.fk_equipo_visitante = id_equipos
        GROUP by p.fk_equipo_visitante 
        
        )as total_goles_visitante,
        
        (
        
         (
            SELECT  sum(p.goles_local) as total_goles_local
            FROM EQUIPO.partidos p
            where p.fk_equipo_local  = id_equipos
            GROUP by p.fk_equipo_local
        
        ) +
        (
        
            SELECT  sum(p.goles_visitante) as total_goles_visitante
            FROM EQUIPO.partidos p
            where p.fk_equipo_visitante = id_equipos
            GROUP by p.fk_equipo_visitante 
        )
        
        
        ) as total_goles
        
        
from EQUIPO.equipos e 
where nombre = 'chacarita'
```
Resultado :

```bash
id_equipos|nombre   |total_goles_local|total_goles_visitante|total_goles|
----------|---------|-----------------|---------------------|-----------|
         4|chacarita|               14|                   10|         24|
```

#### 5. Necesitamos tener registro de los jugadores que hacen cada gol en los partidos,
¿cómo lo harías?
```
Una tabla intermedia que almacene los goles realizados por el jugador en el partido, la tabla debe contener los siguientes campos:

fk_partido,
fk_jugador,
cantidad_gol
    
```