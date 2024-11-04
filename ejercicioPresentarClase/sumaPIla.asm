.begin
.org 2048
    addcc %r14,-4, %r14
    st %r1, %r14
    addcc %r14 ,-4, %r14
    st %r2, %r14
    call add_3
    ld %r14,4, %r14
    
add_3:  ld [%r14], %r8
        addcc %r14, 4, %r14
        ld [%r14], %r9
        addcc %r8, %r9, %r10
        st %r10, [%r14]
        jmpl %r15 + 4, %r0

.end