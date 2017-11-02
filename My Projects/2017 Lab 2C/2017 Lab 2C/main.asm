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

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

includelib p:\masm32\lib\ca296.lib
includelib kernel32.lib
includelib user32.lib
includelib msvcrt.lib


;
; Data & Code
;

EXTERNDEF		sum:NEAR

.data
array1			DWORD	10 DUP(1,1,1,1,1)
n1				DWORD	5
array2			DWORD	5 DUP(0)
n2				DWORD	5

.code
	main:nop


		invoke writeArray, ADDR array1, 5
		
		push OFFSET array1
		push n1

		push OFFSET array2
		push n2

		call sum
		
		invoke writeArray, ADDR array2, 5

		invoke Sleep, 5000
		invoke ExitProcess,0

	end main
