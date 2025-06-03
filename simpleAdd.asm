  ; File: main.s

Q EQU 2
R EQU 4
S EQU 5


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
	MOVS R1,#Q
	MOVS R2,#R
	MOVS R3,#S
	ADDS R1,R2
	ADDS R1,R3
	
	

STOP
    B STOP


	

    END 