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

.data
x			DWORD	4
y			DWORD	7

.code
	main:nop

		push  OFFSET x
		push  OFFSET y
		call exchange

		invoke writeInteger, x
		invoke writeInteger, y

		invoke Sleep, 5000
		invoke ExitProcess, 0

	end main
