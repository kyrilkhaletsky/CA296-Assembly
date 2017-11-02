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
ans			DWORD	0
count		DWORD	0
ori			DWORD	0
mes			BYTE	'%d! = %d', 0,0


.code
	main:nop

		invoke readInteger
		mov ans, eax
		mov ori, eax
		mov count, eax
		dec count

loopy:		
		cmp count, 0	
		jbe doni
		mov ecx, ans	
		imul ecx, count
		mov ans, ecx
		dec count
		jmp loopy

doni:
		invoke crt_printf,  ADDR mes, ori,ans
		invoke Sleep, 5000
		invoke ExitProcess,0

	end main
