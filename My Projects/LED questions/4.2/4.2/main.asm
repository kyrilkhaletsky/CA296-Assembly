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

.data
x			DWORD	0
y			DWORD	0
p			DWORD   0

.code
	main:nop

		invoke readInteger
			mov p, eax		
		
		invoke readInteger
			mov x, eax
		invoke readInteger
			mov y, eax
		
		invoke setPattern, p

		flash:
			invoke readRow, y
			mov ecx, x
			mov ebx, 1
			shl ebx, CL
			xor eax, ebx
			invoke writeRow, y, eax
			invoke Sleep, 500
			
			jmp flash


	end main
