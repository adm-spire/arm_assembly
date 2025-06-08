

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
	ORR R1,R1,#(0xF<<20);
	STR R1,[R0]
	DSB
	ISB
	
	VLDR.F32 S0,=1.04719
	BL Calculator
	
	
STOP 
	B STOP

Calculator
	VLDR.F32 S1,invfact3
	VLDR.F32 S2,invfact5
	VLDR.F32 S3,invfact7
	
	VMUL.F32 S4,S0,S1 ;x/3!
	VMUL.F32 S7,S0,S0 ;x^2
	VMUL.F32 S5,S0,S2 ;x/5!
	VMUL.F32 S4,S4,S7 ;x^3/3!
	VMUL.F32 S8,S7,S7 ;x^4
	
	VMUL.F32 S6,S0,S3 ;x/7!
	VSUB.F32 S10,S0,S4 ;x-x^3/3!
	VMUL.F32 S9,S7,S8 ;x^6
	VMUL.F32 S5,S5,S8 ;x^5/5!
	VMUL.F32 S6,S6,S9 ;x^7/7!
	VADD.F32 S10,S10,S5 ;x-x^3/3! + x^5/5!
	VSUB.F32 S0,S10,S6 ;x-x^3/3! + x^5/5! - x^7/7!
	
	BX LR
	
invfact3 DCD 0x3e2aaaab ;1/3!
invfact5 DCD 0x3c088889 ;1/5!
invfact7 DCD 0x39500d00 ;1/7!

	ALIGN
    END 