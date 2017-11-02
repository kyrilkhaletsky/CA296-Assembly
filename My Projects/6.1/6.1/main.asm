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
a		DWORD	10	DUP(0)

.code
	main:nop

		invoke fillWithRandomValues, addr a, 10, 100
		invoke writeArray, addr a, 10
	
	
	endOfLoop:
		invoke Sleep, 10000
		invoke ExitProcess,0

	end main
