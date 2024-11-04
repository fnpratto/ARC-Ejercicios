!ERROR NO RECONOCE .equ (Preguntar)

.begin
 .org 2048

 !rutina invocante 

        sp .equ %r14
        addcc %sp, -4, %sp
        st %r1, %sp
        addcc %sp, -4, %sp
        st %r2, %sp 
        call add_3
        ld %sp, 4,%sp
        
        .end


    ! rutina invocada

    !%sp: .equ %r14
    add_3: ld [%sp], %r8
            addcc %sp, 4, %sp
            ld [%sp], %r9
            addcc %r8, %r9, %r10
            st %r10, [%sp]
            jmpl %r15 + 4, %r0