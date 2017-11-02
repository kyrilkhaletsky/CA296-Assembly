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


EXTERNDEF	revswap:NEAR

N EQU 5

.data
a			DWORD	N	DUP(0)

.code
	main:nop

		invoke fillWithRandomValues, addr a, N, 10
		invoke writeArray, addr a, N

		push N			;; ebp12
		push offset a	;; ebp8
		call revswap

		invoke writeArray, addr a, N

		invoke Sleep, 5000
		invoke ExitProcess,0

	end main
