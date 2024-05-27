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

.code
main proc
    ;scanf("%d", &number);


    push ebp
    mov ebp,esp
    sub ebp,100


    mov eax,2
    mov ebx,20

whl:
    cmp eax,ebx
    jge endd
    add eax,3
    
    cmp eax,10
    jge whl
    push eax
    push ebx 
    push ecx
    push edx
    INVOKE printf, ADDR output_integer_msg_format, eax
    pop edx
    pop ecx 
    pop ebx 
    pop eax
    jmp whl

endd:
    
    ret
main endp
end