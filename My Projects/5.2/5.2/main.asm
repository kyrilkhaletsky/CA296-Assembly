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
bigNum		DWORD	1
i			DWORD	0
num			DWORD	0
finalval	DWORD	0
finalfac	DWORD	0
total		DWORD	0
total2		DWORD	0
count		DWORD	0
message		BYTE	'The greatest value for a 32bit integer is %d whose factorial is %d!',0
.code
	main:nop

	startOuterLoop:

		mov eax, bigNum
		mov count,eax
		mov total,eax
		startInnerLoop:
			
			cmp count,1
			jbe endInnerLoop

			mov eax,total
			dec count
			mul count
			mov total,eax
			mov total2,edx
			cmp edx, 0
			ja endOuterLoop
			mov total,eax

			
			jmp startInnerLoop
		endInnerLoop:
		mov edx,bigNum
		mov finalfac,edx
		mov finalval,eax
		inc bigNum
		jmp startOuterLoop

	endOuterLoop:

			invoke crt_printf, ADDR message,finalval,finalfac
			invoke Sleep, 5000
			invoke ExitProcess,0

	end main