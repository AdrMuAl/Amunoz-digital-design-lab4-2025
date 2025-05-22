        .data
array:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  @ Arreglo de 10 elementos
y:      .word 5                             @ Constante y = 5

        .text
        .global _start

_start:
        LDR r0, =array       @ Carga la dirección del arreglo en r0
        LDR r1, =y           @ Carga la dirección de y en r1
        LDR r1, [r1]         @ Obtiene el valor de y en r1
        MOV r2, #0           @ Inicializa contador i = 0 (r2)

loop:
        CMP r2, #10          @ Compara i con 10
        BGE end              @ Si i >= 10, termina el bucle

        LDR r3, [r0, r2, LSL #2]  @ Carga array[i] en r3
        CMP r3, r1           @ Compara array[i] con y
        BLT else             @ Si array[i] < y, salta a else

        MUL r3, r3, r1       @ array[i] = array[i] * y
        B store              @ Salta a store

else:
        ADD r3, r3, r1       @ array[i] = array[i] + y

store:
        STR r3, [r0, r2, LSL #2]  @ Guarda el resultado en array[i]
        ADD r2, r2, #1       @ Incrementa i
        B loop               @ Repite el bucle

end:
        B end                @ Bucle infinito para terminar
	