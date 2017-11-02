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



EXTERNDEF		sum:NEAR

.data
mes     BYTE	'%d',10,0
i		DWORD	0
total		DWORD	0
a		DWORD	-1

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

		;; set pointer2
		mov eax, 0
		mov [ebp-12], eax


		loopy:
			mov eax, [ebp - 8]
			cmp eax, [ebp + 12]
			je exit

				mov eax, [ebp - 8]
				sal eax, 2
				inc a
				add eax, [ebp + 20]
				mov ecx, [eax]
				inc dword ptr [ebp-8]
				mov ebx, 0
				mov [ebp-12], ebx
		
		loopy1:
					mov ebx, [ebp - 12]					
					cmp ebx, [ebp + 8]
					je loopy

					mov ebx, [ebp - 12]
					sal ebx, 2
					add ebx, [ebp + 16]
					mov edx, [ebx]
					inc dword ptr [ebp-12]
					cmp a, edx
					je addi
					jmp loopy1	
			addi:	
					add total, ecx	
					jmp loopy1
			

	exit:
		mov eax, total
		pop ebp
		ret 4

end sum