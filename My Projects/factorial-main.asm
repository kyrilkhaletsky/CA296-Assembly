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

.data
x		DWORD 0
message BYTE "fac(%d) = %d",10,0

.code
	main:nop

		mov x,1

loopy:
		cmp x,30
		jge endLoopy

		push x
		call fac
		invoke crt_printf,addr message,x,eax

		inc	x
		jmp loopy
	endLoopy:

		invoke ExitProcess,0

	fac:
		push ebp
		mov	 ebp,esp

		mov eax,[ebp+8]
		cmp eax,0
		jnz	notZero
		mov eax,1
		jmp finish 
	notZero:
		mov	 eax,[ebp+8]
		dec  eax
		push eax
		call fac
		mov	 edx,[ebp+8]
		mul  edx

	finish:
		pop ebp
		ret 4
	end main
