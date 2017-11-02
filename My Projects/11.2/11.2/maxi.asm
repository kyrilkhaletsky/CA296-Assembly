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

EXTERNDEF		maxi:NEAR


.code

	maxi:
		push ebp
		mov ebp, esp
		mov eax, [ebp + 8]
		cmp eax, [ebp + 12]
		jl less
		jmp exit

	less:
		mov eax, [ebp + 12]

	exit: 
		pop ebp
		ret 8

end maxi