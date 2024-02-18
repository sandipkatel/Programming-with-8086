;Write a program to read the string and convert it into upper case
;if it is in lower case and display the resulting string.
.MODEL SMALL
.STACK 32
.DATA
	MAXLEN DB 50
	ACTLEN DB ?
	ACTSTR DB 50 DUP('$')
.CODE
MAIN PROC FAR
	MOV AX, @DATA
	MOV DS, AX

	MOV DX, OFFSET MAXLEN
	MOV AH, 0AH
	INT 21H
	
	MOV AH, 02H
	MOV DL, 0DH
	INT 21H
	MOV DL, 0AH
	INT 21H

	
	MOV SI, OFFSET ACTSTR
	MOV CX, 0H
	MOV CL, ACTLEN
CHECK: MOV DL, [SI]
	CMP DL, 60H
	JL OK
	SUB DL, 20H
	MOV [SI], DL
OK:	INC SI
	LOOP CHECK

MOV DX, OFFSET ACTSTR
MOV AH, 09H
INT 21H

MOV AX, 4C00H
INT 21H

MAIN ENDP
END MAIN
