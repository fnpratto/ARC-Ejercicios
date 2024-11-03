.begin
    .org 2048

main:
    ! Initialize variables var1 and var2
    set 10, %r4        ! var1 = 10
    set 20, %r5        ! var2 = 20
    set resultado, %r6  ! Set address for storing the result
    
    call suma_por_parametro
    call suma_por_registro  ! Fixed function name here
    call suma_por_pila

    ! Variable declarations
    var1: 10              ! Define var1 with initial value 10
    var2: 20              ! Define var2 with initial value 20
    resultado: 0          ! Define storage for result

.end    

suma_por_parametro:
    ld [var1], %r1
    ld [var2], %r2
    addcc %r1, %r2, %r3
    st %r3, [resultado]
    jmpl %r15 + 4, %r0

! Uso de registros: 
! %r6 - Suma 
! %r4 - variable 1 
! %r5 - variable 2

suma_por_registro:
    addcc %r4, %r5, %r6
    st %r6, [resultado]
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
    ld [%sp], %r8   ! Corrected to dereference the stack pointer
    addcc %sp, 4, %sp
    ld [%sp], %r9   ! Corrected to dereference the stack pointer
    addcc %r8, %r9, %r10
    st %r10, [%sp]  ! Corrected to use brackets for stack pointer
    jmpl %r15 + 4, %r0