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

EXTERNDEF	display:NEAR

.data
i		DWORD	0

.code

display:
		
	mov ebx, 20
	cmp i, ebx
	je exit
	mov eax, 4
	mul i
	invoke writeInteger, eax
	inc i
	jmp display


exit:
	ret
end display
