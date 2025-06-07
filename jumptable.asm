
num EQU 2

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
	MOV R0,#0
	MOV R1,#3
	MOV R2,#2
	
	BL arithfunc
STOP 
	B STOP

arithfunc
	CMP R0,#num
	MOVHS PC,LR
	ADRL R3,jumptable
	LDR PC,[R3,R0,LSL #2]
jumptable
	DCD doadd
	DCD dosub
doadd
	ADD R0,R1,R2
	BX LR
dosub 
	SUBS R0,R1,R2
	BX LR

	


	
    END 