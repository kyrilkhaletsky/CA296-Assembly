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

EXTERNDEF	exchange:NEAR

.code
	exchange:
		push ebp
		mov ebp, esp
		
		mov eax, [ebp + 8]
		mov ebx, [ebp + 12]
		
		mov ecx, [eax]
		mov edx, [ebx]
		mov [ebx], ecx
		mov [eax], edx

		pop ebp
		ret 8

	end