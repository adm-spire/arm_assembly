


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
	
	ADRL R1,ConstantTable
	VLDR.F S2,[R1,#20]
	VLDR.F S3,[R1,#12]
	VMUL.F S4,S2,S3
	
	

	
STOP 
	B STOP

ConstantTable
	DCD 0x3f800000      ;1.0
	DCD 0x40000000		 ;2.0
    DCD 0x80000000			 ;-0.0
	DCD 0x41200000		 ;10.0
	DCD 0x42c80000		 ;100.0
	DCD 0x40490fdb		 ;pi
	DCD 0x402df854		 ;e


	
    END 