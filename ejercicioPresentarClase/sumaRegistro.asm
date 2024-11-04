.begin
.org 2048
    call add_registro    
.end

add_registro: 
    ld 5, %r1              ! Mover el valor 5 a %r1
    ld 10, %r2             ! Mover el valor 10 a %r2
    add %r1, %r2, %r3       ! Sumar %r1 y %r2, guardar el resultado en %r3
    jmpl %r15 + 4, %r0
    