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

EXTERNDEF	sum:NEAR

N EQU 10

.data
a			DWORD	N	DUP(0)
i1			DWORD	2
i2			DWORD	3

.code
	main:nop
		
		invoke fillWithRandomValues, addr a, N, 10
		invoke writeArray, addr a, N

		push N
		push i2
		push i1
		push offset a
		
		call sum

		invoke writeArray, addr a, N

		invoke Sleep, 50000
		invoke ExitProcess,0

	end main
