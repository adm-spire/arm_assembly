  ; File: main.s
  ;(A+8B+7C-27)/4
  ;A = 25 B = 19 C=99


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
	MOVS R0,#25
	MOVS R1,#19
	LSLS R1,R1,#3
	ADDS R0,R1
	MOVS R1,#99
	MOVS R2,#7
	MULS R2,R1,R2
	ADD R0,R2
	SUBS R0,#27
	ASRS R0,R0,#2
	
	
		
	
STOP 
	B STOP


	

    END 