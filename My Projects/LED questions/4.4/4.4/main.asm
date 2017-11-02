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
i			DWORD	0

.code
	main:nop

		invoke readInteger
		invoke setPattern, eax

		l0:
			mov	x, 0
			mov y, 0
			cmp i, 32
			je exit
			inc i

		l1:
			invoke readRow, y
			shl eax, 1
			invoke writeRow, x, eax
			inc x
			inc y
			cmp y, 32
			jl l1
			invoke Sleep, 500
			je l0

		exit:
			invoke ExitProcess,0

	end main
