!Forma de invocar una rutina regular

    !rutina invocante

        ld [x], %r1
        ld [y], %r2
        call add_1
        st %r3, [z]

        x: 15   
        y: 9
        z: 0    

    !rutina invocada

        add_1: addcc %r1, %r2, %r3
        jmp jmpl %r15 + 4, %

!zona de transferencia de datos.

    !rutina invocante

        st  %r1, [x]
        st %r2, [y]

        sethi x, %r5

        srl %r5,10,%r5

        call add_2

        ld [x+8], %r3


    !zona de transferencia de datos.
        x: .dwb 3

    !rutina invocada

    add_2: ld %r5, %r8
            ld %r5+4, %r9
            addcc %r8, %r9, %r10
            st %r10, %r5 +8
            jmpl %r15 + 4, %    
        

!Llamadas a subrutinas utiliza una pila. 


    !la rutina invocante coloca (empuja) todos sus argumentos
    !(o punteros a los mismos) en una pila secuencial del tipo LIFO (last in first out). 
    !La rutina invocada extrae de la pila los  argumentos transferidos, a la vez que coloca en la misma cualquier valor que deba retornar. 
    !El programa invocante, a su vez, rescata de la pila los valores devueltos por la rutina !invocada y continüa con la ejecuci6n.

    !El registro de la CPU conocido como puntero a la pila (stack pointer) contiene Ia direcci6n de la cabeza de la !pila. 
    Muchas maquinas tienen instrucciones dei tipo push y pop que, automåticamente, decrementan e incrementan el puntero !a la pila cuando se colocan elementos en la pila o cuando se los extrae de la misma.

    !rutina invocante 

        %sp: .equ %r14
        addcc %sp, -4, %sp
        st %r1, %sp
        addcc %sp, -4, %sp
        st %r2, %sp 
        call add_3
        ld %sp, 4,%sp

    ! rutina invocada

    %sp: .equ %r14
    add_3: ld [%sp], %r8
            addcc %sp, 4, %sp
            ld [%sp], %r9
            addcc %r8, %r9, %r10
            st %r10, [%sp]
            jmpl %r15 + 4, %r0


    !Ventaja:
    !El uso de una pila es que el tamafio de la misma aumenta o disminuye a medida que resulta necesario. 
    !Esto admite Ia posibilidad de encadenar llamadas a procedimientos, en cantidad arbitraria, sin tener que declarar el tamaöo de la pila en el momento del ensamble.

    !Funcionamiento:

    !El registro *r 14 sirve como puntero a la pila (%sp), el que se inicializa desde el sistema operativo con anterioridad a Ia ejecuci6n de la rutina que 10 requiere, 

    !La rutina invocante coloca sus argumentos erl y en Ia pila a través del decremento del puntero a la pila (10 que ubica al registro apuntando a la primera palabra libre por encima de la pila) tras 10 cual se almacena cada argumento en la nueva posici6n apuntada en la pila.
    !Se invoca a la subrutina add 3, la que rescata sus argumentos de la pila, realiza la operaci6n de suma y deja su resultado en la pila antes de retornar,
    !La rutina invocante recupera su argumento de la primera direccion de la pila y continua su ejecuci6n.

    !Cualquiera sea la convenciön de llamada, se utiliza para el llamado la instrucci6n call, la que rescata el valor actual del contador de programa en 5. Cuando la subrutina completa su ejecuci6n, necesita volver a Ia direcci6n de la instrucci6n siguiente a la que efectu6 la llamada, Ia que se encuentra una palabra (cuatro bytes) después del valor rescatado dcl PC Por consiguiente, la sentencia "jmpl Cr15 + 4, %rO" completa el retorno.

    !No obstante, si ta rutina invocada llama a su vez a Otra rutina, el valor del contador de programa que habfa Sido guardado originalmente en 5 se verå sobrescrito por la llamada encadenada, 10 que implica que no se podrå retornar correctamente al programa  original a través de 5. Con el objeto de permitir llamadas y retornos encadenados, el valor actual de 5 (llamado registro de enlace) deberia rescatarse en la pila, junto con cualquier Otro registro que requiera ser recuperado Iuego del retorno.


    !Convencion llamada basada en registros

    !Si se utiliza una convenci6n de llamada basada en registros, antes de proceder a una llamada encadenada deberfa rescatarse el registro de enlace en alguno de los registros disponibles.