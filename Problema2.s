    .syntax unified
    .cpu cortex-a9
    .fpu neon-fp16

    .text
    .global _start
_start:
    /* Cargar X */
    ldr   r0, =X        @ r0 ← &X
    ldr   r0, [r0]      @ r0 ← X

    /* Inicializar resultado */
    mov   r1, #1        @ r1 ← 1

loop:
    cmp   r0, #1        @ si r0 ≤ 1, terminamos
    ble   done
    mul   r1, r1, r0    @ r1 ← r1 * r0
    sub   r0, r0, #1    @ r0 ← r0 - 1
    b     loop

done:
    /* Bucle infinito para inspección en CPUlator */
    b     done

    .data
    .align 2
X:  .word 5            @ valor inicial de X (cambia aquí)

    .end
