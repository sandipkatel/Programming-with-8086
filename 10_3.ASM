TITLE TAKE INPUT n AND DISPLAY SUM OF MULTIPLICATION UPTO n
.MODEL SMALL
.STACK 64
.DATA
	MAXLEN DB 100
	ACTLEN DB ?
	SENTENCE DB 100 DUP('$')
	COUNT DW ?
	RESCOUNT DB 8 DUP('$')
.CODE
MAIN PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		
		MOV DX, OFFSET MAXLEN
		MOV AH, 0AH
		INT 21H
		
		MOV SI, OFFSET SENTENCE
		MOV BX, 00H
CHECK: 	MOV DL, [SI]
		CMP DL, '$'
		JE EXIT
		CMP DL, ' '
		JNE CONTINUE
		INC BX
CONTINUE:INC SI
		LOOP CHECK 
		
EXIT:	INC BX
		MOV COUNT, BX
		CALL NUM2STR

		MOV AX, 0200H
		MOV DX, 0DH
		INT 21H
		MOV DX, 0AH
		INT 21H

		MOV DX, OFFSET 	RESCOUNT
		MOV AH, 09H
		INT 21H

		MOV AH, 4CH
		INT 21H
MAIN ENDP

NUM2STR PROC NEAR
	MOV BX, 10
	MOV AX, COUNT
	MOV DI, 0080H

NEXT: XOR DX, DX
	DIV BX
	ADD DX, 30H
	MOV [DI], DX
	INC DI
	CMP AX, 00
	JNE NEXT

	;REVERSE THE STRING
	MOV CX, DI
	MOV SI, DI
	SUB CX, 80H
	MOV DI, OFFSET RESCOUNT
ASCII:	DEC SI
	MOV AL, [SI]
	MOV [DI], AL
	INC DI
	LOOP ASCII
	RET
NUM2STR ENDP
END