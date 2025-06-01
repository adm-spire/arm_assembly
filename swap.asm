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
	LDR R0,=0xABCDABCD
	LDR R1,=0xDEADBEEF
	EORS R0, R1      
	EORS R1, R0      
	EORS R0, R1 

STOP
    B STOP

    END 