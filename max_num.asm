  ; File: main.s
COUNT RN R0
MAX RN R1
POINTER RN R2
NEXT RN R3

    AREA STACK, NOINIT, READWRITE, ALIGN=3
StackSize EQU 0x100
StackMem  SPACE StackSize
	AREA projectdata , DATA , READONLY
MYDATA DCD 69,87,86,45,75

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
	MOVS COUNT,#5
	MOVS MAX,#0
	LDR POINTER,=MYDATA
	
	
	
AGAIN
	LDR NEXT,[POINTER]
	CMP MAX,NEXT
	BHS CTNU
	MOV MAX,NEXT

CTNU
	ADDS POINTER,#4
	SUBS COUNT,#1
	BNE AGAIN
	
	
	
	
STOP 
	B STOP


	

    END 