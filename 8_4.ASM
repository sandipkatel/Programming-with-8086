.MODEL SMall
.stack 32
.data
	arr db 50 dup('$')
.code
	main proc far
	MOV AX, @DATA
	MOV DS, AX

	MOV CL, 10H
	MOV AH, 01H
INPUT:	INT 21H
	MOV ARR[SI], AL
	INC SI
	LOOP INPUT

	MOV AH, 02H
	MOV DL, 0DH
	INT 21H
	MOV DL, 0AH
	INT 21H
	
	MOV CL, 10H
	MOV SI, 00H
OUTPUT: MOV DL, ARR[SI]
	INT 21H
	INC SI
	LOOP OUTPUT


MOV AX, 4C00H
INT 21H

MAIN ENDP
END