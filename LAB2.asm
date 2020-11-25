.MODEL SMALL
.DATA
N DB 6
A DB 05, 07, 04, 03, 06, 02

.CODE
MOV AX, @DATA
MOV DS, AX

LEA SI, A
MOV CL, N
DEC CL

OUTLOOP:
      MOV CH, CL
      MOV SI, 00H
      
INLOOP:
      MOV AL, A[SI]
      INC SI
      CMP AL, A[SI]
      JC NOEXCHANGE
      XCHG AL, A[SI]
      MOV A[SI-1], AL
      
NOEXHANGE:
      DEC CH
      JNZ INLOOP
      DEC CL
      JNZ OUTLOOP
      
MOV AH, 4CH
INT 21H
END