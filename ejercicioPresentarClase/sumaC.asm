! Programa principal - Paso de parámetros por área de memoria reservada
.section ".data"
var1: .word 10
var2: .word 20
resultado: .word 0
params: .word 0, 0        ! Área de memoria para parámetros

.section ".text"
.global _start

_start:
    set var1, %o0
    ld [%o0], %o1
    set var2, %o0
    ld [%o0], %o2

    set params, %o0
    st %o1, [%o0]         ! Guardar var1 en params[0]
    st %o2, [%o0 + 4]     ! Guardar var2 en params[1]

    call sumar
    nop

    set resultado, %o0    ! Guardar el resultado en memoria
    st %o0, [%o0]

    ! Salida del programa
    mov 1, %g1
    ta 0

sumar:
    set params, %o0
    ld [%o0], %o1         ! Cargar params[0] en %o1
    ld [%o0 + 4], %o2     ! Cargar params[1] en %o2
    add %o1, %o2, %o0     ! Sumar valores
    ret
    restore
