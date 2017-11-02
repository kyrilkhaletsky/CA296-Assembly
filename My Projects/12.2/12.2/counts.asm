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

EXTERNDEF		counts:NEAR

.data

arry		DWORD	3 DUP(0)

.code

	counts:
		push ebp
		mov ebp, esp

		;; set pointer
		mov eax, 0
		mov [ebp-4], eax

		loopy:
				mov eax, [ebp - 4]
				cmp eax, [ebp + 12]
				je exit

				mov eax, [ebp - 4]
				sal eax, 2
				add eax, [ebp + 8]
				mov eax, [eax]
				cmp eax, 0

				je zero
				jg pos
				jl nega

				
			nega:
				mov ebx, 1
				add [arry], ebx

				inc dword ptr [ebp-4]
				jmp loopy

			zero:
				mov ebx, 1
				add [arry + 4], ebx

				inc dword ptr [ebp-4]
				jmp loopy

			pos:
				mov ebx, 1
				add [arry + 8], ebx

				inc dword ptr [ebp-4]
				jmp loopy


	exit:
		mov eax, OFFSET arry
		pop ebp
		ret 8

end counts