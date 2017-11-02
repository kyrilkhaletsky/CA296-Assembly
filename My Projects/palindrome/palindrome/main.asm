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
a			DWORD	6	DUP(2, 3, 4, 4, 4, 2)
i			DWORD	0
j			DWORD	5
yes			BYTE	"This array is a palindrome", 10, 0
no			BYTE	"This array is not a palindrome", 10, 0 

.code
	main:nop

		invoke version
	
	loopy:
		mov eax, i
		cmp eax, j
		jge exit
		sal eax, 2
		add eax, offset a
		mov ebx, [eax]

		mov eax, j
		sal eax, 2
		add eax, offset a
		mov ecx, [eax]
		cmp ebx, ecx
		jne break
		inc i
		dec j
		jmp loopy

	break:
		invoke crt_printf, addr no
		invoke Sleep, 5000
		invoke ExitProcess,0

	exit:
		invoke crt_printf, addr yes
		invoke Sleep, 5000
		invoke ExitProcess,0

	end main