.global main

main:
    MOV r0, #4 //este es el X     
    CMP r0, #0      
    BNE calcular    
    MOV r0, #1      //Si es 0
    B fin

calcular:
    MOV r1, r0      
    MOV r2, r0      
    SUB r1, #1      
    CMP r1, #0      
    BEQ fin

bucle:
    MUL r2, r2, r1  // r2 = r2 * r1
    SUBS r1, #1     // Decrementar contador y actualizar flags
    BNE bucle       

fin:
    MOV r0, r2      //R en r0
    BX lr           
