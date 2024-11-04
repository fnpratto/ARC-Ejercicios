.begin
    .org 2048

main:
    call suma_por_parametro
    call suma_por_registro  ! Fixed function name here
    call suma_por_pila

    x: 15   
    y: 9
    z: 0   

.end    

suma_por_parametro:
    ld [x], %r1
    ld [y], %r2
    call add_1
    st %r3, [z]
    jmpl %r15 + 4, %r0

add_1: 
    addcc %r1, %r2, %r3
    jmpl %r15 + 4, %r0
    

suma_por_registro:
    ld 5, %r1              ! Mover el valor 5 a %r1
    ld 10, %r2             ! Mover el valor 10 a %r2
    add %r1, %r2, %r3       ! Sumar %r1 y %r2, guardar el resultado en %r3
    jmpl %r15 + 4, %r0
    
suma_por_pila:
    addcc %sp, -4, %sp
    st %r1, %sp
    addcc %sp, -4, %sp
    st %r2, %sp
    call add_3
    ld %sp, %rept
    addcc %sp, 4, %sp

add_3:
    ld [%sp], %r8   
    addcc %sp, 4, %sp
    ld [%sp], %r9
    addcc %r8, %r9, %r10
    st %r10, [%sp]  
    jmpl %r15 + 4, %r0