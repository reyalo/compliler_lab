.686
.model flat, c
include C:\masm32\include\msvcrt.inc  ;header file
includelib C:\masm32\lib\msvcrt.lib   ;library

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
input_integer_format byte "%d",0
output_integer_msg_format byte "%d", 0Ah, 0
number sdword ?
a sdword 10
b sdword 20
cc sdword 10
i sdword 1

.code
main proc
    ;scanf("%d", &number);
    ;INVOKE scanf, ADDR input_integer_format, ADDR number

    ;printf("%d\n", number);
    ;INVOKE printf, ADDR output_integer_msg_format, number
    mov eax,a
    mov ebx,b
    mov ecx,cc
    add eax,ebx
    sub eax,ecx
    mov number,eax
    push eax
    push ebx 
    push ecx
    push edx


    INVOKE printf, ADDR output_integer_msg_format, number

    pop edx
    pop ecx 
    pop ebx 
    pop eax




    ret
main endp
end