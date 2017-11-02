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

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

includelib p:\masm32\lib\ca296.lib
includelib kernel32.lib
includelib user32.lib
includelib msvcrt.lib


;
; Data & Code
;

EXTERNDEF		sum:NEAR

.data
mes     BYTE	'%d',10,0
i		DWORD	0
a		DWORD	-1

.code

	sum:
		push ebp
		mov ebp, esp

		;; set pointer
		mov eax, 0
		mov [ebp-4], eax


		loopy:
			mov eax, [ebp - 4]
			cmp eax, [ebp + 8]
			je exit

				mov eax, [ebp - 4]
				sal eax, 2
				add eax, [ebp + 12]
				mov ecx, [eax]
				
				sal ecx, 2
				add ecx, [ebp+12]
				mov ebx,[ecx]
				mov [eax], ebx

			
			inc dword ptr [ebp-4]
			jmp loopy

	exit:
		mov eax, [ebp+12]
		pop ebp
		ret 4

end sum