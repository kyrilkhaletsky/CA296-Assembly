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
x			DWORD	0
y			DWORD	0
message		BYTE	"Input Pattern"

.code
	main:nop

		invoke readIntegerWithMessage, addr message
		invoke setPattern, eax

		loopy:
			mov eax, x
			cmp eax, 32
			je exit
			invoke readRow, y
			mov ecx, x
			mov ebx, 1
			shl ebx, CL
			not eax
			invoke writeRow, y, eax
			inc y
			inc x
			jmp loopy

		exit:
			invoke Sleep, 5000
			invoke ExitProcess,0

	end main
