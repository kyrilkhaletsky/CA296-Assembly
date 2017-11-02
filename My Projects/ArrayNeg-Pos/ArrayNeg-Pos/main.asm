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

N = 50

.data
arrayAddr			DWORD	0
x				DWORD	0
y				DWORD	0

.code
	main:nop

		invoke version
		mov eax,N
		sal eax, 2
		invoke allocate,eax
		mov arrayAddr, eax
		mov eax, N
		dec eax
		mov y, eax

	loopy:
		mov ebx, x
		cmp ebx, y
		jg exit
		invoke random,50
		cmp eax, 0 
		jl nega
		jg pos
		jmp loopy

	nega:
		mov ebx, x
		sal ebx, 2
		add ebx, arrayAddr
		mov [ebx], eax
		inc x 
		jmp loopy

	pos:
		mov ebx, y
		sal ebx, 2
		add ebx, arrayAddr
		mov [ebx], eax
		dec y 
		jmp loopy

	exit:
		invoke writeArray, arrayAddr, N
		invoke Sleep, 5000
		invoke ExitProcess,0

	end main
