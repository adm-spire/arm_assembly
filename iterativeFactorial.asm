

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
	MOV R0,#8

Fact 
	MOV R1,#1
LOOP
	CMP R0,#1
	BLS done
	MUL R1,R0,R1
	SUB R0,R0,#1
	B LOOP
done
	MOV R0,R1
	BX LR
	
	

	
;STOP 
;	B STOP

	ALIGN
    END 