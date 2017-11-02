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
N			DWORD	0
i			DWORD	0
.code
	main:nop
startloop:

		invoke readInteger
		mov N, eax
		cmp N, 0
		jl fin
		mov i, 0

	loopy:
			cmp i, eax
			jge fin1
			invoke writeInteger, i
			inc i
			mov eax, N
			jmp loopy

fin1:
	jmp startloop

fin:
		invoke Sleep, 1000
		invoke ExitProcess,0


	end main
