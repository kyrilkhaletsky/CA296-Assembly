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

EXTERNDEF		sum:NEAR


.code

	sum:
		push ebp
		mov ebp, esp

		;; set total
		mov eax, 0
		mov [ebp -4], eax

		;; set pointer
		mov eax, 0
		mov [ebp-8], eax

		loopy:
				mov eax, [ebp - 8]
				cmp eax, [ebp + 12]
				je exit

				mov eax, [ebp - 8]
				sal eax, 2
				add eax, [ebp + 8]
				mov eax, [eax]
				add [ebp-4], eax

				inc dword ptr [ebp-8]
				jmp loopy


	exit:
		mov eax, [ebp-4] 
		pop ebp
		ret 8

end sum