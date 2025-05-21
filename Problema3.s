        .data
        .equ TECLA, 0x1000     @ Dirección de memoria de la tecla
        .equ CONTADOR, 0x2000  @ Dirección del contador

        .text
        .global _start

_start:
        LDR r1, =TECLA         @ r1 almacena dirección de la tecla
        LDR r2, =CONTADOR      @ r2 almacena dirección del contador

loop:
        @ Leer valor de la tecla
        LDR r3, [r1]           @ Cargar valor de la tecla en r3

        @ Comparar con flecha arriba (0xE048)
        LDR r4, =0xE048        
        CMP r3, r4
        BEQ incrementar

        @ Comparar con flecha abajo (0xE050)
        LDR r4, =0xE050
        CMP r3, r4
        BEQ decrementar

        B loop                @ Si no es válido, repetir

incrementar:
        LDR r5, [r2]           @ Cargar valor actual del contador
        ADD r5, r5, #1         @ Incrementar
        STR r5, [r2]           @ Guardar nuevo valor
        B loop

decrementar:
        LDR r5, [r2]           @ Cargar valor actual del contador
        SUB r5, r5, #1        @ Decrementar
        STR r5, [r2]           @ Guardar nuevo valor
        B loop