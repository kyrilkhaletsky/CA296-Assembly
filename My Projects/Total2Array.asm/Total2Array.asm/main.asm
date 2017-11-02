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

.data
x			DWORD	2, 2, 2, 2, 2
y			DWORD	2, 2, 2, 2, 2


.code
	main:nop

		push 5
		push offset y
		push 5
		push offset x
		call total
		invoke writeInteger, eax

		invoke Sleep, 5000
		invoke ExitProcess,0

	end main
