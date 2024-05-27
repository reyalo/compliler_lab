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
a sdword ?

.code
main proc
    ;scanf("%d", &number);


    push ebp
    mov ebp,esp
    sub ebp,100

    push eax
    push ebx 
    push ecx
    push edx
    push [ebp+0]
    push [ebp+4]
    push ebp
    INVOKE scanf, ADDR input_integer_format, ADDR a
    pop ebp
    pop [ebp+4]
    pop [ebp+0]
    pop edx
    pop ecx 
    pop ebx 
    pop eax

    mov edx,a;

    mov dword ptr [ebp+0],edx

    push eax
    push ebx 
    push ecx
    push edx
    push [ebp+0]
    push [ebp+4]
    push ebp
    INVOKE scanf, ADDR input_integer_format, ADDR a
    pop ebp
    pop [ebp+4]
    pop [ebp+0]
    pop edx
    pop ecx 
    pop ebx 
    pop eax

    mov edx,a;

    mov dword ptr [ebp+4],edx
    
    
    
    mov eax,0
    add eax,[ebp+0]
    add eax,[ebp+4]

    add eax,100

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