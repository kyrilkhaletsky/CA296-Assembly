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
v		DWORD	0

.code
	main:nop
		
		mov ebp,esp

readNextValue:
		invoke readInteger
		cmp eax,0
		jl	printLis

		push eax
		jmp readNextValue

printLis:
		cmp esp,ebp
		je	printListEnd

		pop ebx
		invoke writeInteger,ebx
		jmp printLis

printListEnd:
	
	invoke Sleep, 5000
	invoke ExitProcess,0

end main