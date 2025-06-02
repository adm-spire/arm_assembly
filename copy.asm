  ; File: main.s

RAM1_ADDR EQU 0x20000000
RAM2_ADDR EQU 0x20000100

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
	BL FILL
	BL COPY

STOP
    B STOP

FILL    
    LDR R1,=RAM1_ADDR
	MOVS R0,#10
	LDR R2,=0xDEADBEEF

L1 
	STR R2,[R1]
	ADDS R1,#4
	SUBS R0,#1
	BNE L1
	BX  LR

COPY 
	LDR R1,=RAM1_ADDR
	LDR R2,=RAM2_ADDR
	MOVS R0,#10

L2
	LDR R3,[R1]
	STR R3,[R2]
	ADDS R1,#4
	ADDS R2,#4
	SUBS R0,#1
	BNE L2
	BX LR
	
	

    END 