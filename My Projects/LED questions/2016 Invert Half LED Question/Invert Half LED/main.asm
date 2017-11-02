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
y			DWORD	0
masky			DWORD	0

.code
	main:nop

		invoke readInteger
		invoke setPattern, eax

	loopy:
		cmp y, 32
		je exit

		invoke readRow, y
		mov masky, eax
		shl eax, 16
		shr masky, 16
		or eax, masky
		invoke writeRow, y, eax
		inc y
		jmp loopy

	exit:
		invoke Sleep, 5000
		invoke ExitProcess,0

	end main
