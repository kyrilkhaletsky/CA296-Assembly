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
mes			BYTE	'fib(%d) = %d',10, 0

.code
	main:nop

startloop:
		invoke readInteger
		cmp eax, 0
		jl done
		mov counter, 0
		mov fib, 1
		mov ecx, 1
		mov ebx, 0

	loopy:
			cmp counter, eax
			je done1
			add ebx, ecx
			mov fib, ebx
			mov ebx, ecx
			mov ecx, fib

			inc counter
			jmp loopy

done1:
		invoke crt_printf, ADDR mes, counter, fib
		jmp startloop
done:
		invoke Sleep, 2000
		invoke ExitProcess,0

	end main
