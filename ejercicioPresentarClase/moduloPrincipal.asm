.begin
.org 2048

.macro push a
	add %r14, -4, %r14
	st a, %r14
.endmacro
.macro pop b
	ld %r14, b
	add %r14, 4, %r14
.endmacro

main:
    push %r15		! Pusheo %r15 al stack ya que vengo de un proceso invocante y al hacer call en main pierdo la referencia
    call suma_registro
    call suma_parametros
    call suma_pila

    x: 15   
    y: 9
    z: 0   
fin:	pop %r15		! Pop de %r15 para luego devolver al proceso invocante
	jmpl %r15, 4, %r0


suma_parametros:
    ld [x], %r1
    ld [y], %r2
    call add_1
    st %r3, [z]
    jmpl %r15 + 4, %r0
suma_registro: 
    mov 5, %r1              ! Mover el valor 5 a %r1
    mov 10, %r2             ! Mover el valor 10 a %r2
    addcc  %r1, %r2, %r3       ! Sumar %r1 y %r2, guardar el resultado en %
    jmpl %r15 + 4, %r0
    
suma_pila:
    addcc %r14, -4, %r14      ! Ajustar el puntero de stack
    st %r1, %r14              ! Almacenar %r1 en la dirección apuntada por %r14
    addcc %r14, -4, %r14      ! Ajustar el puntero de stack
    st %r2, %r14              ! Almacenar %r2 en la dirección apuntada por %r14
    call add_3                ! Llamar a la rutina add_3
    ld %r14, 4, %r14          ! Ajustar el puntero de stack de vuelta
    jmpl %r15 + 4, %r0

add_1: 
    addcc %r1, %r2, %r3
    jmpl %r15 + 4, %r0

add_3: 
    ld [%r14], %r8            ! Cargar el primer operando en %r8
    addcc %r14, 4, %r14       ! Ajustar el puntero de stack
    ld [%r14], %r9            ! Cargar el segundo operando en %r9
    addcc %r8, %r9, %r10      ! Sumar %r8 y %r9, guardar el resultado en %r10
    st %r10, %r14           ! Almacenar el resultado en la dirección apuntada por %r14
    jmpl %r15 + 4, %r0        ! Regresar a la instrucción siguiente a la llamada


.end