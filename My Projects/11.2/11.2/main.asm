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

EXTERNDEF		maxi:NEAR

.data
x			DWORD	0
y			DWORD	0


.code
	main:nop

		invoke readInteger
		mov x, eax
		invoke readInteger
		mov y, eax

		push x
		push y

		call maxi

		invoke writeInteger, eax

		invoke Sleep, 5000
		invoke ExitProcess,0

	end main