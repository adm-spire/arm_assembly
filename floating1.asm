

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
	LDR R0,=0xE000ED88
	LDR R1,[R0]
	ORR R1,R1,#(0xF<<20)
	STR R1,[R0]
	
	VMOV.F S0,#0x3F800000
	VMOV.F S1,S0
	VADD.F S2,S1,S0
	

	
STOP 
	B STOP

	ALIGN
    END 