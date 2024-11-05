.begin
.org 2048
    addcc %r14, -4, %r14      ! Ajustar el puntero de stack
    st %r1, %r14              ! Almacenar %r1 en la dirección apuntada por %r14
    addcc %r14, -4, %r14      ! Ajustar el puntero de stack
    st %r2, %r14              ! Almacenar %r2 en la dirección apuntada por %r14
    call add_3                ! Llamar a la rutina add_3
    ld %r14, 4, %r14          ! Ajustar el puntero de stack de vuelta
    
add_3: 
    ld [%r14], %r8            ! Cargar el primer operando en %r8
    addcc %r14, 4, %r14       ! Ajustar el puntero de stack
    ld [%r14], %r9            ! Cargar el segundo operando en %r9
    addcc %r8, %r9, %r10      ! Sumar %r8 y %r9, guardar el resultado en %r10
    st %r10, %r14           ! Almacenar el resultado en la dirección apuntada por %r14
    jmpl %r15 + 4, %r0        ! Regresar a la instrucción siguiente a la llamada

.end
