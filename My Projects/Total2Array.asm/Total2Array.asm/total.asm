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

EXTERNDEF	total:NEAR

.code
	total:
		push ebp
		mov ebp, esp

		mov eax, 0
		mov [ebp - 4], eax
		mov [ebp - 8], eax

	loopy:
		mov eax, [ebp - 4]
		cmp eax, [ebp + 20]
		je exit

		sal eax, 2
		add eax, [ebp + 16]
		mov eax, [eax]
		sal eax, 2
		add eax, [ebp + 8]
		mov eax, [eax]
		add [ebp - 8], eax

		inc dword ptr [ebp - 4]
		jmp loopy

	exit:
		mov eax, [ebp - 8]
		pop ebp
		ret 16

	end