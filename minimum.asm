  ; File: main.s


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
	LDR R0,=SIGN_DATA
	MOVS R3,#8
	LDRB R2,[R0]
	LSLS R2,R2,#24
	ASRS R2,R2,#24
	ADDS R0,#1

BEGIN
	LDRB R1,[R0]
	LSLS R1,R1,#24
	ASRS R1,R1,#24
	CMP R1,R2
	BGE NEXT
	MOV R2,R1
	
NEXT
	ADDS R0,#1
	SUBS R3,#1
	BNE BEGIN
	
	
		
	
STOP 
	B STOP


	

    END 