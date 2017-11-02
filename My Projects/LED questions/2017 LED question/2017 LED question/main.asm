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
start		DWORD	0
finish		DWORD	0
row			DWORD	0
mes			BYTE	"Input Row"

.code
	main:nop

		invoke readIntegerWithMessage, ADDR mes
		mov row, eax		
		
		invoke readInteger
		mov start, eax
		invoke readInteger
		mov finish, eax


		invoke setPattern, 1

		loopy:
			mov eax, start
			cmp eax, finish
			jg exit
			invoke readRow, row
			mov ecx, start
			mov ebx, 1
			shl ebx, CL
			not ebx
			and eax, ebx
			invoke writeRow, row, eax
			inc start
			jmp loopy

		exit:
			invoke Sleep, 5000
			invoke ExitProcess,0

	end main
