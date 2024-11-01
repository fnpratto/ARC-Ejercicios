! Programa principal - Paso de parámetros por registros
.section ".data"
var1: .word 10
var2: .word 20
resultado: .word 0

.section ".text"
.global _start

_start:
    set var1, %o0         ! Cargar dirección de var1 en %o0
    ld [%o0], %o1         ! Cargar el valor de var1 en %o1
    set var2, %o0         ! Cargar dirección de var2 en %o0
    ld [%o0], %o2         ! Cargar el valor de var2 en %o2

    call sumar            ! Llamar a la subrutina
    nop                   ! Instrucción de delay slot

    set resultado, %o0    ! Cargar dirección de resultado en %o0
    st %o0, [%o0]         ! Almacenar el resultado en memoria

    ! Salida del programa
    mov 1, %g1            ! Código de salida
    ta 0                  ! Llamada al sistema para salir

sumar:                    ! Subrutina para sumar
    add %o1, %o2, %o0     ! Suma los valores de %o1 y %o2, guarda en %o0
    ret                   ! Retornar de la subrutina
    restore
