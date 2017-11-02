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
counter		DWORD	0
fib			DWORD	1
mes			BYTE	'fib(%d) = %d', 0

.code
	main:nop

		invoke readInteger
		mov ecx, 1
		mov ebx, 0

loopy:
		cmp counter, eax
		je done
		add ebx, ecx
		mov fib, ebx
		mov ebx, ecx
		mov ecx, fib

		inc counter
		jmp loopy

done:
		invoke crt_printf, ADDR mes, counter, fib

		invoke Sleep, 2000
		invoke ExitProcess,0

	end main
