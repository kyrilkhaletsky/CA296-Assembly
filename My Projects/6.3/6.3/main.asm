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
array		DWORD	10	DUP(0)
i			DWORD	0
highest		DWORD	0	

.code
	main:nop

		invoke fillWithRandomValues, ADDR array, 10, 100
		invoke writeArray, ADDR array, 10
	loopy:
		cmp i, 10
		je endOfLoop
		mov eax, 4
		mul i
		add eax, offset array
		mov ebx, [eax]
		cmp ebx, highest
		jg greater
		inc i
		jmp loopy

	greater:
		mov highest, ebx
		inc i
		jmp loopy
	
	endOfLoop:
		invoke writeInteger, highest	
		invoke Sleep, 5000
		invoke ExitProcess,0

	end main
