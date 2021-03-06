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
y			DWORD	1
masky		DWORD	0
masky2		DWORD	0

.code
	main:nop

		invoke readInteger
		invoke setPattern, eax
		
		invoke readRow, x
		mov masky, eax
		invoke readRow, y
		mov masky2, eax

	loopy:
		cmp x, 32
		je exit
		invoke readRow, x
		mov ebx, masky
		and eax, ebx
		
		mov ebx, masky2
		and eax, ebx
		invoke writeRow, x, eax
		inc x
		jmp loopy

	exit:
		invoke Sleep, 5000
		invoke ExitProcess,0


	end main
