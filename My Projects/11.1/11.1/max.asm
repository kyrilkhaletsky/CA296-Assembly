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

EXTERNDEF		max:NEAR


.code

	max:
		push ebp
		mov ebp, esp
		mov eax, [ebp + 8]
		cmp eax, [ebp + 12]
		jge greater
		invoke writeInteger, [ebp + 12]
		jmp exit

	greater:
		invoke writeInteger, [ebp + 8]

	exit: 
		pop ebp
		ret
end max