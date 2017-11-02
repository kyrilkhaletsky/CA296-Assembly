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
integer		DWORD	0
msg1		BYTE	'There were no duplicate values detected',0
msg2		BYTE	'Duplicate value %d detected',0


.code
	main:nop

		invoke version
		mov ebp,esp

readIn:
		invoke readInteger
		cmp eax,0
		jl	negDetect
		mov integer,eax
		mov eax,esp

checkstack:
		cmp eax,ebp
		je	push_
		mov ebx,integer
		cmp [eax],ebx
		je dupedetected
		add eax,4
		jmp checkstack

push_:
		mov eax,integer
		push eax
		jmp readIn


negDetect:
		invoke crt_printf,addr msg1,0
		jmp exit

dupedetected:
		invoke crt_printf,addr msg2,integer
		jmp exit

exit:
		invoke ExitProcess,0

	end main
