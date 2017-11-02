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
i			DWORD	0

.code
	main:nop

		invoke readInteger
		invoke setPattern, eax

		loopy:
			mov x, 0
			mov y, 1
			cmp i, 32
			je exit
			inc i

		loopy1:
			invoke readRow, y
			invoke writeRow, x, eax
			inc x
			inc y
			cmp x, 32
			jl loopy1
			invoke Sleep, 500
			je loopy
		
		exit:
			invoke ExitProcess, 0

	end main
