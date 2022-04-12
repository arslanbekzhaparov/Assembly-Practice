$MODDE0CV

mov SP, #0x7f ; Initialize the Student Number on the HEX DISP

StudNum1 equ 0xf9 ; 1
StudNum2 equ 0x90 ; 9
StudNum3 equ 0x99 ; 4
StudNum4 equ 0x99 ; 4
StudNum5 equ 0x92 ; 5
StudNum6 equ 0x82 ; 6
StudNum7 equ 0x80 ; 8
StudNum8 equ 0xb0 ; 3

one equ 79H ; 	int 1
two equ 24H ; 	int 2
three equ 30H ; int 3

H_letter equ 09H ; int H
E_letter equ 06H ; int E
L_letter equ 47H ; int L
O_letter equ 40H ; int O
C_letter equ 46H ; int C
P_letter equ 0CH ; int P
N_letter equ 48H ; Int n

blank equ 01111111b ; 

initial:
	acall Is_Pressed		;call isPressed
	jmp initial			;self-loop

Is_Pressed:				;check for pressing the
	JNB KEY.3, latch	;if 0(not pressed) call latch
	ret					;else self loop


latch :				;reads the switch and latches it
	mov R3, SWA		;assign R3 to what the switch is
	mov LEDRA, R3	;the leds will match the switches basically
	
branch :

	cjne R3, #0, A000
	ljmp f000
	ret
A000:

cjne R3, #1, A001
		ljmp f001
ret
A001:

cjne R3, #2, A010
		ljmp f010
ret
A010:

cjne R3, #3, A011
		ljmp f011
ret
A011:

cjne R3, #4, A100
		ljmp f100
ret
A100:

cjne R3, #5, A101
		ljmp f101
ret
A101:

cjne R3, #6, A110
		ljmp f110
ret
A110:
cjne R3, #7, A111
		ljmp f111
ret
A111:
cjne R3, #10, A1010
		ljmp f1010
ret
A1010:
cjne R3, #11, A1011
		ljmp  f1011
ret
A1011:
cjne R3, #12, A1100
		ljmp  f1100
ret
A1100:
cjne R3, #13, A1101
		ljmp  f1101
ret
A1101:
cjne R3, #14, A1110
		ljmp  f1110
ret
A1110:
		ljmp  f111
ret
Full_Pause:			 ; this is a function that will delay for 1 second when called upon
    mov R2, #180 ; 180
L3: mov R1, #250 ; 250 is FAH 
L2: mov R0, #250
acall Is_Pressed
L1: djnz R0, L1  ; 3 machine cycles*30ns*250=22.5us
    djnz R1, L2  ; 22.5us*250=5.625ms
    djnz R2, L3  ; 5.625ms*180=1s
	ret
	
Half_Pause:			 ; this is a function that will delay for 1 second when called upon
    mov R2, #90  ; 90
L5: mov R1, #250 ; 250 is FAH 
L6: mov R0, #250
acall Is_Pressed
L4: djnz R0, L1  ; 3 machine cycles*30ns*250=22.5us
    djnz R1, L2  ; 22.5us*250=5.625ms
    djnz R2, L3  ; 5.625ms*180=0.5s
	ret
		
f000:					; if 000 display 194456
	mov HEX5, #StudNum1 ; displays 1 in HEX 5
	mov HEX4, #StudNum2 ; displays 9 in HEX 4
	mov HEX3, #StudNum3 ; displays 4 in HEX 3
	mov HEX2, #StudNum4 ; displays 4 in HEX 2
	mov HEX1, #StudNum5 ; displays 5 in HEX 1
	mov HEX0, #StudNum6 ; displays 6 in HEX 0
	
	acall Is_Pressed
	ljmp f000
	
f001:				 	; if 001 displays 19445683
	mov HEX5, #blank 	; displays blank
	mov HEX4, #blank 	; displays blank
	mov HEX3, #blank 	; displays blank
	mov HEX2, #blank 	; displays blank
	mov HEX1, #StudNum7 ; displays 7
	mov HEX0, #StudNum8 ; displays 8
	
	acall Is_Pressed
	ljmp f001
	
f010:					; if SW3(0)010 scroll to the left
	mov HEX5, #StudNum1 ; displays 1 in HEX 5
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #StudNum4 ; displays 4
	mov HEX1, #StudNum5 ; displays 5
	mov HEX0, #StudNum6 ; displays 6
	
	acall Full_Pause
	
	mov HEX5, #StudNum2 ; displays 9 in HEX 5
	mov HEX4, #StudNum3 ; displays 4
	mov HEX3, #StudNum4 ; displays 4
	mov HEX2, #StudNum5 ; displays 5
	mov HEX1, #StudNum6 ; displays 6
	mov HEX0, #StudNum7 ; displays 8
	
	acall Full_Pause
	
	mov HEX5, #StudNum3 ; displays 4 in HEX 5
	mov HEX4, #StudNum4 ; displays 4
	mov HEX3, #StudNum5 ; displays 5
	mov HEX2, #StudNum6 ; displays 6
	mov HEX1, #StudNum7 ; displays 8
	mov HEX0, #StudNum8 ; displays 3
	
	acall Full_Pause
	
	mov HEX5, #StudNum4 ; displays 4 in HEX 5
	mov HEX4, #StudNum5 ; displays 5
	mov HEX3, #StudNum6 ; displays 6
	mov HEX2, #StudNum7 ; displays 8
	mov HEX1, #StudNum8 ; displays 3
	mov HEX0, #StudNum1 ; displays 1
	
	acall Full_Pause
	
	mov HEX5, #StudNum5 ; displays 5 in HEX 5
	mov HEX4, #StudNum6 ; displays 6
	mov HEX3, #StudNum7 ; displays 8
	mov HEX2, #StudNum8 ; displays 3
	mov HEX1, #StudNum1 ; displays 1
	mov HEX0, #StudNum2 ; displays 9
	
	acall Full_Pause
	
	mov HEX5, #StudNum6 ; displays 6 in HEX 5
	mov HEX4, #StudNum7 ; displays 8
	mov HEX3, #StudNum8 ; displays 3
	mov HEX2, #StudNum1 ; displays 1
	mov HEX1, #StudNum2 ; displays 9
	mov HEX0, #StudNum3 ; displays 4
	
	acall Full_Pause
	
	mov HEX5, #StudNum7 ; displays 8 in HEX 5
	mov HEX4, #StudNum8 ; displays 3
	mov HEX3, #StudNum1 ; displays 1
	mov HEX2, #StudNum2 ; displays 9
	mov HEX1, #StudNum3 ; displays 4
	mov HEX0, #StudNum4 ; displays 4
	
	acall Full_Pause
	
	mov HEX5, #StudNum8 ; displays 3 in HEX 5
	mov HEX4, #StudNum1 ; displays 1
	mov HEX3, #StudNum2 ; displays 9
	mov HEX2, #StudNum3 ; displays 4
	mov HEX1, #StudNum4 ; displays 4
	mov HEX0, #StudNum5 ; displays 5
	
	acall Full_Pause
	acall Is_Pressed
	ljmp f010

f1010:					; if SW3(1)010 scroll to the left
	mov HEX5, #StudNum1 ; displays 1 in HEX 5
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #StudNum4 ; displays 4
	mov HEX1, #StudNum5 ; displays 5
	mov HEX0, #StudNum6 ; displays 6
	
	acall Half_Pause
	
	mov HEX5, #StudNum2 ; displays 9
	mov HEX4, #StudNum3 ; displays 4
	mov HEX3, #StudNum4 ; displays 4
	mov HEX2, #StudNum5 ; displays 5
	mov HEX1, #StudNum6 ; displays 6
	mov HEX0, #StudNum7 ; displays 8
	
	acall Half_Pause
	
	mov HEX5, #StudNum3 ; displays 4
	mov HEX4, #StudNum4 ; displays 4
	mov HEX3, #StudNum5 ; displays 5
	mov HEX2, #StudNum6 ; displays 6
	mov HEX1, #StudNum7 ; displays 8
	mov HEX0, #StudNum8 ; displays 3
	
	acall Half_Pause
	
	mov HEX5, #StudNum4 ; displays 4
	mov HEX4, #StudNum5 ; displays 5
	mov HEX3, #StudNum6 ; displays 6
	mov HEX2, #StudNum7 ; displays 8
	mov HEX1, #StudNum8 ; displays 3
	mov HEX0, #StudNum1 ; displays 1
	
	acall Half_Pause
	
	mov HEX5, #StudNum5 ; displays 5
	mov HEX4, #StudNum6 ; displays 6
	mov HEX3, #StudNum7 ; displays 8
	mov HEX2, #StudNum8 ; displays 3
	mov HEX1, #StudNum1 ; displays 1
	mov HEX0, #StudNum2 ; displays 9
	
	acall Half_Pause
	
	mov HEX5, #StudNum6 ; displays 6 
	mov HEX4, #StudNum7 ; displays 8
	mov HEX3, #StudNum8 ; displays 3
	mov HEX2, #StudNum1 ; displays 1
	mov HEX1, #StudNum2 ; displays 9
	mov HEX0, #StudNum3 ; displays 4
	
	acall Half_Pause
	
	mov HEX5, #StudNum7 ; displays 8
	mov HEX4, #StudNum8 ; displays 3
	mov HEX3, #StudNum1 ; displays 1
	mov HEX2, #StudNum2 ; displays 9
	mov HEX1, #StudNum3 ; displays 4
	mov HEX0, #StudNum4 ; displays 4
	
	acall Half_Pause
	
	mov HEX5, #StudNum8 ; displays 3
	mov HEX4, #StudNum1 ; displays 1
	mov HEX3, #StudNum2 ; displays 9
	mov HEX2, #StudNum3 ; displays 4
	mov HEX1, #StudNum4 ; displays 4
	mov HEX0, #StudNum5 ; displays 5
	
	acall Half_Pause
	acall Is_Pressed
	ljmp f1010

f011:					; if SW3(0)011 scroll to the right
	mov HEX5, #StudNum1 ; displays 1 in HEX 5
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #StudNum4 ; displays 4
	mov HEX1, #StudNum5 ; displays 5
	mov HEX0, #StudNum6 ; displays 6
	
	acall Full_Pause
	
	mov HEX5, #StudNum8 ; displays 3 in HEX 5
	mov HEX4, #StudNum1 ; displays 1
	mov HEX3, #StudNum2 ; displays 9
	mov HEX2, #StudNum3 ; displays 4
	mov HEX1, #StudNum4 ; displays 4
	mov HEX0, #StudNum5 ; displays 5
	
	acall Full_Pause
	
	mov HEX5, #StudNum7 ; displays 8 in HEX 5
	mov HEX4, #StudNum8 ; displays 3
	mov HEX3, #StudNum1 ; displays 1
	mov HEX2, #StudNum2 ; displays 9
	mov HEX1, #StudNum3 ; displays 4
	mov HEX0, #StudNum4 ; displays 4
	
	acall Full_Pause
	
	mov HEX5, #StudNum6 ; displays 6 in HEX 5
	mov HEX4, #StudNum7 ; displays 8
	mov HEX3, #StudNum8 ; displays 3
	mov HEX2, #StudNum1 ; displays 1
	mov HEX1, #StudNum2 ; displays 9
	mov HEX0, #StudNum3 ; displays 4
	
	acall Full_Pause
	
	mov HEX5, #StudNum5 ; displays 5 in HEX 5
	mov HEX4, #StudNum6 ; displays 6
	mov HEX3, #StudNum7 ; displays 8
	mov HEX2, #StudNum8 ; displays 3
	mov HEX1, #StudNum1 ; displays 1
	mov HEX0, #StudNum2 ; displays 9
	
	acall Full_Pause
	
	mov HEX5, #StudNum4 ; displays 4 in HEX 5
	mov HEX4, #StudNum5 ; displays 5
	mov HEX3, #StudNum6 ; displays 6
	mov HEX2, #StudNum7 ; displays 8
	mov HEX1, #StudNum8 ; displays 3
	mov HEX0, #StudNum1 ; displays 1
	
	acall Full_Pause
	
	mov HEX5, #StudNum3 ; displays 4 in HEX 5
	mov HEX4, #StudNum4 ; displays 4
	mov HEX3, #StudNum5 ; displays 5
	mov HEX2, #StudNum6 ; displays 6
	mov HEX1, #StudNum7 ; displays 8
	mov HEX0, #StudNum8 ; displays 3
	
	acall Full_Pause
	
	mov HEX5, #StudNum2 ; displays 9 in HEX 5
	mov HEX4, #StudNum3 ; displays 4
	mov HEX3, #StudNum4 ; displays 4
	mov HEX2, #StudNum5 ; displays 5
	mov HEX1, #StudNum6 ; displays 6
	mov HEX0, #StudNum7 ; displays 8
	
	acall Full_Pause
	acall Is_Pressed
	ljmp f011
	
f1011:					; if SW3(1)011 scroll to the right
	mov HEX5, #StudNum1 ; displays 1 in HEX 5
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #StudNum4 ; displays 4
	mov HEX1, #StudNum5 ; displays 5
	mov HEX0, #StudNum6 ; displays 6
	
	acall Half_Pause
	
	mov HEX5, #StudNum8 ; displays 3 in HEX 5
	mov HEX4, #StudNum1 ; displays 1
	mov HEX3, #StudNum2 ; displays 9
	mov HEX2, #StudNum3 ; displays 4
	mov HEX1, #StudNum4 ; displays 4
	mov HEX0, #StudNum5 ; displays 5
	
	acall Half_Pause
	
	mov HEX5, #StudNum7 ; displays 8 in HEX 5
	mov HEX4, #StudNum8 ; displays 3
	mov HEX3, #StudNum1 ; displays 1
	mov HEX2, #StudNum2 ; displays 9
	mov HEX1, #StudNum3 ; displays 4
	mov HEX0, #StudNum4 ; displays 4
	
	acall Half_Pause
	
	mov HEX5, #StudNum6 ; displays 6 in HEX 5
	mov HEX4, #StudNum7 ; displays 8
	mov HEX3, #StudNum8 ; displays 3
	mov HEX2, #StudNum1 ; displays 1
	mov HEX1, #StudNum2 ; displays 9
	mov HEX0, #StudNum3 ; displays 4
	
	acall Half_Pause
	
	mov HEX5, #StudNum5 ; displays 5 in HEX 5
	mov HEX4, #StudNum6 ; displays 6
	mov HEX3, #StudNum7 ; displays 8
	mov HEX2, #StudNum8 ; displays 3
	mov HEX1, #StudNum1 ; displays 1
	mov HEX0, #StudNum2 ; displays 9
	
	acall Half_Pause
	
	mov HEX5, #StudNum4 ; displays 4 in HEX 5
	mov HEX4, #StudNum5 ; displays 5
	mov HEX3, #StudNum6 ; displays 6
	mov HEX2, #StudNum7 ; displays 8
	mov HEX1, #StudNum8 ; displays 3
	mov HEX0, #StudNum1 ; displays 1
	
	acall Half_Pause
	
	mov HEX5, #StudNum3 ; displays 4 in HEX 5
	mov HEX4, #StudNum4 ; displays 4
	mov HEX3, #StudNum5 ; displays 5
	mov HEX2, #StudNum6 ; displays 6
	mov HEX1, #StudNum7 ; displays 8
	mov HEX0, #StudNum8 ; displays 3
	
	acall Half_Pause
	
	mov HEX5, #StudNum2 ; displays 9 in HEX 5
	mov HEX4, #StudNum3 ; displays 4
	mov HEX3, #StudNum4 ; displays 4
	mov HEX2, #StudNum5 ; displays 5
	mov HEX1, #StudNum6 ; displays 6
	mov HEX0, #StudNum7 ; displays 8
	
	acall Half_Pause
	acall Is_Pressed
	ljmp f1011
	
f100:					;if SW3(0)100 blink 194456
	
	mov HEX5, #StudNum3 ; displays 1 in HEX 5
	mov HEX4, #StudNum4 ; displays 9
	mov HEX3, #StudNum5 ; displays 4
	mov HEX2, #StudNum6 ; displays 4
	mov HEX1, #StudNum7 ; displays 5
	mov HEX0, #StudNum8 ; displays 6
	
	acall Full_Pause
	
	mov HEX5, #blank ; displays blank
	mov HEX4, #blank ; displays blank
	mov HEX3, #blank ; displays blank
	mov HEX2, #blank ; displays blank
	mov HEX1, #blank ; displays blank
	mov HEX0, #blank ; displays blank
	
	acall Full_Pause
	
	acall Is_Pressed
	ljmp f100
	
f1100:					;if SW3(1)100 blink 194456
	
	mov HEX5, #StudNum3 ; displays 1 in HEX 5
	mov HEX4, #StudNum4 ; displays 9
	mov HEX3, #StudNum5 ; displays 4
	mov HEX2, #StudNum6 ; displays 4
	mov HEX1, #StudNum7 ; displays 5
	mov HEX0, #StudNum8 ; displays 6
	
	acall Half_Pause
	
	mov HEX5, #blank ; displays blank
	mov HEX4, #blank ; displays blank
	mov HEX3, #blank ; displays blank
	mov HEX2, #blank ; displays blank
	mov HEX1, #blank ; displays blank
	mov HEX0, #blank ; displays blank
	
	acall Half_Pause
	
	acall Is_Pressed
	ljmp f1100
		
f101:				 ;if SW(3)101 type out 194456
	mov HEX5, #blank ; displays blank
	mov HEX4, #blank ; displays blank
	mov HEX3, #blank ; displays blank
	mov HEX2, #blank ; displays blank
	mov HEX1, #blank ; displays blank
	mov HEX0, #blank ; displays blank
	
	acall Full_Pause
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #blank 	; displays blank
	mov HEX3, #blank 	; displays blank
	mov HEX2, #blank 	; displays blank
	mov HEX1, #blank 	; displays blank
	mov HEX0, #blank 	; displays blank
	
	acall Full_Pause
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #blank ; displays blank
	mov HEX2, #blank ; displays blank
	mov HEX1, #blank ; displays blank
	mov HEX0, #blank ; displays blank
	
	acall Full_Pause
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #blank 	; displays blank
	mov HEX1, #blank 	; displays blank
	mov HEX0, #blank 	; displays blank
	
	acall Full_Pause
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #StudNum4 ; displays 4
	mov HEX1, #blank 	; displays blank
	mov HEX0, #blank 	; displays blank
	
	acall Full_Pause
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #StudNum4 ; displays 4
	mov HEX1, #StudNum5 ; displays 5
	mov HEX0, #blank 	; displays blank
	
	acall Full_Pause
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #StudNum4 ; displays 4
	mov HEX1, #StudNum5 ; displays 5
	mov HEX0, #StudNum6 ; displays 6
	
	acall Full_Pause
	
	acall Is_Pressed
	ljmp f101
	
f1101:				 ;if SW3(1)101 type out 194456
	mov HEX5, #blank ; displays blank
	mov HEX4, #blank ; displays blank
	mov HEX3, #blank ; displays blank
	mov HEX2, #blank ; displays blank
	mov HEX1, #blank ; displays blank
	mov HEX0, #blank ; displays blank
	
	acall Half_Pause
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #blank 	; displays blank
	mov HEX3, #blank 	; displays blank
	mov HEX2, #blank 	; displays blank
	mov HEX1, #blank 	; displays blank
	mov HEX0, #blank 	; displays blank
	
	acall Half_Pause
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #blank 	; displays blank
	mov HEX2, #blank 	; displays blank
	mov HEX1, #blank 	; displays blank
	mov HEX0, #blank 	; displays blank
	
	acall Half_Pause
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #blank 	; displays blank
	mov HEX1, #blank 	; displays blank
	mov HEX0, #blank 	; displays blank
	
	acall Half_Pause
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #StudNum4 ; displays 4
	mov HEX1, #blank 	; displays blank
	mov HEX0, #blank 	; displays blank
	
	acall Half_Pause
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #StudNum4 ; displays 4
	mov HEX1, #StudNum5 ; displays 5
	mov HEX0, #blank 	; displays blank
	
	acall Full_Pause
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #StudNum4 ; displays 4
	mov HEX1, #StudNum5 ; displays 5
	mov HEX0, #StudNum6 ; displays 6
	
	acall Half_Pause
	
	acall Is_Pressed
	ljmp f1101

f110:					;if 110 display hello then 194456 then CPN312

	mov HEX5, #H_letter ; displays H
	mov HEX4, #E_letter ; displays E
	mov HEX3, #L_letter ; displays L
	mov HEX2, #L_letter ; displays L
	mov HEX1, #O_letter	; displays O
	mov HEX0, #blank 	; displays blank
	
	acall Full_Pause
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #StudNum4 ; displays 4
	mov HEX1, #StudNum5 ; displays 5
	mov HEX0, #StudNum6 ; displays 6
	
	acall Full_Pause
	
	mov HEX5, #C_letter ; displays C
	mov HEX4, #P_letter ; displays P
	mov HEX3, #N_letter ; displays N
	mov HEX1, #one 		; displays 1
	mov HEX0, #two 		; displays 2
	mov HEX2, #three 	; displays 3
	
	acall Full_Pause
	
	acall Is_Pressed
	ljmp f110
	
f1110:				;	if SW3(1)110 display hello then 194456 then CPN312

	mov HEX5, #H_letter ; displays H
	mov HEX4, #E_letter ; displays E
	mov HEX3, #L_letter ; displays L
	mov HEX2, #L_letter ; displays L
	mov HEX1, #O_letter ; displays O
	mov HEX0, #blank 	; displays blank
	
	acall Half_Pause
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #StudNum2 ; displays 9
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #StudNum4 ; displays 4
	mov HEX1, #StudNum5 ; displays 5
	mov HEX0, #StudNum6 ; displays 6
	
	acall Half_Pause
	
	mov HEX5, #C_letter ; displays C
	mov HEX4, #P_letter ; displays P
	mov HEX3, #N_letter ; displays N
	mov HEX1, #one 		; displays 1
	mov HEX0, #two 		; displays 2
	mov HEX2, #three ; displays 3
	
	acall Half_Pause
	
	acall Is_Pressed
	ljmp f1110

f111:				;if 19445683 in all the displays
	
	mov HEX5, #StudNum1 ; displays 1
	mov HEX4, #StudNum1 ; displays 9
	mov HEX3, #StudNum1 ; displays 4
	mov HEX2, #StudNum1 ; displays 4
	mov HEX1, #StudNum1 ; displays 5
	mov HEX0, #StudNum1 ; displays 6
	
	acall Half_Pause
	
	mov HEX5, #StudNum2 ; displays 9
	mov HEX4, #blank ; displays blank
	mov HEX3, #StudNum2 ; displays 9
	mov HEX2, #blank ; displays blank
	mov HEX1, #StudNum2 ; displays 9
	mov HEX0, #blank ; displays blank
	
	acall Full_Pause
	
	mov HEX5, #StudNum3 ; displays 4
	mov HEX4, #StudNum3 ; displays 4
	mov HEX3, #StudNum3 ; displays 4
	mov HEX2, #StudNum3 ; displays 4
	mov HEX1, #StudNum3 ; displays 4
	mov HEX0, #StudNum3 ; displays 4
	
	acall Half_Pause
	
	mov HEX5, #blank ; displays blank
	mov HEX4, #StudNum4 ; displays 4
	mov HEX3, #blank ; displays blank
	mov HEX2, #StudNum4 ; displays 4
	mov HEX1, #blank ; displays blank
	mov HEX0, #StudNum4 ; displays 4
	
	acall Full_Pause
	
	mov HEX5, #StudNum5 ; displays 5
	mov HEX4, #StudNum5 ; displays 5
	mov HEX3, #StudNum5 ; displays 5
	mov HEX2, #StudNum5 ; displays 5
	mov HEX1, #StudNum5 ; displays 5
	mov HEX0, #StudNum5 ; displays 5
	
	acall Half_Pause
	
	mov HEX5, #StudNum6 ; displays 6
	mov HEX4, #blank ; displays blank
	mov HEX3, #blank ; displays blank
	mov HEX2, #blank ; displays blank
	mov HEX1, #blank ; displays blank
	mov HEX0, #StudNum6 ; displays 6
	
	acall Full_Pause
	
	mov HEX5, #StudNum7 ; displays 8
	mov HEX4, #StudNum7 ; displays 8
	mov HEX3, #StudNum7 ; displays 8
	mov HEX2, #StudNum7 ; displays 8
	mov HEX1, #StudNum7 ; displays 8
	mov HEX0, #StudNum7 ; displays 8
	
	acall Half_Pause
	
	mov HEX5, #blank ; displays blank
	mov HEX4, #blank ; displays blank
	mov HEX3, #StudNum8 ; displays 3
	mov HEX2, #StudNum8 ; displays 3
	mov HEX1, #blank ; displays blank
	mov HEX0, #blank ; displays blank
	
	acall Full_Pause
	
	acall Is_Pressed
	ljmp f111

END