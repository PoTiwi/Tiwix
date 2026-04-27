ENTRY(_start)

SECTIONS
{
    . = 0x40000000;

    .text : {
        src/boot.o(.text.boot)
        *(.text*)
    }

    .rodata : {
        *(.rodata*)
    }

    .data : {
        *(.data*)
    }

    .bss : {
        __bss_start = .;
        *(.bss*)
        *(COMMON)
        __bss_end = .;
    }

    . = ALIGN(16);
    . = . + 0x8000;
    __stack_top = .;
}
