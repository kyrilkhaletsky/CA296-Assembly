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

EXTERNDEF	largest:NEAR

.data
x			DWORD	4
y			DWORD	24,20,21,22,23

.code
	main:nop

		invoke version
		push x
		push offset y

		call largest
		invoke writeInteger, eax

		invoke Sleep, 5000
		invoke ExitProcess,0

	end main
