    AREA STACK, NOINIT, READWRITE, ALIGN=3
StackSize EQU 0x100
StackMem  SPACE StackSize
	AREA projectdata , DATA , READONLY
SIGN_DATA DCB +13,-10,+9,+14,-18,-9,+12,-19,+16

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
	LDR R0 ,=SIGN_DATA
	MOVS R3,#9
	MOVS R2,#0
	
LOOP
	LDRB R1, [R0]        ; Load byte (unsigned)
    LSLS R1, R1, #24     ; Move sign bit to MSB
    ASRS R1, R1, #24     ; Arithmetic shift right to sign-extend
	ADD R2,R1
	ADDS R0,#1
	SUBS R3,#1
	BNE LOOP
	
	
		
	
STOP 
	B STOP


	

    END 