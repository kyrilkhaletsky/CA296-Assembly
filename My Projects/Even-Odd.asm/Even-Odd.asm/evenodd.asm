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

EXTERNDEF	evenodd:NEAR

.data
a		DWORD	2	DUP(0)

.code
	evenodd:
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
		mov eax, [eax]

		;; MOD
		mov edx, 0
		mov ecx, 2
		div ecx

		cmp edx, 0
		je eveny
		jne oddy

	eveny:
		inc [a]
		inc dword ptr [ebp - 4]
		jmp loopy

	oddy:
		inc [a + 4]
		inc dword ptr [ebp - 4]
		jmp loopy

	exit:
		mov eax, offset a
		pop ebp
		ret 8

	end