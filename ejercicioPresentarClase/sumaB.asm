! Programa principal - Paso de parámetros por pila
.section ".data"
var1: .word 10
var2: .word 20
resultado: .word 0

.section ".text"
.global _start

_start:
    set var1, %o0
    ld [%o0], %o1         ! Cargar var1 en %o1
    set var2, %o0
    ld [%o0], %o2         ! Cargar var2 en %o2

    ! Paso de parámetros por pila
    save %sp, -96, %sp    ! Reservar espacio en pila
    st %o1, [%sp + 64]    ! Guardar var1 en la pila
    st %o2, [%sp + 68]    ! Guardar var2 en la pila

    call sumar            ! Llamar a la subrutina
    nop

    set resultado, %o0    ! Guardar el resultado en memoria
    st %o0, [%o0]

    ! Salida del programa
    mov 1, %g1
    ta 0

sumar:
    ld [%sp + 64], %o1    ! Recuperar el primer operando
    ld [%sp + 68], %o2    ! Recuperar el segundo operando
    add %o1, %o2, %o0     ! Suma los valores
    ret
    restore
