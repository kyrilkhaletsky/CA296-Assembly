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

EXTERNDEF		sumarray:NEAR

.code

	sumarray:
		push ebp
		mov ebp, esp

		mov eax, 0
		mov edx, eax
		mov ecx, eax

		loopy:
				cmp ecx, [ebp + 12]
				je exit

				mov ebx, ecx
				sal ebx, 2
				add ebx, [ebp + 8]
				mov ebx, [ebx]
				
				invoke map, ebx
				add edx, eax
				inc ecx
				jmp loopy

	exit:
		mov eax, edx
		pop ebp
		ret 8

end sumarray