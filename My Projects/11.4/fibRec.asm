.586
.model flat,stdcall
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

includelib p:\masm32\lib\ca296.lib
includelib kernel32.lib
includelib user32.lib
includelib msvcrt.lib

EXTERNDEF	fibRec:NEAR
.data
.code
fibRec:
	push	ebp				; save base pointer
	mov		ebp,esp			; set EBP to beginning of current stack frame
	sub		esp,4			; create space for storing fib(n - 1)
	mov eax, [ebp+8]
	cmp eax, 1
	jg loopy
	mov ecx, 1
	jmp fin

loopy:
	dec eax
	mov [ebp-4], eax
	push eax
	call fibRec
	mov eax, [ebp-4]
	dec eax
	mov [ebp-4], ecx
	push eax
	call fibRec
	mov eax, [ebp-4]
	add ecx, eax

fin:
	mov eax, ecx
	mov		esp,ebp			
	pop		ebp				
	ret 4
end fibRec