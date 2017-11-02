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


EXTERNDEF	sort:NEAR

.code
	sort:
		push ebp
		mov ebp, esp

		mov eax, 0
		mov [ebp - 4], eax		;; i = 0

	outerLoop:
		mov eax, [ebp - 4]
		cmp eax, [ebp + 12]		;; while i < N
		je exit

		sal eax, 2
		add eax, [ebp + 8]
		mov [ebp - 8], eax		;; min address
		mov eax, [eax]
		mov [ebp - 12], eax		;; min = a[i]
		mov eax, [ebp - 4]
		mov [ebp - 16], eax		;; j = i

	innerLoop:
		mov eax, [ebp - 16]
		cmp eax, [ebp + 12]		;; while j < N
		je swap

		sal eax, 2
		add eax, [ebp + 8]
		mov ebx, eax
		mov eax, [eax]
		cmp eax, [ebp - 12]		;; if a[j] < min
		jl newMin
		inc dword ptr [ebp - 16]
		jmp innerLoop

	newMin:
		mov [ebp - 8], ebx
		mov [ebp - 12], eax
		inc dword ptr [ebp - 16]
		jmp innerLoop

	swap:
		mov eax, [ebp - 4]
		sal eax, 2
		add eax, [ebp + 8]
		mov ebx, eax
		mov eax, [eax]

		mov ecx, [ebp - 8]

		mov edx, [ebp - 12]
		mov [ebx], edx

		mov edx, eax
		mov [ecx], edx

		inc dword ptr [ebp - 4]
		jmp outerLoop

	exit:
		pop ebp
		ret 8

	end