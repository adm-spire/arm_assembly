 ; File: main.s

    AREA STACK, NOINIT, READWRITE, ALIGN=3
StackSize EQU 0x100
StackMem  SPACE StackSize
	
	AREA mydata , DATA , READWRITE
A SPACE 4
D SPACE 4
C SPACE 4

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
	LDR R0,=A
	MOVS R1,#5
	STR R1,[R0]
	
	LDR R0,=D
	MOVS R1,#4
	STR R1,[R0]
	
	LDR R0,=C
	MOVS R1,#200
	STR R1,[R0]
	
	


STOP
    B STOP

    END 
