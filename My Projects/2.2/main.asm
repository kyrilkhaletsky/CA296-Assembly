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
N			DWORD	0
zero		BYTE	'%d is zero', 10, 0
less		BYTE	'%d is negative', 10, 0
more		BYTE	'%d is positive', 10, 0
message     BYTE	'Press OK to continue',0
caption     BYTE	'Welcome to CA296',0

.code
	main:nop

		invoke version
		invoke readInteger
		add N, eax
		
		cmp eax, 0

		je zeromes
		jg moremes
		jl lessmes

zeromes:
		invoke crt_printf, ADDR zero, N
		jmp fin
moremes:
		invoke crt_printf, ADDR more, N
		jmp fin
lessmes:
		invoke crt_printf, ADDR less, N

fin:

		invoke MessageBox,0,ADDR message,ADDR caption,MB_OK


		invoke ExitProcess,0

	end main
