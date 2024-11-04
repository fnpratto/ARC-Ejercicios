.begin
.org 2048
    call add_registro
add_registro: 
    mov 5, %r1              ! Mover el valor 5 a %r1
    mov 10, %r2             ! Mover el valor 10 a %r2
    addcc  %r1, %r2, %r3       ! Sumar %r1 y %r2, guardar el resultado en %
    jmpl %r15 + 4, %r0
    

.end
