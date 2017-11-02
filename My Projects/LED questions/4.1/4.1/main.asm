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
x	DWORD	0
y	DWORD	0
i	DWORD	100000

.code
	main:nop

		next:
			mov eax, i
			cmp eax, 0
			je exit
			sub eax, 1
			mov i, eax

			invoke random, 32
			mov x, eax
			invoke random, 32
			mov y, eax
			invoke readRow, y
			mov ecx, x
			mov ebx, 1
			shl ebx, cl
			or eax, ebx
			invoke writeRow, y, eax
			jmp next
			
		exit:
			invoke ExitProcess, 0 

	end main
