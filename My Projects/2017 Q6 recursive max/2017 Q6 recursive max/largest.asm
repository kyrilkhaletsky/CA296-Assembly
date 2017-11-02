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

EXTERNDEF	largest:NEAR

.code
	largest:
		push ebp
		mov ebp, esp

		mov ebx, [ebp + 12]
		cmp ebx, 1
		jg notBase
		mov eax, 0
		add eax, [ebp + 8]
		mov eax, [eax]
		jmp exit

	notBase:
		mov ebx, [ebp + 12]
		dec ebx
		push ebx
		push [ebp + 8]
		call largest
		mov edx, [ebp + 12]
		dec edx
		sal edx, 2
		add edx, [ebp + 8]
		mov edx, [edx]
		cmp edx, eax
		jg newMax
		jmp exit

	newMax:
		mov eax, edx

	exit:
		pop ebp
		ret 8

	end