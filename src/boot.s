/*
    Booter
    Connects to C
*/

.section ".text.boot"
.global _start

_start:
    mrs x0, mpidr_el1
    and x0, x0, #0xFF
    cbnz x0, .park

    ldr x0, =__stack_top
    mov sp, x0

    ldr x0, =__bss_start
    ldr x1, =__bss_end
.zero:
    cmp x0, x1
    b.ge .done
    str xzr, [x0], #8
    b .zero
.done:
    bl kernel_main

.park:
    wfe
    b .park
