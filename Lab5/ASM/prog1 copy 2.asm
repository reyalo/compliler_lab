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


    INVOKE scanf, ADDR input_integer_format, ADDR a

    mov edx,0
    mov ecx,i
    mov eax,a

whl:
    cmp ecx,eax
    jg endd
    add edx ,ecx
    add ecx,1
    jmp whl

endd:
    mov number,edx





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