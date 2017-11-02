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
tmp			DWORD	0
j			DWORD	0

.code

	sum:
		push ebp
		mov ebp, esp

		;; set pointer
		mov eax, 0
		mov [ebp-4], eax


									;;first index
			mov eax, [ebp + 12]
			sal eax, 2
			add eax, [ebp + 8]
			mov ecx, [eax]
			
									;;second index
			mov ebx, [ebp + 16]
			sal ebx, 2
			add ebx, [ebp + 8]
			mov edx, [ebx]				
				
									;;comparison
			mov j, ecx
			cmp j, edx
			jl swap
			jmp exit

	swap:
			mov [ebx], ecx
			mov [eax], edx

	exit:
		mov eax, [ebp+8]
		pop ebp
		ret 4

end sum