    ; File: main.s

    AREA STACK, NOINIT, READWRITE, ALIGN=3
StackSize EQU 0x100
StackMem  SPACE StackSize

    AREA RESET, DATA, READONLY
    EXPORT __Vectors

__Vectors
    DCD StackMem + StackSize      ; Initial stack pointer
    DCD Reset_Handler             ; Reset handler
    ALIGN

    AREA SimpleProject, CODE, READONLY, ALIGN=2
    ENTRY
    EXPORT Reset_Handler

Reset_Handler
    MOVS R5, #0x12
    MOVS R3, #0x12
    ADDS R6, R5, R3

STOP
    B STOP

    END