! Este programa suma dos numeros

    .begin
    .org 2048
prog1: ld [x], %r1
    ld [y], %r2
    addcc %r1, %r2, %r3
    st %r3, [z]

done: jmpl %r15 + 4, %r0


x: 15
y: 9
z: 0
.end