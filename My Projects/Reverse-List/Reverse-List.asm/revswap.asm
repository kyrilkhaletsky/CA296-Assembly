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

EXTERNDEF	revswap:NEAR

.code
	revswap:
		push ebp
		mov ebp, esp

		mov eax, 0					;;pointer
		mov [ebp - 4], eax
		
		mov eax, [ebp + 12]			;;N
		dec eax
		mov [ebp - 8], eax 

	loopy:
		mov eax, [ebp - 4]
		cmp eax, [ebp - 8]
		jge exit

		;; Find first index
		mov eax, [ebp - 4]
		sal eax, 2
		add eax, [ebp + 8]
		mov ebx, eax
		mov eax, [eax]
		mov [ebp - 12], eax   
		
		;; Find second index
		mov eax, [ebp - 8]
		sal eax, 2
		add eax, [ebp + 8]
		mov ecx, eax
		mov eax, [eax]
		mov [ebp - 16], eax

		;; Move first into second
		mov edx, [ebp - 16]
		mov [ebx], edx

		;; Move second into first
		mov edx, [ebp - 12]
		mov [ecx], edx

		inc dword ptr [ebp - 4]
		dec dword ptr [ebp - 8]
		jmp loopy

	exit:
		pop ebp
		ret 16

	end