TITLE PROGRAM TO SUM FOUR 16 BIT NUMS
.MODEL SMALL
.STACK 64
.DATA
        VAL1 DW 1234H
        VAL2 DW 2345H
        VAL3 DW 3435H
        VAL4 DW 3456H
        SUM DW ?
.CODE
MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX
        MOV AX, VAL1
        ADD AX, VAL2
        ADD AX, VAL3
        ADD AX, VAL3
        MOV SUM, AX
        MOV AX, 4C00H
        INT 21H
MAIN ENDP
END

