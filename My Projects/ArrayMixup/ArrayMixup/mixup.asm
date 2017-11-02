;
; CA296 Console Template
; Version 1
;

;
; Preamble
;

.586
.model flat,stdcall
.stack 4096
option casemap:none

include     c:\masm32\include\windows.inc
include     c:\masm32\include\kernel32.inc
include		c:\masm32\include\user32.inc
include		c:\masm32\include\msvcrt.inc
include		c:\masm32\include\ca296.inc

includelib c:\masm32\lib\ca296.lib
includelib kernel32.lib
includelib user32.lib
includelib msvcrt.lib
;
; Data & Code
;

EXTERNDEF		mixup:NEAR

.code
	mixup:
		push ebp
		mov ebp, esp
		mov eax, 0
		mov [ebp - 4], eax

	loopy:
		mov eax, [ebp - 4]
		cmp eax, [ebp + 12]
		je exit

		sal eax, 2
		add eax, [ebp + 8]
		mov ebx, eax
		mov eax, [eax]
		sal eax, 2
		add eax, [ebp + 8]
		mov eax, [eax]
		mov [ebx], eax
		inc dword ptr [ebp - 4]
		jmp loopy

	exit:
		pop ebp
		ret 8
	end